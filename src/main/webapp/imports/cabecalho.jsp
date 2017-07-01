
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-header">
		<a href="#" class="navbar-brand">Sistema de Reservas de Salas</a>
		<button class="navbar-toggle" type="button" data-target=".navbar-collapse" data-toggle="collapse"></button>
	</div>

	<ul class="nav navbar-nav collapse navbar-collapse">
	<!-- 		<li><a href="managersalas" class="btn btn-basic">Gerenciamento de Salas <span class="glyphicon glyphicon-modal-window"></span></a></li> -->
			<li><a href="usersala" class="btn btn-basic">Visualizar Salas</a></li>
			<li><a href="usermyreserva" class="btn btn-basic">Visualizar Minhas Reservas</a></li>
			<li><a href="updateuser" class="btn btn-basic">Atualizar Cadastro<span class="glyphicon glyphicon-pencil"></span></a></li>
			<li><a href="????????????" class="btn btn-basic">Sobre <span class="glyphicon glyphicon-barcode"></span></a></li>
		
	</ul>
	
	<ul class="nav navbar-nav collapse navbar-collapse pull-right">
		<li><a href="indexuser" class="btn btn-basic">${user.nome} <span class="glyphicon glyphicon-user"></span></a>
		<li><a href="logout" class="btn btn-basic">Logout <span class="glyphicon glyphicon-log-out"></span></a></li>
	</ul>
</div>

<div class="page-header">
	<div class="container">
		<div id="logo_geral">
			<a href="user/indexuser"><img src="<c:url value="/img/logo.png"/>" /></a>
		</div>
	</div>
</div>