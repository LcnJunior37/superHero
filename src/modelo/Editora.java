package modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Editora  {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int codEditora;
	private String nomeEditora;
	public int getCodEditora() {
		return codEditora;
	}
	public void setCodEditora(int codEditora) {
		this.codEditora = codEditora;
	}
	public String getNomeEditora() {
		return nomeEditora;
	}
	public void setNomeEditora(String nomeEditora) {
		this.nomeEditora = nomeEditora;
	}
	

}
