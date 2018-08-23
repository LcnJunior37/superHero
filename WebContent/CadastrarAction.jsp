<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="controle.ControleHQs"%>
<%@ page import="controle.ControleEditora"%>
<%@ page import="modelo.HQ"%>
<%@ page import="modelo.Editora"%>
<%@ page import="java.util.List"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String botaoValue = request.getParameter("btn");
		String titulo = request.getParameter("titulo");
		String codigo = request.getParameter("Cod");
		String edi = request.getParameter("numEd");
		String valor = request.getParameter("valor");
		String lancamento = request.getParameter("lanc");
		String e = request.getParameter("comboEdi");
			try {
		if (!botaoValue.equals("Listar")
				&& !botaoValue.equals("Limpar")&& !botaoValue.equals("Incluir")) {
			if (codigo== null || codigo.equals("")) {
				throw new Exception("codigo deve ser preenchida.");
			}
		}
		if (botaoValue.equals("Incluir")
				) {
			if (titulo == null || titulo.equals("")) {
				throw new Exception("titulo deve ser preenchido.");
			}

			if (valor == null || valor.equals("")) {
				throw new Exception(" valor deve ser preenchida");
			}
			if (e == null || e.equals("")) {
				throw new Exception(" Edição deve ser preenchida");
			}

			if (lancamento == null || lancamento.equals("")) {
				throw new Exception("O Lançamento deve ser preenchida");
			}
		}

		ControleHQs controleHQs = ControleHQs.getInstance();

		if (botaoValue.equals("Incluir")) {
			HQ hq = new HQ();
			Editora edit = new Editora();
			ControleEditora cE = ControleEditora.Editora();
			edit=cE.consultar(Integer.parseInt(e));
			
			hq.setEdicao(Integer.parseInt(edi));
			hq.setTitulo(titulo);
			hq.setValor(Double.parseDouble(valor.replace(",", ".")));
			hq.setEdi(edit);
			hq.setLancamento(Integer.parseInt(lancamento));
		
			session.setAttribute("hq", hq);
			

			controleHQs.incluir(hq);
			session.setAttribute("msg", "Inclusão Ok.");
			out.print("Servidor: Inclusão Ok.");
			response.sendRedirect("TelaMensagem.jsp");
		}

		if (botaoValue.equals("Alterar")) {
		
			HQ hq = new HQ();
			Editora edit = new Editora();
			ControleEditora cE = ControleEditora.Editora();
			edit = cE.consultarString(e);
					
			hq.setCodigo(Integer.parseInt(codigo));
			hq.setEdicao(Integer.parseInt(edi));
			hq.setTitulo(titulo);
			hq.setValor(Double.parseDouble(valor.replace(",", ".")));
			hq.setEdi(edit);
			hq.setLancamento(Integer.parseInt(lancamento));
		
			session.setAttribute("hq", hq);
			

			controleHQs.alterar(hq);
			session.setAttribute("msg", "Alteração Ok.");
			response.sendRedirect("TelaMensagem.jsp");
		}

		if (botaoValue.equals("Excluir")) {
			HQ hq = new HQ();
			int cod = Integer.parseInt(codigo);
			session.setAttribute("hq", hq);

			controleHQs.excluir(cod);
			session.setAttribute("msg", "Exclusão Ok.");
			response.sendRedirect("TelaMensagem.jsp");
		}

		if (botaoValue.equals("Consultar")) {
			HQ hq = null;
			hq = controleHQs
					.consultar(Integer.parseInt(codigo));
			
			if (hq != null) {
				session.setAttribute("hq", hq);
				session.setAttribute("edi", hq.getEdi().getCodEditora());
				//out.print("," + hq.getCodigo() + "," + hq.getTitulo() + ","
					//	  +hq.getValor() + ","
						 // + hq.getLancamento() + "," + hq.getEdicao() + ",");
				response.sendRedirect("TelaCadastrar.jsp");
			} else {
				session.setAttribute("hq", null);
				throw new Exception(" HQ não cadastrado.");
			}
		}

		if (botaoValue.equals("Listar")) {
			List<HQ> hqs = null;
			int ordenacao = 1;
			hqs = controleHQs.listar(ordenacao);
			if (hqs != null) {
				session.setAttribute("hqs", hqs);
				response.sendRedirect("TelaListagem.jsp");
			} else {
				session.setAttribute("hqs", null);
				throw new Exception("Não há HQs cadastrados.");
			}
		}if (botaoValue.equals("Limpar")) {
			session.setAttribute("hq", null);
			response.sendRedirect("TelaCadastrar.jsp");
		}

			} catch (NumberFormatException ex) {
		session.setAttribute("msg", "Digite apenas números. nos campos: Codigo, Lançamento, Valor e Edição ");
		response.sendRedirect("TelaMensagem.jsp");
			} catch (Exception ex) {
		session.setAttribute("msg", "Atenção: " + ex.getMessage());
		response.sendRedirect("TelaMensagem.jsp");
			}
	%>

</body>
</html>