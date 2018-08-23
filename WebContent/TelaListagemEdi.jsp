<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="modelo.Editora"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<title>Lista</title>
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
</style></head>

</head>
<body>
<center>
  <p><img src="logo.png" width="709" height="236"></p>
  <h1>Lojas de HQs</h1>
  <p>&nbsp;</p>
</center>

	<h2>Listagem das Editoras</h2>
	<h3>
		<%
			List<Editora> lista = (ArrayList) session.getAttribute("Editoras");
			for (int i = 0; i < lista.size(); i++) {
				Editora umEdi = lista.get(i);
		%>
		&nbsp; Codigo:&nbsp;
		<%=umEdi.getCodEditora()%>
		&nbsp; Nome:&nbsp;
		<%=umEdi.getNomeEditora()%><br>
		
		<%
			}
		%>

		<br> <a href="TelaCadastrarEditora.jsp">Retornar a Tela de Cadastro da
			Editora</a>
	</h3>

</body>
</html>