package com.br.pb.barros.avaliabus.services;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.br.pb.barros.avaliabus.daos.DenunciaDao;
import com.br.pb.barros.avaliabus.daos.EmpresaDao;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusMandacaruense;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusMarcusDaSilva;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusReunidas;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusSantaMaria;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusSaoJorge;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusTransnacional;
import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;
import com.br.pb.barros.avaliabus.models.Denuncia;
import com.br.pb.barros.avaliabus.models.Empresa;
import com.br.pb.barros.avaliabus.util.SystemSendMail;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ServiceDenuncia {
	
	@Autowired private DenunciaDao denunciaDAO;
	
	@Autowired private EmpresaDao empresaDAO;
	
	SystemSendMail mm = new SystemSendMail();
	
	public void sendEmailDenuncia(Denuncia denuncia) throws IOException, SQLException{
		
		BufferedImage img = null; 
		
		String caminhoImagem = null;
		
		denuncia = denunciaDAO.findById(denuncia.getId());
		
		try {
			
			// faz o tratamento da imagem e armazena no caminho relativo
			Blob blobImagem = denuncia.getImagem();
			int blobImagemLength = (int) blobImagem.length();
			byte[] blobImagemAsByte = blobImagem.getBytes(1, blobImagemLength);
			
			ByteArrayInputStream byteais = new ByteArrayInputStream(blobImagemAsByte);
			img = ImageIO.read(byteais);
			
			String caminhoAtual = new File("").getAbsolutePath();
			caminhoImagem = caminhoAtual + File.separator  + denuncia.getDescricao().trim()+".png";

			ImageIO.write(img, "PNG", new File(caminhoImagem));
			
		} catch (IOException e) {
			e.printStackTrace();
		}	
		
		String corpo = 
				
		"<p style=\"font-size:16px; text-align:justify;\">Olá Prezado " + denuncia.getEmpresa().getNomeResponsavel() + ",<br><br>"
		+ "    Nós somos o <b>AvaliaBUS</b>, somos responsáveis por levar a voz da população até as "
		+ "empresas consecionadas de Transporte Coletivo Público e as entidades responsáveis que atuam em João Pessoa. <br>Nosso Objetivo é "
		+ "melhorar a comunicação entre o <b>povo, as Emrpesas de transporte coletivo e a SEMOB</b> para que "
		+ "todos fiquem cientes da real situação dos meios de transporte. <br> <br>"
		+ "O passageiro da empresa <b>" + denuncia.getEmpresa().getTipoNomeEmpresa().getValor() + "</b> deseja"
				+ " reportar a seguinte queixa: <br><br>"
		+ "<i>" + denuncia.getDescricao() + "</i><br><br>";
				
		mm.enviarEmail(denuncia.getEmpresa().getEmail(), corpo, caminhoImagem);
	}
	
	@Transactional(readOnly = true)
	public void saveDenuncia(MultipartFile multipartFile, Denuncia denuncia)	throws SerialException, SQLException {
		
		if (multipartFile != null && multipartFile.getSize() > 0) {

			byte[] contents = null;
			Blob blob = null;
			
			try {
				
				// faz o parse para persistir a imagem como blob
				contents = multipartFile.getBytes();
				blob = new SerialBlob(contents);
				denuncia.setImagem(blob);

				// pesquisa a empresa
				Empresa newEmp = empresaDAO.findByTipoName(denuncia.getEmpresa().getTipoNomeEmpresa());
				
				// seta a empresa
				denuncia.setEmpresa(newEmp);
				
				denunciaDAO.save(denuncia);
				
				sendEmailDenuncia(denuncia);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
			
	}
	
	@Transactional(readOnly = true)
	public void removeDenuncia(Denuncia denuncia)	throws SQLException {
		
		denunciaDAO.remove(denuncia);
			
	}
	
	public static String checkLinha(String tipoNomeEmpresa) {

		Map<Integer, String> options = new HashMap<>();

		if (tipoNomeEmpresa.equals(TipoNomeEmpresa.SANTA_MARIA.toString())) {
			options = TipoLinhaOnibusSantaMaria.ENUM_MAP;
		}
		if (tipoNomeEmpresa.equals(TipoNomeEmpresa.MANDACARUENSE.toString())) {
			options = TipoLinhaOnibusMandacaruense.ENUM_MAP;
		}
		if (tipoNomeEmpresa.equals(TipoNomeEmpresa.MARCOS_SILVA.toString())) {
			options = TipoLinhaOnibusMarcusDaSilva.ENUM_MAP;
		}
		if (tipoNomeEmpresa.equals(TipoNomeEmpresa.REUNIDAS.toString())) {
			options = TipoLinhaOnibusReunidas.ENUM_MAP;
		}
		if (tipoNomeEmpresa.equals(TipoNomeEmpresa.SAO_JORGE.toString())) {
			options = TipoLinhaOnibusSaoJorge.ENUM_MAP;
		}
		if (tipoNomeEmpresa.equals(TipoNomeEmpresa.TRANSNACIONAL.toString())) {
			options = TipoLinhaOnibusTransnacional.ENUM_MAP;
		}

		ObjectMapper mapper = new ObjectMapper();

		String listResult = null;

		try {
			listResult = mapper.writeValueAsString(options);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listResult;
	}
	
}
