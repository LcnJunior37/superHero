package controle;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import modelo.HQ;
import dao.DaoHQ;

public class ControleHQs implements Serializable {
	
	private static ControleHQs controleHQs;
	
	DaoHQ daoHQ = null;

	private ControleHQs() {
		daoHQ = new DaoHQ();
	}

	public static ControleHQs getInstance() {
		if (controleHQs == null) {
			controleHQs= new ControleHQs();
		}
		return controleHQs;
	}

	public void incluir(HQ aluno) throws Exception {
		if (validar(aluno)) {
			daoHQ.incluir(aluno);
		}
	}

	private boolean validar(HQ aluno) throws Exception {
		
		return true;
	}

	public void alterar(HQ hq) throws Exception {
		if (validar(hq)) {
			daoHQ.alterar(hq);
		}
	}

	public void excluir(int matricula) throws Exception {
		HQ aluno = daoHQ.consultar(matricula);
		daoHQ.excluir(aluno);
	}

	public HQ consultar(int mat) throws Exception {
		HQ aluno = null;
		aluno = daoHQ.consultar(mat);
		return aluno;
	}
	public HQ consultarString(String mat) throws Exception {
		HQ aluno = null;
		aluno = daoHQ.consultarString(mat);
		return aluno;
	}


	public List<HQ> listar(int ordenacao) throws Exception {

		List<HQ> lista = new ArrayList<HQ>();

		lista = daoHQ.listarTodos(ordenacao);

		return lista;
	}
}
