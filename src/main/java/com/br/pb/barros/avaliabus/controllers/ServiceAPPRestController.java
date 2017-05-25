package com.br.pb.barros.avaliabus.controllers;

import java.util.HashMap;
import java.util.List;

import javax.mail.Header;

import org.jboss.resteasy.core.MediaTypeMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.br.pb.barros.avaliabus.daos.UsuarioDao;
import com.br.pb.barros.avaliabus.daos.UsuarioSessionDao;
import com.br.pb.barros.avaliabus.models.Usuario;
import com.br.pb.barros.avaliabus.services.ServiceUsuario;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

@RestController
public class ServiceAPPRestController {

	@Autowired	ServiceUsuario userService;

	@Autowired	UsuarioDao userDao;
	
	@Autowired UsuarioSessionDao usuarioSessionDAO;

	@RequestMapping(value = "/user/", method = RequestMethod.GET)
	public ResponseEntity<List<Usuario>> listAllUsuarios() {
		List<Usuario> users = userDao.all();
		if (users.isEmpty()) {
			return new ResponseEntity<List<Usuario>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Usuario>>(users, HttpStatus.OK);
	}

	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Usuario> getUsuario(@PathVariable("id") long id) {
        Usuario user = userDao.findById(id);
        if (user == null) {
            return new ResponseEntity<Usuario>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Usuario>(user, HttpStatus.OK);
    }
 

	@RequestMapping(value = "/registrar/", method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<Void> createUsuario(Usuario usuario, UriComponentsBuilder ucBuilder) {
		
		try {
			
			String returnMail = userService.checkEmail(usuario.getEmail());
			String returnLogin = userService.checkExistsLogin(usuario.getLogin());
			
			if (!returnMail.equalsIgnoreCase("false") || !returnLogin.equalsIgnoreCase("false") ) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			userService.saveUsuario(usuario);

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		/*ObjectMapper mapper = new ObjectMapper();
		
		HashMap<String, Usuario> hash = new HashMap<String, Usuario>();
		hash.put("usuario", user);
		
		try {
			
			mapper.writeValueAsString(hash);
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}*/
		
//		return new ResponseEntity<Void>(HttpStatus.CREATED);
		
		/*HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/registrar/{id}").buildAndExpand(usuario.getId()).toUri());*/
		
		return new ResponseEntity<Void>(HttpStatus.OK);

	}
	
	@RequestMapping(value = "/user/login/", method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<Void> loginUsuario(String login, String senha, UriComponentsBuilder ucBuilder) {
		
		Usuario usuario = usuarioSessionDAO.findByLoginAndSenha(login, senha);
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.set("", headers.SET_COOKIE);
		
		headers.setLocation(ucBuilder.path("/login/{id}").buildAndExpand(usuario.getId()).toUri());
		
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
	public ResponseEntity<Usuario> updateUsuario(@PathVariable("id") long id, @RequestBody Usuario user) {
		Usuario currentUsuario = userDao.findById(id);

		if (currentUsuario == null) {
			return new ResponseEntity<Usuario>(HttpStatus.NOT_FOUND);
		}

		currentUsuario.setLogin(user.getLogin());
		currentUsuario.setEmail(user.getEmail());
		currentUsuario.setSenha(user.getSenha());

		userDao.update(currentUsuario);
		return new ResponseEntity<Usuario>(currentUsuario, HttpStatus.OK);
	}

	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Usuario> deleteUsuario(@PathVariable("id") long id) {
		Usuario user = userDao.findById(id);
		if (user == null) {
			return new ResponseEntity<Usuario>(HttpStatus.NOT_FOUND);
		}

		userService.removeUsuario(user);
		return new ResponseEntity<Usuario>(HttpStatus.NO_CONTENT);
	}

	@RequestMapping(value = "/user/", method = RequestMethod.DELETE)
	public ResponseEntity<Usuario> deleteAllUsuarios() {
		// userService.deleteAllUsuarios();
		return new ResponseEntity<Usuario>(HttpStatus.NO_CONTENT);
	}
	
}