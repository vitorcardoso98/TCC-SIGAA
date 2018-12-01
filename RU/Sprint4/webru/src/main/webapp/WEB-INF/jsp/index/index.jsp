	
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Restaurante Universitário</title>
</head>
<body>
	<ul id="slide-out" class="side-nav fixed #00897b teal darken-1">
   		<li><a href="${linkTo[IndexController].index}"><i class="small material-icons">group_add</i>Cadastro</a></li>
   		<li><a href=""><i class="small material-icons">restaurant</i>Movimentação</a></li>
   		<li><a href=""><i class="small material-icons">timeline</i>Relatórios</a></li>
   		<li><a href="${linkTo[UtilitarioController].utilitarios}"><i class="small material-icons">apps</i>Utilitários</a></li>
    </ul>
    <div class="row">
    
    </div>
    <div class="row">
    	<div class="col s4">
    	
    	</div>
    	<div class="col s2">
    		<a href="${linkTo[AlunoController].adicionaAluno}"><img src="img/bolsista.png"></a>
    	</div>
    	<div class="col s2">
    		<img src="img/especiais.png">
    	</div>
    	<div class="col s2">
    		<img src="img/gestores.png">
    	</div>
    </div>
</body>
</html>