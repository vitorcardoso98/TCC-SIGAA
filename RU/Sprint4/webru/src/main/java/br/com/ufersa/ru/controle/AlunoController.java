package br.com.ufersa.ru.controle;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.ufersa.ru.dao.AlunoDAO;
import br.com.ufersa.ru.modelo.Aluno;

@Resource
public class AlunoController {
	
	private final Result result;
	
	public  AlunoController(Result result){
		this.result = result;
	}

	public void adicionaAluno(){
		
	}
	
	@Post("/aluno/cadastrarAluno")
	public void cadastrar(Aluno aluno){
		AlunoDAO dao = new AlunoDAO();
		dao.salvar(aluno);
		result.redirectTo(AlunoController.class).listar();
	}
	
	@Get("aluno/listarAlunos")
	public void listar(){
		AlunoDAO dao = new AlunoDAO();
		List<Aluno> alunos = dao.buscarAlunos();
		result.include("alunos", alunos);
	}
	
	public void editarAluno(int matricula){
		AlunoDAO dao = new AlunoDAO();
		Aluno aluno = dao.buscarPorMatricula(matricula);
		result.include("aluno", aluno);
	}
	
	@Post("/aluno/modificar")
	public void modificar(Aluno aluno){
		AlunoDAO dao = new AlunoDAO();
		dao.atualizar(aluno);
		result.redirectTo(AlunoController.class).listar();
	}
	
	public void deletar(int matricula){
		AlunoDAO dao = new AlunoDAO();
		dao.remover(matricula);
		result.redirectTo(AlunoController.class).listar();
	}
}
