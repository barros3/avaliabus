package com.br.pb.barros.avaliabus.services;

import java.sql.SQLDataException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.pb.barros.avaliabus.daos.ResultadoDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ServiceResultado {
	
	@Autowired private ResultadoDao resultadoDAO;
	
	@SuppressWarnings("unchecked")
	public String countDenunciaEmpresa() throws SQLDataException, JsonProcessingException {

		HashMap<String, HashMap<String, Integer>> hashMapModulosQuant = new HashMap<>();

		String listResult = null;
		
		ObjectMapper objectMapper = new ObjectMapper();

		try{
			
			Object JSONDenunciaQuantidade = resultadoDAO.denunciaChart();
			hashMapModulosQuant.put("quantidadeDenuncia", (HashMap<String, Integer>) JSONDenunciaQuantidade);
			
			Object JSONAvaliacaoQuantidade = resultadoDAO.avaliacaoChart();
			hashMapModulosQuant.put("quantidadeAvaliacao", (HashMap<String, Integer>) JSONAvaliacaoQuantidade);
			
			Object JSONSugestaoQuantidade = resultadoDAO.sugestaoChart();
			hashMapModulosQuant.put("quantidadeSugestao", (HashMap<String, Integer>) JSONSugestaoQuantidade);
			
			listResult = objectMapper.writeValueAsString(hashMapModulosQuant);
			
		}catch (JsonProcessingException e) {
			e.printStackTrace();
		}
			
		return listResult;

	}
	
}
