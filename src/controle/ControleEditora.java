package controle;

import java.util.ArrayList;
import java.util.List;

import modelo.Editora;
import dao.DaoEditora;

public class ControleEditora {
private static ControleEditora controleEditora;
	
	DaoEditora daoEditora = null;

	private ControleEditora() {
		daoEditora  = new DaoEditora();
	}

	public static ControleEditora Editora() {
		if (controleEditora == null) {
			controleEditora= new ControleEditora();
		}
		return controleEditora;
	}

	public void incluir(Editora editora) throws Exception {
		if (validar(editora)) {
			daoEditora .incluir(editora);
		}
	}

	private boolean validar(Editora aluno) throws Exception {
		
		return true;
	}

	public void alterar(Editora hq) throws Exception {
		if (validar(hq)) {
			daoEditora.alterar(hq);
		}
	}

	public void excluir(int cod) throws Exception {
		Editora editora = daoEditora.consultar(cod);
		daoEditora.excluir(editora);
	}

	public Editora consultar(int mat) throws Exception {
		Editora edi = null;
		edi = daoEditora.consultar(mat);
		return edi;
	}
	public Editora consultarString(String mat) throws Exception {
		Editora edi = null;
		edi = daoEditora.consultarString(mat);
		return edi;
	}

	public List<Editora> listar(int ordenacao) throws Exception {

		List<Editora> lista = new ArrayList<Editora>();

		lista = daoEditora.listarTodos(ordenacao);

		return lista;
	}
}
