package com.br.pb.barros.avaliabus.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.br.pb.barros.avaliabus.models.Empresa;
import com.br.pb.barros.avaliabus.daos.EmpresaDao;
import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;

@Controller
@RequestMapping("/empresa")
@Transactional
public class EmpresaController {

	@Autowired
	private EmpresaDao empresaDao;

	@RequestMapping("/form")
	public ModelAndView form(Empresa empresa) {
		ModelAndView modelAndView = new ModelAndView("empresa/form-add");
		modelAndView.addObject("nomeEmpresas", TipoNomeEmpresa.values());
		return modelAndView;

	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView save(@Valid Empresa empresa, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return form(empresa);
		}
		empresaDao.save(empresa);
		return new ModelAndView("redirect:/empresa");
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}")
	public ModelAndView load(@PathVariable("id") Long id) {
		ModelAndView modelAndView = new ModelAndView("empresa/form-update");
		modelAndView.addObject("empresa", empresaDao.findById(id));
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue = "0", required = false) int page) {
		ModelAndView modelAndView = new ModelAndView("empresa/list");
		modelAndView.addObject("paginatedList", empresaDao.paginated(page, 10));
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/remove/{id}")
	public String remove(@PathVariable("id") Long id) {
		Empresa empresa = empresaDao.findById(id);
		empresaDao.remove(empresa);
		return "redirect:/empresa";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/{id}")
	public ModelAndView update(@PathVariable("id") Long id, @Valid Empresa empresa, BindingResult bindingResult) {
		empresa.setId(id);
		if (bindingResult.hasErrors()) {
			return new ModelAndView("empresa/form-update");
		}
		empresaDao.update(empresa);
		return new ModelAndView("redirect:/empresa");
	}
}
