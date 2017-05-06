//package com.br.pb.barros.avaliabus.controllers;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.validation.Valid;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.ui.ModelMap;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.br.pb.barros.avaliabus.daos.RoleDao;
//import com.br.pb.barros.avaliabus.daos.UsuarioSessionDao;
//import com.br.pb.barros.avaliabus.models.Usuario;
//import com.br.pb.barros.avaliabus.services.ServiceUsuario;
//
//
//@Controller
//@RequestMapping("/")
//public class LoginController {
//
//	@Autowired UsuarioSessionDao usuarioSessionDaoImpl;
//	
//	@Autowired private ServiceUsuario serviceUsuario;
//	
//	@Autowired RoleDao roleDao;
//	
//	@RequestMapping(value = "/login" , method = RequestMethod.GET)
//	public String login(ModelMap modelMap, @Valid Usuario usuario) {
//		modelMap.addAttribute("usuario", usuario);
//		return "login/form";
//	}
//	
//	@RequestMapping(value = "/" , method = RequestMethod.GET)
//	public String index(ModelMap modelMap, @Valid Usuario usuario, @RequestParam(required = false) boolean checkAutorLogin, Model model) {
//		modelMap.addAttribute("usuario", usuario);
//		Authentication authentication = (Authentication) SecurityContextHolder.getContext().getAuthentication();
//		if(!authentication.getPrincipal().equals("anonymousUser")){
//			model.addAttribute("checkAutorLogin", true);
//		}
//		return "index";
//	}
//
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public String logout(HttpServletRequest request, HttpServletResponse response) {
//		Authentication authentication = (Authentication) SecurityContextHolder.getContext().getAuthentication();
//		if(authentication != null)	{
//			new SecurityContextLogoutHandler().logout(request, response, authentication);;
//		}
//		return "/";
//	}
//	
//	@RequestMapping(method = RequestMethod.POST, value ="/")	public ModelAndView save(@Valid Usuario usuario, BindingResult bindingResult) {
//		serviceUsuario.saveUsuario(usuario);
//		return new ModelAndView("redirect:/index");
//	}	
//
//}
