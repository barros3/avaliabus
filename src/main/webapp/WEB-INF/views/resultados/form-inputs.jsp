<%@page import="java.util.Enumeration"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<div class="android-more-section mdl-dialog full-width" style="width: 100%;">
<div class="custom-resultados"></div>
	<h1 class="mdl-color-text--primary mdl-shadow--6dp" style="text-align: center; height: 8%; margin: 4% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Indicadores de Qualidade</h1>
	<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
	Os Indicadores de qualidade são critérios considerados no 
	formulário de Avaliação para exibir a opinião pública através de gráficos. 
	Cada indicador é contabilizado de acordo com a empresa avaliada gerando assim 
	uma amostra de satisfação do usuário em cada índice.

	</p>
	<div class="android-card-container mdl-grid">
		<div class="zoom-ps mdl-cell mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href=""> <img src="assets/mdl/images/sa-frequencia.jpg"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text">Frequência</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a
					class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="indicador/frequencia/graffreq">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
		
		<div class="zoom-ps mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div style="margin: 7% 0% 0% 0%" class="mdl-card__media">
				<a href="indicador/pontualidade/graffreq"> <img src="assets/mdl/images/sa-pontualidade.jpg"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text" >Pontualidade</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a
					class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="indicador/pontualidade/graffreq">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
		
		<div class="zoom-ps mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href="indicador/limpeza/graffreq"> <img src="assets/mdl/images/sa-limpeza.jpg"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text">Limpeza</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="indicador/limpeza/graffreq">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
	</div>
	<div class="android-card-container mdl-grid">
		<div class="zoom-ps mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href="indicador/lotacao/graffreq"> <img src="assets/mdl/images/sa-lotacao.jpg"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text" style="font-size: 18px">Lotação</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="indicador/lotacao/graffreq">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
		
		<div class="zoom-ps mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href="indicador/condVeic/graffreq"> <img src="assets/mdl/images/sa-conducao-motorista.jpg"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text" style="font-size: 18px">Condução do Motorista</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a
					class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="indicador/condVeic/graffreq">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
		
		<div class="zoom-ps mdl-cell mdl-cell--3-col mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href="indicador/consColetivo/graffreq"> <img src="assets/mdl/images/sa-condicao-veiculo.jpg"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text" style="font-size: 18px">Conservação do Veículo</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a
					class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="indicador/consColetivo/graffreq">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
	</div>
</div>

<div style="margin: 10% 0% 10% 0%"></div>
<div class="android-more-section mdl-dialog full-width" style="width: 100%;">
<div class="custom-resultados"></div>
	<h1 class="mdl-color-text--primary mdl-shadow--6dp" style="text-align: center; height: 8%; margin: 4% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Concessionárias de transporte público coletivo</h1>
	<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
	As Empresas concessiondas é delegada pelo Estado para cumprir as diretrizes descritas no contrato com o Estado.
	Para melhorar a fiscalização Nós do AvaliaBUS separamos as empresas e colocamos todas os indicadores dentro de uma 
	área exclusiva.
	</p>
	<div class="android-card-container mdl-grid">
		<div class="zoom-ps mdl-cell mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href="empresa/indicadores/santa-maria"> <img style="height: 33%;" src="assets/mdl/images/santa-maria.jpg"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text" style="font-size: 18px" style="font-size: 18px">Santa Maria</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a
					class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="empresa/indicadores/santa-maria">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
		
		<div class="zoom-ps mdl-cell mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href="empresa/indicadores/mandacaruense"> <img style="height: 33%;" src="assets/mdl/images/mandacaruense.JPG"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text" style="font-size: 18px">Mandacaruense</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a
					class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="empresa/indicadores/mandacaruense">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
		
		<div class="zoom-ps mdl-cell mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href="empresa/indicadores/marcos-da-silva"> <img style="height: 33%;" src="assets/mdl/images/marcos-da-silva.JPG"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text" style="font-size: 18px">Marcos da Silva</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a
					class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="empresa/indicadores/marcos-da-silva">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
		
		<div class="zoom-ps mdl-cell mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href="empresa/indicadores/transnacional"> <img style="height: 33%;" src="assets/mdl/images/transnacional.jpg"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text" style="font-size: 18px">Transnacional</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a
					class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="empresa/indicadores/transnacional">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
		
		<div class="zoom-ps mdl-cell mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href="empresa/indicadores/sao-jorge"> <img style="height: 33%;" src="assets/mdl/images/sao-jorge.JPG"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text" style="font-size: 18px">São Jorge</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="empresa/indicadores/sao-jorge">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
		
		<div class="zoom-ps mdl-cell mdl-cell--4-col-tablet mdl-cell--3-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col">
			<div class="mdl-card__media">
				<a href="empresa/indicadores/reunidas"> <img style="height: 33%;" src="assets/mdl/images/reunidas.jpg"> </a>
			</div>
			<div class="mdl-card__title">
				<h4 class="mdl-card__title-text" style="font-size: 18px">Reunidas</h4>
			</div>
			<div class="mdl-card__supporting-text">
				<!-- <span class="mdl-typography--font-light mdl-typography--subhead">
					Gráficos referentes a frequência das linhas de ônibus de cada Empresa</span>-->
			</div>
			<div class="mdl-card__actions">
				<a
					class="android-link mdl-button mdl-js-button mdl-typography--text-uppercase"
					href="empresa/indicadores/reunidas">Acesse<i class="material-icons">chevron_right</i>
				</a>
			</div>
		</div>
	</div>
</div>

<div style="margin: 10% 0% 10% 0%"></div>
<div class="android-more-section mdl-dialog full-width" style="width: 100%;">
<div class="custom-resultados"></div>
	<h1 class="mdl-color-text--primary mdl-shadow--6dp" style="text-align: center; height: 8%; margin: 4% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Ranking das Empresas</h1>
	<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
	Nesta área você encontrará três gráficos que representam a 
	quantidade de formulários preenchidos. No módulo de avaliação, 
	cada empresa é representada com uma cor diferente. Passe o mouse 
	por cima e verá a quantidade e o nome da empresa. Assim é com os gráficos de Sugestão e 
	de Denúncia. Através deles você pode identificar quem está no topo dos mais avaliados.
	</p>
	<div id="chart_div" style="width: 98%; height: 100%;" class="mdl-cell mdl-cell--12-col-tablet mdl-cell--12-col-phone mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col"></div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawVisualization);
  
	function drawVisualization() {
		$
		.ajax({
			type : "post",
			url : "resultados/graf-modulo",
			contentType : "application/json; charset=utf-8",
			success : function(response) {
				var data = google.visualization.arrayToDataTable([
					   ['Módulos', 'Santa Maria', 'Mandacaruense', 'Marcos da Silva', 'Transnacional', 'São Jorge', 'Reunidas'],
					   ['Avaliação', response["quantidadeAvaliacao"].quantidadeAvaliacaoSantaMaria,
						   			 response["quantidadeAvaliacao"].quantidadeAvaliacaoMandacaruense,
						   			 response["quantidadeAvaliacao"].quantidadeAvaliacaoReunidas,
						   			 response["quantidadeAvaliacao"].quantidadeAvaliacaoSaoJorge,
						   			 response["quantidadeAvaliacao"].quantidadeAvaliacaoTransnacional,
						   			 response["quantidadeAvaliacao"].quantidadeAvaliacaoMarcosDaSilva],
					   
		   			   ['Denúncia',  response["quantidadeDenuncia"].quantidadeDenunciaSantaMaria,
		   							 response["quantidadeDenuncia"].quantidadeDenunciaMandacaruense,
		   							 response["quantidadeDenuncia"].quantidadeDenunciaReunidas,
		   							 response["quantidadeDenuncia"].quantidadeDenunciaSaoJorge,
						   			 response["quantidadeDenuncia"].quantidadeDenunciaTransnacional,
						   			 response["quantidadeDenuncia"].quantidadeDenunciaMarcosDaSilva],
						   			 
					   ['Sugestões', response["quantidadeSugestao"].quantidadeSugestaoSantaMaria,
						   			 response["quantidadeSugestao"].quantidadeSugestaoMandacaruense,
						   			 response["quantidadeSugestao"].quantidadeSugestaoReunidas,
						   			 response["quantidadeSugestao"].quantidadeSugestaoSaoJorge,
						   			 response["quantidadeSugestao"].quantidadeSugestaoTransnacional,
						   			 response["quantidadeSugestao"].quantidadeSugestaoMarcosDaSilva],
					   
					]);
					
					var options = {
					  title : 'Visualização Geral das Estatísticas das Empresas',
					  vAxis: {title: 'Empresas'},
					  hAxis: {title: 'Módulos'},
					  seriesType: 'bars',
					  series: {6: {type: 'line'}}
					};
					
					var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
						chart.draw(data, options);
			},
			error : function(response) {
				console.log(response);
				alert('Erro na requisição...');
			}
		});
	}
	
</script>

</script>