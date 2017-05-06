package com.br.pb.barros.avaliabus.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.br.pb.barros.avaliabus.daos.UsuarioDao;
import com.br.pb.barros.avaliabus.models.Usuario;
import com.br.pb.barros.avaliabus.services.ServiceUsuario;
import com.br.pb.barros.avaliabus.validators.ValidatorUsuario;

@Controller
@RequestMapping("/usuario")
@Transactional
public class UsuarioController {

	@Autowired private UsuarioDao usuarioDao;
	
	@Autowired private ServiceUsuario serviceUsuario;
	
	private ValidatorUsuario validatorUsuario = new ValidatorUsuario();

	@RequestMapping("/form")	public ModelAndView form(Usuario usuario) {
		ModelAndView modelAndView = new ModelAndView("usuario/form-add");
		return modelAndView;

	}

	@RequestMapping(method = RequestMethod.POST)	public ModelAndView save(@Valid Usuario usuario, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return form(usuario);
		}
		serviceUsuario.saveUsuario(usuario);
		return new ModelAndView("redirect:/");
	}		

	@RequestMapping(method = RequestMethod.GET, value = "/{id}")	public ModelAndView load(@PathVariable("id") Long id) {
		ModelAndView modelAndView = new ModelAndView("usuario/form-update");
		modelAndView.addObject("usuario", usuarioDao.findById(id));
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET)	public ModelAndView list(@RequestParam(defaultValue = "0", required = false) int page) {
		ModelAndView modelAndView = new ModelAndView("usuario/list");
		modelAndView.addObject("paginatedList", usuarioDao.paginated(page, 10));
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/remove/{id}")	public String remove(@PathVariable("id") Long id) {
		Usuario usuario = usuarioDao.findById(id);
		usuarioDao.remove(usuario);
		return "redirect:/usuario";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/{id}")	public ModelAndView update(@PathVariable("id") Long id, @Valid Usuario usuario, BindingResult bindingResult) {
		usuario.setId(id);
		if (bindingResult.hasErrors()) {
			return new ModelAndView("usuario/form-update");
		}
		usuarioDao.update(usuario);
		return new ModelAndView("redirect:/usuario");
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/check-email", produces = "application/json")
	public @ResponseBody String checkEmail(@RequestParam("email") String email,
							HttpServletRequest request, HttpServletResponse response){
	
		return serviceUsuario.checkEmail(email);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/check-login", produces = "application/json")
	public @ResponseBody String checkExistsLogin(@RequestParam("login") String login,
							HttpServletRequest request, HttpServletResponse response){
		return serviceUsuario.checkExistsLogin(login);
	}
	
}
