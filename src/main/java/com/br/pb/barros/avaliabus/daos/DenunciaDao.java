package com.br.pb.barros.avaliabus.daos;

import java.sql.SQLDataException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.models.Denuncia;
import com.br.pb.barros.avaliabus.models.PaginatedList;
import com.fasterxml.jackson.core.JsonProcessingException;

@Repository
public interface DenunciaDao {

	public void save(Denuncia denuncia);

	public void remove(Denuncia denuncia);

	public void update(Denuncia denuncia);

	public List<Denuncia> all();

	public Denuncia findById(Long id);

	public PaginatedList paginated(int page, int max);
	
}
