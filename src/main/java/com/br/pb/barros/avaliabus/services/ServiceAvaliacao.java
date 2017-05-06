package com.br.pb.barros.avaliabus.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.br.pb.barros.avaliabus.daos.AvaliacaoDao;
import com.br.pb.barros.avaliabus.daos.EmpresaDao;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusMandacaruense;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusMarcusDaSilva;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusReunidas;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusSantaMaria;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusSaoJorge;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusTransnacional;
import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;
import com.br.pb.barros.avaliabus.models.Avaliacao;
import com.br.pb.barros.avaliabus.models.Empresa;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ServiceAvaliacao {
	
	@Autowired
	private AvaliacaoDao avaliacaoDAO;
	
	@Autowired
	private EmpresaDao empresaDAO;
	
	@Transactional(readOnly = true)
	public void saveAvaliacao(Avaliacao avaliacao) {
			
		try {

			// pesquisa a empresa
			Empresa newEmp = empresaDAO.findByTipoName(avaliacao.getEmpresa().getTipoNomeEmpresa());

			// seta a empresa
			avaliacao.setEmpresa(newEmp);

			avaliacaoDAO.save(avaliacao);

		} catch (Exception e) {
			e.printStackTrace();
		}
			
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
