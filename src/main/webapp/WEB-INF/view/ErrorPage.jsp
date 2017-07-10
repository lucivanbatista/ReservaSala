<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema de Reservas de Salas - Erro</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="css/bootstrap-united.min.css">
	<link rel="stylesheet" href="css/estilosalas.css">
</head>
<body>	

	<c:if test = "${user.tipoUser > 0}">
         <c:import url="imports/cabecalho.jsp" />
    </c:if>
    
    <c:if test = "${user.tipoUser < 1}">
         <c:import url="imports/cabecalho_adm.jsp" />
    </c:if>
    
    <c:if test="${user == null }">
    	<div class="navbar navbar-inverse navbar-fixed-top barratop">
			<div class="navbar-header">
				<a href="/login" class="navbar-brand">Sistema de Reservas de Salas</a>
				<button class="navbar-toggle" type="button" data-target=".navbar-collapse" data-toggle="collapse"></button>
			</div>
		
			<ul class="nav navbar-nav collapse navbar-collapse">
				<li><a href="/login" class="btn btn-basic"><span class="glyphicon glyphicon-share"> </span> Login </a></li>
				<li><a href="/cadastro" class="btn btn-basic"><span class="glyphicon glyphicon-edit"> </span> Cadastrar </a></li>
				<li><a href="/sobre" class="btn btn-basic"><span class="glyphicon glyphicon-barcode"> </span> Sobre </a></li>
			</ul>	
		</div>
    </c:if>

	
	<div class="container intro">
		<div class="jumbotron">
			<h2><span class="glyphicon glyphicon-warning-sign"></span> ${erro}</h2>
		</div>
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>