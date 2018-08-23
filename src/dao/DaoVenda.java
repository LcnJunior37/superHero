package dao;

import java.io.Serializable;






import modelo.Venda;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class DaoVenda  implements Serializable{
	
	Session session;

	public DaoVenda() {
		session = HibernateUtil.getSession();
	}

	public void incluir(Venda venda ) throws Exception {
		try {
			Transaction transaction = session.beginTransaction();
			session.clear();
			session.save(venda );
			transaction.commit();
		} catch (Exception exception) {
			throw new Exception("Erro na inclus�o . Descri��o "
					+ exception.getMessage());
		}
	}

	

	public void excluir(Venda venda  ) throws Exception {
		try {
			Transaction transacao = session.beginTransaction();
			session.clear();
			session.delete(venda  );
			transacao.commit();
		} catch (Exception ex) {
			throw new Exception("Erro na exclus�o do  Descri��o "
					+ ex.getMessage());
		}
	}
	public  Venda consul (int cod) throws Exception {
		Venda v = null;
		try {
			String hql = "from Venda  a where codVenda =:cod";
			Query consulta = session.createQuery(hql);
			consulta.setParameter("cod", cod);
			v = (Venda) consulta.uniqueResult();
		} catch (Exception ex) {
			throw new Exception("Erro ao consultar venda . Descri��o "
					+ ex.getMessage());
		}
		return v;
	}

	
	

	
}
