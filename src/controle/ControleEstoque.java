package controle;

import java.util.ArrayList;
import java.util.List;

import dao.DaoEstoque;
import modelo.Estoque;



public class ControleEstoque {
private static ControleEstoque controle;
	
	DaoEstoque dao = null;

	private ControleEstoque() {
		dao  = new DaoEstoque();
	}

	public static ControleEstoque Estoque() {
		if (controle == null) {
			controle= new ControleEstoque();
		}
		return controle;
	}

	public boolean incluir(Estoque est) throws Exception {
		boolean resp;
		if (resp = validar(est)) {
			dao .incluir(est);
		}
		return resp;
	}

	private boolean validar(Estoque est) throws Exception {
		boolean resp = true;
		List<Estoque>  l= listar(0);
		for(int i = 0 ; i< l.size();i++){
			Estoque e = l.get(i);
			if(est.getHq().getCodigo() == e.getHq().getCodigo()){
				resp = false;
			}else{
				resp = true;
			}
		}
		
		return resp;
	}

	public void alterar(Estoque est) throws Exception {
		
			dao.alterar(est);
		
	}

	public void excluir(int cod) throws Exception {
		Estoque est = dao.consultar(cod);
		dao.excluir(est);
	}

	public Estoque consultar(int mat) throws Exception {
		Estoque est = null;
		est = dao.consultar(mat);
		return est;
	}
	public Estoque consultarHq(int mat) throws Exception {
		Estoque est = null;
		est = dao.consultarporProduto(mat);
		return est;
	}
	public List<Estoque> listar(int ordenacao) throws Exception {

		List<Estoque> lista = new ArrayList<Estoque>();

		lista = dao.listarTodos(ordenacao);

		return lista;
	}
	public boolean at (int prod, int qtd) throws Exception{
		
		return (dao.Atualizar(prod, qtd));
		
	}
}
