package com.br.pb.barros.avaliabus.daos;

import java.sql.SQLDataException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.models.Avaliacao;
import com.br.pb.barros.avaliabus.models.Empresa;
import com.br.pb.barros.avaliabus.models.PaginatedList;
import com.fasterxml.jackson.core.JsonProcessingException;

@Repository
public interface AvaliacaoDao {

	public void save(Avaliacao avaliacao);

	public void remove(Avaliacao avaliacao);

	public void update(Avaliacao avaliacao);

	public Avaliacao findById(Long id);
	
	public Map<String, Integer> avalieChartFrequencia(Empresa empresa) throws SQLDataException , JsonProcessingException;
	
	public Map<String, Integer> avalieChartPontualidade(Empresa empresa) throws SQLDataException, JsonProcessingException;
	
	public Map<String, Integer> avalieChartLimpeza(Empresa empresa) throws SQLDataException, JsonProcessingException;
	
	public Map<String, Integer> avalieChartConducaoMotorista(Empresa empresa) throws SQLDataException, JsonProcessingException;
	
	public Map<String, Integer> avalieChartLotacao(Empresa empresa) throws SQLDataException, JsonProcessingException;
	
	public Map<String, Integer> avalieChartConservacaoColetivo(Empresa empresa) throws SQLDataException, JsonProcessingException;
	
	public List<Avaliacao> all();
	
	public PaginatedList paginated(int page, int max);

}
