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
			url : "usuario/check-email",
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

	function checkSenha() {

		var _senha = $("#senha").val();
		var _check_senha = $("#check_senha").val();

		if (_senha != _check_senha) {
			alert("As senhas não correspondem!")
		}

	}

	function checkLogin() {

		var _login = $("#login").val();

		$.ajax({
			type : "get",
			url : "usuario/check-login",
			contentType : "application/json",
			data : {
				login : _login
			},
			success : function(response) {

				if (response.toString() === "true") {
					alert("Login já cadastrado!")
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
			<label for="login" class="mdl-textfield__label">Login<span></span></label>
			<form:input id="login" path="login" class="mdl-textfield__input"
				type="text" required="required" onblur="checkLogin()" />
		</div>
	</div>
	<div class="mdl-cell mdl-cell--12-col">
		<div
			class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
			<label for="email" class="mdl-textfield__label">E-mail<span></span></label>
			<form:input id="email" path="email" class="mdl-textfield__input"
				type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
				required="required" onblur="checkMail(); validateEmail(this);" />
		</div>
	</div>
	<div class="mdl-cell mdl-cell--12-col">
		<div
			class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
			<label for="telefone" class="mdl-textfield__label">Senha<span></span></label>
			<form:input id="senha" path="senha" class="mdl-textfield__input"
				type="password" required="required" />
		</div>
	</div>
	<div class="mdl-cell mdl-cell--12-col">
		<div
			class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
			<label for="check_senha" class="mdl-textfield__label">Confirmação
				de Senha<span></span>
			</label> <input id="check_senha" class="mdl-textfield__input"
				id="check_senha" type="password" required="required"
				onblur="checkSenha();" />
		</div>
	</div>
	<div class="mdl-grid mdl-cell--12-col">
		<button type="submit"
			class="mdl-button show-modal mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
			style="width: 100%; text-align: center;">Cadastrar</button>
	</div>
</div>