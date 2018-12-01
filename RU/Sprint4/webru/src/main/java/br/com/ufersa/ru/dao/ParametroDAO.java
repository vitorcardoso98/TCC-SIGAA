package br.com.ufersa.ru.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.caelum.vraptor.ioc.Component;
import br.com.ufersa.ru.modelo.Aluno;
import br.com.ufersa.ru.modelo.Parametro;

@Component
public class ParametroDAO {

	public void salvar(Parametro parametro) {

		EntityManager em = new ConnectionFactory().getConnection();

		try {
			em.getTransaction().begin();
			em.persist(parametro);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
	}

	public List<Parametro> listarParametros() {

		EntityManager em = new ConnectionFactory().getConnection();
		List<Parametro> parametros = null;

		try {
			parametros = em.createQuery("from Parametro").getResultList();
		} catch (Exception e) {
			System.err.println(e);
		} finally {
			em.close();
		}
		return parametros;
	}

	public Parametro buscarPorCodigoParametro(String codigo) {

		EntityManager em = new ConnectionFactory().getConnection();
		Parametro parametro = null;

		try {
			parametro = em.find(Parametro.class, codigo);
		} catch (Exception e) {
			System.err.println(e);
		} finally {
			em.close();
		}
		return parametro;
	}

	public void editar(Parametro parametro) {

		EntityManager em = new ConnectionFactory().getConnection();

		try {
			em.getTransaction().begin();
			em.merge(parametro);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
	}

	public void remover(String codigo) {

		EntityManager em = new ConnectionFactory().getConnection();

		try {
			Parametro parametro = em.find(Parametro.class, codigo);
			em.getTransaction().begin();
			em.remove(parametro);
			em.getTransaction().commit();
		} catch (Exception e) {
			System.err.println(e);
		} finally {
			em.close();
		}
	}
}
