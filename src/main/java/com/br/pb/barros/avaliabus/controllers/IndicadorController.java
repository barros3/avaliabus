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

import com.br.pb.barros.avaliabus.models.Indicador;
import com.br.pb.barros.avaliabus.services.ServiceIndicadores;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/indicador")
@Transactional
public class IndicadorController {

	@Autowired
	private ServiceIndicadores serviceIndicador;

	@RequestMapping("/frequencia/graffreq")
	public ModelAndView formFrequencia(Indicador indicador) {

		ModelAndView modelAndView = new ModelAndView("indicador/frequencia/graf-freq");
		
		return modelAndView;

	}
	
	@RequestMapping("/pontualidade/graffreq")
	public ModelAndView formPontualidade(Indicador indicador) {

		ModelAndView modelAndView = new ModelAndView("indicador/pontualidade/graf-freq");
		
		return modelAndView;

	}
	
	@RequestMapping("/limpeza/graffreq")
	public ModelAndView formLimpeza(Indicador indicador) {

		ModelAndView modelAndView = new ModelAndView("indicador/limpeza/graf-freq");
		
		return modelAndView;

	}
	
	@RequestMapping("/lotacao/graffreq")
	public ModelAndView formConducaoLotacao(Indicador indicador) {

		ModelAndView modelAndView = new ModelAndView("indicador/lotacao/graf-freq");
		
		return modelAndView;

	}
	
	@RequestMapping("/condVeic/graffreq")
	public ModelAndView formConducaoMotorista(Indicador indicador) {

		ModelAndView modelAndView = new ModelAndView("indicador/conducao_veiculo/graf-freq");
		
		return modelAndView;

	}
	
	@RequestMapping("/consColetivo/graffreq")
	public ModelAndView formConservacaoColetivo(Indicador indicador) {

		ModelAndView modelAndView = new ModelAndView("indicador/conservacao_transporte/graf-freq");
		
		return modelAndView;

	}

	@RequestMapping(value = "/list_freq_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresFrequenciaPorEmpresa(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceIndicador.checkFrequencia();
		return result;
	}
	
	@RequestMapping(value = "/list_pont_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresPontualidadePorEmpresa(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceIndicador.checkPontualidade();
		return result;
	}
	
	@RequestMapping(value = "/list_limp_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresLimpezaPorEmpresa(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceIndicador.checkLimpeza();
		return result;
	}
	
	@RequestMapping(value = "/list_lota_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresLotacaoPorEmpresa(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceIndicador.checkLotacao();
		return result;
	}
	
	@RequestMapping(value = "/list_cond_moto_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresConducaoMotoristaPorEmpresa(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceIndicador.checkConducaoMotorista();
		return result;
	}
	
	@RequestMapping(value = "/list_cons_veic_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresConservacaoColetivoPorEmpresa(HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		String result = serviceIndicador.checkConservacaoColetivo();
		return result;
	}

}
