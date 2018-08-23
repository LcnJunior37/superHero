<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.HQ"%>
<%@ page import="modelo.Estoque"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
 <%@ page import="controle.ControleEstoque"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

	<h2>Listagem dos HQs</h2>
	<h3>
		<%
			//ControleEstoque cE = ControleEstoque.Estoque();
			//Estoque e = new Estoque();
			List<HQ> lista = (ArrayList) session.getAttribute("hqs");
			for (int i = 0; i < lista.size(); i++) {
				
				
				HQ umAluno = lista.get(i);
				//e = cE.consultarHq(umAluno.getCodigo());
		%>
		&nbsp; Codigo:&nbsp;
		<%=umAluno.getCodigo()%>
		&nbsp; Nome:&nbsp;
		<%=umAluno.getTitulo()%>
		&nbsp; edicao :&nbsp;
		<%=umAluno.getEdicao()%>
		&nbsp; valor :&nbsp;
		<%=umAluno.getValor()%>
		&nbsp; 
		&nbsp; lançamento:&nbsp;
		<%=umAluno.getLancamento()%>
		&nbsp; 
		&nbsp; Codigo Editora: &nbsp;
		<%=umAluno.getEdi().getCodEditora()%>
		&nbsp;
		
		 <br>
		<%
			}
		%>

		<br> <a href="TelaCadastrar.jsp">Retornar a Tela de Cadastro do
			HQ</a>
	</h3>

</body>
</html>