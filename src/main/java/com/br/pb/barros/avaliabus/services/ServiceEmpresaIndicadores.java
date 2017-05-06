package com.br.pb.barros.avaliabus.services;

import java.sql.SQLDataException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.pb.barros.avaliabus.daos.EmpresaDao;
import com.br.pb.barros.avaliabus.models.Empresa;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * @author barros3
 *
 */

@Service
public class ServiceEmpresaIndicadores {

	@Autowired private EmpresaDao empresaDAO;

	@SuppressWarnings("unchecked")
	public String checkIndicadoresEmpresa(Long id) throws SQLDataException, JsonProcessingException {


		HashMap<String, HashMap<String, Integer>> hashMapEmpIndicadores = new HashMap<>();

		Empresa resultempresa = empresaDAO.findById(id);
		
		String listResult = null;
		
		ObjectMapper objectMapper = new ObjectMapper();

		try{
			
			Object JSONIndicadorFre = empresaDAO.avalieChartFrequencia(resultempresa);
			hashMapEmpIndicadores.put("frequencia", (HashMap<String, Integer>) JSONIndicadorFre);
			
			Object JSONIndicadorPont = empresaDAO.avalieChartPontualidade(resultempresa);
			hashMapEmpIndicadores.put("pontualidade", (HashMap<String, Integer>) JSONIndicadorPont);
			
			Object JSONIndicadorLot = empresaDAO.avalieChartLotacao(resultempresa);
			hashMapEmpIndicadores.put("lotacao", (HashMap<String, Integer>) JSONIndicadorLot);
			
			Object JSONIndicadorLimp = empresaDAO.avalieChartLimpeza(resultempresa);
			hashMapEmpIndicadores.put("limpeza", (HashMap<String, Integer>) JSONIndicadorLimp);
			
			Object JSONIndicadoresMot = empresaDAO.avalieChartConducaoMotorista(resultempresa);
			hashMapEmpIndicadores.put("conducao-motorista", (HashMap<String, Integer>) JSONIndicadoresMot);
			
			Object JSONIndicadoresConsColet = empresaDAO.avalieChartConservacaoColetivo(resultempresa);
			hashMapEmpIndicadores.put("conservacao-coletivo", (HashMap<String, Integer>) JSONIndicadoresConsColet);
			
			listResult = objectMapper.writeValueAsString(hashMapEmpIndicadores);
			
		}catch (JsonProcessingException e) {
			e.printStackTrace();
		}
			
		return listResult;

	}
	
}
