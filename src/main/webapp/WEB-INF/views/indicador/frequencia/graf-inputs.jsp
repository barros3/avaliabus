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
	  
      google.charts.setOnLoadCallback(drawChartFreqSantMa);
      google.charts.setOnLoadCallback(drawChartFreqMand);
      google.charts.setOnLoadCallback(drawChartFreqMSilva);
      
      google.charts.setOnLoadCallback(drawChartFreqTrans);
      google.charts.setOnLoadCallback(drawChartFreqSaoJor);
      google.charts.setOnLoadCallback(drawChartFreqReun);
      
      
	function drawChartFreqSantMa() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_freq_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Santa Maria"].frequenciaPessimo ],
										[
												"Ruim",
												response["Santa Maria"].frequenciaRuim ],
										[
												"Regular",
												response["Santa Maria"].frequenciaRegular ],
										[
												"Bom",
												response["Santa Maria"].frequenciaBom ],
										[
												"Excelente",
												response["Santa Maria"].frequenciaExcelente ] ]);
						var options = {
								title : 'Santa Maria',
								is3D : true
							};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_freq_stn_m'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}

	function drawChartFreqMand() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_freq_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Mandacaruense"].frequenciaPessimo ],
										[
												"Ruim",
												response["Mandacaruense"].frequenciaRuim ],
										[
												"Regular",
												response["Mandacaruense"].frequenciaRegular ],
										[
												"Bom",
												response["Mandacaruense"].frequenciaBom ],
										[
												"Excelente",
												response["Mandacaruense"].frequenciaExcelente ] ]);
						var options = {
							title : 'Mandacaruense',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_freq_mand'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartFreqMSilva() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_freq_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Marcos da Silva"].frequenciaPessimo ],
										[
												"Ruim",
												response["Marcos da Silva"].frequenciaRuim ],
										[
												"Regular",
												response["Marcos da Silva"].frequenciaRegular ],
										[
												"Bom",
												response["Marcos da Silva"].frequenciaBom ],
										[
												"Excelente",
												response["Marcos da Silva"].frequenciaExcelente ] ]);
						var options = {
							title : 'Marcos da Silva',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_freq_m_sil'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartFreqTrans() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_freq_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Transnacional"].frequenciaPessimo ],
										[
												"Ruim",
												response["Transnacional"].frequenciaRuim ],
										[
												"Regular",
												response["Transnacional"].frequenciaRegular ],
										[
												"Bom",
												response["Transnacional"].frequenciaBom ],
										[
												"Excelente",
												response["Transnacional"].frequenciaExcelente ] ]);
						var options = {
							title : 'Transnacional',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_freq_trans'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	function drawChartFreqSaoJor() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_freq_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Sao Jorge"].frequenciaPessimo ],
										[
												"Ruim",
												response["Sao Jorge"].frequenciaRuim ],
										[
												"Regular",
												response["Sao Jorge"].frequenciaRegular ],
										[
												"Bom",
												response["Sao Jorge"].frequenciaBom ],
										[
												"Excelente",
												response["Sao Jorge"].frequenciaExcelente ] ]);
						var options = {
							title : 'São Jorge',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_freq_sj'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartFreqReun() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_freq_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Reunidas"].frequenciaPessimo ],
										[
												"Ruim",
												response["Reunidas"].frequenciaRuim ],
										[
												"Regular",
												response["Reunidas"].frequenciaRegular ],
										[
												"Bom",
												response["Reunidas"].frequenciaBom ],
										[
												"Excelente",
												response["Reunidas"].frequenciaExcelente ] ]);
						var options = {
							title : 'Reunidas',
							is3D : true
								
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_freq_reun'));

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
		style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Indicadores de Frequência</h1>
<br>
<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
			O indicador de Frequência  representa a frequência que o ônibus passa na parada. 
			Se uma determinada linha ônibus passa mais 
			vezes que outra significa a avaliação deve ser considerada Excelente. 
	</p>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_freq_stn_m" class="mdl-cell--4-col"></div>
		<div id="piechart_freq_mand" class="mdl-cell--4-col"></div>
		<div id="piechart_freq_m_sil" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_freq_trans" class="mdl-cell--4-col"></div>
		<div id="piechart_freq_sj" class="mdl-cell--4-col"></div>
		<div id="piechart_freq_reun" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col" style="margin: 2% 0% -6% 90%">
		<a class="mdl-button mdl-button--fab mdl-button--primary" style="text-decoration: none" href="<c:url value='/resultados/form' />"> < </a>
	</div>
</div>