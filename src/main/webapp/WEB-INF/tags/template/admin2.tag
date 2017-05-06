<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<!DOCTYPE html>
<html lang="pt-br"> 
<head>
    <title>Avaliabus</title>

	<meta http-equiv="Content-Language" content="pt-br">

    <!-- Page styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.min.css">
    <link rel="stylesheet" href="<c:url value='assets/login.css'/>">
    <link rel="stylesheet" href="assets/mdl/styles.css">
    
    
    <script src="https://code.getmdl.io/1.2.1/material.min.js"></script>
   
    <!-- Materialize -->
	<script src="<c:url value='/assets/newlayout/js/vendor/materialize/materialize.min.js'/>"></script>
    <!-- <style>
		    #view-source {
		      position: fixed;
		      display: block;
		      right: 0;
		      bottom: 0;
		      margin-right: 40px;
		      margin-bottom: 40px;
		      z-index: 900;
		    }
	    </style>
     -->
  </head>
  <body>
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

      <div class="android-header mdl-layout__header mdl-layout__header--waterfall">
        <div class="mdl-layout__header-row">
<!--           <span class="android-title mdl-layout-title"> -->
		<span class="android-title mdl-layout-title">
            <img class="android-logo-image" src="assets/mdl/images/logohead.jpg">
          </span>
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
              <a class="mdl-navigation__link mdl-navigation" href="">Sobre</a>
              <a class="mdl-navigation__link mdl-navigation" href="">O que pretendemos?</a>
<!--               <a class="mdl-navigation__link mdl-navigation" href=""><span class="mdl-layout-title">Como funciona?</a> -->
              <a class="mdl-navigation__link mdl-navigation" href="">Transparência</a>
              <a class="mdl-navigation__link mdl-navigation" href="">Fale conosco</a>
              <a class="mdl-navigation__link mdl-navigation" href="">Sugestao</a>
            </nav>
          </div>
          
          <span class="android-mobile-title mdl-layout-title">
<!--             <img class="android-logo-image" src="assets/mdl/images/android-logo.png"> -->
          </span>
          <button class="android-more-button mdl-button mdl-js-button mdl-button--icon mdl-js-ripple-effect" id="more-button">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right mdl-js-ripple-effect" for="more-button">
            <li><a href="<c:url value='/login'/>" class="mdl-menu__item">Area administrativa</a></li>
            <li><a href="<c:url value='/login'/>" class="mdl-menu__item">Nossa Historia</a></li>
            <li><a href="<c:url value='/login'/>" class="mdl-menu__item">O que pretendemos ?</a></li>
			
			<c:if test="${checkAutorLogin = true }" var="checkAutorLogin">
				<li><a href="<c:url value='/logout'/>" class="mdl-menu__item">Sair</a></li>
			</c:if>
			<c:if test="${checkAutorLogin =  false}" var="checkAutorLogin">
				<li disable class="mdl-menu__item">Sair</li>
			</c:if>
			</ul>
        </div>
      </div>


<!-- 		NAVEGACAO LATERAL -->

      <div class="android-drawer mdl-layout__drawer">
        <span class="mdl-layout-title">
         <img alt="logo" src="assets/mdl/images/newlogo.png">
        </span>
        <nav class="mdl-navigation">
  	  	<span class="mdl-navigation__link" href="">SERVIÇOS</span>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Avaliação</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Denúncias</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Sugestão</a>
          <div class="android-drawer-separator"></div>
          	<span class="mdl-navigation__link" href="">INDICADORES</span>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Frequência</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Pontualidade</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Limpeza</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Lotação</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Condução do Motorista</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Qualidade do Ônibus</a>
          <div class="android-drawer-separator"></div>
          	<span class="mdl-navigation__link" href="">EMPRESAS</span>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Santa Maria</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Mandacaruense</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Marcos da Silva</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Transnacional</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">São Jorge</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Reunidas</a>
          <div class="android-drawer-separator"></div>
          	<span class="mdl-navigation__link" href="">MAIS</span>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Área administrativa</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Nossa História</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">O que pretendemos ?</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Contate-nos</a>
          <a class="mdl-navigation__link" href="<c:url value='/'/>">Nos sugestione</a>
        </nav>
      </div>

      <div class="android-content mdl-layout__content">
       
        <jsp:doBody />
		<template:footer />
      </div>
    </div>
    <script src="https://code.getmdl.io/1.2.1/material.min.js"></script>
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="assests/materialize/js/materialize.min.js"></script>
  </body>
</html>