package com.br.pb.barros.avaliabus.daos.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.daos.SugestaoDao;
import com.br.pb.barros.avaliabus.daos.PaginatorQueryHelper;
import com.br.pb.barros.avaliabus.models.PaginatedList;
import com.br.pb.barros.avaliabus.models.Sugestao;

@Repository
public class SugestaoDaoImpl implements SugestaoDao {

	@PersistenceContext
	private EntityManager manager;

	public List<Sugestao> all() {
		return manager.createQuery("select p from Sugestao p", Sugestao.class).getResultList();
	}

	public void save(Sugestao sugestao) {
		manager.persist(sugestao);
	}

	public Sugestao findById(Long id) {
		return manager.find(Sugestao.class, id);
	}

	public void remove(Sugestao sugestao) {
		manager.createQuery("DELETE FROM Sugestao where id = :id").setParameter("id", sugestao.getId()).executeUpdate();
	}

	public void update(Sugestao sugestao) {
		manager.merge(sugestao);
	}

	public PaginatedList paginated(int page, int max) {
		return new PaginatorQueryHelper().list(manager, Sugestao.class, page, max);
	}

}
