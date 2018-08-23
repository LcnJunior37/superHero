<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Venda</title>
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
<h2> Venda</h2>
 <center><form name="form1" method="post" action="ActionVenda.jsp">

  
  <table width="200" border="0">
    <tr>
      <td><label for="Cod">Codigo Venda:</label>
     </td>
      <td> <input name="Cod" type="text" id="Cod" size="30" value="${sessionScope.Venda.codVenda}" placeholder="Codigo é automatico"></td>
    </tr>
    <tr>
      <td><label for="data">Data</label>
     </td>
      <td> <input name="data" type="date"  id="data" size="30" value="${sessionScope.Venda.data}"placeholder="Titulo do HQ"></td>
    </tr>
    <tr>
    
      
  </table>
  
  <p>
    <input type="submit" name="btn" id="btn" value="Inciar_Venda">  
        
          <input type="submit" name="btn" id="btn" value="Limpar">   
         
			
</p>
</form></center>