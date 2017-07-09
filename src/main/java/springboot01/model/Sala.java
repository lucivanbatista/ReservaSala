package springboot01.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity(name="salas")
public class Sala {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@NotNull
	@Size(min = 1, max = 40, message = "O tamanho deve ser entre {min} e {max}")
	private String nPorta; // Está String pois pode haver salas que não sejam identifcadas com numeros, exemplo Sala multiuso/desenho
	
	@NotNull
	@Size(min = 1, max = 40, message = "O tamanho deve ser entre {min} e {max}")
	private String bloco;
	
	@NotNull
//	@Size(min = 10, max = 200, message = "O tamanho deve ser entre {min} e {max}")
	private String descricao;
	
//	@OneToMany
//	private List<Reserva> listaRoomReservas;
	
	public Sala() {
		// TODO Auto-generated constructor stub
	}
	
	public Sala(int id, String nPorta, String bloco, String descricao) {
		this.id = id;
		this.nPorta = nPorta;
		this.bloco = bloco;
		this.descricao = descricao;
	}
	
	public Sala(String nPorta, String bloco, String descricao) {
		this.nPorta = nPorta;
		this.bloco = bloco;
		this.descricao = descricao;
	}
	
	public Sala(int id, String nPorta, String bloco){
		this.id = id;
		this.nPorta = nPorta;
		this.bloco = bloco;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getnPorta() {
		return nPorta;
	}

	public void setnPorta(String nPorta) {
		this.nPorta = nPorta;
	}

	public String getBloco() {
		return bloco;
	}

	public void setBloco(String bloco) {
		this.bloco = bloco;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
