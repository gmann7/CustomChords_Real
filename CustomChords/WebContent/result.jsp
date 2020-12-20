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
					ArrayList<Prodotto> lista = (ArrayList<Prodotto>) request.getAttribute("list");
				%>

<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
				
				
				<!-- STORE -->
					<div id="store" class="col-md-12">


						<!-- store products -->
						<div class="row">
						
						
				
				<% if(lista.size()>0){
				%>
				
				
		<% //for (Prodotto p : lista)
			 for (int i=0; i<lista.size(); i++) {
				 Prodotto p = lista.get(i);
		%>
		
							<%if ((i % 4) == 0){%>
								<!-- /product -->
								<div class="clearfix visible-sm visible-xs"></div>
							<%  }%>
							
							
							
			<!-- product -->
							<div class="col-md-3 col-xs-6">
								<div class="product">
									<div class="product-img">
									<img id="<%=p.getId()%>" src="./img/<%=p.getId()%>.jpg" onclick="openProduct('<%=p.getId()%>')" >										
									</div>
									<div class="product-body">
										<p class="product-category"><%=p.getCategoria()%></p>
										<h3 class="product-name"><a href="ProductServlet?prodotto=<%= p.getId()%>"><%=p.getNome()%></a></h3>
										<h4 class="product-price">&#8364;<%=p.getPrezzo()%></h4>

									</div>
									<div class="add-to-cart">
										<button id="<%=p.getId()%>" class="add-to-cart-btn" onclick="sendProduct('<%=p.getId()%>')"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
									</div>
								</div>
							</div> 
							
							
							
							
							

	<%
		}
		
	%>
	
	<% }		else{ %>
	
	<div class="container">
	<br> <br> <h1> Nessun Risultato Trovato</h1> <br><br><br><br><br>
	</div>
	
	<%} %>
	
						</div>
						<!-- /store products -->
					
					</div>
					<!-- /STORE -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
	
	
	
	
	
	
	
	<div class="container">
	<div class = "return-cart">	 <a href="index.jsp" class="title"><i class="fa fa-arrow-left"></i> Ritorna alla Home Page</a> </div>
	</div>
	
	
	
	
	
	
	     <!-- FOOTER -->
<%@ include file="../fragments/footer.jsp" %>


<!-- jQuery Plugins -->

<%@ include file="../fragments/scripts.jsp" %>
	<script>
	
	function openProduct(id){
		url = "ProductServlet?prodotto=" + id;
		window.location.href = url;
	}
	
	
function sendProduct(id) {
		url = "addProductServlet?id=" + id;
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				alert("Prodotto aggiunto con successo");
			}
		}
		xhr.open('GET', url, true);
		xhr.send();

	}
	</script>
	

	
</body>
</html>