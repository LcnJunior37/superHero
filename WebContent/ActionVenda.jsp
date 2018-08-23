<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="modelo.Venda"%>
    <%@ page import="java.util.List"%>
    <%@ page import="controle.ControleVenda"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String botaoValue = request.getParameter("btn");
String data = request.getParameter("data");
String codigo = request.getParameter("cod");
try {
	ControleVenda controle = ControleVenda.venda();
	if (botaoValue.equals("Incluir_Venda"))
			 {
		if (data == null || data.equals("")) {
			throw new Exception("data deve ser preenchido.");
		}

		
	}

	

	if (botaoValue.equals("Inciar_Venda")) {
		Venda Venda = new Venda();
		
		Venda.setData(data);
		
		session.setAttribute("Venda",Venda);
		

		controle.incluir(Venda);
		//out.print("Servidor: Inclusão Ok.");
		//session.setAttribute("msg", "Inclusão Ok.");
		response.sendRedirect("TelaItem.jsp");
	

	

	
	}if (botaoValue.equals("Limpar")) {
		session.setAttribute("Venda", null);
		response.sendRedirect("index.html");
	}

		
		} catch (Exception ex) {
	session.setAttribute("msg", "Atenção: " + ex.getMessage());
	response.sendRedirect("TelaMensagem.jsp");
		}
%>
</body>
</html>