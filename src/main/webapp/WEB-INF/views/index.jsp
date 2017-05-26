
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>

<!-- <base href="http://avaliabus.herokuapp.com/" />	 -->
<base href="http://localhost:8080/avaliabus/" />

<template:admin>
	<div class="android-customized-section">
		<div class="mdl-grid">
			<div class="mdl-typography--text-center mdl-cell mdl-cell-1-col" style="0% 0% 0% -10%">
				<img alt="logo" src="assets/mdl/images/newlogo.png">
			</div>
			<div class="mdl-cell mdl-cel--8-col">
				<div class="mdl-typography--font-light mdl-typography--display-1-color-contrast">AvaliaBUS</div>
				<p class="mdl-typography--font-light">
					Sistema de Avaliação da qualidade dos serviços prestados pelas
					empresas de concessão de Transporte Coletivo em João Pessoa - PB. <br>
					<a href="" class="android-link mdl-typography--font-light">Baixe
						no Playstore</a>
				</p>
		<c:if test="${not isLogado}" var="isLogado">
					<button type="button" class="mdl-button show-modal mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="width:100%;">Acesse já!</button>
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
				<div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
					<div class="mdl-card__media">
						<img src="assets/mdl/images/frequencia.png">
					</div>
					<div class="mdl-card__title">
						<h4 class="mdl-card__title-text">Avaliação</h4>
					</div>
					<div class="mdl-card__supporting-text">
						<span class="mdl-typography--font-light mdl-typography--subhead">
							Acessando ao conteúdo deste card você verá uma página preenchida
							com campos para realizar uma AVALIAÇÃO da qualidade do serviço do
							Onibus em questão. Lembre-se de ter em mãos todos os dados do
							coletivo como: linha, horário e empresa. </span>
					</div>
					<div class="mdl-card__actions">
						<a class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
							href="avaliacao/form">AVALIE<i class="material-icons">chevron_right</i>
						</a>
					</div>
				</div>
	
				<div
					class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
					<div class="mdl-card__media">
						<img src="assets/mdl/images/denuncia.png">
					</div>
					<div class="mdl-card__title">
						<h4 class="mdl-card__title-text">Denúncia</h4>
					</div>
					<div class="mdl-card__supporting-text">
						<span class="mdl-typography--font-light mdl-typography--subhead">
							Denuncie o serviço anonimamente através desta pagina. Lembre-se
							que para realizar a Denúncia vc terá que estar logado - não se
							preocupe, toda denúncia e feita anônima e não fazemos a relação
							entre o usuário e a denúncia. </span>
					</div>
					<div class="mdl-card__actions">
						<a
							class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
							href="denuncia/form">DENUNCIE<i class="material-icons">chevron_right</i>
						</a>
					</div>
				</div>
	
				<div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
					<div class="mdl-card__media">
						<img src="assets/mdl/images/sugestao.png">
					</div>
					<div class="mdl-card__title">
						<h4 class="mdl-card__title-text">Sugestão</h4>
					</div>
					<div class="mdl-card__supporting-text">
						<span class="mdl-typography--font-light mdl-typography--subhead">
							Nós também temos o direito de sugerir melhorias para o transporte
							coletivo. Nós pagamos diariamente, Nós enxergamos de perto as
							necessidades mais baiscas do passageiro... Faça sua parte! </span>
					</div>
					<div class="mdl-card__actions">
						<a
							class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
							href="sugestao/form">SUGESTIONE<i class="material-icons">chevron_right</i>
						</a>
					</div>
				</div>
	
				<div class="mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
					<div class="mdl-card__media">
						<img src="assets/mdl/images/resultados.jpeg">
					</div>
					<div class="mdl-card__title">
						<h4 class="mdl-card__title-text">Resultados</h4>
					</div>
					<div class="mdl-card__supporting-text">
						<span class="mdl-typography--font-light mdl-typography--subhead">
							Acessando aqui, você tera acesso aos info-gráficos gerados a
							partir da coleta de dados enviados pelos usuários. Para acessa as
							informações nessa área você não precisa estar logado. Vamos lá! </span>
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