<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Gerenciador de Reservas</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="css/bootstrap-united.min.css">
	<link rel="stylesheet" href="css/estilosalas.css">
</head>
<body>
	<c:import url="/imports/cabecalho_adm.jsp" />
	
	<div class="container">
		<h1>
			Gerenciador de Reservas <small> Adicione, Remova, Atualiza e Liste as Reservas - Função Administrador</small>
		</h1>
	</div>

	<div class="container">
		<fieldset class="field_cadastrar">
			<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#addmodal">Adicionar Reserva</button>
			<div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Adicionar Reservas</h4>
						</div>
						<form action="criarreserva" method="post">
							<div class="modal-body">
								<fieldset>
								<legend>Informações da Reserva</legend>
<!-- 									<div class="form-group"> -->
<!-- 										<label>Número da Matrícula do Usuário </label> -->
<!-- 										<input type="text" class="form-control" id="matriculaUser" name="matriculaUser" placeholder="Digite a matrícula do usuário" autofocus> -->
<!-- 									</div> -->
									<div class="form-group">
										<label>ID da Sala </label>
										<input type="text" class="form-control" id="idSala" name="idSala"	placeholder="Digite o id da sala">
									</div>
									<div class="form-group">
										<label>Descrição Geral sobre a Reserva </label>
										<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Digite uma descrição sobre a reserva">
									</div>
									<div class="form-group">
										<label>Digite o Horário Desejado (A,B,C,D,E,F) </label>
										<input type="text" class="form-control" id="horario" name="horario" placeholder="Digite o horário desejado">
									</div>
									<div class="form-group">
										<label>Digite o dia do mês </label>
										<input type="text" class="form-control" id="dia" name="dia" placeholder="Digite o dia">
									</div>
									<div class="form-group">
										<label>Digite o mês desse ano </label>
										<input type="text" class="form-control" id="mes" name="mes" placeholder="Digite o mês">
									</div>
								</fieldset>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
								<button type="submit" class="btn btn-success">Confirmar Reserva</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</fieldset>
	</div>

	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>Lista de Reservas Cadastradas</h3>
			</div>

			<form action="showallreservas" method="get">
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
<%-- 							<td>${reserva.user.matricula}</td> --%>
							<td>${reserva.sala.id}</td>
							<td>${reserva.descricao}</td>
							<td>${reserva.horario}</td>
							<td>${reserva.dia}</td>
							<td>${reserva.mes}</td>
							<td>
								<form action="deletereserva" method="post">
									<input type="hidden" name="idremove" id="idremove" value="${reserva.id}">
									<button type="submit" class="btn btn-danger btn-md"><span class="glyphicon glyphicon-trash"></span></button>
								</form>
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
<!-- 														<div class="form-group"> -->
<!-- 															<label>Número da Matrícula do Usuário </label> -->
<%-- 															<input type="text" class="form-control" id="matriculaUser" name="matriculaUser" value="${reserva.matriculaUser}" autofocus> --%>
<!-- 														</div> -->
														<div class="form-group">
															<label>ID da Sala </label>
															<input type="text" class="form-control" id="idSala" name="idSala" value="${reserva.sala.id}" autofocus>
														</div>
														<div class="form-group">
															<label>Descrição Geral sobre a Reserva </label>
															<input type="text" class="form-control" id="descricao" name="descricao" value="${reserva.descricao}">
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
	
	<c:import url="/imports/rodape_adm.jsp" />
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>