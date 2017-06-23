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
	<c:import url="/imports/cabecalho_adm.jsp" />
	
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
						<form:form action="criarsalas" method="post">
							<div class="modal-body">
								<fieldset>
								<legend>Informações da Sala</legend>
									<div class="form-group">
										<label>Número da Porta da Sala </label>
										<input type="text" class="form-control" id="nPorta" name="nPorta" placeholder="Digite o número da porta" autofocus required>
									</div>
									<div class="form-group">
										<label>Bloco de onde a Sala está localizada </label>
										<input type="text" class="form-control" id="bloco" name="bloco"	placeholder="Digite o bloco desta sala" required>
									</div>
									<div class="form-group">
										<label>Descrição Geral sobre a Sala </label>
										<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Digite uma descrição sobre a sala" required>
									</div>
								</fieldset>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
								<button type="submit" class="btn btn-success">Confirmar</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</fieldset>
	</div>

	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>Lista de Salas Cadastradas</h3>
			</div>

			<form action="showsalas" method="get">
				<button type="submit" class="btn btn-primary btn-md">Listar	Salas Cadastradas</button>
			</form>

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
								<a href="deletarsalas/${sala.id}" class="btn btn-danger btn-md"><span class="glyphicon glyphicon-trash"></a>
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
											<form action="atualizarsalas" method="post">
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
															<label>Descrição Geral sober a Sala </label>
															<input type="text" class="form-control" id="descricao" name="descricao" value="${sala.descricao}">
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