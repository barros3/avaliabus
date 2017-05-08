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
			Configurações de Usuário</h1>
		<br>
		<p
			style="font-size: 22px; text-align: justify !important; font-family: serif; margin: 5% 10% 3% 11%;">
			Nesta área o administrador tem acesso aos Usuários cadastrados no
			sistema.</p>
		<div class="mdl-grid">
			<div class="mdl-cell mdl-cell--12-col">
				<div class="mdl-cell mdl-cell--12-col">
					<table
						class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%; text-align: center">
						<thead style="font-size:14px; text-align:center">
							<td>Login</td>
							<td>E-mail</td>
							<td>Data de Criação</td>
							<td>Gerenciar</td>
						</thead>
						<tbody>
							<c:forEach items='${paginatedList.currentList}' var='object'>
								<tr>
									<td>${object.login}</td>
									<td>${object.email}</td>
									<td>${object.createdAt}</td>
									<td><a
										href="<c:url value='/usuario/remove'/>/${object.id}">Remove</a>
										<a href="<c:url value='/usuario'/>/${object.id}">Editar</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<template:paginationComponent paginatedList="${paginatedList}" page="${param.page}" action="/usuario" />
				</div>
			</div>
			<div class="mdl-cell mdl-cell--3-col"></div>
		</div>
	</div>
</template:admin>
