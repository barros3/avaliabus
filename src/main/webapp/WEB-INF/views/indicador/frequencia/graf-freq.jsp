<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>

<base href="https://avaliabus.herokuapp.com/" />

<template:admin>
	<div class="mdl-grid">
		<div class="mdl-cell mdl-cell--3-col"></div>
			<div class="mdl-cell mdl-cell--6-col">		
			</div>
		<div class="mdl-cell mdl-cell--3-col"></div>
	</div>
	<div class="mdl-grid">
		<div class="mdl-cell mdl-cell--12-col">	
			<form:form role="form" servletRelativeAction="/indicador/frequencia" method="GET">
				<%@include file="graf-inputs.jsp"%>
			</form:form>
		</div>
	</div>	
</template:admin>