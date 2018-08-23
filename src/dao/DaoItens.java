package dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import modelo.Editora;
import modelo.Itens;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class DaoItens implements Serializable {
	Session session;

	public DaoItens() {
		session = HibernateUtil.getSession();
	}

	public void incluir(Itens i) throws Exception {
		try {
			Transaction transaction = session.beginTransaction();
			session.clear();
			session.save(i);
			transaction.commit();
		} catch (Exception exception) {
			throw new Exception("Erro na inclusão . Descrição "
					+ exception.getMessage());
		}
	}
	
	public List<Itens> consultar(int cod) throws Exception {
		List<Itens> lista;
		try {
			String hql = "from itens  a where codVenda = :cod";
			Query consulta = session.createQuery(hql);
			consulta.setParameter("cod", cod);
			lista =  consulta.list();
		} catch (Exception ex) {
			throw new Exception("Erro ao lista de itens. Descrição "
					+ ex.getMessage());
		}
		return lista;
	}
	public List<Itens> listarTodos(int ordenacao) throws Exception {
		List<Itens>lista;
		Criteria consulta = session.createCriteria(Itens.class);
		lista = consulta.list();
		return lista;
	}
	public List<Itens> listaporVenda(int v) throws Exception{
		 List<Itens> lV= new ArrayList(); 
		 List<Itens> l = listarTodos(1);
		 
		 for(int i = 0 ; i< l.size();i++){
			 if(l.get(i).getVenda().getCodVenda() == v){
				 lV.add(l.get(i));
			 }
		 }
		
		
		return lV;
	}
	
	


}
