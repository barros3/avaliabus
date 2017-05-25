<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>

<!-- <base href="https://avaliabus.herokuapp.com/" /> -->
<base href="http://localhost:8080/avaliabus/" />

<template:admin>
    <div class="mdl-grid">
		<div class="mdl-cell mdl-cell--3-col"></div>
			<div class="mdl-cell mdl-cell--6-col">		
			<br><br>
			      <form:form role="form" commandName="usuario" servletRelativeAction="/usuario/${usuario.id}" method="POST">
					
					<%@include file="form-inputs.jsp" %>
			        <button type="submit" class="btn btn-primary">Enviar</button>

   				 </form:form>
    				 </div>
		<div class="mdl-cell mdl-cell--3-col"></div>
	</div>		
</template:admin>
