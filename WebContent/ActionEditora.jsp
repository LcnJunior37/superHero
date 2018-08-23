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
<body>
<%
String botaoValue = request.getParameter("btn");
String titulo = request.getParameter("txtNome");
String codigo = request.getParameter("cod");
try {
	if (!botaoValue.equals("Listar")
			&& !botaoValue.equals("Limpar")&& !botaoValue.equals("Incluir")) {
		if (codigo== null || codigo.equals("")) {
			throw new Exception("codigo deve ser preenchida.");
		}
	}
	if (botaoValue.equals("Incluir")
			|| botaoValue.equals("Alterar")) {
		if (titulo == null || titulo.equals("")) {
			throw new Exception("Nome deve ser preenchido.");
		}

		
	}

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

	if (botaoValue.equals("Alterar")) {
		Editora edi = new Editora();
		edi.setCodEditora(Integer.parseInt(codigo));
		edi.setNomeEditora(titulo);
		
		session.setAttribute("Editora",edi);
		

		controleEditora.alterar(edi);
		
		session.setAttribute("msg", "Alteração Ok.");
		response.sendRedirect("TelaMensagem.jsp");
	}

	if (botaoValue.equals("Excluir")) {
		Editora edi = new Editora();
		int cod = Integer.parseInt(codigo);
		session.setAttribute("Editora",edi);

		controleEditora.excluir(cod);
		session.setAttribute("msg", "Exclusão Ok.");
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

	if (botaoValue.equals("Listar")) {
		List<Editora> Editoras = null;
		int ordenacao = 1;
		Editoras = controleEditora .listar(ordenacao);
		if (Editoras != null) {
			session.setAttribute("Editoras", Editoras);
			response.sendRedirect("TelaListagemEdi.jsp");
		} else {
			session.setAttribute("Editoras", null);
			throw new Exception("Não há Editoras cadastradas.");
		}
	}if (botaoValue.equals("Limpar")) {
		session.setAttribute("Editora", null);
		response.sendRedirect("TelaCadastrarEditora.jsp");
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