package com.br.pb.barros.avaliabus.daos;

import java.util.List;

import com.br.pb.barros.avaliabus.models.PaginatedList;
import com.br.pb.barros.avaliabus.models.Usuario;

public interface UsuarioDao {

	public void save(Usuario usuario);
	
	public void remove(Usuario usuario);

	public void update(Usuario usuario);

	public Usuario findById(Long id);

	public boolean checkEmailExists(String email);
	
	public boolean checkExistsLogin(String login);
	
	public List<Usuario> all();

	public PaginatedList paginated(int page, int max);

}
