package modelo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class HQ implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int codigo;
 	private String titulo;
    private Double valor;
    private int lancamento;
    private int edicao;
    
    @ManyToOne
	@JoinColumn(name = "codEditora")
    private Editora edi;
    
	public Editora getEdi() {
		return edi;
	}
	public void setEdi(Editora edi) {
		this.edi = edi;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	 public int getEdicao() {
			return edicao;
		}
	
	public Double getValor() {
		return valor;
	}
	public void setValor(Double valor) {
		this.valor = valor;
	}
	public void setEdicao(int edicao) {
		this.edicao = edicao;
	}
	public int getLancamento() {
		return lancamento;
	}
	public void setLancamento(int lacamento) {
		this.lancamento = lacamento;
	}
	
  
	
}