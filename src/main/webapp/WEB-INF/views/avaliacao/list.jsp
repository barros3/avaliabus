<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>

<link rel="stylesheet" href="<c:url value='/assets/css/pagination/jqpagination.css'/>" />

<script src="<c:url value='/assets/js/jquery.jqpagination.js'/>"></script>

<base href="https://avaliabus.herokuapp.com/" />

<template:admin>
	<div class="mdl-grid">
		<div class="mdl-cell mdl-cell--3-col"></div>
		<div class="mdl-cell mdl-cell--6-col">
			<h2 class="mdl-card__title-text mdl-color-text--primary"
				style="text-align: center;">Avaliações</h2>
			<br>
			<br>
			<table
				class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
				<thead>
					<td class="mdl-data-table__cell--non-numeric">Observacao:</td>
					<td>Açoes</td>
				</thead>
				<tbody>
					<c:forEach items='${paginatedList.currentList}' var='object'>
						<tr>
							<td class="mdl-data-table__cell--non-numeric">${object.observacao}</td>
							<td><a href="<c:url value='/avaliacao/remove'/>/${object.id}">Remove</a>
								/ <a href="<c:url value='/avaliacao'/>/${object.id}">Editar</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<template:paginationComponent paginatedList="${paginatedList}" page="${param.page}" action="/avaliacao" />
			<a href="<c:url value='/avaliacao/form'/>" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span>Novo</a>
		</div>
	</div>
	<div class="mdl-cell mdl-cell--3-col"></div>
</template:admin>
