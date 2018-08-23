package modelo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import controle.ControleItens;

@Entity
public class Venda {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int codVenda;
	private String data;
	
	public int getCodVenda() {
		return codVenda;
	}
	public void setCodVenda(int codVenda) {
		this.codVenda = codVenda;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	
		
		
		
		
		
		
		
		
	
}
