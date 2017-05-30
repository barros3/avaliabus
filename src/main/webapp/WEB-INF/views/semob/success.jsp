<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>
<link rel="stylesheet" href="<c:url value='assets/css/sweetalert2.css'/>" />
<script src="<c:url value='assets/js/sweetalert2.js'/>"></script>
<script src="<c:url value='assets/js/sweetalert2.min.js'/>"></script>

<!-- <base href="https://avaliabus.herokuapp.com/" /> -->
<base href="http://localhost:8080/avaliabus/" /> 

<template:admin>
		<script>
			swal(
				  'Enviado!',
				  'Avalia��o realizada com sucesso!',
				  'success'
				)
		</script>
		
		<meta http-equiv="Refresh" content="1;url=avaliabus"/>	 
</template:admin>