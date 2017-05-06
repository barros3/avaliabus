package com.br.pb.barros.avaliabus.daos.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.daos.DenunciaDao;
import com.br.pb.barros.avaliabus.daos.PaginatorQueryHelper;
import com.br.pb.barros.avaliabus.models.Denuncia;
import com.br.pb.barros.avaliabus.models.PaginatedList;

@Repository
public class DenunciaDaoImpl implements DenunciaDao {

	@PersistenceContext
	private EntityManager manager;

	public List<Denuncia> all() {
		return manager.createQuery("select p from Denuncia p", Denuncia.class).getResultList();
	}

	public void save(Denuncia denuncia) {
		manager.persist(denuncia);
	}

	public Denuncia findById(Long id) {
		return manager.find(Denuncia.class, id);
	}

	public void remove(Denuncia denuncia) {
		manager.createQuery("DELETE FROM Denuncia where id = :id").setParameter("id", denuncia.getId()).executeUpdate();
	}

	public void update(Denuncia denuncia) {
		manager.merge(denuncia);
	}

	public PaginatedList paginated(int page, int max) {
		return new PaginatorQueryHelper().list(manager, Denuncia.class, page, max);
	}
	
}
