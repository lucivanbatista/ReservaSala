<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<div class="container">
		<h1>
			Cadastro <small> Consiga acesso ao sistema para conseguir visualizar e reservar as salas</small>
		</h1>
	</div>

	<div class="container">
		<fieldset class="field_cadastrar">
			<legend>Cadastro de Salas</legend>
			<form action="cadastrouser" method="post">
				<div class="form-group row">
					<label class="col-sm-2 col-form-label col-form-label-sm">Matrícula do Usuário</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="matricula" name="matricula" placeholder="Digite sua matrícula institucional"	autofocus>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label col-form-label-sm">Nome do Usuário</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nome" name="nome"	placeholder="Digite o seu nome">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label col-form-label-sm">Email de Usuário</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="email" name="email" placeholder="Digite o seu email">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label col-form-label-sm">Senha para Logar</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="senha" name="senha" placeholder="Digite a sua senha">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label col-form-label-sm">Selecione o tipo de Usuário</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="tipoUser" name="tipoUser" placeholder="Digite 1 para Aluno e 2 para Professor" >
					</div>
				</div>
				<button type="submit" class="btn btn-primary btn-md">Cadastrar no Sistema</button>
			</form>
		</fieldset>
	</div>	
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>