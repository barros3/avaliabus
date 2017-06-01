package com.br.pb.barros.avaliabus.util;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class AvaliaBUSInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AvaliaBUSInterceptor.class);

	private AvaliaBUSSessionUTIL session = new AvaliaBUSSessionUTIL();
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handle) throws Exception {

		// Defini se aplicacao esta remota ou local
		request.setAttribute("isLocal", session.isLocal());

		
		Authentication authentication = (Authentication) SecurityContextHolder.getContext().getAuthentication();		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		
		if(authorities.iterator().next().getAuthority().equals("USER") || authorities.iterator().next().getAuthority().equals("ADMIN_MASTER")){
			
			session.setLogado(true);
			request.setAttribute("isLogado", session.isLogado());
		
			if(authorities.iterator().next().getAuthority().equals("ADMIN_MASTER")){
				
				session.setAdminMaster(true);
				request.setAttribute("admin_master", session.isAdminMaster());
				
			}
		}

		return true;
	}

}
