<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<link rel="stylesheet" href="<c:url value='assets/css/sweetalert2.css'/>" />
<script src="<c:url value='assets/js/sweetalert2.js'/>"></script>
<script src="<c:url value='assets/js/sweetalert2.min.js'/>"></script>

 <c:if test="${isLocal == true}" var="isLocal">
 	<base href="http://localhost:8080/avaliabus/" />
 </c:if>
 <c:if test="${isLocal == false}" var="isLocal">
 	<base href="https://avaliabus.herokuapp.com/" />
 </c:if>

<template:admin>
		<script>
			swal(
				  'Usuário Cadastrado com sucesso!!',
				  'Agora faça Login na aplicação!'
				)
		</script>
		
		<meta http-equiv="Refresh" content="1;url=/home"/>	 
</template:admin>