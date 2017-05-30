<%@page import="java.util.Enumeration"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<script type="text/javascript">
	function selectLinha() {
		$.ajax({
			type : "get",
			url : "denuncia/add",
			data : 'tipoNomeEmpresa=' + $("#tipoNomeEmpresa").val(),
			contentType: "application/json; charset=utf-8",
			success : function(response) {
				
				$('#linha').html("");
				
				var obj = JSON.parse(JSON.stringify(response));
				
				var options = '<option value=""> <-- Linha/Numero --></option>';
				
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
<div class="android-more-section mdl-dialog full-width" style="width: 100%; background-color: #ffffff;">
	<h1 class="mdl-color-text--primary mdl-shadow--6dp"
		style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Realizar Denúncia</h1>
			<br>
			<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
					Para enviar uma Denúncia do Ônibus/Motorista/Cobrador/Serviço é necessário preencher os dados do transporte coletivo
					explicando a ocorrência. Lembre-se que os dados enviados não são vinculado a conta na qual vc acessa nosso sistema de Denunica. 
			</p>
	<div class="mdl-grid">
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--6-col">
					<div class='input-group date' id='datetimepicker9'>
						<label for="dataDenuncia">Data<span style="color: red;"> *</span></label>		
						<form:input path="dataDenuncia" class="mdl-textfield__input validate" id="datetimepicker9" type="date" />
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
						<label for="horaDenuncia">Hora<span style="color: red;"> *</span></label>		
						<form:input path="horaDenuncia" class="mdl-textfield__input validate" id="datetimepicker9" type="time" />
						<span class="input-group-addon">
			                  <span class="glyphicon glyphicon-calendar">
			                  </span>
			              </span>
					</div>
				</div>
			</div>
		</div>
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<div class="mdl-grid">
				<div class="mdl-textfield mdl-js-textfield mdl-cell mdl-cell mdl-cell--6-col">
					<label for="tipoNomeEmpresa">Selecione a Empresa<span style="color: red;"> *</span></label>	
					<form:select path="empresa.tipoNomeEmpresa" class="mdl-textfield__input validate" id="tipoNomeEmpresa" onchange="selectLinha();">
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
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<div class="mdl-grid">
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
					<label for="descricao" class="mdl-textfield__label">Obserção: <span></span></label>	
					<form:textarea path="descricao" class="mdl-textfield__input" name="descricao" id="descricao" type="text" rows= "5"/>
				</div>
			</div>
		</div>
		<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
			<div class="mdl-grid">
				<div class="mdl-textfield mdl-js-textfield mdl-cell mdl-cell mdl-cell--12-col">
					<label for="linha">Carregar_imagem.xxx<span style="color: red;"> *</span></label>	
					<form:input path="imagemTransiente" type="file" name="file" />
				</div>
			</div>
		</div>
	</div>
	<button type="submit" href="#" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Enviar</button>
</div>
