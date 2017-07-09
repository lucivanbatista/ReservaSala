package springboot01.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity(name="reservas")
public class Reserva {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	private Usuario user;
	
	@ManyToOne
	private Sala sala;
	
	@NotNull
	@Size(min = 10, max = 200, message = "O tamanho deve ser entre {min} e {max}")
	private String descricao;
	
	@NotNull
//	@Pattern(regexp = "([A-F])+", message="Padrao inexperado, somente letras maiusculas")
	private String horario;

	@NotNull
//	@Pattern(regexp = "([0-9])+", message="Padrao inexperado, somente numeros")
	private int dia;
	
	@NotNull
//	@Pattern(regexp = "([0-9])+", message="Padrao inexperado, somente numeros")
	private int mes;
	
//		public Reserva(int id, Usuario user, Sala sala, String descricao, char horario, int dia, int mes) {
//		this.id = id;
//		this.user = user;
//		this.sala = sala;
//		this.descricao = descricao;
//		this.horario = horario;
//		this.dia = dia;
//		this.mes = mes;
//	}

	
	public Reserva(){
		
	}

	public Reserva(int id, Usuario user, Sala sala, String descricao, String horario, int dia, int mes) {
	this.id = id;
	this.user = user;
	this.sala = sala;
	this.descricao = descricao;
	this.horario = horario;
	this.dia = dia;
	this.mes = mes;
}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getHorario() {
		return horario;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public int getDia() {
		return dia;
	}

	public void setDia(int dia) {
		this.dia = dia;
	}

	public int getMes() {
		return mes;
	}

	public void setMes(int mes) {
		this.mes = mes;
	}

	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}

	public Sala getSala() {
		return sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}	
}
