<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Gerenciador de Salas</title>
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
			Gerenciador de Salas <small> Adicione, Remova, Atualiza e Liste as Salas - Função Administrador</small>
		</h1>
	</div>

	<div class="container">
		<fieldset class="field_cadastrar">
			<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#addmodal">Adicionar Sala</button>
			<div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Adicionar Sala</h4>
						</div>
						<c:import url="/imports/form_cad_sala.jsp" /> <%--importando da pasta imports o cadastrar salas --%>
					</div>
				</div>
			</div>
		</fieldset>
	</div>
	
<!-- 	---------------VALIDAÇÃO SERÁ COLOCADA ACIMA------------------- -->
<%-- 	<form:form action="criarsalas" method="post" modelAttribute="sala"> --%>
<!-- 							<div class="modal-body"> -->
<!-- 								<fieldset> -->
<!-- 								<legend>Informações da Sala</legend> -->
<%-- 									<form:input path="id" type="hidden"  />									 --%>
<!-- 									<spring:bind path="nPorta"> -->
<%-- 										<div class="form-group ${status.error ? 'has-error' : ''}"> --%>
<%-- 											<form:label path="nPorta">Número da Porta da Sala </form:label> --%>
<%-- 											<form:input path="nPorta" type="text" cssClass="form-control" /> --%>
<%-- 											<form:errors path="nPorta" /> --%>
<!-- 										</div> -->
<!-- 									</spring:bind> -->

<!-- 									<spring:bind path="bloco"> -->
<%-- 									<div class="form-group ${status.error ? 'has-error' : ''}"> --%>
<%-- 											<form:label path="bloco">Bloco de onde a Sala está localizada </form:label> --%>
<%-- 											<form:input path="bloco" type="text" cssClass="form-control" /> --%>
<%-- 											<form:errors path="bloco" /> --%>
<!-- 										</div> -->
<!-- 									</spring:bind> -->
									
<!-- 									<spring:bind path="descricao"> -->
<%-- 										<div class="form-group ${status.error ? 'has-error' : ''}"> --%>
<%-- 											<form:label path="descricao">Descrição Geral sobre a Sala </form:label> --%>
<%-- 											<form:input path="descricao" type="text" cssClass="form-control" /> --%>
<%-- 											<form:errors path="descricao" /> --%>
<!-- 										</div> -->
<!-- 									</spring:bind> -->
<!-- 								</fieldset> -->
<!-- 							</div> -->
<!-- 							<div class="modal-footer"> -->
<!-- 								<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button> -->
<!-- 								<button type="submit" class="btn btn-success">Confirmar</button> -->
<!-- 							</div> -->
<%-- 						</form:form> --%>

	<div class="container">
		<div class="panel panel-default">
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
					<button type="submit" class="btn btn-primary btn-md">Listar	Todas as Salas Cadastradas</button>
				</form>
			</fieldset>
		</div>
	</div>
	
	<div class="container">
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
															<label>Digite o Horário Desejado (A,B,C,D,E,F) </label>
															<input type="text" class="form-control" id="horariofiltro" name="horariofiltro" placeholder="Digite o horário desejado">
														</div>
														<div class="form-group">
															<label>Digite o dia do mês </label>
															<input type="text" class="form-control" id="diafiltro" name="diafiltro" placeholder="Digite o dia">
														</div>
														<div class="form-group">
															<label>Digite o mês desse ano </label>
															<input type="text" class="form-control" id="mesfiltro" name="mesfiltro" placeholder="Digite o mês">
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
								<button type="button" class="btn btn-danger btn-md" data-toggle="modal" data-target="#${sala.id}delete" ><span class="glyphicon glyphicon-trash"></button>
								
								<div class="modal fade" id="${sala.id}delete" role="dialog">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<div class="modal-body">
								            	<h3> Deseja realmente excluir essa Sala?</h3>
								      		</div>
										    <div class="modal-footer">
											    <a href="deletarsalas/${sala.id}" class="btn btn-danger btn-md">Apagar Sala</a>
											    <button type="button" data-dismiss="modal" class="btn btn-default">Cancelar</button>
										    </div>
								    	</div>
									</div>
								</div>
								
							</td>
							<td>
								<button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#${sala.id}"><span class="glyphicon glyphicon-pencil"></span></button>
								<div class="modal fade" id="${sala.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">Atualizar Sala</h4>
											</div>
											<form:form action="atualizarsalas" method="post">
												<div class="modal-body">
													<fieldset>
													<legend>Informações da Sala</legend>
														<div class="form-group">
															<label>ID da Sala </label>
															<input type="hidden" name="id" id="id" value="${sala.id}">
															<input type="text" class="form-control" id="id" name="id" value="${sala.id}" disabled="disabled">
														</div>
														<div class="form-group">
															<label>Número da Porta da Sala </label>
															<input type="text" class="form-control" id="nPorta" name="nPorta" value="${sala.nPorta}" autofocus>
														</div>
														<div class="form-group">
															<label>Bloco de onde a Sala está localizada </label>
															<input type="text" class="form-control" id="bloco" name="bloco" value="${sala.bloco}">
														</div>
														<div class="form-group">
															<label>Descrição Geral sobre a Sala </label>
															<input type="text" class="form-control" id="descricao" name="descricao" value="${sala.descricao}">
														</div>
													</fieldset>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove-sign"></span></button>
													<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok-sign"></span></button>
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</td>
							
							<td>
								<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#addreservemodal"><span class="glyphicon glyphicon-plus"></span></button>
								<div class="modal fade" id="addreservemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
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
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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