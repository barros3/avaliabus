package com.br.pb.barros.avaliabus.controllers;

import java.sql.SQLDataException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.br.pb.barros.avaliabus.models.Usuario;
import com.br.pb.barros.avaliabus.services.ServiceEmpresaIndicadores;
import com.br.pb.barros.avaliabus.services.ServiceResultado;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/resultados")
@Transactional
public class ResultadosController {
	
	@Autowired	private ServiceResultado serviceResultado;

	@RequestMapping("/form")	public ModelAndView form(Usuario resultados) {
		ModelAndView modelAndView = new ModelAndView("resultados/form-add");
		return modelAndView;

	}
	
	@RequestMapping(value = "/graf-modulo", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultDenunciaQuantidade(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceResultado.countDenunciaEmpresa();
		return result;
	}
	

}
