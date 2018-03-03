package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import entities.Parametro;

@Component
public class ParametroDAO {

	private Session session;
	
	public ParametroDAO(Session session){
		this.session = session;
	}
	
	public Parametro get(String codigo){
		return (Parametro) session.createCriteria(Parametro.class)
				.add(Restrictions.eq("codigo", codigo)).uniqueResult();
	}
	
	public void saveOrUpdate(Parametro parametro) {
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(parametro);
		tx.commit();
	}
	
	public List<Parametro> list(){
		return session.createCriteria(Parametro.class).list();
	}
	
	public void delete(Parametro parametro){
		Transaction tx = session.beginTransaction();
		session.delete(parametro);
		tx.commit();
	}
}
