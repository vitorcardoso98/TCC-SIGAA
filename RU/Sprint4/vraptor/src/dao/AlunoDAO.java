package dao;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import entities.Aluno;

@Component
public class AlunoDAO {

	private final Session session;

	public AlunoDAO(Session session) {
		this.session = session;
	}

	public Aluno get(int matricula){
		return (Aluno) session.createCriteria(Aluno.class)
				.add(Restrictions.eq("matricula", matricula)).uniqueResult();
	}
	
	public void saveOrUpdate(Aluno aluno) {
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(aluno);
		tx.commit();
	}
	
	public List<Aluno> list(){
		return session.createCriteria(Aluno.class).list();
	}
	
	public void delete(Aluno aluno){
		Transaction tx = session.beginTransaction();
		session.delete(aluno);
		tx.commit();
	}
}
