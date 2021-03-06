<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>

 <c:if test="${isLocal == true}" var="isLocal">
 	<base href="http://localhost:8080/avaliabus/" />
 </c:if>
 <c:if test="${isLocal == false}" var="isLocal">
 	<base href="https://avaliabus.herokuapp.com/" />
 </c:if>
<template:admin>
	<div class="mdl-grid">
		<div class="mdl-cell mdl-cell--3-col"></div>
			<div class="mdl-cell mdl-cell--6-col">		
			<br><br>
			<h1 class="mdl-card__title-text mdl-color-text--primary" style="text-align: center;">Empresas de Transporte P�blico</h1>
			<br>
				<p style="text-align: justify;"> 
				</p>
				<form:form role="form" commandName="empresa" servletRelativeAction="/empresa" method="POST">
					<%@include file="form-inputs.jsp"%>
					<button type="submit" href="#" class="btn btn-success  green darken-1 btn-large">Cadastrar</button>
				</form:form>
			</div>
		<div class="mdl-cell mdl-cell--3-col"></div>
	</div>	
</template:admin>