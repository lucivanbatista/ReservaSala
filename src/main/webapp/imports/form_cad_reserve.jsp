<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form action="criarreserva" method="post">
	<div class="modal-body">
		<fieldset>
			<legend>Informa��es da Reserva</legend>
<!-- 									<div class="form-group"> -->
<!-- 										<label>N�mero da Matr�cula do Usu�rio </label> -->
<!-- 										<input type="text" class="form-control" id="matriculaUser" name="matriculaUser" placeholder="Digite a matr�cula do usu�rio" autofocus> -->
<!-- 									</div> -->
			<div class="form-group">
				<label>ID da Sala </label>
				<input type="text" class="form-control" id="idSala" name="idSala"	placeholder="Digite o id da sala">
			</div>
			<div class="form-group">
				<label>Descri��o Geral sobre a Reserva </label>
				<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Digite uma descri��o sobre a reserva">
			</div>
			<div class="form-group">
				<label>Digite o Hor�rio Desejado (A,B,C,D,E,F) </label>
				<input type="text" class="form-control" id="horario" name="horario" placeholder="Digite o hor�rio desejado">
			</div>
			<div class="form-group">
				<label>Digite o dia do m�s </label>
				<input type="text" class="form-control" id="dia" name="dia" placeholder="Digite o dia">
			</div>
			<div class="form-group">
				<label>Digite o m�s desse ano </label>
				<input type="text" class="form-control" id="mes" name="mes" placeholder="Digite o m�s">
			</div>
		</fieldset>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
		<button type="submit" class="btn btn-success">Confirmar Reserva</button>
	</div>
</form:form>