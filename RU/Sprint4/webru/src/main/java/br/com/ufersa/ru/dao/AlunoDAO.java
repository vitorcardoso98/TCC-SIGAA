package br.com.ufersa.ru.dao;

import java.util.List;
import javax.persistence.EntityManager;
import br.com.ufersa.ru.modelo.Aluno;

public class AlunoDAO {

	public void salvar(Aluno aluno) {

		EntityManager em = new ConnectionFactory().getConnection();

		try {
			em.getTransaction().begin();
			em.persist(aluno);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
	}

	public void atualizar(Aluno aluno) {

		EntityManager em = new ConnectionFactory().getConnection();

		try {
			em.getTransaction().begin();
			em.merge(aluno);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		} finally {
			em.close();
		}

	}
	
	public Aluno buscarPorMatricula (int matricula){
		
		EntityManager em = new ConnectionFactory().getConnection();
		Aluno al = null;
		
		try {
			al = em.find(Aluno.class, matricula);
		} catch (Exception e) {
			System.err.println(e);
		}finally{
			em.close();
		}
		return al;
	}
	
	public List<Aluno> buscarAlunos(){
		
		EntityManager em = new ConnectionFactory().getConnection();
		List<Aluno> alunos = null;
		
		try {
			alunos = em.createQuery("from Aluno").getResultList();
		} catch (Exception e) {
			System.err.println(e);
		}finally{
			em.close();
		}
		return alunos;
	}
	
	public void remover(int matricula){
		
		EntityManager em = new ConnectionFactory().getConnection();
		
		try {
			Aluno al = em.find(Aluno.class, matricula);			
			em.getTransaction().begin();
			em.remove(al);
			em.getTransaction().commit();
		} catch (Exception e) {
			System.err.println(e);
		}finally{
			em.close();
		}
	}
}
