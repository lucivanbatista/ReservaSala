<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form action="criarsalas" method="post">
	<div class="modal-body">
		<fieldset>
			<legend>Informações da Sala</legend>

			<div class="form-group">
				<label>Número da Porta da Sala </label> <input type="text"
					class="form-control" id="nPorta" name="nPorta"
					placeholder="Digite o número da porta" autofocus required>
			</div>
			<div class="form-group">
				<label>Bloco de onde a Sala está localizada </label> <input
					type="text" class="form-control" id="bloco" name="bloco"
					placeholder="Digite o bloco desta sala" required>
			</div>
			<div class="form-group">
				<label>Descrição Geral sobre a Sala </label> <input type="text"
					class="form-control" id="descricao" name="descricao"
					placeholder="Digite uma descrição sobre a sala" required>
			</div>
		</fieldset>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
		<button type="submit" class="btn btn-success">Confirmar</button>
	</div>
</form:form>