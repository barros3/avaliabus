<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>

<base href="https://avaliabus.herokuapp.com/" />

<template:admin>
	<div class="mdl-grid" style="background-color: rgb(52, 197, 54);">
		<div class="mdl-cell mdl-cell--3-col"></div>
			<div class="mdl-cell mdl-cell--6-col">		
				<form:form role="form" commandName="avaliacao" servletRelativeAction="/avaliacao" enctype="multipart/form-data" method="POST">
					<%@include file="form-inputs.jsp"%>
				</form:form>
			</div>
		<div class="mdl-cell mdl-cell--3-col"></div>
	</div>	
</template:admin>