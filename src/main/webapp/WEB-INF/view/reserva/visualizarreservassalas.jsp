<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Visualizador de Salas</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="../css/bootstrap-united.min.css">
	<link rel="stylesheet" href="../css/estilosalas.css">
</head>
<body>
	<c:if test = "${user.tipoUser > 0}">
         <c:import url="/imports/cabecalho.jsp" />
    </c:if>
    
    <c:if test = "${user.tipoUser < 1}">
         <c:import url="/imports/cabecalho_adm.jsp" />
    </c:if>
	
	<div class="container">
		<div class="panel panel-default">
			<h1>
				Informações da Sala <small> Visualize as informações da Sala e suas Reservas</small>
			</h1>
		</div>
		<div>
			<fieldset>
				<legend>Informações da Sala</legend>
				<input type="hidden" name="id" id="id" value="${sala.id}">
				<div class="form-group">
					<label>Número da Porta da Sala </label>
					<input type="text" class="form-control" id="nPorta" name="nPorta" value="${sala.nPorta}" disabled="disabled">
				</div>
				<div class="form-group">
					<label>Bloco de onde a Sala está localizada </label>
					<input type="text" class="form-control" id="bloco" name="bloco" value="${sala.bloco}" disabled="disabled">
				</div>
				<div class="form-group">
					<label>Descrição Geral sobre a Sala </label>
					<input type="text" class="form-control" id="descricao" name="descricao" value="${sala.descricao}" disabled="disabled">
				</div>
			</fieldset>
		</div>
	</div>
	
	

			
			
<!-- 			<fieldset> -->
<%-- 				<form action="showreservas" method="get"> --%>
<!-- 					<div class="form-group"> -->
<!-- 						<label>Digite o Horário Desejado (A,B,C,D,E,F) </label> -->
<!-- 						<input type="text" class="form-control" id="horariofiltro" name="horariofiltro"	placeholder="Digite o horário desejado"> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label>Digite o dia do mês </label> -->
<!-- 						<input type="text" class="form-control" id="diafiltro" name="diafiltro" placeholder="Digite o dia"> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label>Digite o mês desse ano </label> -->
<!-- 						<input type="text" class="form-control" id="mesfiltro" name="mesfiltro" placeholder="Digite o mês"> -->
<!-- 					</div> -->
<!-- 					<button type="submit" class="btn btn-primary btn-md">Listar	Todas as Salas Cadastradas</button> -->
<%-- 				</form> --%>
<!-- 			</fieldset> -->


	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<h2>Filtros de Pesquisa para as Reservas</h2>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>ID da Reserva</th>
						<th>Matrícula do Usuário</th>
						<th>ID da Sala</th>
						<th>Descrição Geral da Reserva</th>
						<th>Horário</th>
						<th>Dia</th>
						<th>Mês</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reservas}" var="reserva">
						<tr>
							<td>${reserva.id}</td>
							<td>${reserva.user.matricula}</td>
							<td>${reserva.sala.id}</td>
							<td>${reserva.descricao}</td>
							<td>${reserva.horario}</td>
							<td>${reserva.dia}</td>
							<td>${reserva.mes}</td>
						</tr>
					</c:forEach>
				</tbody>	
			</table>
		</div>
	</div>
	
	<c:if test = "${user.tipoUser > 0}">
         <c:import url="/imports/rodape.jsp" />
    </c:if>
    
    <c:if test = "${user.tipoUser < 1}">
         <c:import url="/imports/rodape_adm.jsp" />
    </c:if>
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>