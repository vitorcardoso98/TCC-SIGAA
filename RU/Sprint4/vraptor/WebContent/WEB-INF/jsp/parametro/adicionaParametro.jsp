<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restaurante Universitário - Cadastro de parâmetro</title>
</head>
<body>
	<form action="<c:url value="/parametro/addParametro"/>" method="post">
		Código:<br> <input type="text" name="parametro.codigo"><br>
		Descrição:<br> <input type="text" name="parametro.descricao"><br>
		Valor:<br> <input type="text" name="parametro.valor"><br>
		<br> <input type="submit" value="Submit">
	</form>
</body>
</html>