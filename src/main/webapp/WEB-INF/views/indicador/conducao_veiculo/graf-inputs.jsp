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
	  
      google.charts.setOnLoadCallback(drawChartCondMotSantMa);
      google.charts.setOnLoadCallback(drawChartCondMotMand);
      google.charts.setOnLoadCallback(drawChartCondMotMSilva);
      
      google.charts.setOnLoadCallback(drawChartCondMotTrans);
      google.charts.setOnLoadCallback(drawChartCondMotSaoJor);
      google.charts.setOnLoadCallback(drawChartCondMotReun);
      
      
	function drawChartCondMotSantMa() {
		$
				.ajax({
					type : "post",
					url : "avaliabus/indicador/list_cond_moto_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Santa Maria"].conducaoMotoristaPessimo ],
										[
												"Ruim",
												response["Santa Maria"].conducaoMotoristaRuim ],
										[
												"Regular",
												response["Santa Maria"].conducaoMotoristaRegular ],
										[
												"Bom",
												response["Santa Maria"].conducaoMotoristaBom ],
										[
												"Excelente",
												response["Santa Maria"].conducaoMotoristaExcelente ] ]);
						var options = {
							title : 'Condução do Motorista Santa Maria',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cond_motor_stn_m'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}

	function drawChartCondMotMand() {
		$
				.ajax({
					type : "post",
					url : "avaliabus/indicador/list_cond_moto_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Mandacaruense"].conducaoMotoristaPessimo ],
										[
												"Ruim",
												response["Mandacaruense"].conducaoMotoristaRuim ],
										[
												"Regular",
												response["Mandacaruense"].conducaoMotoristaRegular ],
										[
												"Bom",
												response["Mandacaruense"].conducaoMotoristaBom ],
										[
												"Excelente",
												response["Mandacaruense"].conducaoMotoristaExcelente ] ]);
						var options = {
							title : 'Condução do Motorista Mandacaruense',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cond_motor_mand'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartCondMotMSilva() {
		$
				.ajax({
					type : "post",
					url : "avaliabus/indicador/list_cond_moto_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Marcos da Silva"].conducaoMotoristaPessimo ],
										[
												"Ruim",
												response["Marcos da Silva"].conducaoMotoristaRuim ],
										[
												"Regular",
												response["Marcos da Silva"].conducaoMotoristaRegular ],
										[
												"Bom",
												response["Marcos da Silva"].conducaoMotoristaBom ],
										[
												"Excelente",
												response["Marcos da Silva"].conducaoMotoristaExcelente ] ]);
						var options = {
							title : 'Condução do Motorista Marcos da Silva',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cond_motor_m_sil'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartCondMotTrans() {
		$
				.ajax({
					type : "post",
					url : "avaliabus/indicador/list_cond_moto_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Transnacional"].conducaoMotoristaPessimo ],
										[
												"Ruim",
												response["Transnacional"].conducaoMotoristaRuim ],
										[
												"Regular",
												response["Transnacional"].conducaoMotoristaRegular ],
										[
												"Bom",
												response["Transnacional"].conducaoMotoristaBom ],
										[
												"Excelente",
												response["Transnacional"].conducaoMotoristaExcelente ] ]);
						var options = {
							title : 'Condução do Motorista Transnacional',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cond_motor_trans'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	function drawChartCondMotSaoJor() {
		$
				.ajax({
					type : "post",
					url : "avaliabus/indicador/list_cond_moto_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Sao Jorge"].conducaoMotoristaPessimo ],
										[
												"Ruim",
												response["Sao Jorge"].conducaoMotoristaRuim ],
										[
												"Regular",
												response["Sao Jorge"].conducaoMotoristaRegular ],
										[
												"Bom",
												response["Sao Jorge"].conducaoMotoristaBom ],
										[
												"Excelente",
												response["Sao Jorge"].conducaoMotoristaExcelente ] ]);
						var options = {
							title : 'Condução do Motorista São Jorge',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cond_motor_sj'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartCondMotReun() {
		$
				.ajax({
					type : "post",
					url : "avaliabus/indicador/list_cond_moto_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Reunidas"].conducaoMotoristaPessimo ],
										[
												"Ruim",
												response["Reunidas"].conducaoMotoristaRuim ],
										[
												"Regular",
												response["Reunidas"].conducaoMotoristaRegular ],
										[
												"Bom",
												response["Reunidas"].conducaoMotoristaBom ],
										[
												"Excelente",
												response["Reunidas"].conducaoMotoristaExcelente ] ]);
						var options = {
							title : 'Condução do Motorista Reunidas',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cond_motor_reun'));

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
		style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Condução dos Motorista</h1>
<br>
<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
			É fácil encontrar motoristas qualificados para o serviço pois estes 
			são gentis e dirigem com prudência, entretanto, há aqueles que não respeitam
			 o usuário e dirigem com imprudência e com 
			comportamento hostil. É necessário avaliá-los de acordo com sua perspectiva.
	</p>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_cond_motor_stn_m" class="mdl-cell--4-col"></div>
	<div id="piechart_cond_motor_mand" class="mdl-cell--4-col"></div>
	<div id="piechart_cond_motor_m_sil" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_cond_motor_trans" class="mdl-cell--4-col"></div>
		<div id="piechart_cond_motor_sj" class="mdl-cell--4-col"></div>
		<div id="piechart_cond_motor_reun" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col" style="margin: 2% 0% -6% 90%">
		<a class="mdl-button mdl-button--fab mdl-button--primary" style="text-decoration: none" href="<c:url value='/resultados/form' />"> < </a>
	</div>
</div>