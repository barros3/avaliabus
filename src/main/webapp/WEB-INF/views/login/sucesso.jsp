<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template"%>

<!-- <base href="https://avaliabus.herokuapp.com/" /> -->
<base href="http://localhost:8080/avaliabus/" /> 

<template:admin>

 	<script>
		swal(
			  'Salvo',
			  'Cadastrado com sucesso!',
			  'success'
			)
	</script>
	
	<meta http-equiv="Refresh" content="1;url=/home"/>
 
</template:admin>