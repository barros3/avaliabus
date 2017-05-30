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
	  
      google.charts.setOnLoadCallback(drawChartConsColetSantMa);
      google.charts.setOnLoadCallback(drawChartConsColetMand);
      google.charts.setOnLoadCallback(drawChartConsColetMSilva);
      
      google.charts.setOnLoadCallback(drawChartConsColetTrans);
      google.charts.setOnLoadCallback(drawChartConsColetSaoJor);
      google.charts.setOnLoadCallback(drawChartConsColetReun);
      
      
	function drawChartConsColetSantMa() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_cons_veic_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Santa Maria"].conservacaoColetivoPessimo ],
										[
												"Ruim",
												response["Santa Maria"].conservacaoColetivoRuim ],
										[
												"Regular",
												response["Santa Maria"].conservacaoColetivoRegular ],
										[
												"Bom",
												response["Santa Maria"].conservacaoColetivoBom ],
										[
												"Excelente",
												response["Santa Maria"].conservacaoColetivoExcelente ] ]);
						var options = {
							title : 'Santa Maria',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cons_colet_stn_m'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}

	function drawChartConsColetMand() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_cons_veic_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Mandacaruense"].conservacaoColetivoPessimo ],
										[
												"Ruim",
												response["Mandacaruense"].conservacaoColetivoRuim ],
										[
												"Regular",
												response["Mandacaruense"].conservacaoColetivoRegular ],
										[
												"Bom",
												response["Mandacaruense"].conservacaoColetivoBom ],
										[
												"Excelente",
												response["Mandacaruense"].conservacaoColetivoExcelente ] ]);
						var options = {
							title : 'Mandacaruense',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cons_colet_mand'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartConsColetMSilva() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_cons_veic_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Marcos da Silva"].conservacaoColetivoPessimo ],
										[
												"Ruim",
												response["Marcos da Silva"].conservacaoColetivoRuim ],
										[
												"Regular",
												response["Marcos da Silva"].conservacaoColetivoRegular ],
										[
												"Bom",
												response["Marcos da Silva"].conservacaoColetivoBom ],
										[
												"Excelente",
												response["Marcos da Silva"].conservacaoColetivoExcelente ] ]);
						var options = {
							title : 'Marcos da Silva',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cons_colet_m_sil'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartConsColetTrans() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_cons_veic_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Transnacional"].conservacaoColetivoPessimo ],
										[
												"Ruim",
												response["Transnacional"].conservacaoColetivoRuim ],
										[
												"Regular",
												response["Transnacional"].conservacaoColetivoRegular ],
										[
												"Bom",
												response["Transnacional"].conservacaoColetivoBom ],
										[
												"Excelente",
												response["Transnacional"].conservacaoColetivoExcelente ] ]);
						var options = {
							title : 'Transnacional',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cons_colet_trans'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	function drawChartConsColetSaoJor() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_cons_veic_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Sao Jorge"].conservacaoColetivoPessimo ],
										[
												"Ruim",
												response["Sao Jorge"].conservacaoColetivoRuim ],
										[
												"Regular",
												response["Sao Jorge"].conservacaoColetivoRegular ],
										[
												"Bom",
												response["Sao Jorge"].conservacaoColetivoBom ],
										[
												"Excelente",
												response["Sao Jorge"].conservacaoColetivoExcelente ] ]);
						var options = {
							title : 'São Jorge',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cons_colet_sj'));

						chart.draw(data, options);

					},
					error : function(response) {
						console.log(response);
						alert('Erro na requisição...');
					}
				});

	}
	
	function drawChartConsColetReun() {
		$
				.ajax({
					type : "post",
					url : "/avaliabus/indicador/list_cons_veic_indicador",
					contentType : "application/json; charset=utf-8",
					success : function(response) {

						var obj = JSON.parse(JSON.stringify(response));

						var data = google.visualization
								.arrayToDataTable([
										[ 'total', 'indicador' ],
										[
												"Péssimo",
												response["Reunidas"].conservacaoColetivoPessimo ],
										[
												"Ruim",
												response["Reunidas"].conservacaoColetivoRuim ],
										[
												"Regular",
												response["Reunidas"].conservacaoColetivoRegular ],
										[
												"Bom",
												response["Reunidas"].conservacaoColetivoBom ],
										[
												"Excelente",
												response["Reunidas"].conservacaoColetivoExcelente ] ]);
						var options = {
							title : 'Reunidas',
							is3D : true
						};

						var chart = new google.visualization.PieChart(document
								.getElementById('piechart_cons_colet_reun'));

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
		style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Conservação do Veículo</h1>
<br>
<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
			Atualmente é difícil ver ônibus que seja velho,
			 no entanto, o indicador de Condições do Veículo 
			 definir um parâmetro referente ao estado do ônibus.
			  Se existir algo no ônibus como: banco quebrado, pneus velhos, 
			  buracos no assoalho, ou etc. É necessário verificar como será avaliado esta linha de ônibus.

	</p>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_cons_colet_stn_m" class="mdl-cell--4-col"></div>
		<div id="piechart_cons_colet_mand" class="mdl-cell--4-col"></div>
		<div id="piechart_cons_colet_m_sil" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-grid mdl-shadow--6dp">
		<div id="piechart_cons_colet_trans" class="mdl-cell--4-col"></div>
		<div id="piechart_cons_colet_sj" class="mdl-cell--4-col"></div>
		<div id="piechart_cons_colet_reun" class="mdl-cell--4-col"></div>
	</div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col"></div>
	<div class="mdl-cell--4-col" style="margin: 2% 0% -6% 90%">
		<a class="mdl-button mdl-button--fab mdl-button--primary" style="text-decoration: none" href="<c:url value='/resultados/form' />"> < </a>
	</div>
</div>