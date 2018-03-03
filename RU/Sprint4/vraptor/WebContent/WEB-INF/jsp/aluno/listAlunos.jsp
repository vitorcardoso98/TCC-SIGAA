<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bolsistas cadastrados</title>
</head>
<body>
	<table border="1px">
		<tr>
			<td>Nome</td>
			<td>Matrícula</td>
		</tr>
		<c:forEach items="${alunos}" var="alunos">
			<tr>
				<td>${alunos.nome}</td>
				<td>${alunos.matricula}</td>
				<td><a href="${linkTo[AlunoController].editAluno}?matricula=${alunos.matricula}">Modificar</a></td>
				<td><a href="${linkTo[AlunoController].deleteAluno}?matricula=${alunos.matricula}">Excluir</a></td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>