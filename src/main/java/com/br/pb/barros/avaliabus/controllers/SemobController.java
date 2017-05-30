package com.br.pb.barros.avaliabus.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.br.pb.barros.avaliabus.daos.SemobDao;
import com.br.pb.barros.avaliabus.models.Semob;

@Controller
@RequestMapping("/semob")
@Transactional
public class SemobController {

	@Autowired private SemobDao semobDao;
	
	@RequestMapping("/form")	public ModelAndView form(Semob semob) {
		ModelAndView modelAndView = new ModelAndView("semob/form-add");
		modelAndView.addObject("semob", semobDao.get());
		return modelAndView;

	}

	@RequestMapping(method = RequestMethod.POST)	public ModelAndView save(@Valid Semob semob, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return form(semob);
		}
		semobDao.save(semob);
		return new ModelAndView("redirect:/");
	}		

	@RequestMapping(method = RequestMethod.GET, value = "/{id}")	public ModelAndView load(@PathVariable("id") Long id) {
		ModelAndView modelAndView = new ModelAndView("semob/form-update");
		modelAndView.addObject("semob", semobDao.get());
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/remove/{id}")	public String remove(@PathVariable("id") Long id) {
		Semob semob = semobDao.get();
		semobDao.remove(semob);
		return "redirect:/semob";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/{id}")	public ModelAndView update(@PathVariable("id") Long id, @Valid Semob semob, BindingResult bindingResult) {
		semob.setId(id);
		if (bindingResult.hasErrors()) {
			return new ModelAndView("semob/form-update");
		}
		semobDao.update(semob);
		return new ModelAndView("redirect:/semob");
	}
	
}
