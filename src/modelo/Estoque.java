package modelo;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Estoque {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int codEst;
	private int qtd;
	private int qtd_min;
	@OneToOne
	@JoinColumn(name = "codigo",unique = true, nullable = false)
	private HQ hq;
	
	public int getCodEst() {
		return codEst;
	}
	public void setCodEst(int codEst) {
		this.codEst = codEst;
	}
	public int getQtd() {
		return qtd;
	}
	public void setQtd(int qtd) {
		this.qtd = qtd;
	}
	public HQ getHq() {
		return hq;
	}
	public void setHq(HQ hq) {
		this.hq = hq;
	}
	public int getQtd_min() {
		return qtd_min;
	}
	public void setQtd_min(int qtd_min) {
		this.qtd_min = qtd_min;
	}
	
	
	
}