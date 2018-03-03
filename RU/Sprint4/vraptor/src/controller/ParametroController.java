package controller;

import java.util.List;

import service.ParametroService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import entities.Parametro;

@Resource
public class ParametroController {

	private final Result result;
	private final ParametroService parametroService;
	
	public ParametroController(Result result, ParametroService parametroService){
		this.result = result;
		this.parametroService = parametroService;
	}
	
	public void adicionaParametro(){
		
	}
	
	@Post("/parametro/addParametro")
	public void add(Parametro parametro){
		parametroService.save(parametro);
		result.redirectTo(ParametroController.class).listParametros();

	}
	
	@Get("/parametro/list")
	public void listParametros(){
		List<Parametro> parametros = parametroService.list();
		result.include("parametros", parametros);
	}
	
	public void editParametro(String codigo){
		Parametro parametro = parametroService.edit(codigo);
		result.include("parametro", parametro);
	}
	
	@Post("/parametro/editaParametro")
	public void update(Parametro parametro){
		parametroService.update(parametro);
		result.redirectTo(ParametroController.class).listParametros();

	}
	
	public void deleteParametro(String codigo){
		parametroService.delete(codigo);
		result.redirectTo(ParametroController.class).listParametros();
	}
}
