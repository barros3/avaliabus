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
	  
      google.charts.setOnLoadCallback(drawChartFre);
      google.charts.setOnLoadCallback(drawChartLimp);
      google.charts.setOnLoadCallback(drawChartLot);
      
      google.charts.setOnLoadCallback(drawChartCoduMoto);
      google.charts.setOnLoadCallback(drawChartConser);
      google.charts.setOnLoadCallback(drawChartPont);
      
      
	function drawChartFre() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/empresa/indicadores/graf-indicadores-empresa-transnacional",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));
						
						console.log(obj);

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["frequencia"].frequenciaPessimo ],
										[
												"Ruim",
												response["frequencia"].frequenciaRuim ],
										[
												"Regular",
												response["frequencia"].frequenciaRegular ],
										[
												"Bom",
												response["frequencia"].frequenciaBom ],
										[
												"Excelente",
												response["frequencia"].frequenciaExcelente ] ]);
						var options = {
							title : 'Frequência',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_frequencia'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}

	function drawChartLimp() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/empresa/indicadores/graf-indicadores-empresa-transnacional",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["limpeza"].limpezaPessimo ],
										[
												"Ruim",
												response["limpeza"].limpezaRuim ],
										[
												"Regular",
												response["limpeza"].limpezaRegular ],
										[
												"Bom",
												response["limpeza"].limpezaBom ],
										[
												"Excelente",
												response["limpeza"].limpezaExcelente ] ]);
						var options = {
							title : 'Limpeza',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_limpeza'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartLot() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/empresa/indicadores/graf-indicadores-empresa-transnacional",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["lotacao"].lotacaoPessimo ],
										[
												"Ruim",
												response["lotacao"].lotacaoRuim ],
										[
												"Regular",
												response["lotacao"].lotacaoRegular ],
										[
												"Bom",
												response["lotacao"].lotacaoBom ],
										[
												"Excelente",
												response["lotacao"].lotacaoExcelente ] ]);
						var options = {
							title : 'Lotação',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_lotacao'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartCoduMoto() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/empresa/indicadores/graf-indicadores-empresa-transnacional",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["conducao-motorista"].conducaoMotoristaPessimo ],
										[
												"Ruim",
												response["conducao-motorista"].conducaoMotoristaRuim ],
										[
												"Regular",
												response["conducao-motorista"].conducaoMotoristaRegular ],
										[
												"Bom",
												response["conducao-motorista"].conducaoMotoristaBom ],
										[
												"Excelente",
												response["conducao-motorista"].conducaoMotoristaExcelente ] ]);
						var options = {
							title : 'Condução do Motorista',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cond_motorista'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	function drawChartConser() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/empresa/indicadores/graf-indicadores-empresa-transnacional",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
						.arrayToDataTable([
								[ 'total', 'indicador' ],
								[
										"Péssimo",
										response["conservacao-coletivo"].conservacaoColetivoPessimo ],
								[
										"Ruim",
										response["conservacao-coletivo"].conservacaoColetivoRuim ],
								[
										"Regular",
										response["conservacao-coletivo"].conservacaoColetivoRegular ],
								[
										"Bom",
										response["conservacao-coletivo"].conservacaoColetivoBom ],
								[
										"Excelente",
										response["conservacao-coletivo"].conservacaoColetivoExcelente ] ]);
						var options = {
							title : 'Conservação do Ônibus',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cons_coletivo'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartPont() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/empresa/indicadores/graf-indicadores-empresa-transnacional",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
						.arrayToDataTable([
								[ 'total', 'indicador' ],
								[
										"Péssimo",
										response["pontualidade"].pontualidadePessimo ],
								[
										"Ruim",
										response["pontualidade"].pontualidadeRuim ],
								[
										"Regular",
										response["pontualidade"].pontualidadeRegular ],
								[
										"Bom",
										response["pontualidade"].pontualidadeBom ],
								[
										"Excelente",
										response["pontualidade"].pontualidadeExcelente ] ]);
						var options = {
							title : 'Pontualidade',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_pontualidade'));

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
		style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Indicadores Gerais da Transnacional</h1>
<br>
<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
			Nesta área você tem acesso aos indicadores completo da empresa de transporte coletivo TRANSNACIONAL. 
	</p>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_frequencia" class="mdl-cell--4-col"></div>
		<div id="piechart_pontualidade" class="mdl-cell--4-col"></div>
		<div id="piechart_lotacao" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_cond_motorista" class="mdl-cell--4-col"></div>
		<div id="piechart_cons_coletivo" class="mdl-cell--4-col"></div>
		<div id="piechart_limpeza" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col" style="margin: 2% 0% -6% 90%">
		<a class="mdl-button mdl-button--fab mdl-button--primary" style="text-decoration: none" href="<c:url value='/resultados/form' />"> < </a>
	</div>
</div>