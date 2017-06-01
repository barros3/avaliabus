<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- <base href="https://avaliabus.herokuapp.com/" /> -->
<base href="http://localhost:8080/avaliabus/" />

<script type="text/javascript">
	
	var response_login, response_email
	
	function checkMail() {

		var _email = $("#email").val();

		$.ajax({
			type : "get",
			url : "home/check-email",
			data : {
				email : _email
			},
			contentType : "application/json; charset=utf-8",
			success : function(response) {

				if (response.toString() === "true") {
					
					response_email = response.toString();

					alert("Email já castrado!")
					
				}else{
					
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
			return false;
		}
		return true;
	}

	function checkLogin() {

		var _login = $("#login").val();

		$.ajax({
			type : "get",
			url : "home/check-login",
			contentType : "application/json; charset=utf-8",
			data : {
				login : _login
			},
			success : function(response) {

				if (response.toString() === "true") {

					response_login = response.toString();
					alert("Login já cadastrado!")
					
				}

			},
			erro : function(response) {
				console.log(response);
				alert('ERRO NA REQUISICAO!!');
			}

		});
	}

	function validateEmail() {
		if(checkMail() === 'false'){
			return false;
		}
		var email = $("#email").val();
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
	
	$(document).ready(function(){
		var re_email = $("#email").val();
		var re_login = $("#login").val();
		
		$("#btn-cadastrar").blur('blur', function(){
			if(re_email != "true" && re_login != "true" && checkSenha() === 'true'){
				alert("Liberar botao -> VALIDOU")
			}else{
				alert("Necessário preencher todos os campos!")
			}	
		});
	});
	
</script>

	<div class="mdl-grid">
		<div class="mdl-cell mdl-cell--1-col"></div>
			<dialog class="mdl-dialog full-width" style="width: 75%; height: 85% !important; margin: 0% 15% 0% 13%;">
				<div class="mdl-card__title mdl-color-text--primary">
					<h2 class="mdl-card__title-text"  style="margin: 0% 45% 0% 40%;">Área de Login</h2>
				</div>
			    <div class="mdl-grid">
					<div class="mdl-grid mdl-shadow--6dp mdl-cell mdl-cell--7-col">
					<div class="mdl-cell--1-col"></div>
					<div class="mdl-cell--5-col">
						<div class="mdl-card__title mdl-color-text--primary">
							<h2 class="mdl-card__title-text">Login</h2>
						</div>
						<form:form modelAttribute="usuario" method="POST" style="text-align: center">
							<div class="mdl-card__supporting-text">
								<div class="mdl-textfield mdl-js-textfield">
									<input class="mdl-textfield__input validate" name="username" id="username" type="text" required="required"/> 
									<label class="mdl-textfield__label" for="username">Usuário</label>
								</div>
								<div class="mdl-textfield mdl-js-textfield">
									<input class="mdl-textfield__input validate" name="password" id="password" type="password" required="required"/> 
									<label class="mdl-textfield__label" for="userpass">Senha</label> 
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								</div>
							</div>
							<div class="mdl-card__supporting-text">
								<button class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="width:100%">Entrar</button>
							<!-- 	<button type="button" class="mdl-button show-modal mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="width:100%;">Cadastrar</button> -->
							</div>
						</form:form>
					</div>
					<div class="mdl-cell--1-col">
					</div>
					<div class="mdl-cell--5-col">
						<div class="mdl-card__title mdl-color-text--primary">
							<h2 class="mdl-card__title-text">Login com Redes Sociais</h2>
						</div>
						<div style="text-align: center; margin: 0% -40% 0% 0%;">
							<div class="mdl-card__supporting-text">
								<div class="mdl-textfield mdl-js-textfield">
								<script>					
																// This is called with the results from from FB.getLoginStatus().
								  function statusChangeCallback(response) {
								    console.log('statusChangeCallback');
								    console.log(response);
								    // The response object is returned with a status field that lets the
								    // app know the current login status of the person.
								    // Full docs on the response object can be found in the documentation
								    // for FB.getLoginStatus().
								    if (response.status === 'connected') {
								      
// 							    	var _name = response.name;
// 							    	var _status = response.status;
// 							    	var _token = response.token;
// 							    	var _accessToken = response.accessToken;
								      
// 								      $.ajax({
// 								    	  type: "POST",
// 								    	  contentType: "application/json; charset=utf-8",
// 								    	  url: "usuairo/login-facebook",
// 								    	  data: {
// 								    		  _name = name,
// 								    		  _status = status,
// 								    		  _accessToken = accessToken;
// 								    	  },
// 								    	  success: function(){
// 								    		  alert("bem vindo!");
// 								    	  }, 
// 								    	  error: {
// 								    		  alert("falhou no ajax");
// 								    	  }
								    	  
// 								      });
								      
								      testAPI();
								    } else {
								      // The person is not logged into your app or we are unable to tell.
								      document.getElementById('status').innerHTML = 'Acesse rápido com seu Facebook!';
								    }
								  }
								
								  // This function is called when someone finishes with the Login
								  // Button.  See the onlogin handler attached to it in the sample
								  // code below.
								  function checkLoginState() {
								    FB.getLoginStatus(function(response) {
								      statusChangeCallback(response);
								    });
								  }
								
								  window.fbAsyncInit = function() {
								  FB.init({
								    appId      : '1930692287207580',
								    cookie     : true,  // enable cookies to allow the server to access 
								                        // the session
								    xfbml      : true,  // parse social plugins on this page
								    version    : 'v2.8' // use graph api version 2.8
								  });
								
								  // Now that we've initialized the JavaScript SDK, we call 
								  // FB.getLoginStatus().  This function gets the state of the
								  // person visiting this page and can return one of three states to
								  // the callback you provide.  They can be:
								  //
								  // 1. Logged into your app ('connected')
								  // 2. Logged into Facebook, but not your app ('not_authorized')
								  // 3. Not logged into Facebook and can't tell if they are logged into
								  //    your app or not.
								  //
								  // These three cases are handled in the callback function.
								
								  FB.getLoginStatus(function(response) {
								    statusChangeCallback(response);
								  });
								
								  };
								
								  // Load the SDK asynchronously
								  (function(d, s, id) {
										var js, fjs = d.getElementsByTagName(s)[0];
										if (d.getElementById(id))
											return;
										js = d.createElement(s);
										js.id = id;
										js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.9&appId=1930692287207580";
										fjs.parentNode.insertBefore(js, fjs);
									}(document, 'script', 'facebook-jssdk'));
								
								  // Here we run a very simple test of the Graph API after login is
								  // successful.  See statusChangeCallback() for when this call is made.
								  function testAPI() {
								    console.log('carregue as informacoes aqui.... ');
								    FB.api('/me', function(response) {
								      console.log('Login sucesso com: ' + response.name);
								      console.log("Nome " + response.name)
								      document.getElementById('status').innerHTML =
								        response.name + ', já pode usar nossos servicos!';
								    });
								  }
								  
								</script>

								<!--
								  Below we include the Login Button social plugin. This button uses
								  the JavaScript SDK to present a graphical Login button that triggers
								  the FB.login() function when clicked.
								-->
								
								<!-- <fb:login-button scope="public_profile,email" onlogin="checkLoginState();"> -->
								<!-- </fb:login-button> -->
								
								<div id="status">
								</div>
								
<!-- 									 <div id="fb-root"></div> -->
									<div class="fb-login-button" 
										data-width="140"
										data-max-rows="1"
										data-size="large"
										data-button-type="login_with"
									 	data-show-faces="true" 
									 	data-auto-logout-link="true"
									 	data-use-continue-as="true">
								 	 </div> 
								
		<!-- 						<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button> -->
								</div>
								<div class="mdl-textfield mdl-js-textfield">
		<!-- 						GMAIL -->
								</div>
							</div>
						</div>
					</div>
					<div class="mdl-cell--1-col"></div>
				</div>
				<div class="mdl-shadow--6dp mdl-cell mdl-cell--5-col">
					<div style="">
						<div class="mdl-card__title mdl-color-text--primary">
							<h2 class="mdl-card__title-text">Cadastre-se já!</h2>
						</div>
						<div style="">
							<form:form role="form" commandName="usuario" servletRelativeAction="/save" method="POST" style="text-align: center">
								<div class="mdl-card__supporting-text">
									<div class="mdl-grid mdl-textfield mdl-js-textfield mdl-cell--12-col">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--6-col">
											<label for="login" class="mdl-textfield__label">Login *<span></span></label>	
											<form:input id="login" path="login" class="mdl-textfield__input validate" type="text" required="required" onblur="checkLogin()"/>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--6-col">
											<label for="email" class="mdl-textfield__label">E-mail *<span></span></label>
											<form:input id="email" path="email" class="mdl-textfield__input" type="text" 
												pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required="required" onblur="validateEmail(this);"/>
										</div>
									</div>
									<div class="mdl-grid mdl-cell--12-col">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--6-col">
											<label for="telefone" class="mdl-textfield__label">Senha *<span></span></label>
											<form:input id="senha" path="senha" class="mdl-textfield__input" type="password" required="required"/>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--6-col">
											<label for="check_senha" class="mdl-textfield__label">Confirmação de Senha *<span></span></label>
											<input id="check_senha" class="mdl-textfield__input" type="password" required="required" onblur="checkSenha();"/>
										</div>
									</div>	
									<div class="mdl-grid mdl-cell--12-col">
										<button id="btn-cadastrar" type="submit" class="mdl-button show-modal mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="width:100%; text-align: center;" >Cadastrar</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div> 
			</div>
	    </dialog>
	<script>
		var dialog = document.querySelector('dialog');
		var showModalButton = document.querySelector('.show-modal');
		if (!dialog.showModal) {
			dialogPolyfill.registerDialog(dialog);
		}
		showModalButton.addEventListener('click', function() {
			dialog.showModal();
		});
		dialog.querySelector('.close').addEventListener('click', function() {
			dialog.close();
		});
	</script>
</div>

