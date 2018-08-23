package dao;

import java.util.List;

import modelo.Editora;
import modelo.HQ;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class DaoEditora {
	Session session;

	public DaoEditora() {
		session = HibernateUtil.getSession();
	}

	public void incluir(Editora Editora ) throws Exception {
		try {
			Transaction transaction = session.beginTransaction();
			session.clear();
			session.save(Editora );
			transaction.commit();
		} catch (Exception exception) {
			throw new Exception("Erro na inclusão . Descrição "
					+ exception.getMessage());
		}
	}

	public void alterar(Editora  Editora ) throws Exception {
		try {
			Transaction transaction = session.beginTransaction();
			session.clear();
			session.update(Editora);
			transaction.commit();
		} catch (Exception exception) {
			throw new Exception("Erro na alteração . Descrição "
					+ exception.getMessage());
		}
	}

	public void excluir(Editora  Editora ) throws Exception {
		try {
			Transaction transacao = session.beginTransaction();
			session.clear();
			session.delete(Editora );
			transacao.commit();
		} catch (Exception ex) {
			throw new Exception("Erro na exclusão do  Descrição "
					+ ex.getMessage());
		}
	}

	public Editora consultar(int cod) throws Exception {
		Editora editora = null;
		try {
			String hql = "from Editora  a where codEditora = :cod";
			Query consulta = session.createQuery(hql);
			consulta.setParameter("cod", cod);
			editora = (Editora) consulta.uniqueResult();
		} catch (Exception ex) {
			throw new Exception("Erro ao consultar Editora . Descrição "
					+ ex.getMessage());
		}
		return editora;
	}
	public Editora consultarString(String cod) throws Exception {
		Editora editora = null;
		try {
			String hql = "from Editora  a where nomeEditora = :cod";
			Query consulta = session.createQuery(hql);
			consulta.setParameter("cod", cod);
			editora = (Editora) consulta.uniqueResult();
		} catch (Exception ex) {
			throw new Exception("Erro ao consultar Editora . Descrição "
					+ ex.getMessage());
		}
		return editora;
	}

	public List<Editora> listarTodos(int ordenacao) throws Exception {
		List<Editora> lista;
		Criteria consulta = session.createCriteria(Editora.class);
		lista = consulta.list();
		return lista;
	}
}
