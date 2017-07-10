<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema de Reservas de Salas - Gerenciador de Reservas</title>
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
			Gerenciador de Reservas <small> Adicione, Remova, Atualiza e Liste as Reservas - Função Administrador</small>
		</h1>
	</div>
	
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>Lista de Reservas Cadastradas</h3>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-5">
					<form action="showallmyreservas" method="get">
						<button type="submit" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-search"> </span> Listar	Minhas Reservas Cadastradas</button>
					</form>
				</div>
				<div class="col-md-5">
					<form action="showallreservas" method="get">
						<button type="submit" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-search"> </span> Listar	TODAS as Reservas Cadastradas</button>
					</form>
				</div>
			</div>
			<br>
			
			

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
							<td>								
								<button type="button" class="btn btn-danger btn-md" data-toggle="modal" data-target="#${reserva.id}delete" ><span class="glyphicon glyphicon-trash"></button>
								
								<div class="modal fade" id="${reserva.id}delete" role="dialog">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<div class="modal-body">
								            	<h3> Deseja realmente excluir essa Reserva?</h3>
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
															<label>Número da Matrícula do Usuário </label>
															<input type="text" class="form-control" id="matriculaUser" name="matriculaUser" value="${reserva.user.matricula}" disabled="disabled">
														</div>
														<div class="form-group">
															<label>ID da Sala </label>
															<input type="hidden" class="form-control" id="idSala" name="idSala" value="${reserva.sala.id}">
															<input type="text" class="form-control" id="ids" name="ids" value="${reserva.sala.id}" disabled="disabled">
														</div>
														<div class="form-group">
															<label>Descrição Geral sobre a Reserva </label>
															<input type="text" class="form-control" id="descricao" name="descricao" value="${reserva.descricao}" autofocus>
														</div>
														<div class="row">
															<div class="col-md-4">
																<div class="form-group">
																	<label>Horário Atual </label>
																	<input type="text" class="form-control" id="horario" name="horario" value="${reserva.horario}" disabled="disabled">
																</div>
																
																<div class="form-group">
																	<label>Selecione o Horário </label><br>
																	<select id="horarior" name="horarior">
																		<option value="A">A (08:00 - 10:00)</option>
																		<option value="B">B (10:00 - 12:00)</option>
																		<option value="C">C (13:30 - 15:30)</option>
																		<option value="D">D (15:30 - 17:30)</option>
																		<option value="E">E (18:00 - 20:00)</option>
																		<option value="F">F (20:00 - 22:00)</option>
																	</select>
																</div>
															</div>
															
															<div class="col-md-4">
																<div class="form-group">
																	<label>Dia do mês Atual </label>
																	<input type="text" class="form-control" id="dia" name="dia" value="${reserva.dia}" disabled="disabled">
																</div>
																
																<div class="form-group">
																	<label>Selecione o dia do mês </label><br>
																	<select id="diar" name="diar">
																		<option value="1">1</option>
																		<option value="2">2</option>
																		<option value="3">3</option>
																		<option value="4">4</option>
																		<option value="5">5</option>
																		<option value="6">6</option>
																		<option value="7">7</option>
																		<option value="8">8</option>
																		<option value="9">9</option>
																		<option value="10">10</option>
																		<option value="11">11</option>
																		<option value="12">12</option>
																		<option value="13">13</option>
																		<option value="14">14</option>
																		<option value="15">15</option>
																		<option value="16">16</option>
																		<option value="17">17</option>
																		<option value="18">18</option>
																		<option value="19">19</option>
																		<option value="20">20</option>
																		<option value="21">21</option>
																		<option value="22">22</option>
																		<option value="23">23</option>
																		<option value="24">24</option>
																		<option value="25">25</option>
																		<option value="26">26</option>
																		<option value="27">27</option>
																		<option value="28">28</option>
																		<option value="29">29</option>
																		<option value="30">30</option>
																		<option value="31">31</option>
																	</select>
																</div>
															</div>
															
															<div class="col-md-4">
																<div class="form-group">
																	<label>Mês desse ano Atual</label>
																	<input type="text" class="form-control" id="mes" name="mes" value="${reserva.mes}" disabled="disabled">
																</div>
																
																<div class="form-group">
																	<label>Selecione o mês </label><br>
																	<select id="mesr" name="mesr">
																		<option value="1">Janeiro</option>
																		<option value="2">Fevereiro</option>
																		<option value="3">Março</option>
																		<option value="4">Abril</option>
																		<option value="5">Maio</option>
																		<option value="6">Junho</option>
																		<option value="7">Julho</option>
																		<option value="8">Agosto</option>
																		<option value="9">Setembro</option>
																		<option value="10">Outubro</option>
																		<option value="11">Novembro</option>
																		<option value="12">Dezembro</option>
																	</select>
																</div>
															</div>
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
         <c:import url="../imports/rodape.jsp" />
    </c:if>
    
    <c:if test = "${user.tipoUser < 1}">
         <c:import url="../imports/rodape_adm.jsp" />
    </c:if>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>