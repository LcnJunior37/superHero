<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="modelo.Editora"%>
	<%@ page import="controle.ControleEditora"%>
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
<h2> Cadastrar</h2>
 <center><form name="form1" method="post" action="CadastrarAction.jsp">

  
  <table width="200" border="0">
    <tr>
      <td><label for="Cod">Codigo:</label>
     </td>
      <td> <input name="Cod" type="text" id="Cod" size="30" value="${sessionScope.hq.codigo}" placeholder="Codigo é automatico"></td>
    </tr>
    <tr>
      <td><label for="titulo">Titulo:</label>
     </td>
      <td> <input name="titulo" type="text"  id="titulo" size="30" value="${sessionScope.hq.titulo}"placeholder="Titulo do HQ"></td>
    </tr>
    <tr>
      <td><label for="numEd">Edição:</label>
     </td>
      <td> <input name="numEd" type="text"  id="numEd" size="30" value="${sessionScope.hq.edicao}"placeholder="Numero da edição"></td>
    </tr>
    <tr>
      <td><label for="valor">Valor:</label>
     </td>
      <td> <input name="valor" type="text"  id="valor" size="30" value="${sessionScope.hq.valor}" placeholder="Valor do Produto"></td>
    </tr>
    <tr>
       <td><label for="">Laçamento:</label>
     </td>
       <td> <input name="lanc" type="text"  id="lanc" size="30" value="${sessionScope.hq.lancamento}"placeholder="Ano de Lançamento"></td>
    </tr>
    <tr>
    <td>
     <label for="comboEdi">Editora</label></td><td>
     <select name="comboEdi" id="comboEdi" >
  
    <%
    ControleEditora cEd = ControleEditora.Editora();
    List<Editora> lista = cEd.listar(1);
    		 for (int i=0; i < lista.size(); i++){
 				Editora ed = lista.get(i);
    
    %>
    
     <option value="<%= ed.getCodEditora() %>">
						<%= ed.getNomeEditora()%></option>
				
						
				
				<%	}// fim do for	%>
	<option selected>${sessionScope.hq.edi.nomeEditora}			
				
    
     </select></td>
    </tr>
    
      
  </table>
  
  <p>
    <input type="submit" name="btn" id="btn" value="Incluir">  <input type="submit" name="btn" id="btn" value="Excluir">
      <input type="submit" name="btn" id="btn" value="Alterar">
        <input type="submit" name="btn" id="btn" value="Consultar">
          <input type="submit" name="btn" id="btn" value="Limpar">   <input type="submit" name="btn" id="btn" value="Listar">
           <br><a href="index.html">Retornar Home
			</a>
</p>
</form></center>
</body>
</html>