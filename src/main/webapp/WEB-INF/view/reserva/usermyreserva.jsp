<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Minhas de Reservas</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="css/bootstrap-united.min.css">
	<link rel="stylesheet" href="css/estilosalas.css">
</head>
<body>
	<c:if test = "${user.tipoUser > 0}">
         <c:import url="/imports/cabecalho.jsp" />
    </c:if>
    
    <c:if test = "${user.tipoUser < 1}">
         <c:import url="/imports/cabecalho_adm.jsp" />
    </c:if>
	
	<div class="container">
		<h1>
			Minhas Reservas <small> Remova, Atualiza e Liste as Suas Reservas</small>
		</h1>
	</div>

	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>Lista de Minhas Reservas Cadastradas</h3>
			</div>

			<form action="showallmyreservas" method="get">
				<button type="submit" class="btn btn-primary btn-md">Listar	Reservas Cadastradas</button>
			</form>

			<table class="table">
				<thead>
					<tr>
						<th>ID da Reserva</th>
<!-- 						<th>Matrícula do Usuário</th> -->
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
							<td>${reserva.sala.id}</td>
							<td>${reserva.descricao}</td>
							<td>${reserva.horario}</td>
							<td>${reserva.dia}</td>
							<td>${reserva.mes}</td>
							<td>
								<button type="button" class="btn btn-danger btn-md" data-toggle="modal" data-target="#${reserva.id}delete" ><span class="glyphicon glyphicon-trash"></button>
								
								<div class="modal fade" id="${reserva.id}delete" role="dialog">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<div class="modal-body">
								            	<h3> Deseja realmente excluir essa Sala?</h3>
								      		</div>
										    <div class="modal-footer">
											    <a href="deletereserva/${reserva.id}" class="btn btn-danger btn-md">Apagar Reserva</a>
											    <button type="button" data-dismiss="modal" class="btn btn-default">Cancelar</button>
										    </div>
								    	</div>
									</div>
								</div>
							</td>
							<td>
								<button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#${reserva.id}"><span class="glyphicon glyphicon-pencil"></span></button>
								<div class="modal fade" id="${reserva.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">Atualizar Reserva</h4>
											</div>
											<form action="updatereserva" method="post">
												<div class="modal-body">
													<fieldset>
													<legend>Informações da Reserva</legend>
														<div class="form-group">
															<label>ID da Reserva </label>
															<input type="hidden" name="id" id="id" value="${reserva.id}">
															<input type="text" class="form-control" id="id" name="id" value="${reserva.id}" disabled="disabled">
														</div>
														<div class="form-group">
															<label>ID da Sala </label>
															<input type="hidden" name="idSala" id="idSala" value="${reserva.sala.id}">
															<input type="text" class="form-control" id="idSala" name="idSala" value="${reserva.sala.id}" disabled="disabled">
														</div>
														<div class="form-group">
															<label>Descrição Geral sobre a Reserva </label>
															<input type="text" class="form-control" id="descricao" name="descricao" value="${reserva.descricao}" autofocus>
														</div>
														<div class="form-group">
															<label>Horário (A,B,C,D,E,F) </label>
															<input type="text" class="form-control" id="horario" name="horario" value="${reserva.horario}">
														</div>
														<div class="form-group">
															<label>Dia do mês </label>
															<input type="text" class="form-control" id="dia" name="dia" value="${reserva.dia}">
														</div>
														<div class="form-group">
															<label>Mês desse ano </label>
															<input type="text" class="form-control" id="mes" name="mes" value="${reserva.mes}">
														</div>
													</fieldset>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove-sign"></span></button>
													<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok-sign"></span></button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</td>
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
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>