package com.br.pb.barros.avaliabus.services;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.br.pb.barros.avaliabus.daos.EmpresaDao;
import com.br.pb.barros.avaliabus.daos.SugestaoDao;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusMandacaruense;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusMarcusDaSilva;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusReunidas;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusSantaMaria;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusSaoJorge;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusTransnacional;
import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;
import com.br.pb.barros.avaliabus.models.Empresa;
import com.br.pb.barros.avaliabus.models.Sugestao;
import com.br.pb.barros.avaliabus.util.SystemSendMail;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ServiceSugestao {

	@Autowired private SugestaoDao sugestaoDAO;

	@Autowired private EmpresaDao empresaDAO;

	SystemSendMail mm = new SystemSendMail();

	@Transactional(readOnly = true)
	public void saveSugestao(Sugestao sugestao) throws SQLException {

		try {

			Empresa newEmp = empresaDAO.findByTipoName(sugestao.getEmpresa().getTipoNomeEmpresa());

			// seta a empresa
			sugestao.setEmpresa(newEmp);

			sugestaoDAO.save(sugestao);

			sendEmailSugestao(sugestao);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Transactional(readOnly = true)
	public void removeSugestao(Sugestao sugestao) throws SQLException {

		sugestaoDAO.remove(sugestao);

	}

	public void sendEmailSugestao(Sugestao sugestao) throws IOException, SQLException {

		sugestao = sugestaoDAO.findById(sugestao.getId());

		String corpo =

				"<p style=\"font-size:16px; text-align:justify;\">Olá Prezado "
						+ sugestao.getEmpresa().getNomeResponsavel() + ",<br><br>"
						+ "    Nós somos o <b>AvaliaBUS</b>, somos responsáveis por levar a voz da população até as "
						+ "empresas consecionadas de Transporte Coletivo Público e as entidades responsáveis que atuam em João Pessoa. <br>Nosso Objetivo é "
						+ "melhorar a comunicação entre o <b>povo, as Emrpesas de transporte coletivo e a SEMOB</b> para que "
						+ "todos fiquem cientes da real situação dos meios de transporte. <br> <br>"
						+ "O passageiro da empresa <b>" + sugestao.getEmpresa().getTipoNomeEmpresa().getValor()
						+ "</b> deseja" + " reportar a seguinte sugestão: <br><br>" + "<i>" + sugestao.getDescricao()
						+ "</i><br><br>";

		mm.enviarEmailSemImagem(sugestao.getEmpresa().getEmail(), corpo);
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
