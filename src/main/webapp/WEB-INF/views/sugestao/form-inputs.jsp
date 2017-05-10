<%@page import="java.util.Enumeration"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<script type="text/javascript">
	function selectLinha() {
		$.ajax({
			type : "get",
			url : "avaliacao/add",
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

<!-- <div style="margin: 10% 0% 10% 0%"></div> -->
	<div class="android-more-section mdl-dialog full-width" style="width: 100%; background-color: #ffffff;">
	<h1 class="mdl-color-text--primary mdl-shadow--6dp" style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Sugestões para Empresa</h1>
		<br>
		<p style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
				Através dessa área você pode fazer sugestões para Empresa desejada. 
					Lembre-se: Você pode sugerir para a própria linha que você anda basta apenas selecionar no campo específico. 
		</p>
		<div class="mdl-grid">
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
						<label for="linha">Linha</label>	
						<form:select path="linha" class="mdl-textfield__input validate" id="linha">
							<form:option value="" label="<-- Linha/Numero -->"/>
						</form:select>
					</div>
				</div>
			</div>
			<div class="mdl-cell mdl-cell--12-col mdl-shadow--4dp">
				<div class="mdl-grid">
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
						<label for="descricao" class="mdl-textfield__label">Obserção: <span>*</span></label>	
						<form:textarea path="descricao" class="mdl-textfield__input" name="descricao" id="descricao" type="text" rows= "5"/>
					</div>
				</div>
			</div>
		</div>
		<button type="submit" href="#" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Cadastrar</button>
	</div>