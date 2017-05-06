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
					url : "/avaliabus/indicador/list_cond_moto_indicador",
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
							is3D : true,
							'width' : 400,
							'height' : 300
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
					url : "/avaliabus/indicador/list_cond_moto_indicador",
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
							is3D : true,
							'width' : 400,
							'height' : 300.
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
					url : "/avaliabus/indicador/list_cond_moto_indicador",
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
							is3D : true,
							'width' : 400,
							'height' : 300.
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
					url : "/avaliabus/indicador/list_cond_moto_indicador",
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
							is3D : true,
							'width' : 400,
							'height' : 300.
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
					url : "/avaliabus/indicador/list_cond_moto_indicador",
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
							is3D : true,
							'width' : 400,
							'height' : 300
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
					url : "/avaliabus/indicador/list_cond_moto_indicador",
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
							is3D : true,
							'width' : 400,
							'height' : 300
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
<div class="mdl-grid">
	<div id="piechart_cond_motor_stn_m" class="mdl-cell--4-col"></div>
	<div id="piechart_cond_motor_mand" class="mdl-cell--4-col"></div>
	<div id="piechart_cond_motor_m_sil" class="mdl-cell--4-col"></div>
</div>
<div class="mdl-grid">
	<div id="piechart_cond_motor_trans" class="mdl-cell--4-col"></div>
	<div id="piechart_cond_motor_sj" class="mdl-cell--4-col"></div>
	<div id="piechart_cond_motor_reun" class="mdl-cell--4-col"></div>
</div>