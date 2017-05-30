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
		<div class="mdl-cell mdl-cell--12-col">	
			<br><br>
			<form:form role="form" servletRelativeAction="/indicador/lotacao" method="GET">
				<%@include file="graf-inputs.jsp"%>
			</form:form>
		</div>
	</div>	
</template:admin>