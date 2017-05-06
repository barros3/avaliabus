package com.br.pb.barros.avaliabus.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.br.pb.barros.avaliabus.daos.AvaliacaoDao;
import com.br.pb.barros.avaliabus.enuns.TipoClassificacao;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusMandacaruense;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusMarcusDaSilva;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusReunidas;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusSantaMaria;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusSaoJorge;
import com.br.pb.barros.avaliabus.enuns.TipoLinhaOnibusTransnacional;
import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;
import com.br.pb.barros.avaliabus.models.Avaliacao;
import com.br.pb.barros.avaliabus.services.ServiceAvaliacao;
import com.br.pb.barros.avaliabus.util.AvaliaBUSSessionUTIL;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/avaliacao")
@Transactional
public class AvaliacaoController {

	@Autowired	private AvaliacaoDao avaliacaoDao;
	
	@Autowired private ServiceAvaliacao serviceAvaliacao;
	
	AvaliaBUSSessionUTIL session = new AvaliaBUSSessionUTIL();
	
	@InitBinder
	public void initBinderData(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat horaFormat = new SimpleDateFormat("HH:mm");
		dateFormat.setLenient(true);
		horaFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, "dataAvaliacao", new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(Date.class, "horaAvaliacao", new CustomDateEditor(horaFormat, true));
	}

	@RequestMapping("/form")
	public ModelAndView form(Avaliacao avaliacao) {
		
		ModelAndView modelAndView = new ModelAndView("avaliacao/form-add");
		
		modelAndView.addObject("checkBoxValues", TipoClassificacao.values());
		modelAndView.addObject("nomeEmpresas", TipoNomeEmpresa.values());
		return loadFormDependencies(modelAndView);

	}

	private ModelAndView loadFormDependencies(ModelAndView modelAndView) {
		modelAndView.addObject("categoryList", avaliacaoDao.all());
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView save(@Valid Avaliacao avaliacao, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return form(avaliacao);
		}
		serviceAvaliacao.saveAvaliacao(avaliacao);
		
		if(session.isAdminMaster()){			
			return new ModelAndView("redirect:/avaliacao");
		}
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}")
	public ModelAndView load(@PathVariable("id") Long id) {
		ModelAndView modelAndView = new ModelAndView("avaliacao/form-update");
		modelAndView.addObject("avaliacao", avaliacaoDao.findById(id));
		loadFormDependencies(modelAndView);
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue = "0", required = false) int page) {
		ModelAndView modelAndView = new ModelAndView("avaliacao/list");
		modelAndView.addObject("paginatedList", avaliacaoDao.paginated(page, 10));
		return modelAndView;
	}

	// just because get is easier here. Be my guest if you want to change.
	@RequestMapping(method = RequestMethod.GET, value = "/remove/{id}")
	public String remove(@PathVariable("id") Long id) {
		Avaliacao avaliacao = avaliacaoDao.findById(id);
		avaliacaoDao.remove(avaliacao);
		return "redirect:/avaliacao";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/{id}")
	public ModelAndView update(@PathVariable("id") Long id, @Valid Avaliacao avaliacao, BindingResult bindingResult) {
		avaliacao.setId(id);
		if (bindingResult.hasErrors()) {
			return loadFormDependencies(new ModelAndView("avaliacao/form-update"));
		}
		avaliacaoDao.update(avaliacao);
		return new ModelAndView("redirect:/avaliacao");
	}
	
	
	@RequestMapping(value="/add", method=RequestMethod.GET,  produces="application/json")
	public @ResponseBody String resultListLinha(@RequestParam("tipoNomeEmpresa") String tipoNomeEmpresa, 
											HttpServletRequest request, HttpServletResponse response) {
		
		Map<Integer, String> options = new HashMap<>();
		
		if(tipoNomeEmpresa.equals(TipoNomeEmpresa.SANTA_MARIA.toString())){		
			options = TipoLinhaOnibusSantaMaria.ENUM_MAP;
		}
		if(tipoNomeEmpresa.equals(TipoNomeEmpresa.MANDACARUENSE.toString())){		
			options = TipoLinhaOnibusMandacaruense.ENUM_MAP;
		}
		if(tipoNomeEmpresa.equals(TipoNomeEmpresa.MARCOS_SILVA.toString())){		
			options = TipoLinhaOnibusMarcusDaSilva.ENUM_MAP;
		}
		if(tipoNomeEmpresa.equals(TipoNomeEmpresa.REUNIDAS.toString())){		
			options = TipoLinhaOnibusReunidas.ENUM_MAP;
		}
		if(tipoNomeEmpresa.equals(TipoNomeEmpresa.SAO_JORGE.toString())){		
			options = TipoLinhaOnibusSaoJorge.ENUM_MAP;
		}
		if(tipoNomeEmpresa.equals(TipoNomeEmpresa.TRANSNACIONAL.toString())){		
			options = TipoLinhaOnibusTransnacional.ENUM_MAP;
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		String listResult = null;
		
		try {
			listResult = mapper.writeValueAsString(options);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listResult;
	}
	
}