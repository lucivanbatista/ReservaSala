package springboot01.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

@Entity(name="usuarios")
public class Usuario {
	
	@Id
	@NotNull
	private int matricula;
	
	@NotNull
	@Size(min = 6, max = 150, message = "O tamanho deve ser entre {min} e {max}")
	private String nome;
	
	@Email
	@NotNull
	@Size(min = 10, max = 60, message = "O tamanho deve ser entre {min} e {max}")
	private String email;
	
	@NotNull
	@Size(min = 8, max = 40, message = "O tamanho deve ser entre {min} e {max}")
	private String senha;
	
	private int tipoUser;
	
//	@OneToMany
//	private List<Reserva> listaMyReservas;
	
	public Usuario(int matricula, String nome, String email, String senha, int tipoUser) {
		this.matricula = matricula;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.setTipoUser(tipoUser);
	}
	
	public Usuario(){
		
	}
	
//	public Usuario(int matricula, String nome, String email, int tipoUser) {
//		this.matricula = matricula;
//		this.nome = nome;
//		this.email = email;
//		this.setTipoUser(tipoUser);
//	}

	public int getMatricula() {
		return matricula;
	}

	public void setMatricula(int matricula) {
		this.matricula = matricula;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public int getTipoUser() {
		return tipoUser;
	}

	public void setTipoUser(int tipoUser) {
		this.tipoUser = tipoUser;
	}
}
