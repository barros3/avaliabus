//package com.br.pb.barros.avaliabus.daos;
//
//import java.util.List;
//
//import javax.persistence.EntityManager;
//import javax.persistence.PersistenceContext;
//import javax.persistence.Query;
//
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Repository;
//
//import com.br.pb.barros.avaliabus.models.PaginatedList;
//import com.br.pb.barros.avaliabus.models.Usuario;
//
//
//@Repository
//public class UserDetailsServiceDAO implements UserDetailsService {
//
//	@PersistenceContext
//	private EntityManager em;
//	
//	@PersistenceContext
//	private EntityManager manager;
//
//	public void setManager(EntityManager manager) {
//		this.manager = manager;
//	}
//
//	public List<Usuario> all() {
//		return manager.createQuery("select c from Usuario c", Usuario.class).getResultList();
//	}
//
//	public void save(Usuario usuario) {
//		manager.persist(usuario);
//	}
//
//	public Usuario findById(Long id) {
//		return manager.find(Usuario.class, id);
//	}
//
//	public void remove(Usuario usuario) {
//		manager.remove(usuario);
//	}
//
//	public void update(Usuario usuario) {
//		manager.merge(usuario);
//	}
//
//	public Usuario findByLoginAndSenha(String login, String senha) {
//		Query query = manager.createQuery("select c from Usuario c where c.login = :login and c.senha = :senha")
//				.setParameter("login", login).setParameter("senha", senha);
//		Usuario usuario = (Usuario) query.getSingleResult();
//		return usuario;
//	}
//
////	public PaginatedList paginated(int page, int max) {
////		return new PaginatorQueryHelper().list(manager, Usuario.class, page, max);
////	}
//
//	@Override
//	public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
//		List<Usuario> users = manager.createQuery("select u from Usuario u where u.login = :login", Usuario.class)
//				.setParameter("login", login).getResultList();
//		if (users.isEmpty()) {
//			throw new UsernameNotFoundException("O usuario	" + login + " não existe");
//		}
//		return users.get(0);
//	}
//	
//	public Usuario findByLogin(String login) {
//		Usuario usuario =  new Usuario();
//		try {
//			usuario = manager.createQuery("select c from Usuario c where c.login = :login", Usuario.class)
//					.setParameter("login", login).getSingleResult();
//		} catch (Exception e) {
//			return null;
//		}
//		return usuario;
//	}
//
////	@Override
////	public Usuario findUsuarioByIdFuncionario(Long idFuncionario) {
////		Usuario user = manager.createQuery("Select f.usuario from funcionario f where f.idusuario = :idusuario", Usuario.class)
////				.setParameter("idUsuario", idFuncionario).getSingleResult();
////		return user;
////	}
//
////	@Override
////	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
////		throw new UnsupportedOperationException("You should implement the body of this method in order to load users");
////	}
//
//}