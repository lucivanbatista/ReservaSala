<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-inverse navbar-fixed-top barratop">
	<div class="navbar-header">
		<a href="/indexuser" class="navbar-brand">Sistema de Reservas de Salas</a>
		<button class="navbar-toggle" type="button" data-target=".navbar-collapse" data-toggle="collapse"></button>
	</div>

	<ul class="nav navbar-nav collapse navbar-collapse">
		<li><a href="/managersalas" class="btn btn-basic"><span class="glyphicon glyphicon-modal-window"> </span> Gerenciamento de Salas </a></li>
		<li><a href="/managerreservas" class="btn btn-basic"><span class="glyphicon glyphicon-modal-window"> </span> Gerenciamento de Reservas</a></li>
		<li><a href="/sobre" class="btn btn-basic"><span class="glyphicon glyphicon-barcode"> </span> Sobre</a></li>
	</ul>
	
	<ul class="nav navbar-nav navbar-right buttondrop">
		<li class="dropdown"><a id="btn-perfil"	class="dropdown-toggle btn btn-basic" data-toggle="dropdown" href="#">${user.nome}<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/updateuser" class="btn btn-basic">Atualizar Cadastro <span class="glyphicon glyphicon-pencil"></span></a></li>
				<li><a href="/logout" class="btn btn-basic">Logout <span class="glyphicon glyphicon-log-out"></span></a></li>
			</ul>
		</li>
	</ul>
</div>

