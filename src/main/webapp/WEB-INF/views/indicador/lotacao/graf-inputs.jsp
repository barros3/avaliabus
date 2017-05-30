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
	  
      google.charts.setOnLoadCallback(drawChartLotaSantMa);
      google.charts.setOnLoadCallback(drawChartLotaMand);
      google.charts.setOnLoadCallback(drawChartLotaMSilva);
      
      google.charts.setOnLoadCallback(drawChartLotaTrans);
      google.charts.setOnLoadCallback(drawChartLotaSaoJor);
      google.charts.setOnLoadCallback(drawChartLotaReun);
      
      
	function drawChartLotaSantMa() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_lota_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Santa Maria"].lotacaoPessimo ],
										[
												"Ruim",
												response["Santa Maria"].lotacaoRuim ],
										[
												"Regular",
												response["Santa Maria"].lotacaoRegular ],
										[
												"Bom",
												response["Santa Maria"].lotacaoBom ],
										[
												"Excelente",
												response["Santa Maria"].lotacaoExcelente ] ]);
						var options = {
							title : 'Santa Maria',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_lota_stn_m'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}

	function drawChartLotaMand() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_lota_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Mandacaruense"].lotacaoPessimo ],
										[
												"Ruim",
												response["Mandacaruense"].lotacaoRuim ],
										[
												"Regular",
												response["Mandacaruense"].lotacaoRegular ],
										[
												"Bom",
												response["Mandacaruense"].lotacaoBom ],
										[
												"Excelente",
												response["Mandacaruense"].lotacaoExcelente ] ]);
						var options = {
							title : 'Mandacaruense',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_lota_mand'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartLotaMSilva() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_lota_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Marcos da Silva"].lotacaoPessimo ],
										[
												"Ruim",
												response["Marcos da Silva"].lotacaoRuim ],
										[
												"Regular",
												response["Marcos da Silva"].lotacaoRegular ],
										[
												"Bom",
												response["Marcos da Silva"].lotacaoBom ],
										[
												"Excelente",
												response["Marcos da Silva"].lotacaoExcelente ] ]);
						var options = {
							title : 'Marcos da Silva',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_lota_m_sil'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartLotaTrans() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_lota_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Transnacional"].lotacaoPessimo ],
										[
												"Ruim",
												response["Transnacional"].lotacaoRuim ],
										[
												"Regular",
												response["Transnacional"].lotacaoRegular ],
										[
												"Bom",
												response["Transnacional"].lotacaoBom ],
										[
												"Excelente",
												response["Transnacional"].lotacaoExcelente ] ]);
						var options = {
							title : 'Transnacional',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_lota_trans'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	function drawChartLotaSaoJor() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_lota_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Sao Jorge"].lotacaoPessimo ],
										[
												"Ruim",
												response["Sao Jorge"].lotacaoRuim ],
										[
												"Regular",
												response["Sao Jorge"].lotacaoRegular ],
										[
												"Bom",
												response["Sao Jorge"].lotacaoBom ],
										[
												"Excelente",
												response["Sao Jorge"].lotacaoExcelente ] ]);
						var options = {
							title : 'São Jorge',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_lota_sj'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartLotaReun() {
		$
				.ajax({
					type : "post",
					url : "indicador/list_lota_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Reunidas"].lotacaoPessimo ],
										[
												"Ruim",
												response["Reunidas"].lotacaoRuim ],
										[
												"Regular",
												response["Reunidas"].lotacaoRegular ],
										[
												"Bom",
												response["Reunidas"].lotacaoBom ],
										[
												"Excelente",
												response["Reunidas"].lotacaoExcelente ] ]);
						var options = {
							title : 'Reunidas',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_lota_reun'));

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
		style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Lotação</h1>
<br>
<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
		O indicador de Lotação é fácil identificar sua representatividade pois trata-se da
		 viagem no coletivo com um número de passageiros maior que o suportado. 
</p>

	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_lota_stn_m" class="mdl-cell--4-col"></div>
		<div id="piechart_lota_mand" class="mdl-cell--4-col"></div>
		<div id="piechart_lota_m_sil" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_lota_trans" class="mdl-cell--4-col"></div>
		<div id="piechart_lota_sj" class="mdl-cell--4-col"></div>
		<div id="piechart_lota_reun" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col" style="margin: 2% 0% -6% 90%">
		<a class="mdl-button mdl-button--fab mdl-button--primary" style="text-decoration: none" href="<c:url value='/resultados/form' />"> < </a>
	</div>
</div>