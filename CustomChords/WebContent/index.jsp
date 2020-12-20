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
    
    
<body >
 <!-- HEADER -->
		<%@ include file="../fragments/header.jsp" %>

        <!-- NAVIGATION -->
        <%@ include file="../fragments/menu.jsp" %>
        <!-- /NAVIGATION -->
		<!-- CATEGORIE PRINCIPALI -->
		    <!-- SECTION -->
		<div class="section">
        <!-- container -->
        <div class="container">
          <!-- row -->
          <div class="row">
            <!-- shop -->
            <div class="col-md-4 col-xs-6">
              <div class="shop">
                <div class="shop-img">
                  <img src="./img/shop01.png" alt="">
                </div>
                <div class="shop-body">
                  <h3>Chitarre</h3>
                  <a href="categoriaServlet?categ=chitarra" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                </div>
              </div>
            </div>
            <!-- /shop -->
  
            <!-- shop -->
            <div class="col-md-4 col-xs-6">
              <div class="shop">
                <div class="shop-img">
                  <img src="./img/shop03.png" alt="">
                </div>
                <div class="shop-body">
                  <h3>Tastiere</h3>
                  <a href="categoriaServlet?categ=tastiera" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                </div>
              </div>
            </div>
            <!-- /shop -->
  
            <!-- shop -->
            <div class="col-md-4 col-xs-6">
              <div class="shop">
                <div class="shop-img">
                  <img src="./img/shop02.png" alt="">
                </div>
                <div class="shop-body">
                  <h3>Corsi &<br>Lezioni</h3>
                  <a href="categoriaServlet?categ=corso" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                </div>
              </div>
            </div>
            <!-- /shop -->
          </div>
          <!-- /row -->
        </div>
        <!-- /container -->
      </div>
      <!-- /SECTION -->
      
      <!-- CAROUSEL SLICK -->
            <!-- SECTION -->
      <div class="section">
          <div class=dimcar >
            <section class="carous" id="wrapper">
                <div>   <img src="img/img_1.jpg">      </div>
                <div>   <img src="img/img_2.jpg">      </div>
                <div>   <img src="img/img_3.jpg">      </div>
            </section>
          </div>
          <!-- /SECTION -->
          </div>
            <!-- /CAROUSEL SLICK-->
      
     					<% 		ServletContext context = getServletContext();
								ArrayList<Prodotto> vetrina = (ArrayList<Prodotto>) context.getAttribute("vetrina");
						%>
     
     
	<!-- SECTION -->
		    <div class="section">
			    <!-- container -->
			    <div class="container">
			    	<!-- row -->
				    <div class="row">
              <!-- section title -->
	      				<div class="col-md-12">
	       					<div class="section-title">
	    						<h3 class="title">TOP SELLINGS</h3>
			    				  <div class="section-nav">
					  		    </div>
						      </div>
					      </div>
              <!-- /section title -->
              
              			
              			
						
              <!-- Novita: Prodotti tab & slick -->
              <div class="col-md-12">
                  <div class="row">
                    <div class="products-tabs">
                      <!-- tab -->
                      <div id="tab1" class="tab-pane active">
                          <div class="products-slick" data-nav="#slick-nav-1">
                          
                  
 							<% if(vetrina.size()>0){
							for (Prodotto p : vetrina ) {						
								%>
                  
                          
                          <!-- product -->
							<div class="product">
                                <div class="product-img">
                                <img src="./img/<%= p.getId()%>.jpg" alt="" onclick="openProduct('<%=p.getId()%>')">
                                  <div class="product-label">                              
                                    <span class="new">NEW</span>
                                  </div>
                                </div>  
                                <div class="product-body"> 
                                    <p class="product-category"><%= p.getCategoria()%></p>
                                    <h3 class="product-name"><a href="ProductServlet?prodotto=<%= p.getId()%>"><%= p.getNome()%></a></h3>
                                    <h4 class="product-price"> &#8364;<%= p.getPrezzo()%></h4>
                                </div>

                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn" id="<%=p.getId()%> " onclick="sendProduct('<%=p.getId()%>')"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                </div>
                                
				
                            </div> 
                            <!-- /product -->
                            
                  
	
							
							 <%        }
							%>
							
							
							<% }else{ %>
							
							
									<h1> Vetrina Non Disponibile</h1>
									<%} %>
	
                            
                            
                            
                            
                            </div>
                        <div id="slick-nav-1" class="products-slick-nav"></div>
                      </div>
                      <!-- /tab -->
                    </div>
                  </div>
                </div>
                <!-- Products tab & slick -->
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
    	
    	function openProduct(id){
    		url = "ProductServlet?prodotto=" + id;
    		window.location.href = url;
    	}
    	
    	
    	function sendProduct(id) {
    		url = "addProductServlet?id="+id;
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


