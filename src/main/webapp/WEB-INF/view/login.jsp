<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema de Reservas de Salas - Login</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="css/bootstrap-united.min.css">
	<link rel="stylesheet" href="css/estilosalas.css">
</head>
<body>
	
	<div class="container">
		<h1>
			Sistema de Reservas de Salas <small> Reserve uma sala para você com facilidade!</small>
		</h1>
	</div>

	<div class="container">
		<fieldset class="field_login">
			<form action="logar" method="post">
				Email do Usuário: <input type="text" name="user" id="user">
				Senha do Usuário: <input type="password" name="senha" id="senha">
				<button type="submit" class="btn btn-success btn-md" id="login">Login</button>
			</form>
		</fieldset>
	</div>
	
	<div class="container">
		<p> Não é cadastrado? Se cadastre agora: </p><a href="/cadastro">Cadastrar Aqui</a>
	</div>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>