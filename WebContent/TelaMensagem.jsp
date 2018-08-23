<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mensagem</title>
<style type="text/css">
label {
	font-family: Verdana, Geneva, sans-serif;
	font-size: 16px;
	color: #999;
}
body {
	background-color: #000;
}
h1 {
	color: #F00;
}
h2,h3,a {
	color: #CCC;
}
a:hover{
	color: #F00
}

</style>
</head>
<body>
<center>
  <p><img src="logo.png" width="709" height="236"></p>
  <h1>Lojas de HQs</h1>
  <p>&nbsp;</p>
</center>

	<h2>Tela de Mensagem</h2>
	<h2>"${sessionScope.msg}"</h2>
	
	<h3>
		<a href="TelaCadastrar.jsp">Voltar para a Tela HQ</a><br />
		<a href="TelaCadastrarEditora.jsp">Voltar para a Tela Editora</a><br />
		<a href="TelaEstoque.jsp">Voltar tela Estoque</a><br />
		<a href="index.html">Retornar Home
			</a><br />
	</h3>

</body>
</html>