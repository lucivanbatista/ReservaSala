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
	<link rel="stylesheet" href="css/bootstrap-united.min.css">
	<link rel="stylesheet" href="css/estilosalas.css">
</head>
<body>
	<c:import url="/imports/cabecalho.jsp" />
	
	<div class="container">
		<h1>
			Visualizador de Salas <small> Liste as Salas e Faça Reservas</small>
		</h1>
	</div>

	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>Lista de Salas Cadastradas</h3>
			</div>

<!-- 			<div class="form-group"> -->
<!-- 				<label>Digite o Horário Desejado (A,B,C,D,E,F) </label> <input type="text" class="form-control" id="horario" name="horario"	placeholder="Digite o horário desejado"> -->
<!-- 			</div> -->
			
			<!-- 			<div class="form-group"> -->
<!-- 				<label>Digite o dia do mês </label> <input type="text" class="form-control" id="diafiltro" name="diafiltro" placeholder="Digite o dia"> -->
<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<!-- 				<label>Digite o mês desse ano </label> <input type="text" class="form-control" id="mesfiltro" name="mesfiltro" placeholder="Digite o mês"> -->
<!-- 			</div> -->]
			<fieldset>
				<form action="showsalasby" method="get">
					<h2>Filtros de Pesquisa para Salas</h2>
					<div class="form-group">
						<label>Número da Porta da Sala </label> <input type="text" class="form-control" id="nPortafiltro" name="nPortafiltro" placeholder="Digite a porta" autofocus>
					</div>
					<div class="form-group">
						<label>Bloco de onde a Sala está localizada </label> <input type="text" class="form-control" id="blocofiltro" name="blocofiltro" placeholder="Digite o bloco">
					</div>
					<button type="submit" class="btn btn-primary btn-md">Listar	Todas as Salas Cadastradas pelo Filtro acima</button>
				</form>
			</fieldset>
			
			<fieldset>
				<form action="showsalas" method="get">
					<button type="submit" class="btn btn-primary btn-md">Listar	Todas as Salas Cadastradas</button>
				</form>
			</fieldset>

			<table class="table">
				<thead>
					<tr>
						<th>ID da Sala</th>
						<th>Número da Porta da Sala</th>
						<th>Bloco da Sala</th>
						<th>Descrição Geral da Sala</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${salas}" var="sala">
						<tr>
							<td>${sala.id}</td>
							<td>${sala.nPorta}</td>
							<td>${sala.bloco}</td>
							<td>${sala.descricao}</td>
							<!-- Botão que irá redirecionar a sala para uma nova página, onde irá mostrar um campo com as informações 
							da sala e alguns filtros que serão Dia e Mês, onde irá mostrar todos os horários disponíveis e ocupados e 
							o que estará acontecendo nessa sala
							Próximo Passo: Cadastrar uma Reserva para essa sala (OK)
							Próximo Passo: Condições para não ser possível inserir uma reserva no horário já cadastrado (OK)
							Próximo Passo: Condições para não ser possível inserir uma sala já cadastrada (OK)
							Usuário Visualizar as reservas e horários disponíveis para cada Sala através de um Botão
							-->
							<td>
								<fieldset class="field_cadastrar">
									<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#vermodal"><span class="glyphicon glyphicon-plus"></span></button>
									<div class="modal fade" id="vermodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h4 class="modal-title" id="myModalLabel">Visualizar Reservas</h4>
												</div>
												<form action="visualizarreservaby" method="get">
													<div class="modal-body">
														<fieldset>
														<legend>Informações da Reserva</legend>
															<input type="hidden" name="idSala" id="idSala" value="${sala.id}">
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
								</fieldset>
							</td>
							
							<td>
								<fieldset class="field_cadastrar">
									<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#addmodal"><span class="glyphicon glyphicon-plus"></span></button>
									<div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h4 class="modal-title" id="myModalLabel">Adicionar Reserva</h4>
												</div>
												<form action="criarreserva" method="post">
													<div class="modal-body">
														<fieldset>
														<legend>Informações da Reserva</legend>
															<input type="hidden" name="idSala" id="idSala" value="${sala.id}">
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
														<button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove-sign"></span></button>
														<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok-sign"></span></button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</fieldset>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<c:import url="/imports/rodape.jsp" />
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>