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
        <title>CustomChords - Strumenti Musicali Personalizzati </title>
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
		// Carrello carrello = (Carrello) session.getAttribute("cart"); NON SERVE PERCHE GIA ISTANZIATO NELL'HEADER
		if (carrello != null) {
	%>
	
	<!-- SECTION -->
<div class="section">
  <!-- container -->
  <div class="container">
   
      <!-- Order Details -->
      <div class="col-md-auto order-details">
        <div class="section-title text-center">
          <h3 class="title">Il tuo Carrello</h3>
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
                <div class="cart-img">
                    <img src="./img/<%=i.getItem().getId()%>.jpg" alt="">
                  </div>
              <div><a href="ProductServlet?prodotto=<%=i.getItem().getId()%>"><%=i.getItem().getNome()%></a></div>
              
              <div> <a href onclick="deleteEvent('<%=i.getItem().getId()%>')" > <i class="fa fa-times" aria-hidden="true"></i> </a> </div>
                
              <div> <input type="number" class="qnt-cart" id="<%=i.getItem().getId() %>-qnt" onchange="changeAmountEvent('<%=i.getItem().getId()%>')" min=1 max=10
					value=<%=i.getQuantita()%>> </div>
              <div>&#8364;<%=i.getItem().getPrezzo()%></div>
        	</div>
        </div>
	
		
		<%
			}
		%>
		
		
		<div class="order-col">
            <div><strong>TOTALE</strong></div>
            <div><strong class="order-total">&#8364;<%=carrello.getTotPrezzo()%></strong> </br> <i><light>IVA COMPRESA NEL PREZZO</light></i> </div>
            <% Utente u = (Utente) session.getAttribute("utente");	%>
								<% 
								if(u!=null){
								%>
          </div>        
          <a href="checkout.jsp" class="primary-btn order-submit">Vai alla Cassa</a>
        </div>
        						<%	} 
								else { %>
			</div>        
          	<a href="account.jsp" class="primary-btn order-submit">Accedi al tuo account per acquistare</a>
        	</div>				<%	} 	%>
								
								
								
             <!-- /Order Details -->
    	</div>
    		<!-- /row -->
  	</div>
  <!-- /container -->

	
	
	<%
		} else {
	%>
	<div class="container">
	<br> <br> <h1>Carrello vuoto</h1> <br><br><br><br><br>
	</div>
	<%
		}
	%>
	</div>
<!-- /SECTION -->
	
	<div class="container">
	<div class = "return-cart">	 <a href="index.jsp" class="title"><i class="fa fa-arrow-left"></i> Ritorna al catalogo</a> </div>
	</div>
	
	
	
	
	      <!-- FOOTER -->
<%@ include file="../fragments/footer.jsp" %>


<!-- jQuery Plugins -->

<%@ include file="../fragments/scripts.jsp" %>
	<script>
		function deleteEvent(idItem) {
			url = "deleteProductServlet?id=" + idItem;
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					location.reload();
				}
			}
			xhr.open('GET', url, true);
			xhr.send();

		}
		
		function changeAmountEvent(idItem) {
			var b = "#" + idItem + "-qnt";
			var qnt = $(b).val();
			url = "changeAmountProductServlet?id=" + idItem + "&quantita=" + qnt;
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					location.reload();
				}
			}
			xhr.open('GET', url, true);
			xhr.send();

		}
		
	</script>
</body>
</html>