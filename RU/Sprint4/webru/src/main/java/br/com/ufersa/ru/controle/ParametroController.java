package br.com.ufersa.ru.controle;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.ufersa.ru.dao.ParametroDAO;
import br.com.ufersa.ru.modelo.Parametro;

@Resource
public class ParametroController {
	
	private final Result result;
	private final ParametroDAO dao; 
	
	public ParametroController(Result result, ParametroDAO dao){
		this.result = result;
		this.dao = dao;
	}
	
	public void formAdicionaParametro(){
		
	}
	
	@Post("/parametro/definirParametro")
	public void definirParametro(Parametro parametro){
		dao.salvar(parametro);
		result.redirectTo(ParametroController.class).listarParametros();
	}
	
	@Get("/parametro/listar")
	public void listarParametros(){
		List<Parametro> parametros = dao.listarParametros();
		result.include("parametros", parametros);
	}
	
	public void editar(String codigo){
		Parametro parametro = dao.buscarPorCodigoParametro(codigo);
		result.include("parametro", parametro);
	}
	
	@Post("/parametro/editarParametro")
	public void editarParametro(Parametro parametro){
		dao.editar(parametro);
		result.redirectTo(ParametroController.class).listarParametros();
	}
	
	public void excluirParametro(String codigo){
		dao.remover(codigo);
		result.redirectTo(ParametroController.class).listarParametros();
	}

}
