package com.br.pb.barros.avaliabus.controllers;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.br.pb.barros.avaliabus.daos.UsuarioSessionDao;

@Controller	@Transactional @RequestMapping("/facebook")
public class SpringSocialLoginController {
	
	@Autowired private UsuarioSessionDao usuarioSessionDAO;
	
	private HttpSession session;
	
	public SpringSocialLoginController() {
	}
	
	public SpringSocialLoginController(UsuarioSessionDao usuarioSessionDao
			, HttpSession session) {
		
		this.usuarioSessionDAO = usuarioSessionDao;
		this.session = session;
	}
	
	
	@RequestMapping(name = "/singin", method = RequestMethod.GET)
	public ModelAndView facebook(Facebook facebook, ModelAndView modelAndView
							   , HttpRequest request, HttpResponse response){	
		
		System.out.println("Passou por aqui");
		
		return modelAndView;
	}
}