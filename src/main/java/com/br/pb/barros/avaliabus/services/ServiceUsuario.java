package com.br.pb.barros.avaliabus.services;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.br.pb.barros.avaliabus.daos.UsuarioDao;
import com.br.pb.barros.avaliabus.models.Role;
import com.br.pb.barros.avaliabus.models.Usuario;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ServiceUsuario {

	@Autowired	private UsuarioDao usuarioDAO;
	
	@Autowired private PasswordEncoder passwordEncoder;

	public void saveUsuario(Usuario usuario) {
		
		Set<Role> role = new HashSet<Role>();
		Role rol = new Role();
		
		Calendar calendar = new GregorianCalendar();
		
		try {
			
			// seta papel
			rol.setName("USER");
			// adiciona no hashset
			role.add(rol);
			
			// seta o hashset no usuario depois seta a senha
			usuario.setRoles(role);			
			String cryptSenha = passwordEncoder.encode(usuario.getPassword());
			usuario.setSenha(cryptSenha);
			// pega a data instantanea
			usuario.setCreatedAt(calendar.getTime());
			
			// atribui um UUID
			usuario.setUid(generatedUUID());
			
			// salva  o novo usuario
			usuarioDAO.save(usuario);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static final Integer generatedUUID() {
		UUID idOne = UUID.randomUUID();
		return idOne.hashCode();
	}

	@Transactional public void removeUsuario(Usuario usuario) {
		try {
			
			Usuario currentUser = usuarioDAO.findById(usuario.getId());
			
			usuarioDAO.remove(currentUser);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String checkEmail(String email){
		
		ObjectMapper mapper = new ObjectMapper();
		String result = null;
		try {		
			result = mapper.writeValueAsString(usuarioDAO.checkEmailExists(email));
		
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return result;
	}

	public String checkExistsLogin(String login){
		
		ObjectMapper mapper = new ObjectMapper();
		String result = null;
		try{
			result = mapper.writeValueAsString(usuarioDAO.checkExistsLogin(login));
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return result;		
	}
	
}