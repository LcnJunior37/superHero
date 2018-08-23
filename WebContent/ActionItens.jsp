<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="modelo.Itens"%>
       <%@ page import="modelo.Venda"%>
    <%@ page import="java.util.List"%>
    <%@ page import="controle.ControleItens"%>
     <%@ page import="controle.ControleVenda"%>
        <%@ page import="controle.ControleHQs"%>
                <%@ page import="controle.ControleEstoque"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String botaoValue = request.getParameter("btn");
String cod = request.getParameter("Cod");
String combo = request.getParameter("comboProd");
String codigo = request.getParameter("Cod");
String ve = request.getParameter("venda");
String qtd = request.getParameter("qtd");
try {
	
	if (botaoValue.equals("Incluir")
			) {
		if (combo== null || combo.equals("")) {
			throw new Exception("data deve ser preenchido.");
		}

		
	}

	ControleVenda controle = ControleVenda.venda();
	ControleItens controleI = ControleItens.Itens();
	ControleHQs cHQ = ControleHQs.getInstance();
	ControleEstoque  cEst= ControleEstoque.Estoque();
	

	if (botaoValue.equals("Incluir")) {
		Venda Venda = new Venda();
		
		
		
		Venda = controle.Venda(Integer.parseInt(ve));
		Itens  I = new Itens();
		I.setCod(Integer.parseInt(cod));
		I.setHq(cHQ.consultar(Integer.parseInt(combo)));
		I.setVenda(Venda);
		I.setQtd(Integer.parseInt(qtd));
		boolean acabou =cEst.at(I.getHq().getCodigo(), I.getQtd());
		if(!(acabou)){
			session.setAttribute("p","Estoque Baixo" );
		}
		
		controleI.incluir(I);
		
		session.setAttribute("Venda",Venda);
		session.setAttribute("itens",Venda);
		

		
		//out.print("Servidor: Inclusão Ok.");
		//session.setAttribute("msg", "Inclusão Ok.");
		response.sendRedirect("TelaIten.jsp");
	

	

	
	}if (botaoValue.equals("Efetuar Venda")) {
		Venda venda = controle.Venda(Integer.parseInt(ve));
		List<Itens>  lista = controleI.listarPorVenda(venda.getCodVenda());
		
		session.setAttribute("Venda",venda);
		session.setAttribute("lista",lista);
		response.sendRedirect("Fim.jsp");
	}

		
		} catch (Exception ex) {
	session.setAttribute("msg", "Atenção: " + ex.getMessage());
	response.sendRedirect("TelaMensagem.jsp");
		}
%>