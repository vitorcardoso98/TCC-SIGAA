<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<title>Cadastro de bolsista</title>
</head>
<body>
	<ul id="slide-out" class="side-nav fixed #00897b teal darken-1">
   		<li><a href="http://localhost:8080/vraptor"><i class="small material-icons">group_add</i>Cadastro</a></li>
   		<li><a href=""><i class="small material-icons">restaurant</i>Movimentação</a></li>
   		<li><a href=""><i class="small material-icons">timeline</i>Relatórios</a></li>
   		<li><a href="http://localhost:8080/vraptor/utilitarios.jsp"><i class="small material-icons">apps</i>Utilitários</a></li>
    </ul>
    
    <div class="row">
    </div>
    
    <div class="row">
    	<div class="col s3">
    	
    	</div>
    	
    	<div class="col s5">
    		<p>Cadastar bolsista</p>
    		<form action="<c:url value="/aluno/addAluno"/>" method="post">
				Nome:<input type="text" name="aluno.nome">
				Matrícula:<input type="text" name="aluno.matricula"><br> 
				<button class="btn waves-effect waves-light" type="submit" name="action">Salvar
    				<i class="material-icons right">send</i>
  				</button>
  				<a href="${linkTo[AlunoController].listAlunos}"class="waves-effect waves-light btn"><i class="material-icons left">cloud</i>Bolsistas cadastrados</a>
			</form>
    	</div>
    </div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</body>
</html>