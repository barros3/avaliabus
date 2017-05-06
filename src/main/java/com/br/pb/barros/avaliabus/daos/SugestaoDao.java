package com.br.pb.barros.avaliabus.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.models.Sugestao;
import com.br.pb.barros.avaliabus.models.PaginatedList;

@Repository
public interface SugestaoDao {

	public List<Sugestao> all();

	public void save(Sugestao sugestao);

	public void remove(Sugestao sugestao);

	public void update(Sugestao sugestao);

	public Sugestao findById(Long id);

	public PaginatedList paginated(int page, int max);
	
}
