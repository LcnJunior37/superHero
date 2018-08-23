<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	  <%@ page import="modelo.HQ"%>
	<%@ page import="controle.ControleHQs"%>
	<%@ page import="java.util.List"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar HQs </title>
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

<body>
 
<center>
  <p><img src="logo.png" width="709" height="236"></p>
  <h1>Lojas de HQs</h1>
  <p>&nbsp;</p>
</center>
<h2> ITens</h2>
 <center><form name="form1" method="post" action="ActionItens.jsp">

  
  <table width="200" border="0">
    <tr>
      <td><label for="Cod">Cod</label>
     </td>
      <td> <input name="Cod" type="text" id="Cod" size="30" value="${sessionScope.Itens.cod}" placeholder="Codigo é automatico"></td>
    </tr>
    <tr>
     <tr>
    <td>
     <label for="comboProd">Produto</label></td><td>
     <select name="comboProd" id="comboProd" >
  
    
  
    <%
    ControleHQs cHQ = ControleHQs.getInstance();
    List<HQ> lista = cHQ.listar(1);
    		 for (int i=0; i < lista.size(); i++){
 				HQ hq  = lista.get(i);
    
    %>
    
     <option value="<%= hq.getCodigo() %>">
						<%= hq.getTitulo() %></option>
				
						
				
				<%	}// fim do for	%>
	<option selected>${sessionScope.Itens.hq.titulo}			
				
    
     </select></td>
    </tr>

    <tr>
      <td><label for="qtd">Quantidade:</label>
     </td>
      <td> <input name="qtd" type="text"  id="qtd" size="30" value="${sessionScope.Itens.qtd}"placeholder="Quantidade"></td>
    </tr>
    <tr>
      <td><label for="valor">Venda</label>
     </td>
      <td> <input name="venda" type="text"  id="venda" size="30" value="${sessionScope.Venda.codVenda}" placeholder="venda"></td>
    </tr>
    
  <p>
    <input type="submit" name="btn" id="btn" value="Incluir">  <input type="submit" name="btn" id="btn" value="Efetuar Venda"> <input type="submit" name="btn" id="btn" value="Limpar">   
           <br>
</p>
</form>

<h1 >${sessionScope.p}</h1>
</center>
</body>
</html>