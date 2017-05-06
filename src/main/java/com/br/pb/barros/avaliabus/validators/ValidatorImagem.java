package com.br.pb.barros.avaliabus.validators;

import java.io.File;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;


@Component
public class ValidatorImagem implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MultipartFile.class.equals(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		MultipartFile imagem = (MultipartFile) target;
		
		if(imagem.getSize() == 0){
			errors.reject("imagem", "required.imagem");
		}
		
	}
}
