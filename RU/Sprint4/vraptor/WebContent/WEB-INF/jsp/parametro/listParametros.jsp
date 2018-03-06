<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Parâmetros</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<body>
	<ul id="slide-out" class="side-nav fixed #00897b teal darken-1">
		<li><a href="http://localhost:8080/vraptor"><i
				class="small material-icons">group_add</i>Cadastro</a></li>
		<li><a href=""><i class="small material-icons">restaurant</i>Movimentação</a></li>
		<li><a href=""><i class="small material-icons">timeline</i>Relatórios</a></li>
		<li><a href="http://localhost:8080/vraptor/utilitarios.jsp"><i class="small material-icons">apps</i>Utilitários</a></li>
	</ul>
	<div class="row"></div>
	<div class="row">
		<div class="col s3"></div>

		<div class="col s9">
			<table class="striped">
				<thead>
					<tr>
						<th>Código</th>
						<th>Descrição</th>
						<th>Valor</th>
						<th>Modificar</th>
						<th>Excluir</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${parametros}" var="parametros">
						<tr>
							<td>${parametros.codigo}</td>
							<td>${parametros.descricao}</td>
							<td>${parametros.valor}</td>
							<td><a
								href="${linkTo[ParametroController].editParametro}?codigo=${parametros.codigo}">Modificar</a></td>
							<td><a
								href="${linkTo[ParametroController].deleteParametro}?codigo=${parametros.codigo}">Excluir</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col s3">
		
		</div>
		<div class="col s9">
			<a href="${linkTo[ParametroController].adicionaParametro}" class="waves-effect waves-light btn">Novo parâmetro</a>
		</div>
	</div>
</body>
</html>