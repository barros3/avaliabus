<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>

<link rel="stylesheet" href="<c:url value='/assets/css/pagination/jqpagination.css'/>" />

<script src="<c:url value='/assets/js/jquery.jqpagination.js'/>"></script>

<template:admin>
    <div class ="container min-container">
      <h2 class="basic-title">Denuncias</h2>
        <div class="well">
          <table class="table table-condensed table-bordered table-striped table-hover">
          		  <thead>
	                  <tr>
	                  	<td>id</td>
		                  	<td>Lotacao</td>
		                  	<td>Frequencia</td>
						<td>acoes</td>
	                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items='${paginatedList.currentList}' var='object'>         		
	                  <tr>
						<td><a href="<c:url value='/denuncia'/>/${object.id}">${object.id}</a></td>
		                  	<td>${object.descricao}</td>
		                  	<td>${object.empresa.tipoNomeEmpresa.valor}</td>
	                    <td><a href="<c:url value='/denuncia/remove'/>/${object.id}">Remove</a></td>
					  </tr>
                  </c:forEach>
                  </tbody>
          </table>
		  <template:paginationComponent paginatedList="${paginatedList}" page="${param.page}" action="/denuncia"/>
          <a href="<c:url value='/denuncia/form'/>" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span>Novo</a>
        </div>
    </div>
</template:admin>
