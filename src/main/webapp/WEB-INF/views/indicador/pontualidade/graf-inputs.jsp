<%@page import="java.util.Enumeration"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type='text/javascript' src='https://www.google.com/jsapi'></script>

<script type="text/javascript">

	  google.charts.load("current", {packages:["corechart"]});
	  
      google.charts.setOnLoadCallback(drawChartPontSantMa);
      google.charts.setOnLoadCallback(drawChartPontMand);
      google.charts.setOnLoadCallback(drawChartPontMSilva);
      
      google.charts.setOnLoadCallback(drawChartPontTrans);
      google.charts.setOnLoadCallback(drawChartPontSaoJor);
      google.charts.setOnLoadCallback(drawChartPontReun);
      
      
	function drawChartPontSantMa() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_pont_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Santa Maria"].pontualidadePessimo ],
										[
												"Ruim",
												response["Santa Maria"].pontualidadeRuim ],
										[
												"Regular",
												response["Santa Maria"].pontualidadeRegular ],
										[
												"Bom",
												response["Santa Maria"].pontualidadeBom ],
										[
												"Excelente",
												response["Santa Maria"].pontualidadeExcelente ] ]);
						var options = {
							title : 'Santa Maria',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_pont_stn_m'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}

	function drawChartPontMand() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_pont_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Mandacaruense"].pontualidadePessimo ],
										[
												"Ruim",
												response["Mandacaruense"].pontualidadeRuim ],
										[
												"Regular",
												response["Mandacaruense"].pontualidadeRegular ],
										[
												"Bom",
												response["Mandacaruense"].pontualidadeBom ],
										[
												"Excelente",
												response["Mandacaruense"].pontualidadeExcelente ] ]);
						var options = {
							title : 'Mandacaruense',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_pont_mand'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartPontMSilva() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_pont_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Marcos da Silva"].pontualidadePessimo ],
										[
												"Ruim",
												response["Marcos da Silva"].pontualidadeRuim ],
										[
												"Regular",
												response["Marcos da Silva"].pontualidadeRegular ],
										[
												"Bom",
												response["Marcos da Silva"].pontualidadeBom ],
										[
												"Excelente",
												response["Marcos da Silva"].pontualidadeExcelente ] ]);
						var options = {
							title : 'Marcos da Silva',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_pont_m_sil'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartPontTrans() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_pont_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Transnacional"].pontualidadePessimo ],
										[
												"Ruim",
												response["Transnacional"].pontualidadeRuim ],
										[
												"Regular",
												response["Transnacional"].pontualidadeRegular ],
										[
												"Bom",
												response["Transnacional"].pontualidadeBom ],
										[
												"Excelente",
												response["Transnacional"].pontualidadeExcelente ] ]);
						var options = {
							title :	'Transnacional',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_pont_trans'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	function drawChartPontSaoJor() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_pont_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Sao Jorge"].pontualidadePessimo ],
										[
												"Ruim",
												response["Sao Jorge"].pontualidadeRuim ],
										[
												"Regular",
												response["Sao Jorge"].pontualidadeRegular ],
										[
												"Bom",
												response["Sao Jorge"].pontualidadeBom ],
										[
												"Excelente",
												response["Sao Jorge"].pontualidadeExcelente ] ]);
						var options = {
							title : 'São Jorge',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_pont_sj'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartPontReun() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_pont_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Reunidas"].pontualidadePessimo ],
										[
												"Ruim",
												response["Reunidas"].pontualidadeRuim ],
										[
												"Regular",
												response["Reunidas"].pontualidadeRegular ],
										[
												"Bom",
												response["Reunidas"].pontualidadeBom ],
										[
												"Excelente",
												response["Reunidas"].pontualidadeExcelente ] ]);
						var options = {
							title : 'Reunidas',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_pont_reun'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
</script>
<div class="android-more-section mdl-dialog full-width" style="width: 100%; background-color: #ffffff;">
	<h1 class="mdl-color-text--primary mdl-shadow--6dp"
			style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Pontualidade</h1>
	<br>
	<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
				O indicador de Pontualidade representa o quão a linha de ônibus está cumprindo com o seu 
				horário estabelecido. Essa tabela com os horário você pode encontrar no site da SEMOB.
		</p>
		<div class="mdl-grid mdl-shadow--6dp">
	
		<div id="piechart_pont_stn_m" class="mdl-cell--4-col"></div>
		<div id="piechart_pont_mand" class="mdl-cell--4-col"></div>
		<div id="piechart_pont_m_sil" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_pont_trans" class="mdl-cell--4-col"></div>
		<div id="piechart_pont_sj" class="mdl-cell--4-col"></div>
		<div id="piechart_pont_reun" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col" style="margin: 2% 0% -6% 90%">
		<a class="mdl-button mdl-button--fab mdl-button--primary" style="text-decoration: none" href="<c:url value='/resultados/form' />"> < </a>
	</div>
</div>