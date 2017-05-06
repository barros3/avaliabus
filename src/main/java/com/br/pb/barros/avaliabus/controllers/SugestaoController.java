package com.br.pb.barros.avaliabus.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

import com.br.pb.barros.avaliabus.daos.SugestaoDao;
import com.br.pb.barros.avaliabus.enuns.TipoClassificacao;
import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;
import com.br.pb.barros.avaliabus.models.Sugestao;
import com.br.pb.barros.avaliabus.services.ServiceSugestao;
import com.br.pb.barros.avaliabus.util.AvaliaBUSSessionUTIL;

@Controller
@RequestMapping("/sugestao")
@Transactional
public class SugestaoController {

	@Autowired private SugestaoDao sugestaoDao;

	@Autowired private ServiceSugestao sugestaoService;

	AvaliaBUSSessionUTIL session = new AvaliaBUSSessionUTIL();
	
	@InitBinder
	public void initBinderData(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat horaFormat = new SimpleDateFormat("HH:mm");
		dateFormat.setLenient(true);
		horaFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, "dataSugestao", new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(Date.class, "horaSugestao", new CustomDateEditor(horaFormat, true));
	}

	@RequestMapping("/form")
	public ModelAndView form(Sugestao sugestao) {

		ModelAndView modelAndView = new ModelAndView("sugestao/form-add");

		modelAndView.addObject("checkBoxValues", TipoClassificacao.values());
		modelAndView.addObject("nomeEmpresas", TipoNomeEmpresa.values());

		return loadFormDependencies(modelAndView);

	}

	private ModelAndView loadFormDependencies(ModelAndView modelAndView) {

		modelAndView.addObject("categoryList", sugestaoDao.all());

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView save(@Valid Sugestao sugestao,	BindingResult bindingResult) throws IOException {

		if (bindingResult.hasErrors()) {
			return form(sugestao);
		}
		
		try {
			sugestaoService.saveSugestao(sugestao);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if(session.isAdminMaster()){			
			return new ModelAndView("redirect:/avaliacao");
		}
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}")
	public ModelAndView load(@PathVariable("id") Long id) {

		ModelAndView modelAndView = new ModelAndView("sugestao/form-update");

		modelAndView.addObject("sugestao", sugestaoDao.findById(id));

		loadFormDependencies(modelAndView);

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue = "0", required = false) int page) {

		ModelAndView modelAndView = new ModelAndView("sugestao/list");

		modelAndView.addObject("paginatedList", sugestaoDao.paginated(page, 10));

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/remove/{id}")
	public String remove(@PathVariable("id") Long id) {

		Sugestao sugestao = sugestaoDao.findById(id);

		sugestaoDao.remove(sugestao);

		return "redirect:/sugestao";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/{id}")
	public ModelAndView update(@PathVariable("id") Long id, @Valid Sugestao sugestao, BindingResult bindingResult) {

		sugestao.setId(id);

		if (bindingResult.hasErrors()) {
			return loadFormDependencies(new ModelAndView("sugestao/form-update"));
		}

		sugestaoDao.update(sugestao);

		return new ModelAndView("redirect:/sugestao");
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String resultListLinha(
			@RequestParam(value = "tipoNomeEmpresa", required = false) String tipoNomeEmpresa,
			HttpServletRequest request, HttpServletResponse response) {
		return ServiceSugestao.checkLinha(tipoNomeEmpresa);
	}

}
