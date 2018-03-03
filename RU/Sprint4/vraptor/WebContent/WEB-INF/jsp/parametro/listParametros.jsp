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
			<td>Código</td>
			<td>Descrição</td>
			<td>Valor</td>
		</tr>
		<c:forEach items="${parametros}" var="parametros">
			<tr>
				<td>${parametros.codigo}</td>
				<td>${parametros.descricao}</td>
				<td>${parametros.valor}</td>
				<td><a href="${linkTo[ParametroController].editParametro}?codigo=${parametros.codigo}">Modificar</a></td>
				<td><a href="${linkTo[ParametroController].deleteParametro}?codigo=${parametros.codigo}">Excluir</a></td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>