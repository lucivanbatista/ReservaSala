<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form action="criarsalas" method="post">
	<div class="modal-body">
		<fieldset>
			<legend>Informa��es da Sala</legend>

			<div class="form-group">
				<label>N�mero da Porta da Sala </label> <input type="text"
					class="form-control" id="nPorta" name="nPorta"
					placeholder="Digite o n�mero da porta" autofocus required>
			</div>
			<div class="form-group">
				<label>Bloco de onde a Sala est� localizada </label> <input
					type="text" class="form-control" id="bloco" name="bloco"
					placeholder="Digite o bloco desta sala" required>
			</div>
			<div class="form-group">
				<label>Descri��o Geral sobre a Sala </label> <input type="text"
					class="form-control" id="descricao" name="descricao"
					placeholder="Digite uma descri��o sobre a sala" required>
			</div>
		</fieldset>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
		<button type="submit" class="btn btn-success">Confirmar</button>
	</div>
</form:form>