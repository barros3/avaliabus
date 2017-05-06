package com.br.pb.barros.avaliabus.daos;

import java.sql.SQLDataException;
import java.util.List;
import java.util.Map;

import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;
import com.br.pb.barros.avaliabus.models.Empresa;
import com.br.pb.barros.avaliabus.models.PaginatedList;
import com.fasterxml.jackson.core.JsonProcessingException;

public interface EmpresaDao {

	
	public List<Empresa> all();
	
	public void save(Empresa empresa);
	
	public void remove(Empresa empresa);

	public void update(Empresa empresa);

	public Empresa findById(Long id);
	
	public Empresa findByTipoName(TipoNomeEmpresa tipoNameEmpresa);
	
    public Map<String, Integer> avalieChartFrequencia(Empresa empresa) throws SQLDataException , JsonProcessingException;
	
	public Map<String, Integer> avalieChartPontualidade(Empresa empresa) throws SQLDataException, JsonProcessingException;
	
	public Map<String, Integer> avalieChartLimpeza(Empresa empresa) throws SQLDataException, JsonProcessingException;
	
	public Map<String, Integer> avalieChartConducaoMotorista(Empresa empresa) throws SQLDataException, JsonProcessingException;
	
	public Map<String, Integer> avalieChartLotacao(Empresa empresa) throws SQLDataException, JsonProcessingException;
	
	public Map<String, Integer> avalieChartConservacaoColetivo(Empresa empresa) throws SQLDataException, JsonProcessingException;
	
	public PaginatedList paginated(int page, int max);

}
