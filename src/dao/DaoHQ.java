package dao;

import java.io.Serializable;
import java.util.List;

import modelo.HQ;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class DaoHQ implements Serializable {
	Session session;

	public DaoHQ() {
		session = HibernateUtil.getSession();
	}

	public void incluir(HQ hq) throws Exception {
		try {
			Transaction transaction = session.beginTransaction();
			session.clear();
			session.save(hq);
			transaction.commit();
		} catch (Exception exception) {
			throw new Exception("Erro na inclusão . Descrição "
					+ exception.getMessage());
		}
	}

	public void alterar(HQ hq) throws Exception {
		try {
			Transaction transaction = session.beginTransaction();
			session.clear();
			session.update(hq);
			transaction.commit();
		} catch (Exception exception) {
			throw new Exception("Erro na alteração . Descrição "
					+ exception.getMessage());
		}
	}

	public void excluir(HQ hq) throws Exception {
		try {
			Transaction transacao = session.beginTransaction();
			session.clear();
			session.delete(hq);
			transacao.commit();
		} catch (Exception ex) {
			throw new Exception("Erro na exclusão do  Descrição "
					+ ex.getMessage());
		}
	}

	public HQ consultar(int cod) throws Exception {
		HQ hq = null;
		try {
			String hql = "from HQ a where codigo = :cod";
			Query consulta = session.createQuery(hql);
			consulta.setParameter("cod", cod);
			hq = (HQ) consulta.uniqueResult();
		} catch (Exception ex) {
			throw new Exception("Erro ao consultar a aluno. Descrição "
					+ ex.getMessage());
		}
		return hq;
	}
	public HQ consultarString(String cod) throws Exception {
		HQ hq = null;
		try {
			String hql = "from HQ a where titulo = :cod";
			Query consulta = session.createQuery(hql);
			consulta.setParameter("cod", cod);
			hq = (HQ) consulta.uniqueResult();
		} catch (Exception ex) {
			throw new Exception("Erro ao consultar a aluno. Descrição "
					+ ex.getMessage());
		}
		return hq;
	}

	public List<HQ> listarTodos(int ordenacao) throws Exception {
		List<HQ> lista;
		Criteria consulta = session.createCriteria(HQ.class);
		lista = consulta.list();
		return lista;
	}

}