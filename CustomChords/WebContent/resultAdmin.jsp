
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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Modifica e Cancella Prodotti </title>
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
<body >
<!-- HEADER -->
		<%@ include file="../fragments/header.jsp" %>

        <!-- NAVIGATION -->
        <%@ include file="../fragments/menu.jsp" %>
        <!-- /NAVIGATION -->
        <!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
			<!-- row -->
				<div class="row">
				
							<div class="section-title">
						<h3 class="title">Lista di prodotti presenti sul sito</h3>
							</div> 
	<%
		ArrayList<Prodotto> lista = (ArrayList<Prodotto>) request.getAttribute("list");
	%>
	<%
		if (lista.size() > 0) {
	%>
	<table class="main-table" border="1">
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Categoria</th>
			<th>Sottocategoria</th>
			<th>Quantita</th>
			<th>Prezzo</th>
			<th>Vetrina</th>
			<th>Iva</th>
			<th>Modifica</th>
			<th>Elimina</th>

		</tr>

		<%
			for (Prodotto p : lista) {
		%>

		<tr>
			<td><%=p.getId()%></td>
			<td><%=p.getNome()%></td>
			<td><%=p.getDescrizione()%></td>
			<td><%=p.getCategoria()%></td>
			<td><%=p.getSottoCategoria()%></td>
			<td><%=p.getQuantitaDisponibile()%></td>
			<td><%=p.getPrezzo()%></td>
			<td><%=p.isVetrina()%></td>
			<td><%=p.getIva()%></td>
			<td>
				<button onclick="modifyProduct('<%=p.getId()%>')">Modifica</button>
			</td>
			<td>
				<button onclick="deleteProduct('<%=p.getId()%>')">X</button>
			</td>
		</tr>

		<%
			}
		%>

	</table>
	<%
		} else {
	%>
	<h1>Nessun risultato trovato</h1>
	<%
		}
	%>
	
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


	<script>
		function deleteProduct(idItem) {
			var sure = confirm("Sicuro di voler cancellare il prodotto dal catalogo");
			if (sure == true) {
				url = "modifyAndDeleteServlet?id=" + idItem + "&op=cancel";
				var xhr = new XMLHttpRequest();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						location.reload();
					}
				}
				xhr.open('GET', url, true);
				xhr.send();
			}

		}

		function modifyProduct(idItem) {
			var sure = confirm("Sicuro di voler modificare il prodotto "
					+ idItem + "?");
			if (sure == true) {
				window.location.replace("modifyAndDeleteServlet?id=" + idItem + "&op=modify");
			}

		}
	</script>
</body>
</html>