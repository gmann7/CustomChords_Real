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
					Prodotto p = (Prodotto) request.getAttribute("prodotto");
				%>
		
		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
				
				<% if(p!=null){
				%>
				
				<!-- Product main img -->
					<div class="col-md-5 col-md-push-2">
						<div id="product-main-img">
							<div class="product-preview">
								<img src="./img/<%=p.getId()%>.jpg" alt="">
							</div>

							<div class="product-preview">
								<img src="./img/<%=p.getId()%>_02.jpg" alt="">
							</div>

							<div class="product-preview">
								<img src="./img/<%=p.getId()%>_03.jpg" alt="">
							</div>

							<div class="product-preview">
								<img src="./img/<%=p.getId()%>_04.jpg" alt="">
							</div>
						</div>
					</div>
					<!-- /Product main img -->
					
					<!-- Product thumb imgs -->
					<div class="col-md-2  col-md-pull-5">
						<div id="product-imgs">
							<div class="product-preview">
								<img src="./img/<%=p.getId()%>.jpg" alt="">
							</div>

							<div class="product-preview">
								<img src="./img/<%=p.getId()%>_02.jpg" alt="">
							</div>

							<div class="product-preview">
								<img src="./img/<%=p.getId()%>_03.jpg" alt="">
							</div>

							<div class="product-preview">
								<img src="./img/p<%=p.getId()%>_04.jpg" alt="">
							</div>
						</div>
					</div>
					<!-- /Product thumb imgs -->
				
				
				<!-- Product details -->
					<div class="col-md-5">
						<div class="product-details">
							<h2 class="product-name"><%=p.getNome()%></h2>

							<div>
								<h3 class="product-price">&#8364;<%=p.getPrezzo()%></h3>
								<span class="product-available">In Stock</span>
							</div>
							<p><%=p.getDescrizione()%>.</p>


							<div class="add-to-cart">													
								<button class="add-to-cart-btn id="<%=p.getId()%>" onclick="sendProduct('<%=p.getId()%>')"><i class="fa fa-shopping-cart"></i> add to cart</button>
							</div>

						</div>
					</div>
					<!-- /Product details -->
				
				
				
				
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>

				
				
				
				
				
				
				<% }	%>
				
				
	
	
	
	     <!-- FOOTER -->
<%@ include file="../fragments/footer.jsp" %>


<!-- jQuery Plugins -->

<%@ include file="../fragments/scripts.jsp" %>
	<script>
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