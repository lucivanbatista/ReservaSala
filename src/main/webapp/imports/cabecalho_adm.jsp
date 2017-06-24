
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-header">
		<a href="#" class="navbar-brand">Sistema de Reservas de Salas</a>
		<button class="navbar-toggle" type="button" data-target=".navbar-collapse" data-toggle="collapse"></button>
	</div>

	<ul class="nav navbar-nav collapse navbar-collapse">
		<li><a href="managersalas" class="btn btn-basic">Gerenciamento de Salas <span class="glyphicon glyphicon-modal-window"></span></a></li>
		<li><a href="managerreservas" class="btn btn-basic">Gerenciamento de Reservas <span class="glyphicon glyphicon-modal-window"></span></a></li>
		<li><a href="????????????" class="btn btn-basic">Sobre <span class="glyphicon glyphicon-barcode"></span></a></li>
		<li><a href="logout" class="btn btn-basic">Logout <span class="glyphicon glyphicon-barcode"></span></a></li>
	</ul>
</div>

<div class="page-header">
	<div class="container">
		<div id="logo_geral">
			<a href="???????????"><img src="<c:url value="/img/logo.png"/>" /></a>
		</div>
	</div>
</div>