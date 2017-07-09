<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form action="criarreserva" method="post">
	<div class="modal-body">
		<fieldset>
			<legend>Informações da Reserva</legend>
			<div class="form-group">
				<label>ID da Sala </label> <input type="text" class="form-control" id="idSala" name="idSala" placeholder="Digite o id da sala">
			</div>
			<div class="form-group">
				<label>Descrição Geral sobre a Reserva </label> <input type="text" class="form-control" id="descricao" name="descricao" placeholder="Digite uma descrição sobre a reserva">
			</div>
			<div class="form-group">
				<label>Selecione o Horário Desejado </label><br>
				<select id="horarior" name="horarior">
					<option value="A">A (08:00 - 10:00)</option>
					<option value="B">B (10:00 - 12:00)</option>
					<option value="C">C (13:30 - 15:30)</option>
					<option value="D">D (15:30 - 17:30)</option>
					<option value="E">E (18:00 - 20:00)</option>
					<option value="F">F (20:00 - 22:00)</option>
				</select>
			</div>
			<div class="form-group">
				<label>Selecione o dia do mês </label><br>
				<select id="diar" name="diar">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>
			</div>
			<div class="form-group">
				<label>Selecione o mês </label><br>
				<select id="mesr" name="mesr">
					<option value="1">Janeiro</option>
					<option value="2">Fevereiro</option>
					<option value="3">Março</option>
					<option value="4">Abril</option>
					<option value="5">Maio</option>
					<option value="6">Junho</option>
					<option value="7">Julho</option>
					<option value="8">Agosto</option>
					<option value="9">Setembro</option>
					<option value="10">Outubro</option>
					<option value="11">Novembro</option>
					<option value="12">Dezembro</option>
				</select>
			</div>
		</fieldset>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
		<button type="submit" class="btn btn-success">Confirmar Reserva</button>
	</div>
</form:form>