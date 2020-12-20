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
<html lang="en">
	<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Checkout </title>
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
<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-7">
						<!-- Billing Details -->
						<div class="section-title">
								<h3 class="title">Dati di Spedizione</h3>
							</div>
							<form action="checkoutServlet" method="post" name="checkoutForm" id="checkoutForm">
							<div class="form-group">																					
								<input class="input" type="text"
							name="cittaspedizione" id="cittaspedizione" placeholder="Città di Spedizione"> <span
							class="errorMsg" id="errorCittaSpedizione"></span>
							</div>
							
							
							<div class="form-group">
								 <input class="input" type="text"
							name="indirizzospedizione" id="indirizzospedizione" placeholder="Indirizzo di Spedizione"> <span
							class="errorMsg" id="errorIndirizzoSpedizione"></span>
							</div>
							<div class="form-group">
							<input class="input" type="text"
							name="carta" id="carta" placeholder="Numero Carta"> <span class="errorMsg"
							id="errorCarta"></span>
							</div>					
							<button class="primary-btn order-submit" type="reset" id="resetButton">Reset</button>
							<button class="primary-btn order-submit" id="checkoutForm" type="button" onclick="checkOutData()">Conferma Ordine</button> 
							</form>
		</div>
		
			<!-- Order Details -->
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Il tuo Ordine</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>PRODOTTO</strong></div>
								<div><strong>TOTALE</strong></div>
							</div>

		<%
			ArrayList<ItemCarrello> carr = carrello.getCart();

				for (ItemCarrello i : carr) {
		%>
		<div class="order-products">
								<div class="order-col">
									<div><%=i.getQuantita()%>x<%=i.getItem().getNome()%></div>
									<div>&#8364;<%=i.getQuantita() * i.getItem().getPrezzo()%></div>
								</div>


		<%
			}
		%>
		
								</div>
								<div class="order-col">
								<div><strong>TOTALE</strong></div>
								<div><strong class="order-total">&#8364;<%=carrello.getTotPrezzo()%></strong></div>
							</div>
							</div>				
					
					</div>
					<!-- /Order Details -->
					
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

	
	
	<!-- jQuery Plugins -->

<%@ include file="../fragments/scripts.jsp" %>
    
	
	
	
	
	
	

	<script>
		function checkOutData() {
			$(".errorMsg").empty();

			var citta = $("#cittaspedizione").val();
			var indirizzo = $("#indirizzospedizione").val();
			var carta = $("#carta").val();

			if ((citta != null && citta != "")
					&& (indirizzo != null && indirizzo != "")
					&& (carta != null && carta != "")) {
				$("#checkoutForm").submit();
			} else {
				if (citta == null || citta == "") {
					$("#errorCittaSpedizione").html("Città non valida");
				}
				if (indirizzo == null || indirizzo == "") {
					$("#errorIndirizzoSpedizione").html("Indirizzo non valido");
				}
				if (carta == null || carta == "") {
					$("#errorCarta").html("Carta non valida");
				}

			}
		}
	</script>
</body>
</html>
