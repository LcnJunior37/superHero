<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="modelo.Estoque"%>
    <%@ page import="modelo.HQ"%>
    <%@ page import="java.util.List"%>
    <%@ page import="controle.ControleEstoque"%>
     <%@ page import="controle.ControleHQs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String botaoValue = request.getParameter("btn");
String qtd = request.getParameter("txtqtd");
String q_m = request.getParameter("txtqtd_min");
String HQ =  request.getParameter("combo");
String codigo = request.getParameter("cod");

try {
	if (!botaoValue.equals("Listar")
			&& !botaoValue.equals("Limpar")&& !botaoValue.equals("Incluir")) {
		if (codigo== null || codigo.equals("") || Integer.parseInt(codigo) <=0 ) {
			throw new Exception("codigo deve ser preenchida.");
		}
	}
	if (botaoValue.equals("Incluir")
			|| botaoValue.equals("Alterar")) {
		if (qtd == null || qtd.equals("")|| Integer.parseInt(qtd)<=0) {
			throw new Exception("quantidade deve ser preenchido. e maior que zero");
		}
		if (q_m == null || q_m.equals("")|| Integer.parseInt(q_m)<=0) {
			throw new Exception("quantidade minima deve ser preenchido. e maior que zero");
		}
		if ( HQ== null || HQ.equals("")|| Integer.parseInt(HQ)<=0) {
			throw new Exception("Hq  deve ser selecionado. ");
		}

		
	}

	ControleEstoque controleEstoque = ControleEstoque.Estoque();

	if (botaoValue.equals("Incluir")) {
		Estoque est = new Estoque();
		
		est.setQtd(Integer.parseInt(qtd));
		est.setQtd_min(Integer.parseInt(q_m));		
		ControleHQs cH = ControleHQs.getInstance();
		HQ hq = cH.consultar(Integer.parseInt(HQ));
		est.setHq(hq);
		
		boolean resp = controleEstoque.incluir(est);
		session.setAttribute("Estoque",est);
		if(resp){
		
		session.setAttribute("msg", "Inclusão Ok.");
		}else{
			
			session.setAttribute("msg", "Este produto já pertence a um estoque.");
		}
		response.sendRedirect("TelaMensagem.jsp");
	}

	if (botaoValue.equals("Alterar")) {
		Estoque est = new Estoque();
		
		est.setCodEst(Integer.parseInt(codigo));
		est.setQtd(Integer.parseInt(qtd));
		est.setQtd_min(Integer.parseInt(q_m));
		ControleHQs cH = ControleHQs.getInstance();
		
		HQ hq = cH.consultar(Integer.parseInt(HQ));
		est.setHq(hq);
	
		controleEstoque.alterar(est);
	
		session.setAttribute("Estoque",est);
		
		
		session.setAttribute("msg", "Alteração Ok. '<br/>' Obs. Só é permitido alterar a Quantidade ea Quantidade Minima o estoque");
		response.sendRedirect("TelaMensagem.jsp");
	}

	if (botaoValue.equals("Excluir")) {
		Estoque est = new Estoque();
		int cod = Integer.parseInt(codigo);
		session.setAttribute("Estoque",est);

		controleEstoque.excluir(cod);
		session.setAttribute("msg", "Exclusão Ok.");
		response.sendRedirect("TelaMensagem.jsp");
	}

	if (botaoValue.equals("Consultar")) {
		Estoque est = null;
		est = controleEstoque
				.consultar(Integer.parseInt(codigo));
		if (est != null) {
			session.setAttribute("Estoque", est);
			response.sendRedirect("TelaEstoque.jsp");
		} else {
			session.setAttribute("Estoque", null);
			throw new Exception(" Estoque não cadastrado.");
		}
	}

	
	if (botaoValue.equals("Limpar")) {
		session.setAttribute("Estoque", null);
		response.sendRedirect("TelaEstoque.jsp");
	}

		} catch (NumberFormatException ex) {
	session.setAttribute("msg", "Digite apenas números.  ");
	response.sendRedirect("TelaMensagem.jsp");
		} catch (Exception ex) {
	session.setAttribute("msg", "Atenção: " + ex.getMessage());
	response.sendRedirect("TelaMensagem.jsp");
		}
%>
</body>
</html>