package dao;

import java.util.List;




import modelo.Estoque;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class DaoEstoque {
	Session session;

	public DaoEstoque() {
		session = HibernateUtil.getSession();
	}

	public void incluir(Estoque Est ) throws Exception {
		try {
			Transaction transaction = session.beginTransaction();
			session.clear();
			session.save(Est);
			transaction.commit();
		} catch (Exception exception) {
			throw new Exception("Erro na inclusão . Descrição "
					+ exception.getMessage());
		}
	}

	public void alterar(Estoque Est ) throws Exception {
		try {
			Transaction transaction = session.beginTransaction();
			session.clear();
			session.update(Est );
			transaction.commit();
		} catch (Exception exception) {
			throw new Exception("Erro na alteração . Descrição "
					+ exception.getMessage());
		}
	}

	public void excluir(Estoque  Est ) throws Exception {
		try {
			Transaction transacao = session.beginTransaction();
			session.clear();
			session.delete(Est );
			transacao.commit();
		} catch (Exception ex) {
			throw new Exception("Erro na exclusão do  Descrição "
					+ ex.getMessage());
		}
	}

	public Estoque consultar(int cod) throws Exception {
		Estoque Est = null;
		try {
			String hql = "from Estoque  a where codEst =:cod";
			Query consulta = session.createQuery(hql);
			consulta.setParameter("cod", cod);
			Est = (Estoque) consulta.uniqueResult();
		} catch (Exception ex) {
			throw new Exception("Erro ao consultar Estoque . Descrição "
					+ ex.getMessage());
		}
		return Est;
	}

	public List<Estoque> listarTodos(int ordenacao) throws Exception {
		List<Estoque> lista;
		Criteria consulta = session.createCriteria(Estoque.class);
		lista = consulta.list();
		return lista;
	}
	
	public Estoque consultarporProduto(int cod) throws Exception {
		Estoque Est = null;
		try {
			String hql = "from Estoque  a where codigo =:cod";
			Query consulta = session.createQuery(hql);
			consulta.setParameter("cod", cod);
			Est = (Estoque) consulta.uniqueResult();
		} catch (Exception ex) {
			throw new Exception("Erro ao consultar Estoque . Descrição "
					+ ex.getMessage());
		}
		return Est;
	}
	public boolean Atualizar(int prod ,int qtd ) throws Exception {
		try {
			boolean a = true;
			Estoque est = consultarporProduto(prod);
			est.setQtd((est.getQtd() -qtd));
			if(est.getQtd() < est.getQtd_min()){
				a = false;
			}
			
			Transaction transaction = session.beginTransaction();
			session.clear();
			session.update(est );
			transaction.commit();
			
			return a;
		} catch (Exception exception) {
			throw new Exception("Erro na Atualização. Descrição "
					+ exception.getMessage());
		}
	}
}
