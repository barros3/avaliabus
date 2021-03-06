
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>

<c:if test="${isLocal == true}" var="isLocal">
 	<base href="http://localhost:8080/avaliabus/" />
 </c:if>
 <c:if test="${isLocal == false}" var="isLocal">
 	<base href="https://avaliabus.herokuapp.com/" />
 </c:if>


<template:admin>
	<div class="android-customized-section">
		<div class="mdl-grid">
			<div class="mdl-typography--text-center mdl-cell mdl-cell-1-col" style="0% 0% 0% -10%">
				<img alt="logo" src="assets/mdl/images/newlogo.png">
			</div>
			<div class="mdl-cell mdl-cel--8-col">
				<div class="mdl-typography--font-light mdl-typography--display-1-color-contrast">AvaliaBUS</div>
				<p class="mdl-typography--font-light">
					Sistema de Avalia��o da qualidade dos servi�os prestados pelas
					empresas de concess�o de Transporte Coletivo em Jo�o Pessoa - PB. <br>
					<a href="" class="android-link mdl-typography--font-light">Baixe
						no Playstore</a>
				</p>
		<c:if test="${not isLogado}" var="isLogado">
					<button type="button" class="mdl-button show-modal mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="width:100%;">Acesse j�!</button>
					<%@include file="login/form.jsp" %>	
			</div>
			<div class="mdl-cell mdl-cell--2-col"></div>
		</div>
			<div class="android-customized-section-image"></div>
			<script type="text/javascript">
				$('.android-more-section').attr('style','margin: -10% 0% 0% 14%');
			
			</script>
		</c:if>
		<c:if test="${not isLogado}" var="isLogado">
				<p class="mdl-button show-modal mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="width:100%;">Compartilhe o AvaliaBUS!</p>
				</div>
				<div class="mdl-cell mdl-cell--2-col"></div>
			</div>
		</c:if>
	</div>
	<div class="android-more-section">
		<div style="margin: -4% 0% 0% 14%"></div>
			<div class="android-card-container mdl-grid" style="text-align: justify;">
				<div class="zoom-ps mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
					<div class="mdl-card__media">
						<a href="avaliacao/form"> <img style="margin: 9% 0% 09% 22%; width: 70%;" src="assets/mdl/images/sa-avaliacao.jpg" /> </a>
					</div>
					<div class="mdl-card__title">
						<h4 class="mdl-card__title-text">Avalia��o</h4>
					</div>
					<div class="mdl-card__supporting-text">
						<span class="mdl-typography--font-light mdl-typography--subhead">
							Acessando ao conte�do deste card voc� ver� uma p�gina preenchida
							com campos para realizar uma AVALIA��O da qualidade do servi�o do
							Onibus em quest�o. Lembre-se de ter em m�os todos os dados do
							coletivo como: linha, hor�rio e empresa. </span>
					</div>
					<div class="mdl-card__actions">
						<a class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
							href="avaliacao/form">AVALIE<i class="material-icons">chevron_right</i>
						</a>
					</div>
				</div>
	
				<div class="zoom-ps mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
					<div class="mdl-card__media">
						<a href="denuncia/form"> <img style="margin: 4% 0% 0% 10%; width: 85%;" src="assets/mdl/images/sa-denuncia.jpg"></a>
					</div>
					<div class="mdl-card__title">
						<h4 class="mdl-card__title-text" style="margin: -12% 0% 0% 0%;">Den�ncia</h4>
					</div>
					<div class="mdl-card__supporting-text">
						<span class="mdl-typography--font-light mdl-typography--subhead">
							Denuncie o servi�o anonimamente atrav�s desta pagina. Lembre-se
							que para realizar a Den�ncia vc ter� que estar logado - n�o se
							preocupe, toda den�ncia e feita an�nima e n�o fazemos a rela��o
							entre o usu�rio e a den�ncia. </span>
					</div>
					<div class="mdl-card__actions">
						<a class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
							href="denuncia/form">DENUNCIE<i class="material-icons">chevron_right</i>
						</a>
					</div>
				</div>
	
				<div class="zoom-ps mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
					<div class="mdl-card__media">
						<a href="sugestao/form"> <img style="margin: 18% 0% 3% 0%; width: 107%;" src="assets/mdl/images/sa-sugestao.jpg"> </a>
					</div>
					<div class="mdl-card__title">
						<h4 class="mdl-card__title-text">Sugest�o</h4>
					</div>
					<div class="mdl-card__supporting-text">
						<span class="mdl-typography--font-light mdl-typography--subhead">
							N�s tamb�m temos o direito de sugerir melhorias para o transporte
							coletivo. N�s pagamos diariamente, N�s enxergamos de perto as
							necessidades mais baiscas do passageiro... Fa�a sua parte! </span>
					</div>
					<div class="mdl-card__actions">
						<a class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
							href="sugestao/form">SUGESTIONE<i class="material-icons">chevron_right</i>
						</a>
					</div>
				</div>
	
				<div class="zoom-ps mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
					<div class="mdl-card__media">
						<a href="resultados/form"> <img style="margin: 24% 0% 11% 13%; width: 77%;" src="assets/mdl/images/sa-resultado.jpg"> </a>
					</div>
					<div class="mdl-card__title">
						<h4 class="mdl-card__title-text" style="">Resultados</h4>
					</div>
					<div class="mdl-card__supporting-text">
						<span class="mdl-typography--font-light mdl-typography--subhead">
							Acessando aqui, voc� tera acesso aos info-gr�ficos gerados a
							partir da coleta de dados enviados pelos usu�rios. Para acessar as
							informa��es nessa �rea voc� n�o precisa estar logado. Vamos l�! </span>
					</div>
					<div class="mdl-card__actions">
						<a
							class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
							href="resultados/form"> RESULTADOS <i class="material-icons">chevron_right</i>
						</a>
					</div>
				</div>
			</div>
		</div>
</template:admin>