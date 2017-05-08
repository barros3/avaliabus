<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>

<base href="https://avaliabus.herokuapp.com/" />

<template:admin>
  <div>
    <h2 class="basic-title">Add</h2>
      <form:form role="form" commandName="avaliacao" servletRelativeAction="/avaliacao/${avaliacao.id}" method="POST">
		
		<%@include file="form-inputs.jsp" %>
        <button type="submit" class="btn btn-primary">Submit</button>

      </form:form>	
    </div>
</template:admin>
