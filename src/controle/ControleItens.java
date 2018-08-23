package controle;

import java.util.ArrayList;
import java.util.List;

import modelo.Itens;
import dao.DaoItens;

public class ControleItens {
private static ControleItens controle;
	
	DaoItens dao = null;

	private ControleItens() {
		dao  = new DaoItens();
	}

	public static ControleItens Itens() {
		if (controle == null) {
			controle= new ControleItens();
		}
		return controle;
	}

	public void incluir(Itens i) throws Exception {
		if (validar(i)) {
			dao .incluir(i);
		}
	}

	private boolean validar(Itens i) throws Exception {
		
		return true;
	}

	
	public List<Itens> listarPorVenda(int cod) throws Exception {

		List<Itens> lista = new ArrayList<Itens>();

		lista = dao.listaporVenda(cod);

		return lista;
	}

}
