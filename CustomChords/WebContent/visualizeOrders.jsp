
<%
	Utente u = (Utente) session.getAttribute("utente");
	if (u == null || !u.getAdmin()) {
		response.sendRedirect("index.jsp");
	}
%>

<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Visualizzazione Ordini Clienti </title>
        <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon">
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    
        <!-- Slick [per NEW PRODUCTS] -->
		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        
        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
    </head>


<body>



<!-- HEADER -->
		<%@ include file="../fragments/header.jsp" %>

        <!-- NAVIGATION -->
        <%@ include file="../fragments/menu.jsp" %>
        <!-- /NAVIGATION -->
        
        
	<%
		ArrayList<String> listaClienti = (ArrayList<String>) request.getAttribute("listaclienti");
	%>
	
	<div class="section">
			<!-- container -->
			<div class="container">
			<!-- row -->
				<div class="row">

					<div class="col-md-7">
		
		<fieldset>
						<div class="section-title">
						<h3 class="title">Ricerca per Cliente</h3>
						</div>
		<form action="ricercaPerClienteServlet" method="post"
			name="ricercaperclienteForm">
			<select class="input" name="emailcliente">
				<%
					for (String s : listaClienti) {
				%>
				<option value='<%=s%>'><%=s%>
				</option>
				<%
					}
				%>
			</select> <input class="primary-btn" type="submit">
		</form>
	</fieldset>
	
	
	<fieldset>
						<div class="section-title">
						<h3 class="title">Ricerca in un lasso di tempo</h3>
						</div>
		<form action="ricercaPerDataServlet" method="post"
			name="ricercaperdataForm">
			<label>Dal: <input class="input" name="dallaData" type="date"> </label> <br> 
			<label>Fino al: <input class="input" name="finoallaData" type="date"></label><br> 
			<input class="primary-btn" type="submit">
		</form>
	</fieldset>
	
	<fieldset>
						<div class="section-title">
						<h3 class="title">Visualizza tutti gli Ordini</h3>
						</div>
		<form action="stampaOrdiniServlet" method="post" name="allordersForm">
			<input class="primary-btn" type="submit">
		</form>
	</fieldset>
	
					</div>
		
			
			
			
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->			
	
<!-- FOOTER -->
<%@ include file="../fragments/footer.jsp" %>

    
<!-- jQuery Plugins -->

<%@ include file="../fragments/scripts.jsp" %>


</body>
</html>