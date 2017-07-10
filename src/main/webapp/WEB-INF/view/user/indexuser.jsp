<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema de Reservas de Salas - Página Inicial</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="css/bootstrap-united.min.css">
	<link rel="stylesheet" href="css/estilosalas.css">
</head>
<body>	
	<c:if test = "${user.tipoUser > 0}">
         <c:import url="../imports/cabecalho.jsp" />
    </c:if>
    
    <c:if test = "${user.tipoUser < 1}">
         <c:import url="../imports/cabecalho_adm.jsp" />
    </c:if>	
	
	<div class="container intro">
		<h1>
			Página Inicial <small> Reserve e gerencie salas para utilizar futuramente!</small>
		</h1>
	</div>
	
	<c:if test = "${user.tipoUser > 0}">
         <c:import url="../imports/rodape.jsp" />
    </c:if>
    
    <c:if test = "${user.tipoUser < 1}">
         <c:import url="../imports/rodape_adm.jsp" />
    </c:if>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>