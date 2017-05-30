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
		<div class="mdl-cell mdl-cell--1-col"></div>
			<div class="mdl-cell mdl-cell--10-col">		
<!-- 			<h1 class="mdl-color-text--primary mdl-shadow--6dp" style="text-align: center; height: 8%; margin: 4% 0% 0% 0%; padding-top: 1%; width: 100%; background-color: gold;">Analise de resultados</h1> -->
				<%@include file="form-inputs.jsp"%>
			</div>
		<div class="mdl-cell mdl-cell--1-col"></div>
	</div>	
</template:admin>