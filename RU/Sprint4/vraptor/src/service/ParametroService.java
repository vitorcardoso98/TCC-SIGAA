package service;

import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import dao.ParametroDAO;
import entities.Parametro;

@Component
public class ParametroService {

	private ParametroDAO parametroDAO;

	public ParametroService(ParametroDAO parametroDAO) {
		this.parametroDAO = parametroDAO;
	}

	public void save(Parametro parametro) {
		parametroDAO.saveOrUpdate(parametro);
	}

	public List<Parametro> list() {
		return parametroDAO.list();
	}

	// Captura a matrícula de um objeto para ser atualizado
	public Parametro edit(String codigo) {
		return parametroDAO.get(codigo);
	}

	public void update(Parametro parametro) {
		parametroDAO.saveOrUpdate(parametro);
	}
	
	public void delete(String codigo){
		Parametro parametro = parametroDAO.get(codigo);
		parametroDAO.delete(parametro);
	}
}
