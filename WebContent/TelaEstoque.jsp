
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="modelo.HQ"%>
	<%@ page import="controle.ControleHQs"%>
	<%@ page import="java.util.List"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><style type="text/css">
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
h2,h3h2,h3,a {
	color: #CCC;
}
a:hover{
	color: #F00
}
</style></head>

<body>
 
<center>
  <p><img src="logo.png" width="709" height="236"></p>
  <h1>Lojas de HQs</h1>
  <p>&nbsp;</p>
</center>
<h2> Cadastrar</h2>
 <center>
   <form name="form1" method="post" action="ActionEstoque.jsp"
   >
     <table width="200" border="0">
       <tr>
         <td><label for="">Codigo:</label></td>
         <td><input name="cod" type="text" value="${sessionScope.Estoque.codEst}"></td>
       </tr>
       <tr>
         <td><label for="">Quantidade</label></td>
         <td><input name="txtqtd" type="text" value="${sessionScope.Estoque.qtd}"></td>
       </tr>
       <tr>
         <td><label for="">Quantidade minima</label></td>
         <td><input name="txtqtd_min" type="text" value="${sessionScope.Estoque.qtd_min}"></td>
       </tr>
           <tr>
    <td>
     <label for="combo">HQ</label></td><td>
     <select name="combo" id="combo" >
  
    <%
    ControleHQs cHQ = ControleHQs.getInstance();
    List<HQ> lista = cHQ.listar(1);
    		 for (int i=0; i < lista.size(); i++){
 				HQ hq  = lista.get(i);
    
    %>
    
     <option value="<%= hq.getCodigo() %>">
						<%= hq.getTitulo() %></option>
				
						
				
				<%	}// fim do for	%>
	<option selected index>${sessionScope.Estoque.hq.codigo}			
				
    
     </select></td>
    </tr>
     </table>
     <p> <input type="submit" name="btn" id="btn" value="Incluir"> 
      <input type="submit" name="btn" id="btn" value="Excluir">
      <input type="submit" name="btn" id="btn" value="Alterar">
        <input type="submit" name="btn" id="btn" value="Consultar">
          <input type="submit" name="btn" id="btn" value="Limpar">   </p>
   </form>
 </center>
 <a href="index.html">Retornar Home
			</a>
</body>
</html>