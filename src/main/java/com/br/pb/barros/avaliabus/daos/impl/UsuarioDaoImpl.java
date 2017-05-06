package com.br.pb.barros.avaliabus.daos.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.daos.PaginatorQueryHelper;
import com.br.pb.barros.avaliabus.daos.UsuarioDao;
import com.br.pb.barros.avaliabus.models.PaginatedList;
import com.br.pb.barros.avaliabus.models.Usuario;

@Repository
public class UsuarioDaoImpl implements UsuarioDao {

	@PersistenceContext
	private EntityManager manager;

	public List<Usuario> all() {
		return manager.createQuery("select c from Usuario c", Usuario.class).getResultList();
	}

	public void save(Usuario usuario) {
		manager.persist(usuario);
	}

	public Usuario findById(Long id) {
		return manager.find(Usuario.class, id);
	}

	public void remove(Usuario usuario) {
		manager.remove(usuario);
	}

	public void update(Usuario usuario) {
		manager.merge(usuario);
	}

	public PaginatedList paginated(int page, int max) {
		return new PaginatorQueryHelper().list(manager, Usuario.class, page, max);
	}

	public boolean checkEmailExists(String email) {
		List<Usuario> resultUsuario = new ArrayList<Usuario>();

		boolean booleanResult = false;
		
		try{
			
			resultUsuario = (List<Usuario>) manager.createQuery("SELECT u FROM Usuario u WHERE u.email = :email", Usuario.class).
				setParameter("email", email).getResultList();
		
			if(resultUsuario.get(0) == null){
				booleanResult = false;
			}else{
				booleanResult =  true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		return booleanResult;
	}

	public boolean checkExistsLogin(String login) {
		List<Usuario> resultUsuario = new ArrayList<Usuario>();
		
		boolean booleanResult = false;

		try{
			
			resultUsuario = (List<Usuario>) manager.createQuery("SELECT u FROM Usuario u WHERE u.login = :login", Usuario.class).
				setParameter("login", login).getResultList();
		
			if(resultUsuario.get(0) == null){
				booleanResult = false;
			}else{
				booleanResult =  true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		return booleanResult;
	}
	
}
