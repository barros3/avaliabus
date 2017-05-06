<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<template:admin>
  <div>
    <h2 class="basic-title">Add</h2>
      <form:form role="form" cssClass="well" commandName="denuncia" servletRelativeAction="/denuncia/${denuncia.id}" method="POST">
		
		<%@include file="form-inputs.jsp" %>
        <button type="submit" class="btn btn-primary">Enviar</button>

      </form:form>	
    </div>
</template:admin>
