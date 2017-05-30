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
	<div class="android-more-section mdl-dialog full-width"
		style="width: 100%; background-color: #bfd8af">
		<h1 class="mdl-color-text--primary mdl-shadow--6dp"
			style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Cadastrar
			Novo Usuário</h1>
		<br>
		<p
			style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
			Nesta área o administrador tem acesso as Empresas cadastradas no
			sistema.</p>
		<br>
		<br>
		<form:form role="form" commandName="usuario"
			servletRelativeAction="/usuario" method="POST">
			<%@include file="form-inputs.jsp"%>
		</form:form>
	</div>
</template:admin>