package com.br.pb.barros.avaliabus.controllers;

import java.sql.SQLDataException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.br.pb.barros.avaliabus.models.Empresa;
import com.br.pb.barros.avaliabus.services.ServiceEmpresaIndicadores;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/empresa/indicadores")
@Transactional
public class EmpresaIndicadoresController {

	@Autowired	private ServiceEmpresaIndicadores serviceEmpresaIndicadores;
	
	@RequestMapping(method = RequestMethod.GET, value = "/santa-maria")
	public @ResponseBody ModelAndView formEmpresaSantaMaria(@Valid Empresa empresa){
		return new ModelAndView("empresa/indicadores/santa-maria/form-graf-ind");		
	}
	
	@RequestMapping(value = "/graf-indicadores-empresa-santa-maria", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresEmpresaSantaMaria(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceEmpresaIndicadores.checkIndicadoresEmpresa((long) 1);
		return result;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/mandacaruense")
	public @ResponseBody ModelAndView formEmpresaMandacaruense(@Valid Empresa empresa){
		return new ModelAndView("empresa/indicadores/mandacaruense/form-graf-ind");		
	}
	
	@RequestMapping(value = "/graf-indicadores-empresa-mandacaruense", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresEmpresaMandacaruense(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceEmpresaIndicadores.checkIndicadoresEmpresa((long) 2);
		return result;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/marcos-da-silva")
	public @ResponseBody ModelAndView formEmpresaMarcosDaSilva(@Valid Empresa empresa){
		return new ModelAndView("empresa/indicadores/marcos-da-silva/form-graf-ind");		
	}
	
	@RequestMapping(value = "/graf-indicadores-empresa-marcos-da-silva", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresEmpresaMarcosDaSilva(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceEmpresaIndicadores.checkIndicadoresEmpresa((long) 3);
		return result;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/transnacional")
	public @ResponseBody ModelAndView formEmpresaTransnacional(@Valid Empresa empresa){
		return new ModelAndView("empresa/indicadores/transnacional/form-graf-ind");		
	}
	
	@RequestMapping(value = "/graf-indicadores-empresa-transnacional", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresEmpresaTransnacional(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceEmpresaIndicadores.checkIndicadoresEmpresa((long) 4);
		return result;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/sao-jorge")
	public @ResponseBody ModelAndView formEmpresaSaoJorge(@Valid Empresa empresa){
		return new ModelAndView("empresa/indicadores/sao-jorge/form-graf-ind");		
	}
	
	@RequestMapping(value = "/graf-indicadores-empresa-sao-jorge", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresEmpresaSaoJorge(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceEmpresaIndicadores.checkIndicadoresEmpresa((long) 5);
		return result;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/reunidas")
	public @ResponseBody ModelAndView formEmpresaReunidas(@Valid Empresa empresa){
		return new ModelAndView("empresa/indicadores/reunidas/form-graf-ind");		
	}
	
	@RequestMapping(value = "/graf-indicadores-empresa-reunidas", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresEmpresaReunidas(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceEmpresaIndicadores.checkIndicadoresEmpresa((long) 6);
		return result;
	}

}