package com.br.pb.barros.avaliabus.daos;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;

import com.br.pb.barros.avaliabus.models.Role;


public interface RoleDao {

	public void setManager(EntityManager manager);
	public List<Role> all();
	public void save(Role role);
	public Role findByName(String id);
	public void remove(Role role);
	public void update(Role role);
	public Set<Role> findRolesUsuario();
	public void merge(Role role);
	public Role findRoleByIdUsuario(Long id);
	
}