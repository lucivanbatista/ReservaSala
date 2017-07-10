<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-header">
		<a href="/indexuser" class="navbar-brand">Sistema de Reservas de Salas</a>
		<button class="navbar-toggle" type="button" data-target=".navbar-collapse" data-toggle="collapse"></button>
	</div>

	<ul class="nav navbar-nav collapse navbar-collapse">
			<li><a href="/usersala" class="btn btn-basic"><span class="glyphicon glyphicon-search"> </span> Visualizar Salas</a></li>
			<li><a href="/usermyreserva" class="btn btn-basic"><span class="glyphicon glyphicon-search"> </span> Visualizar Minhas Reservas</a></li>
			<li><a href="/updateuser" class="btn btn-basic"><span class="glyphicon glyphicon-pencil"> </span> Atualizar Cadastro</a></li>
			<li><a href="/sobre" class="btn btn-basic"><span class="glyphicon glyphicon-barcode"> </span> Sobre </a></li>
	</ul>
	
	<ul class="nav navbar-nav collapse navbar-collapse pull-right">
		<li><a href="/indexuser" class="btn btn-basic">${user.nome} <span class="glyphicon glyphicon-user"></span></a>
		<li><a href="/logout" class="btn btn-basic">Logout <span class="glyphicon glyphicon-log-out"></span></a></li>
	</ul>
</div>

