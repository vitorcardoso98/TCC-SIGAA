<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restaurante Universitário - Cadastro de bolsista</title>
</head>
<body>
	<form action="<c:url value="/aluno/addAluno"/>" method="post">
		Nome:<br> <input type="text" name="aluno.nome"><br>
		Matrícula:<br> <input type="text" name="aluno.matricula">
		<br> <input type="submit" value="Submit">
	</form>
</body>
</html>