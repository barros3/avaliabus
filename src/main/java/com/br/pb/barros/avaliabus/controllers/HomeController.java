package com.br.pb.barros.avaliabus.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.br.pb.barros.avaliabus.conf.UsuarioLogado;
import com.br.pb.barros.avaliabus.models.Usuario;
import com.br.pb.barros.avaliabus.services.ServiceUsuario;

@Controller
@RequestMapping(value = {"/" , "/home"})
@Transactional
public class HomeController {
	
	@Autowired private ServiceUsuario serviceUsuario;
	
	@Autowired UsuarioLogado usuarioLogado;
	
	@RequestMapping(method = RequestMethod.GET)
	public String login(ModelMap modelMap, @Valid Usuario usuario, @RequestParam(required = false) boolean checkAutorLogin, Model model) {
		
		modelMap.addAttribute("usuario", usuario);
		
		return "index";
	}
	
	@RequestMapping(method = RequestMethod.POST)	public ModelAndView save(@Valid Usuario usuario, BindingResult bindingResult) {
		serviceUsuario.saveUsuario(usuario);
		
		if(usuarioLogado.getUsuario() != null){
			System.out.println("Usuario logado!");
		} else{
			usuarioLogado.setUsuario(usuario);
		}
		
		return new ModelAndView("redirect:/");
	}	
	
	@RequestMapping(method = RequestMethod.GET, value = "/check-login", produces = "application/json")
	public @ResponseBody String checkExistsLogin(@RequestParam("login") String login,
							HttpServletRequest request, HttpServletResponse response){
		return serviceUsuario.checkExistsLogin(login);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/check-email", produces = "application/json")
	public @ResponseBody String checkEmail(@RequestParam("email") String email,
							HttpServletRequest request, HttpServletResponse response){
	
		return serviceUsuario.checkEmail(email);
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }
	
//	@RequestMapping(value = "/" , method = RequestMethod.GET)
//	public String index(ModelMap modelMap, @Valid Usuario usuario, @RequestParam(required = false) boolean checkAutorLogin, Model model) {
//		modelMap.addAttribute("usuario", usuario);
//		Authentication authentication = (Authentication) SecurityContextHolder.getContext().getAuthentication();
//		if(!authentication.getPrincipal().equals("anonymousUser")){
//			model.addAttribute("checkAutorLogin", true);
//		}
//		return "index";
//	}
	
	 private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
}
