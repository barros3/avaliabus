<%@page import="java.util.Enumeration"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<div class="mdl-grid">
	<div class="mdl-cell mdl-cell--12-col">
		<div class="mdl-grid">
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--6-col">
				<label for="nomeResponsavel" class="mdl-textfield__label">Responsável <span></span></label>	
				<form:input path="nomeResponsavel" class="mdl-textfield__input" name="nomeResponsavel" id="nomeResponsavel" type="text"/>
			</div>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--3-col">
				<label for="email" class="mdl-textfield__label">E-mail<span></span></label>
				<form:input path="email" class="mdl-textfield__input" name="email" id="email" type="text"/>
			</div>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--3-col">
				<label for="telefone" class="mdl-textfield__label">Telefone<span></span></label>
				<form:input path="telefone" class="mdl-textfield__input" name="telefone" id="telefone" type="text"/>
			</div>
		</div>
	</div>
	
	<div class="mdl-cell mdl-cell--12-col">
		<div class="mdl-grid">
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--6-col">
				<label for="endereco" class="mdl-textfield__label">Endereço<span></span></label>
				<form:input path="endereco" class="mdl-textfield__input" id="endereco" type="text" />
			</div>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--6-col">
				<label for="tipoNomeEmpresa">Nome da Empresa<span style="color: red;"> *</span></label>	
				<form:select path="tipoNomeEmpresa" class="mdl-textfield__input" id="tipoNomeEmpresa">
					<form:option value="" label="<-- Empresa -->"/>
			    	<form:options items="${nomeEmpresas}" itemLabel="valor"/>
				</form:select>
			</div>
		</div>
	</div>
</div>