<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<!DOCTYPE html>
<html> 
<head>
    <title>AvaliaBUS</title>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- 	<meta http-equiv="Content-Language" content="pt-br, en, fr, it"> -->

    <!-- Page styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.min.css">
     <!-- custom login -->
    <link rel="stylesheet" href="<c:url value='assets/login.css'/>">
    <link rel="stylesheet" href="<c:url value='assets/customStyle.css'/>">
    <!-- mdl -->
    <link rel="stylesheet" href="<c:url value='assets/mdl/styles.css'/>">
    <!-- bootstrap -->
	<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.css'/>">
    
<!--     <base href="http://localhost:8080/avaliabus/" /> -->
<base href="http://avaliabus.herokuapp.com/" />
    
    
    <script src="https://code.getmdl.io/1.2.1/material.min.js"></script>
    
    <!-- Materialize -->
	<script src="<c:url value='/assets/newlayout/js/vendor/materialize/materialize.min.js'/>"></script>
    <script src="https://code.getmdl.io/1.2.1/material.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="assests/materialize/js/materialize.min.js"></script>
  </head>
  <body>
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

      <div class="android-header mdl-layout__header">
        <div class="mdl-layout__header-row">
          <!-- Add spacer, to align navigation to the right in desktop -->
          <div class="android-header-spacer mdl-layout-spacer"></div>
          <div class="android-search-box mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right mdl-textfield--full-width">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="search-field">
              <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
              <input class="mdl-textfield__input" type="text" id="search-field">
            </div>
          </div>
          <!-- Navigation -->
          <div class="android-navigation-container">
            <nav class="android-navigation mdl-navigation">
              <a class="mdl-navigation__link mdl-navigation" style="text-decoration:none;" href="">Sobre</a>
              <a class="mdl-navigation__link mdl-navigation" style="text-decoration:none;" href="resultados/form">Resultados</a>
              <a class="mdl-navigation__link mdl-navigation" style="text-decoration:none;" href="avaliacao/form">Avalie sua Viagem</a>
<!--               <a class="mdl-navigation__link mdl-navigation" href=""><span class="mdl-layout-title">Como funciona?</a> -->
              <a class="mdl-navigation__link mdl-navigation" style="text-decoration:none;" href="sugestao/form">Sugestão</a>
              <a class="mdl-navigation__link mdl-navigation" style="text-decoration:none;" href="denuncia/form">Denuncie</a>
            </nav>
          </div>
          
          <span class="android-mobile-title mdl-layout-title">
<!--             <img class="android-logo-image" src="assets/mdl/images/android-logo.png"> -->
          </span>
          <button class="android-more-button mdl-button mdl-js-button mdl-button--icon mdl-js-ripple-effect" id="more-button">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right mdl-js-ripple-effect" for="more-button">
<%--             <li><a href="<c:url value='resultados/form'/>" class="mdl-menu__item" style="text-decoration:none;">Resultados</a></li> --%>
<%--             <li><a href="<c:url value='avaliacao/form'/>" class="mdl-menu__item" style="text-decoration:none;">Avaliação</a></li> --%>
<%--             <li><a href="<c:url value='denuncia/form'/>" class="mdl-menu__item" style="text-decoration:none;">Denúncia</a></li> --%>
<%-- 			<li><a href="<c:url value='sugestao/form'/>" class="mdl-menu__item" style="text-decoration:none;">Sugestão</a></li> --%>
			
			<c:if test="${isLogado == true}" var="isLogado">
				<li><a href="<c:url value='/logout'/>" class="mdl-menu__item" style="text-decoration:none;">Sair</a></li>
			</c:if>
			</ul>
        </div>
      </div>


<!-- 		NAVEGACAO LATERAL -->
	<c:if test="${admin_master == true}" var="checkAutorLogin">
      <div class="android-drawer mdl-layout__drawer">
        <span class="mdl-layout-title">
         <img alt="logo" src="assets/mdl/images/luciano.jpg" style="margin: 9% 0% 0% 5%">
        </span>
        <nav class="mdl-navigation">
  	  	<span class="mdl-navigation__link" href="">Administrador</span>
          <a class="mdl-navigation__link" href="<c:url value='/usuario/form'/>" style="text-decoration:none;">Cadastrar Usuário</a>
          <a class="mdl-navigation__link" href="<c:url value='/usuario/'/>" style="text-decoration:none;">Listar Usuário</a>
<%--           <a class="mdl-navigation__link" href="<c:url value='/sugestao/form'/>" style="text-decoration:none;">Sugestão</a> --%>
          <div class="android-drawer-separator"></div>
          	<span class="mdl-navigation__link" href="">EMPRESAS</span>
<%--           	<a class="mdl-navigation__link" href="<c:url value='/empresa/form'/>" style="text-decoration:none;">Cadastrar Empresas</a> --%>
          	<a class="mdl-navigation__link" href="<c:url value='/empresa/'/>" style="text-decoration:none;">Configurações de Empresas</a>
<!--           <div class="android-drawer-separator"></div> -->
<!--           	<span class="mdl-navigation__link" href="">EMPRESAS</span> -->
<%--           <a class="mdl-navigation__link" href="<c:url value='/empresa/indicadores/santa-maria'/>" style="text-decoration:none;">Santa Maria</a> --%>
<%--           <a class="mdl-navigation__link" href="<c:url value='/empresa/indicadores/mandacaruense'/>" style="text-decoration:none;">Mandacaruense</a> --%>
<%--           <a class="mdl-navigation__link" href="<c:url value='/empresa/indicadores/marcos-da-silva'/>" style="text-decoration:none;">Marcos da Silva</a> --%>
<%--           <a class="mdl-navigation__link" href="<c:url value='/empresa/indicadores/transnacional'/>" style="text-decoration:none;">Transnacional</a> --%>
<%--           <a class="mdl-navigation__link" href="<c:url value='/empresa/indicadores/sao-jorge'/>" style="text-decoration:none;">São Jorge</a> --%>
<%--           <a class="mdl-navigation__link" href="<c:url value='/empresa/indicadores/reunidas'/>" style="text-decoration:none;">Reunidas</a> --%>
<!--           <div class="android-drawer-separator"></div> -->
<!--           	<span class="mdl-navigation__link" href="">MAIS</span> -->
<%--           <a class="mdl-navigation__link" href="<c:url value='/'/>" style="text-decoration:none;">Área administrativa</a> --%>
<%--           <a class="mdl-navigation__link" href="<c:url value='/'/>" style="text-decoration:none;">Nossa História</a> --%>
<%--           <a class="mdl-navigation__link" href="<c:url value='/'/>" style="text-decoration:none;">O que pretendemos ?</a> --%>
<%--           <a class="mdl-navigation__link" href="<c:url value='/'/>" style="text-decoration:none;">Contate-nos</a> --%>
<%--           <a class="mdl-navigation__link" href="<c:url value='/'/>" style="text-decoration:none;">Nos sugestione</a> --%>
        </nav>
      </div>
	</c:if>
      <div class="android-content mdl-layout__content">
       
        <jsp:doBody />
		<template:footer />
      </div>
    </div>
  </body>
</html>