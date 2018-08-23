<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="modelo.Editora"%>
    <%@ page import="java.util.List"%>
    <%@ page import="controle.ControleEditora"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%
String botaoValue = request.getParameter("btn");
String titulo = request.getParameter("txtNome");
String codigo = request.getParameter("cod");
try {
	ControleEditora controleEditora = ControleEditora.Editora();
 if (botaoValue.equals("Incluir")) {
		Editora edi = new Editora();
		
		edi.setNomeEditora(titulo);
		
		session.setAttribute("Editora",edi);
		
		
		controleEditora.incluir(edi);
		out.print("Servidor: Inclusão Ok.");
		session.setAttribute("msg", "Inclusão Ok.");
		response.sendRedirect("TelaMensagem.jsp");
	}
	if (botaoValue.equals("Consultar")) {
		Editora  edi = null;
		edi = controleEditora
				.consultar(Integer.parseInt(codigo));
		if (edi != null) {
			out.print("," +edi.getCodEditora() + "," + edi.getNomeEditora()  + ","
					);
			session.setAttribute("Editora", edi);
			
			response.sendRedirect("TelaCadastrarEditora.jsp");
		} else {
			session.setAttribute("Editora", null);
			throw new Exception(" Editora não cadastrado.");
		}
	}
	} catch (NumberFormatException ex) {
	session.setAttribute("msg", "Digite apenas números. nos campos: Codigo ");
	response.sendRedirect("TelaMensagem.jsp");
		} catch (Exception ex) {
	session.setAttribute("msg", "Atenção: " + ex.getMessage());
	response.sendRedirect("TelaMensagem.jsp");
		}
%>

</body>
</html>