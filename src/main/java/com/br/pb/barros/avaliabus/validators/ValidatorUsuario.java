package com.br.pb.barros.avaliabus.validators;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.br.pb.barros.avaliabus.models.Usuario;


/**
 * 
 * @author Luciano Barros
 *
 */

@Component 
public class ValidatorUsuario implements Validator {

	private Pattern pattern;
	private Matcher matcher;

	private static final String EMAIL_PATTERN =
		"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	@Override
	public boolean supports(Class<?> clazz) {
		return Usuario.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login", "field.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "field.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "senha", "field.empty");

		Usuario usuario = (Usuario) target;

		if(!validate(usuario.getEmail())){
			errors.rejectValue("email", "field.email", "Email Inválido!");
		}
			
	}
	
	/**
	 * Validate hex with regular expression
	 *
	 * @param hex
	 *            hex for validation
	 * @return true valid hex, false invalid hex
	 */
	public boolean validate(final String hex) {

		pattern = Pattern.compile(EMAIL_PATTERN);
		
		matcher = pattern.matcher(hex);
		
		return matcher.matches();

	}
	
}
