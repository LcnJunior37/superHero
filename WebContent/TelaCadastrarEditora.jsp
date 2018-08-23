<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
   <form name="form1" method="post" action="ActionEditora.jsp"
   >
     <table width="200" border="0">
       <tr>
         <td><label for="">Codigo:</label></td>
         <td><input name="cod" type="text" value="${sessionScope.Editora.codEditora}"></td>
       </tr>
       <tr>
         <td><label for="">Nome</label></td>
         <td><input name="txtNome" type="text" value="${sessionScope.Editora.nomeEditora}"></td>
       </tr>
     </table>
     <p> <input type="submit" name="btn" id="btn" value="Incluir">  <input type="submit" name="btn" id="btn" value="Excluir">
      <input type="submit" name="btn" id="btn" value="Alterar">
        <input type="submit" name="btn" id="btn" value="Consultar">
          <input type="submit" name="btn" id="btn" value="Limpar">   <input type="submit" name="btn" id="btn" value="Listar"></p>
   </form>
 </center>
 <a href="index.html">Retornar Home
			</a>
</body>
</html>