<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sistema de Reservas de Salas - Atualizar Cadastro</title>
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
	
	<div class="container intro">
		<h1>
			Atualizar Cadastro <small> Atualize suas informações!</small>
		</h1>
	</div>
	
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>Atualizar Usuário</h3>
			</div>

			<fieldset class="field_cadastrar">
				<form action="atualizaruser" method="post" id="formuserup">
					<input type="hidden" name="matricula" id="matricula" value="${user.matricula}">
					<input type="hidden" name="tipoUser" id="tipoUser" value="${user.tipoUser}">
					<div class="form-group row">
						<label class="col-sm-2 col-form-label col-form-label-sm">Nome</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="nome" name="nome" value="${user.nome}" autofocus>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label col-form-label-sm">Email</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="email" name="email" value="${user.email}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label col-form-label-sm">Senha Antiga</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="senha" name="senha" value="${user.senha}">
						</div>
					</div>					
					
					<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#updateusermodal"><span class="glyphicon glyphicon-floppy-disk"> </span> Atualizar Informações</button>

					<div class="modal fade" id="updateusermodal" role="dialog">
						<div class="modal-dialog modal-md">
							<div class="modal-content">
								<div class="modal-body">
									<h3>Deseja realmente alterar suas informações?</h3>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-success">Confirmar Alterações</button>
									<button type="button" data-dismiss="modal" class="btn btn-default">Cancelar</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</fieldset>
		</div>
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