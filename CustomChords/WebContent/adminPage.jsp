
<%
	Utente u = (Utente) session.getAttribute("utente");
	if (u == null || !u.getAdmin()) {
		response.sendRedirect("index.jsp");
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.RequestDispatcher "%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pagina amministratore</title>
</head>
<body >
<h3> Pagina amministratore</h3> <br>
<a href="insertProductAdminPage.jsp">Inserisci prodotto</a> <br> <br>
<a href="modifyAndDeleteListServlet">Cancella/modifica prodotti</a> <br> <br>
<a href="visualizeOrdersServlet">Visualizza ordini</a> <br> <br>


</body>
</html>