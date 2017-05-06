package com.br.pb.barros.avaliabus.daos;

import java.sql.SQLDataException;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;

@Repository
public interface ResultadoDao {

	public Map<String, Integer> denunciaChart() throws SQLDataException, JsonProcessingException;

	public Map<String, Integer> avaliacaoChart() throws SQLDataException, JsonProcessingException;

	public Map<String, Integer> sugestaoChart() throws SQLDataException, JsonProcessingException;

}
