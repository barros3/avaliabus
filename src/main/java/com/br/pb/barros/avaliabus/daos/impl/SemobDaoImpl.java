package com.br.pb.barros.avaliabus.daos.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.daos.SemobDao;
import com.br.pb.barros.avaliabus.models.Semob;

@Repository
public class SemobDaoImpl implements SemobDao {

	@PersistenceContext
	private EntityManager manager;

	public void save(Semob semob) {
		if(get() != null){
			manager.merge(semob);
		}
		manager.persist(semob);
	}

	public Semob get() {
		return (Semob) manager.createQuery("FROM Semob").getResultList().get(0);
	}

	public void remove(Semob semob) {
		manager.remove(semob);
	}

	public void update(Semob semob) {
		manager.merge(semob);
	}

}
