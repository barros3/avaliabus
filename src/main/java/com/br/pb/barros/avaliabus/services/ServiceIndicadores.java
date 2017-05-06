package com.br.pb.barros.avaliabus.services;

import java.sql.SQLDataException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.pb.barros.avaliabus.daos.AvaliacaoDao;
import com.br.pb.barros.avaliabus.daos.EmpresaDao;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusMandacaruense;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusMarcusDaSilva;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusReunidas;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusSantaMaria;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusSaoJorge;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusTransnacional;
import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;
import com.br.pb.barros.avaliabus.models.Empresa;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * @author barros3
 *
 */

@Service
public class ServiceIndicadores {

	@Autowired private AvaliacaoDao avaliacaoDAO;
	
	@Autowired private EmpresaDao empresaDAO;

	public String checkFrequencia() throws SQLDataException, JsonProcessingException {

		Object JSONIndicadores = null;

		HashMap<String, Object> hashMapEmpIndicadores = new HashMap<>();

		List<Empresa> resultListempresa = empresaDAO.all();
		
		for(int i = 0; i < resultListempresa.size(); i++){
			JSONIndicadores = avaliacaoDAO.avalieChartFrequencia(resultListempresa.get(i));
			hashMapEmpIndicadores.put(resultListempresa.get(i).getTipoNomeEmpresa().getValor().toString(), JSONIndicadores);
		}

		ObjectMapper objectMapper = new ObjectMapper();

		String listResult = null;

		try {
			listResult = objectMapper.writeValueAsString(hashMapEmpIndicadores);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return listResult;

	}
	
	public String checkPontualidade() throws SQLDataException, JsonProcessingException {

		Object JSONIndicadores = null;

		HashMap<String, Object> hashMapEmpIndicadores = new HashMap<>();

		List<Empresa> resultListempresa = empresaDAO.all();
		
		for(int i = 0; i < resultListempresa.size(); i++){
			JSONIndicadores = avaliacaoDAO.avalieChartPontualidade(resultListempresa.get(i));
			hashMapEmpIndicadores.put(resultListempresa.get(i).getTipoNomeEmpresa().getValor().toString(), JSONIndicadores);
		}

		ObjectMapper objectMapper = new ObjectMapper();

		String listResult = null;

		try {
			listResult = objectMapper.writeValueAsString(hashMapEmpIndicadores);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return listResult;

	}
	
	public String checkLimpeza() throws SQLDataException, JsonProcessingException {

		Object JSONIndicadores = null;

		HashMap<String, Object> hashMapEmpIndicadores = new HashMap<>();

		List<Empresa> resultListempresa = empresaDAO.all();
		
		for(int i = 0; i < resultListempresa.size(); i++){
			JSONIndicadores = avaliacaoDAO.avalieChartLimpeza(resultListempresa.get(i));
			hashMapEmpIndicadores.put(resultListempresa.get(i).getTipoNomeEmpresa().getValor().toString(), JSONIndicadores);
		}

		ObjectMapper objectMapper = new ObjectMapper();

		String listResult = null;

		try {
			listResult = objectMapper.writeValueAsString(hashMapEmpIndicadores);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return listResult;

	}
	
	public String checkLotacao() throws SQLDataException, JsonProcessingException {

		Object JSONIndicadores = null;

		HashMap<String, Object> hashMapEmpIndicadores = new HashMap<>();

		List<Empresa> resultListempresa = empresaDAO.all();
		
		for(int i = 0; i < resultListempresa.size(); i++){
			JSONIndicadores = avaliacaoDAO.avalieChartLotacao(resultListempresa.get(i));
			hashMapEmpIndicadores.put(resultListempresa.get(i).getTipoNomeEmpresa().getValor().toString(), JSONIndicadores);
		}

		ObjectMapper objectMapper = new ObjectMapper();

		String listResult = null;

		try {
			listResult = objectMapper.writeValueAsString(hashMapEmpIndicadores);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return listResult;

	}
	
	public String checkConducaoMotorista() throws SQLDataException, JsonProcessingException {

		Object JSONIndicadores = null;

		HashMap<String, Object> hashMapEmpIndicadores = new HashMap<>();

		List<Empresa> resultListempresa = empresaDAO.all();
		
		for(int i = 0; i < resultListempresa.size(); i++){
			JSONIndicadores = avaliacaoDAO.avalieChartConducaoMotorista(resultListempresa.get(i));
			hashMapEmpIndicadores.put(resultListempresa.get(i).getTipoNomeEmpresa().getValor().toString(), JSONIndicadores);
		}

		ObjectMapper objectMapper = new ObjectMapper();

		String listResult = null;

		try {
			listResult = objectMapper.writeValueAsString(hashMapEmpIndicadores);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return listResult;

	}
	
	public String checkConservacaoColetivo() throws SQLDataException, JsonProcessingException {

		Object JSONIndicadores = null;

		HashMap<String, Object> hashMapEmpIndicadores = new HashMap<>();

		List<Empresa> resultListempresa = empresaDAO.all();
		
		for(int i = 0; i < resultListempresa.size(); i++){
			JSONIndicadores = avaliacaoDAO.avalieChartConservacaoColetivo(resultListempresa.get(i));
			hashMapEmpIndicadores.put(resultListempresa.get(i).getTipoNomeEmpresa().getValor().toString(), JSONIndicadores);
		}

		ObjectMapper objectMapper = new ObjectMapper();

		String listResult = null;

		try {
			listResult = objectMapper.writeValueAsString(hashMapEmpIndicadores);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return listResult;

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
