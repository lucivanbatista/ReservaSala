<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema de Reservas de Salas - Sobre</title>
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
			Sobre o Sistema
		</h1>
	</div>
	
	<div class="container">
		<h4>
			<p>Sistema desenvolvido como o objetivo do Trabalho Final da disciplina de Programação de Software para WEB</p>
			<p>Funções do Sistema: </p>
			<ul>
				<li>Cadastrar / Remover / Alterar / Visualizar Salas</li>
				<li>Criar / Remover / Alterar / Visualziar Reservas</li>
				<li>Criar / Alterar Conta de Usuário</li>
				<li>Logar / Deslogar do Sistema</li>
				<li>Entre outras funções... </li>
			</ul>
		</h4>
		<h5>Desenvolvido pelo aluno: José Lucivan Batista Freires</h5>
		<h5>Para mais informações, entre em contato pelo email: lucivanbatista98@gmail.com ou pelo telefone: (88) 997920355</h5>		
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