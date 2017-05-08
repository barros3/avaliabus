<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>

<link rel="stylesheet"
	href="<c:url value='/assets/css/pagination/jqpagination.css'/>" />

<script src="<c:url value='/assets/js/jquery.jqpagination.js'/>"></script>

<base href="https://avaliabus.herokuapp.com/avaliabus/" />

<template:admin>
	<div class="android-more-section mdl-dialog full-width" style="width: 100%; background-color: #bfd8af;">
		<h1 class="mdl-color-text--primary mdl-shadow--6dp"
			style="text-align: center; height: 8%; margin: 0% 0% 0% 0%; 
			padding-top: 1%; width: 100%; background-color: gold;">
			Configurações de Empresa</h1>
		<br>
		<p
			style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
			Nesta área o administrador tem acesso as Empresas cadastradas no
			sistema.</p>
		<div class="mdl-grid">
			<div class="mdl-cell mdl-cell--12-col">
				<div class="mdl-cell mdl-cell--12-col">
					<table
						class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--4dp"
						style="width: 100%">
						<thead style="font-size:14px; text-align:center">
							<td class="mdl-data-table__cell--non-numeric">Empresa</td>
							<td>E-mail</td>
							<td>Telefone</td>
							<td>Responsável</td>
							<td>Gerenciar</td>
						</thead>
						<tbody>
							<c:forEach items='${paginatedList.currentList}' var='object'>
								<tr>
									<td class="mdl-data-table__cell--non-numeric">${object.tipoNomeEmpresa.valor}</td>
									<td>${object.email}</td>
									<td>${object.telefone}</td>
									<td>${object.nomeResponsavel}</td>
									<td><a
										href="<c:url value='/empresa/remove'/>/${object.id}">Remove</a>
										/ <a href="<c:url value='/empresa'/>/${object.id}">Editar</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
<%-- 					<template:paginationComponent paginatedList="${paginatedList}" --%>
<%-- 						page="${param.page}" action="/empresa" /> --%>
				</div>
			</div>
			<div class="mdl-cell mdl-cell--3-col"></div>
		</div>
	</div>
</template:admin>
