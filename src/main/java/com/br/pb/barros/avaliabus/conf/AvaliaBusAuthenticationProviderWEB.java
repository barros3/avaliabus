package com.br.pb.barros.avaliabus.conf;

import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.br.pb.barros.avaliabus.daos.UsuarioSessionDao;
import com.br.pb.barros.avaliabus.models.Usuario;


@Component
public class AvaliaBusAuthenticationProviderWEB implements AuthenticationProvider {
	
	@PersistenceContext private EntityManager manager;

	@Autowired private PasswordEncoder passwordEncoder;
	
	@Autowired UsuarioSessionDao usuarioSessionDao;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String username = authentication.getName();
		String password = (String) authentication.getCredentials();

		List<Usuario> users = manager.createQuery("select u from Usuario u where u.login = :login", Usuario.class)
				.setParameter("login", username).getResultList();
		if (users.isEmpty()) {
			throw new UsernameNotFoundException("O usuario	" + username + " não existe");
		}
		if (users.get(0) == null || !users.get(0).getUsername().equals(username)) {
			throw new BadCredentialsException("Login não encontrado!");
		}
		
		String passwordBase = usuarioSessionDao.loadUserByUsername(username).getPassword();
		
		if (!passwordEncoder.matches(password, passwordBase)) {
			throw new BadCredentialsException("Senha errada!");
		}
		
		Collection<? extends GrantedAuthority> autorities = users.get(0).getAuthorities();
		
		return new UsernamePasswordAuthenticationToken(users.get(0), password, autorities);		
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	
	public AvaliaBusAuthenticationProviderWEB() {
		super();
	}
	
}