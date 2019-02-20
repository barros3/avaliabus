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
		return new ModelAndView("indicador/frequencia/graf-freq");
	}
	
	@RequestMapping("/pontualidade/graffreq")
	public ModelAndView formPontualidade(Indicador indicador) {
		return new ModelAndView("indicador/pontualidade/graf-freq");
	}
	
	@RequestMapping("/limpeza/graffreq")
	public ModelAndView formLimpeza(Indicador indicador) {
		return new ModelAndView("indicador/limpeza/graf-freq");
	}
	
	@RequestMapping("/lotacao/graffreq")
	public ModelAndView formConducaoLotacao(Indicador indicador) {
		return new ModelAndView("indicador/lotacao/graf-freq");
	}
	
	@RequestMapping("/condVeic/graffreq")
	public ModelAndView formConducaoMotorista(Indicador indicador) {
		return new ModelAndView("indicador/conducao_veiculo/graf-freq");
	}
	
	@RequestMapping("/consColetivo/graffreq")
	public ModelAndView formConservacaoColetivo(Indicador indicador) {
		return new ModelAndView("indicador/conservacao_transporte/graf-freq");
	}

	@RequestMapping(value = "/list_freq_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresFrequenciaPorEmpresa(
			HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		return serviceIndicador.checkFrequencia();
	}
	
	@RequestMapping(value = "/list_pont_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresPontualidadePorEmpresa(
			HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		return serviceIndicador.checkPontualidade();		
	}
	
	@RequestMapping(value = "/list_limp_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresLimpezaPorEmpresa(
			HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		return serviceIndicador.checkLimpeza();
	}
	
	@RequestMapping(value = "/list_lota_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresLotacaoPorEmpresa(
			HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		return serviceIndicador.checkLotacao();
	}
	
	@RequestMapping(value = "/list_cond_moto_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresConducaoMotoristaPorEmpresa(
			HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		return serviceIndicador.checkConducaoMotorista();
	}
	
	@RequestMapping(value = "/list_cons_veic_indicador", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resultIndicadoresConservacaoColetivoPorEmpresa(
			HttpServletRequest request, HttpServletResponse response) throws SQLDataException, JsonProcessingException {
		return serviceIndicador.checkConservacaoColetivo();
	}

}
