<%@page import="java.util.Enumeration"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>

<script type="text/javascript">
	function checkMail() {

		var _email = $("#email").val();

		$.ajax({
			type : "get",
			url : "/avaliabus/usuario/check-email",
			data : {
				email : _email
			},
			contentType : "application/json; charset=utf-8",
			success : function(response) {

				if (response.toString() === "true") {
					alert("Email já castrado!")
				}

			},
			erro : function(response) {
				console.log(response);
				alert('ERRO NA REQUISICAO!!');
			}
		});
	}

	function validateEmail(email) {
		var chrbeforAt = email.substr(0, email.indexOf('@'));
		if (!($.trim(email).length > 127)) {
			if (chrbeforAt.length >= 2) {
				var re = /^(([^<>()[\]{}'^?\\.,!|//#%*-+=&;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
				return re.test(email);
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
</script>

<div class="mdl-grid mdl-shadow--6dp mdl-cell mdl-cell--12-col" style="width: 50%; margin: 0% 0% 0% 25%; background-color:  #ffffff">
	<div class="mdl-cell mdl-cell--12-col">
		<div
			class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
			<label for="responsavel" class="mdl-textfield__label">Nome do Responsável<span></span></label>
			<form:input id="responsavel" path="responsavel" class="mdl-textfield__input"
				type="text"/>
		</div>
	</div>
	<div class="mdl-cell mdl-cell--12-col">
		<div
			class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
			<label for="email" class="mdl-textfield__label">E-mail<span></span></label>
			<form:input id="email" path="email" class="mdl-textfield__input"
				type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"/>
		</div>
	</div>
	<div class="mdl-cell mdl-cell--12-col">
		<div
			class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
			<label for="telefone" class="mdl-textfield__label">Telefone<span></span></label>
			<form:input id="telefone" path="telefone" class="mdl-textfield__input"	 type="text"/>
		</div>
	</div>
	<div class="mdl-grid mdl-cell--12-col">
		<button type="submit"
			class="mdl-button show-modal mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
			style="width: 100%; text-align: center;">Salvar</button>
	</div>
</div>