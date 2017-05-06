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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.br.pb.barros.avaliabus.daos.DenunciaDao;
import com.br.pb.barros.avaliabus.enuns.TipoClassificacao;
import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;
import com.br.pb.barros.avaliabus.models.Denuncia;
import com.br.pb.barros.avaliabus.models.Empresa;
import com.br.pb.barros.avaliabus.services.ServiceDenuncia;

@Controller
@RequestMapping("/denuncia")
@Transactional
public class DenunciaController {

	@Autowired
	private DenunciaDao denunciaDao;

	@Autowired
	private ServiceDenuncia denunciaService;

	@InitBinder
	public void initBinderData(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat horaFormat = new SimpleDateFormat("HH:mm");
		dateFormat.setLenient(true);
		horaFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, "dataDenuncia", new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(Date.class, "horaDenuncia", new CustomDateEditor(horaFormat, true));
	}

	@RequestMapping("/form")
	public ModelAndView form(Denuncia denuncia, Empresa empresa) {

		ModelAndView modelAndView = new ModelAndView("denuncia/form-add");

		modelAndView.addObject("checkBoxValues", TipoClassificacao.values());
		modelAndView.addObject("nomeEmpresas", TipoNomeEmpresa.values());

		return loadFormDependencies(modelAndView);

	}

	private ModelAndView loadFormDependencies(ModelAndView modelAndView) {

		modelAndView.addObject("categoryList", denunciaDao.all());

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView save(@Valid Denuncia denuncia, @Valid Empresa empresa,
									@RequestParam(value = "imagemTransiente") MultipartFile multipartFile, HttpServletRequest request,
											BindingResult bindingResult) throws IOException {

		if (bindingResult.hasErrors()) {
			return form(denuncia, empresa);
		}
		
		try {
			denunciaService.saveDenuncia(multipartFile, denuncia);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return new ModelAndView("redirect:/denuncia");
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}")
	public ModelAndView load(@PathVariable("id") Long id) {

		ModelAndView modelAndView = new ModelAndView("denuncia/form-update");

		modelAndView.addObject("denuncia", denunciaDao.findById(id));

		loadFormDependencies(modelAndView);

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue = "0", required = false) int page) {

		ModelAndView modelAndView = new ModelAndView("denuncia/list");

		modelAndView.addObject("paginatedList", denunciaDao.paginated(page, 10));

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/remove/{id}")
	public String remove(@PathVariable("id") Long id) {

		Denuncia denuncia = denunciaDao.findById(id);

		denunciaDao.remove(denuncia);

		return "redirect:/denuncia";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/{id}")
	public ModelAndView update(@PathVariable("id") Long id, @Valid Denuncia denuncia, BindingResult bindingResult) {

		denuncia.setId(id);

		if (bindingResult.hasErrors()) {
			return loadFormDependencies(new ModelAndView("denuncia/form-update"));
		}

		denunciaDao.update(denuncia);

		return new ModelAndView("redirect:/denuncia");
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String resultListLinha(
			@RequestParam(value = "tipoNomeEmpresa", required = false) String tipoNomeEmpresa,
			HttpServletRequest request, HttpServletResponse response) {
		return ServiceDenuncia.checkLinha(tipoNomeEmpresa);
	}

}
