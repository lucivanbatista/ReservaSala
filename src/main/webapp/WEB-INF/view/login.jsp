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
	<link rel="stylesheet" href="css/estilologin.css">
	
</head>
<body>
	
	<div class="container">
		<h1>
			Sistema de Reservas de Salas <small> Reserve uma sala para você com facilidade!</small>
		</h1>
	</div>

	<div class="container">
  
		<div class="row" id="pwd-container">
		    <div class="col-md-4"></div>
		    
		    <div class="col-md-4">
		    	<div class="login-form">
		        	<form method="post" action="logar" role="login">
		        		<img src="<c:url value="/img/logo.png"/>" class="img-responsive" />
		        		<input type="email" name="user" id="user" placeholder="Email" required class="form-control input-lg" />
				        <input type="password" class="form-control input-lg" id="senha" name="senha" placeholder="Password" required="" />
				        <button type="submit" id="login" class="btn btn-lg btn-primary btn-block">Login</button>
				        <div>
				        	<a href="/cadastro">Criar uma Conta</a>
				        </div>
				    </form>
				</div>  
			</div>
		      
		   	<div class="col-md-4"></div>
		</div>
	</div>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>