<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema de Reservas de Salas - Gerenciador de Salas</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="css/bootstrap-united.min.css">
	<link rel="stylesheet" href="css/estilosalas.css">
</head>
<body>
	
	<div class="container intro">
		<h1>
			Cadastro <small> Consiga acesso ao sistema para conseguir visualizar e reservar as salas</small>
		</h1>
	</div>

	<div class="container">
		<fieldset class="field_cadastrar field_cadastraruser">
			<form action="cadastrouser" method="post" id="formusercad">
				<div class="form-group row">
					<label class="col-form-label col-form-label-sm">Matrícula do Usuário</label>
					<input type="text" class="form-control" id="matricula" name="matricula" placeholder="Digite sua matrícula institucional" autofocus>
				</div>
				<div class="form-group row">
					<label class="col-form-label col-form-label-sm">Nome do Usuário</label>
					<input type="text" class="form-control" id="nome" name="nome"	placeholder="Digite o seu nome" required>
				</div>
				<div class="form-group row">
					<label class="col-form-label col-form-label-sm">Email de Usuário</label>
					<input type="email" class="form-control" id="email" name="email" placeholder="Digite o seu email">
				</div>
				<div class="form-group row">
					<label class="col-form-label col-form-label-sm">Senha para Logar</label>
					<input type="password" class="form-control" id="senha" name="senha" placeholder="Digite a sua senha">
				</div>
				<div class="form-group row">
					<label class="col-form-label col-form-label-sm">Confirmar Senha</label>
					<input type="password" class="form-control" id="confsenha" name="confsenha" placeholder="Digite a sua senha novamente">
				</div>
				<div class="form-group row">
					<label class="col-form-label col-form-label-sm">Selecione o tipo de Usuário</label>
					<select id="tipoUser" name="tipoUser">
						<option value="1">Aluno</option>
						<option value="2">Professor</option>
					</select>
				</div>
				<button type="button" class="btn btn-primary btn-md" id="buttoncadastraruser">Cadastrar no Sistema</button>
			</form>
		</fieldset>
	</div>	
	
	<script src="js/validacao.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>