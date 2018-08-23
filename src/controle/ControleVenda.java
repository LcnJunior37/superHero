package controle;

import java.util.ArrayList;
import java.util.List;

import modelo.Editora;
import modelo.Estoque;
import modelo.Venda;
import dao.DaoEditora;
import dao.DaoVenda;

public class ControleVenda {
private static ControleVenda ControleVenda;
	
	DaoVenda dao = null;

	private ControleVenda() {
		dao  = new DaoVenda();
	}

	public static ControleVenda venda() {
		if (ControleVenda == null) {
			ControleVenda= new ControleVenda();
		}
		return ControleVenda;
	}

	public void incluir(Venda v) throws Exception {
		
			dao .incluir(v);
		
	}

	


	public void excluir(int cod) throws Exception {
		Venda venda = new Venda();
		venda.setCodVenda(cod);
		dao.excluir(venda);
	}
	public Venda Venda(int v) throws Exception {
	      Venda ven = null;
		ven = dao.consul(v);
		return ven ;
	}

	
}
