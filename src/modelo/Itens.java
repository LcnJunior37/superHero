package modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import controle.ControleEstoque;

@Entity
public class Itens {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cod;
	@ManyToOne
	@JoinColumn(name = "codigo")	
	private HQ hq;
	
	@ManyToOne
	@JoinColumn(name = "codVenda")	
	private Venda venda;
	
		private int qtd;
	public void qtdEst(int qtd) throws Exception{
		ControleEstoque ctr = ControleEstoque.Estoque();
		Estoque est = ctr.consultarHq(hq.getCodigo());
		est.setQtd(est.getQtd() - qtd);
		setQtd(qtd);
	}
	public int getCod() {
		return cod;
	}
	public void setCod(int cod) {
		this.cod = cod;
	}
	public HQ getHq() {
		return hq;
	}
	public void setHq(HQ hq) {
		this.hq = hq;
	}
	public Venda getVenda() {
		return venda;
	}
	public void setVenda(Venda venda) {
		this.venda = venda;
	}
	public int getQtd() {
		return qtd;
	}
	public void setQtd(int qtd) {
		this.qtd = qtd;
	}

}
