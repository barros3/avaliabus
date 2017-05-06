<%@page import="java.util.Enumeration"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<script type="text/javascript">
	function selectLinha() {
		$.ajax({
			type : "get",
			url : "/avaliabus/avaliacao/add",
			data : 'tipoNomeEmpresa=' + $("#tipoNomeEmpresa").val(),
			contentType: "application/json; charset=utf-8",
			success : function(response) {
				
				$('#linha').html("");
				
				var obj = JSON.parse(JSON.stringify(response));
				
				var options = '<option value=""><-- Linha/Numero --></option>';
				
				$.map(obj, function(val, key) {
					options += '<option itemValue="' + key + '" itemLabel="">'+ val + '</option>';					
				});
				
				$('#linha').html(options).show();
				
			},
			error : function(response) {
				console.log(response);
				alert('Erro na requisição...');
			}
		});
	}
	
</script>
<!-- <div style="margin: 10% 0% 10% 0%"></div> -->
<div class="android-more-section mdl-dialog full-width" style="width: 100%; background-color: #ffffff;">
<h1 class="mdl-color-text--primary mdl-shadow--6dp"
		style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Formulário de Avaliação</h1>
			<br>
			<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
					Para realizar a Avaliação do Onibus é necessário preencher os dados do transporte coletivo
				que vc deseja avaliar e marcar os indicadores de avaliação abaixo, que variam de "Péssimo" à "Excelente". 
			</p>
	<div class="mdl-grid">
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<div class="mdl-cell mdl-cell--12-col">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--6-col">
						<div class='input-group date' id='datetimepicker9'>
							<label for="dataAvaliacao">Data<span style="color: red;"> *</span></label>		
							<form:input path="dataAvaliacao" class="mdl-textfield__input validate" id="datetimepicker9" type="date" />
							<span class="input-group-addon">
				                  <span class="glyphicon glyphicon-calendar">
				                  </span>
				              </span>
				              <script type="text/javascript">
						        $(function () {
						            $('#datetimepicker9').datetimepicker({
						                viewMode: 'years'
						            });
						        });
						    </script>
						</div>
					</div>
					<div class="mdl-cell mdl-cell--6-col">
						<div class='input-group date' id='datetimepicker9'>
							<label for="horaAvaliacao">Hora<span style="color: red;"> *</span></label>		
							<form:input path="horaAvaliacao" class="mdl-textfield__input validate" id="datetimepicker9" type="time" />
							<span class="input-group-addon">
				                  <span class="glyphicon glyphicon-calendar">
				                  </span>
				              </span>
						</div>
					</div>
				</div>
			</div>
			<div class="mdl-cell mdl-cell--12-col">
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
					<label for="observacao" class="mdl-textfield__label">Obserção: <span></span></label>	
					<form:textarea path="observacao" class="mdl-textfield__input" name="observacao" id="observacao" type="text" rows= "5"/>
				</div>
			</div>
			<div class="mdl-cell mdl-cell--12-col">
				<div class="mdl-grid">
					<div class="mdl-textfield mdl-js-textfield mdl-cell mdl-cell mdl-cell--6-col mdl-select mdl-js-select mdl-select--floating-label">
						<label for="tipoNomeEmpresa">Selecione a Empresa<span style="color: red;"> *</span></label>	
						<form:select path="empresa.tipoNomeEmpresa" class="mdl-textfield mdl-textfield__input validate mdl-select__input" id="tipoNomeEmpresa" onchange="selectLinha();">
							<form:option value="" label="<-- Empresa -->"/>
					    	<form:options items="${nomeEmpresas}" itemLabel="valor"/>
						</form:select>
					</div>
					<div class="mdl-textfield mdl-js-textfield mdl-cell mdl-cell mdl-cell--6-col">
						<label for="linha">Linha<span style="color: red;"> *</span></label>	
						<form:select path="linha" class="mdl-textfield__input validate" id="linha">
							<form:option value="" label="<-- Linha/Numero -->"/>
						</form:select>
					</div>
				</div>
			</div>
		</div>
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<ul class="demo-list-item mdl-list">
			  <li class="mdl-list__item mdl-cell mdl-cell--12-col">
				<ul class="mdl-cell mdl-cell mdl-cell--6-col">
					<h2 class="mdl-card__title-text mdl-color-text--primary">Lotação</h2>
					<br>
					<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 0% 3% 0%;">
						O ônibus estava lotado ? Havia mais gente que o ônibus pudesse suportar ? 						
					</p>
				</ul>	
				<ul class="demo-list-item mdl-list mdl-cell mdl-cell--6-col">
					<form:radiobuttons path="lotacao"
								class="mdl-radio-button mdl-cell mdl-cell--9-col" id="lotacao"
							items="${checkBoxValues}" itemLabel="valor" itemValue="chave" />
				</ul>
	
			 </li>
			</ul>
		</div>
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<ul class="demo-list-item mdl-list">
			  <li class="mdl-list__item mdl-cell mdl-cell--12-col">
				<ul class="mdl-cell mdl-cell mdl-cell--6-col">
					<h2 class="mdl-card__title-text mdl-color-text--primary">Frequência</h2>
					<br>
					<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 0% 3% 0%;">
						Defina como você acha que é a frequência que o coletivo passa na parada de ônibus. 
						
					</p>
				</ul>	
				<ul class="demo-list-item mdl-list mdl-cell mdl-cell mdl-cell--6-col">
					<form:radiobuttons path="frequencia"
								class="mdl-radio-button mdl-cell mdl-cell--9-col" id="frequencia"
							items="${checkBoxValues}" itemLabel="valor" itemValue="chave" />
				</ul>
	
			 </li>
			</ul>
		</div>
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<ul class="demo-list-item mdl-list">
			  <li class="mdl-list__item mdl-cell mdl-cell--12-col">
				<ul class="mdl-cell mdl-cell mdl-cell--6-col">
					<h2 class="mdl-card__title-text mdl-color-text--primary">Pontualidade</h2>
					<br>
					<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 0% 3% 0%;">
						Avalie aqui a pontualidade: o Onibus chega sempre na hora certa ?
					</p>
				</ul>	
				<ul class="demo-list-item mdl-list mdl-cell mdl-cell mdl-cell--6-col">
					<form:radiobuttons path="pontualidade"
								class="mdl-radio-button mdl-cell mdl-cell--9-col" id="pontualidade"
							items="${checkBoxValues}" itemLabel="valor" itemValue="chave" />
				</ul>
	
			 </li>
			</ul>
		</div>
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<ul class="demo-list-item mdl-list">
			  <li class="mdl-list__item mdl-cell mdl-cell--12-col">
				<ul class="mdl-cell mdl-cell mdl-cell--6-col">
					<h2 class="mdl-card__title-text mdl-color-text--primary">Limpeza</h2>
					<br>
					<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 0% 3% 0%;">
						Avalie aqui a limpeza: o Onibus está sempre limpo ?
					</p>
				</ul>	
				<ul class="demo-list-item mdl-list mdl-cell mdl-cell mdl-cell--6-col">
					<form:radiobuttons path="limpeza"
								class="mdl-radio-button mdl-cell mdl-cell--9-col" id="limpeza"
							items="${checkBoxValues}" itemLabel="valor" itemValue="chave" />
				</ul>
	
			 </li>
			</ul>
		</div>
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<ul class="demo-list-item mdl-list">
			  <li class="mdl-list__item mdl-cell mdl-cell--12-col">
				<ul class="mdl-cell mdl-cell mdl-cell--6-col">
					<h2 class="mdl-card__title-text mdl-color-text--primary">Condução do Motorista</h2>
					<br>
					<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 0% 3% 0%;">
						Avalie aqui como foi que o Motorista se comportou durante sua viagem. Foi rápido demais? 
						Lembre-se você pode denunciá-lo por aqui!
					</p>
				</ul>	
				<ul class="demo-list-item mdl-list mdl-cell mdl-cell mdl-cell--6-col">
					<form:radiobuttons path="conducaoMotorista"
								class="mdl-radio-button mdl-cell mdl-cell--9-col" id="conducaoMotorista"
							items="${checkBoxValues}" itemLabel="valor" itemValue="chave" />
				</ul>
	
			 </li>
			</ul>
		</div>
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<ul class="demo-list-item mdl-list">
			  <li class="mdl-list__item mdl-cell mdl-cell--12-col">
				<ul class="mdl-cell mdl-cell mdl-cell--6-col">
					<h2 class="mdl-card__title-text mdl-color-text--primary">Condições do Veiculo</h2>
					<br>
					<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 0% 3% 0%;">
						Avalie aqui o estado de conservação dos ônibus: o onibus é novo ou tem algo quebrado ?
					</p>
				</ul>	
				<ul class="demo-list-item mdl-list mdl-cell mdl-cell mdl-cell--6-col">
					<form:radiobuttons path="conservacaoTransporte"
								class="mdl-radio-button mdl-cell mdl-cell--9-col" id="conservacaoTransporte"
							items="${checkBoxValues}" itemLabel="valor" itemValue="chave" />
				</ul>
	
			 </li>
			</ul>
		</div>
	</div>
	<button type="submit" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Enviar</button>	
</div>