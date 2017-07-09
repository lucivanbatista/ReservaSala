<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema de Reservas de Salas - Visualizador de Salas</title>
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
	
	<div class="container intro">
		<h1>
			Visualizador de Salas <small> Liste as Salas e Faça Reservas</small>
		</h1>
	</div>

	<div class="container">
		<div class="panel panel-default box">
			<div class="panel-body">
				<h2>Filtros de Pesquisa para Salas</h2>
			</div>
			
			
			<fieldset>
				<form action="showsalasby" method="get">
					<div class="form-group">
						<label>Número da Porta da Sala </label> <input type="text" class="form-control" id="nPortafiltro" name="nPortafiltro" placeholder="Digite a porta" autofocus>
					</div>
					<div class="form-group">
						<label>Bloco de onde a Sala está localizada </label> <input type="text" class="form-control" id="blocofiltro" name="blocofiltro" placeholder="Digite o bloco">
					</div>
					<button type="submit" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-search"> </span> Listar	Todas as Salas Cadastradas</button>
				</form>
			</fieldset>
		</div>
	</div>
			
<!-- 			<fieldset> -->
<%-- 				<form action="showsalas" method="get"> --%>
<!-- 					<button type="submit" class="btn btn-primary btn-md">Listar	Todas as Salas Cadastradas</button> -->
<%-- 				</form> --%>
<!-- 			</fieldset> -->

	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>Lista de Salas Cadastradas</h3>
			</div>
			
			<table class="table">
				<thead>
					<tr>
						<th>ID da Sala</th>
						<th>Número da Porta da Sala</th>
						<th>Bloco da Sala</th>
						<th>Descrição Geral da Sala</th>
						<th></th>
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
							<td>			
								<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#${sala.id}salamodal"><span class="glyphicon glyphicon-list-alt"></span></button>
								<div class="modal fade" id="${sala.id}salamodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">Reservas dessa Sala</h4>
											</div>
											<form action="visualizarreservassalas" method="get">
												<div class="modal-body">
													<fieldset>
														<input type="hidden" name="idsalafiltro" id="idsalafiltro" value="${sala.id}">
														<div class="form-group">
															<label>Selecione o Horário Desejado </label><br>
															<select id="horariofiltro" name="horariofiltro">
																<option value="">Todos</option>
																<option value="A">A (08:00 - 10:00)</option>
																<option value="B">B (10:00 - 12:00)</option>
																<option value="C">C (13:30 - 15:30)</option>
																<option value="D">D (15:30 - 17:30)</option>
																<option value="E">E (18:00 - 20:00)</option>
																<option value="F">F (20:00 - 22:00)</option>
															</select>
														</div>
														<div class="form-group">
															<label>Selecione o dia do mês </label><br>
															<select id="diafiltro" name="diafiltro">
																<option value="">Todos</optin>
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
														<div class="form-group">
															<label>Selecione o mês </label><br>
															<select id="mesfiltro" name="mesfiltro">
																<option value="">Todos</optin>
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
							
							<td>
								<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#${sala.id}addreservemodal"><span class="glyphicon glyphicon-plus"></span></button>
								<div class="modal fade" id="${sala.id}addreservemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
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
															<label>Selecione o Horário Desejado </label><br>
															<select id="horarior" name="horarior">
																<option value="A">A (08:00 - 10:00)</option>
																<option value="B">B (10:00 - 12:00)</option>
																<option value="C">C (13:30 - 15:30)</option>
																<option value="D">D (15:30 - 17:30)</option>
																<option value="E">E (18:00 - 20:00)</option>
																<option value="F">F (20:00 - 22:00)</option>
															</select>
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