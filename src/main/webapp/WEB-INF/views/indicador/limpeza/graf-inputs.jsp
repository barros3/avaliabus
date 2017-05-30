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
	  
      google.charts.setOnLoadCallback(drawChartLimpSantMa);
      google.charts.setOnLoadCallback(drawChartLimpMand);
      google.charts.setOnLoadCallback(drawChartLimpMSilva);
      
      google.charts.setOnLoadCallback(drawChartLimpTrans);
      google.charts.setOnLoadCallback(drawChartLimpSaoJor);
      google.charts.setOnLoadCallback(drawChartLimpReun);
      
      
	function drawChartLimpSantMa() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_limp_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Santa Maria"].limpezaPessimo ],
										[
												"Ruim",
												response["Santa Maria"].limpezaRuim ],
										[
												"Regular",
												response["Santa Maria"].limpezaRegular ],
										[
												"Bom",
												response["Santa Maria"].limpezaBom ],
										[
												"Excelente",
												response["Santa Maria"].limpezaExcelente ] ]);
						var options = {
							title : 'Santa Maria',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_limp_stn_m'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}

	function drawChartLimpMand() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_limp_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Mandacaruense"].limpezaPessimo ],
										[
												"Ruim",
												response["Mandacaruense"].limpezaRuim ],
										[
												"Regular",
												response["Mandacaruense"].limpezaRegular ],
										[
												"Bom",
												response["Mandacaruense"].limpezaBom ],
										[
												"Excelente",
												response["Mandacaruense"].limpezaExcelente ] ]);
						var options = {
							title : 'Mandacaruense',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_limp_mand'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartLimpMSilva() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_limp_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Marcos da Silva"].limpezaPessimo ],
										[
												"Ruim",
												response["Marcos da Silva"].limpezaRuim ],
										[
												"Regular",
												response["Marcos da Silva"].limpezaRegular ],
										[
												"Bom",
												response["Marcos da Silva"].limpezaBom ],
										[
												"Excelente",
												response["Marcos da Silva"].limpezaExcelente ] ]);
						var options = {
							title : 'Marcos da Silva',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_limp_m_sil'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartLimpTrans() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_limp_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Transnacional"].limpezaPessimo ],
										[
												"Ruim",
												response["Transnacional"].limpezaRuim ],
										[
												"Regular",
												response["Transnacional"].limpezaRegular ],
										[
												"Bom",
												response["Transnacional"].limpezaBom ],
										[
												"Excelente",
												response["Transnacional"].limpezaExcelente ] ]);
						var options = {
							title : 'Transnacional',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_limp_trans'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	function drawChartLimpSaoJor() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_limp_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Sao Jorge"].limpezaPessimo ],
										[
												"Ruim",
												response["Sao Jorge"].limpezaRuim ],
										[
												"Regular",
												response["Sao Jorge"].limpezaRegular ],
										[
												"Bom",
												response["Sao Jorge"].limpezaBom ],
										[
												"Excelente",
												response["Sao Jorge"].limpezaExcelente ] ]);
						var options = {
							title : 'São Jorge',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_limp_sj'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartLimpReun() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_limp_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Reunidas"].limpezaPessimo ],
										[
												"Ruim",
												response["Reunidas"].limpezaRuim ],
										[
												"Regular",
												response["Reunidas"].limpezaRegular ],
										[
												"Bom",
												response["Reunidas"].limpezaBom ],
										[
												"Excelente",
												response["Reunidas"].limpezaExcelente ] ]);
						var options = {
							title : 'Reunidas',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_limp_reun'));

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
			style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Limpeza</h1>
	<br>
	<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
				O indicador de Limpeza representa as condições
				 de higiene do coletivo. Embora isso, seja algo 
				 relativo ao dia que se ande de ônibus, se encontrarmos 
				 uma frequência de sujeira este ônibus deve ser avaliado 
				 com a limpeza não tão boa.

	</p>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_limp_stn_m" class="mdl-cell--4-col"></div>
		<div id="piechart_limp_mand" class="mdl-cell--4-col"></div>
		<div id="piechart_limp_m_sil" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_limp_trans" class="mdl-cell--4-col"></div>
		<div id="piechart_limp_sj" class="mdl-cell--4-col"></div>
		<div id="piechart_limp_reun" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col" style="margin: 2% 0% -6% 90%">
		<a class="mdl-button mdl-button--fab mdl-button--primary" style="text-decoration: none" href="<c:url value='/resultados/form' />"> < </a>
	</div>
</div>