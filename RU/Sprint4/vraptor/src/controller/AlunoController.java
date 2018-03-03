package controller;

import java.util.List;

import service.AlunoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import entities.Aluno;

@Resource
public class AlunoController {

	private final Result result;
	private final AlunoService alunoService;
	
	public AlunoController(Result result, AlunoService alunoService){
		this.result = result;
		this.alunoService = alunoService;
	}
	
	public void adicionaAluno(){
		
	}
	
	@Post("/aluno/addAluno")
	public void add(Aluno aluno){
		alunoService.save(aluno);
		result.redirectTo(AlunoController.class).listAlunos();

	}
	
	@Get("/aluno/list")
	public void listAlunos(){
		List<Aluno> alunos = alunoService.list();
		result.include("alunos", alunos);
	}
	
	public void editAluno(int matricula){
		Aluno aluno = alunoService.edit(matricula);
		result.include("aluno", aluno);
	}
	
	@Post("/aluno/editaAluno")
	public void update(Aluno aluno){
		alunoService.update(aluno);
		result.redirectTo(AlunoController.class).listAlunos();

	}
	
	public void deleteAluno(int matricula){
		alunoService.delete(matricula);
		result.redirectTo(AlunoController.class).listAlunos();
	}
	
}
