<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Itens"%>
<%@ page import="modelo.Venda"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
 

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
<%
Venda venda = (Venda) session.getAttribute("Venda");

%>
	<center><h2>&nbsp;</h2>
	<table width="200" border="1">
	  <tr>
	    <td colspan="3"><h2>Venda: <%=venda.getCodVenda()%></h2>	      
	    <td colspan="2"><h2>Data: <%=venda.getData()%></h2>
      
      </tr>
       
	  <tr>
	    <td><h2>Codigo Itens</h2></td>
	    <td><h2>HQ</h2></td>
	    <td><h2>Quantidade</h2></td>
	    <td><h2>Valor Unitario </h2></td>
	    <td><<h2>Total</h2></td>
      </tr>
      <%
			//ControleEstoque cE = ControleEstoque.Estoque();
			//Estoque e = new Estoque();
			List<Itens> lista = (ArrayList) session.getAttribute("lista");
			double vT = 0;
			int It = 0;
			for (int i = 0; i < lista.size(); i++) {
				It++;
				
				
				 Itens itens = lista.get(i);
				 double vU = itens.getQtd() * itens.getHq().getValor();
				 vT+=vU;
				//e = cE.consultarHq(umAluno.getCodigo());
		%>
	  <tr>
	    <td><h3><%=It%></h3></td>
	    <td><h3><%=itens.getHq().getTitulo()%></h3></td>
	    <td><h3><%=itens.getQtd()%></h3></td>
	    <td><h3><%=itens.getHq().getValor()%></h3></td>
	    <td><h3>&nbsp;R$&nbsp; <%=vU%></h3></td>
      </tr>
       <% } // fim do for%>
	  <tr>
	    <td colspan="4"><h2>Valor total:</h2>;</td>
	    <td><h2>R$ <%=vT%></h2></td>
      </tr>
      
</table>
</center>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<h3>
    
    
    
   

		<br> <a href="index.html">Home</a>
	</h3>

</body>
</html>