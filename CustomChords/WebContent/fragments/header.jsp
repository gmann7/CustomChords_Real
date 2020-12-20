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
<!-- HEADER -->
		<header>
            <!-- MAIN HEADER -->
			<div id="header">
                    <!-- container -->
                    <div class="container">
                        <!-- row -->
					    <div class="row">
                            <!-- LOGO -->
                            <div class="col-md-3">
                                <div class="header-logo">
                                    <a href="index.jsp" class="logo">
                                        <img src="./img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <!-- /LOGO -->
                     
			
	                                
                            <!-- BARRA RICERCA -->
						<div class="col-md-6">
                                <div class="header-search">
                                    <form method="get" action="searchServlet">
                                        <input type="text" class="input" name="search" placeholder="Ricerca nel sito...">
                                        <button type="submit" class="search-btn"><div class="search-txt">Cerca</div></button>
                                    </form>
                                </div>
                            </div>
                            <!-- /BARRA RICERCA -->


                    	    <!-- ACCOUNT -->
						    <div class="col-md-3 clearfix">
                                <div class="header-ctn">
                                    <!-- Account -->
                                    
                                    <div>
                                        <a href="AccountDetailsServlet">
                                            <i class="fa fa-user" ></i>
                                            <span>
                                            <% Utente ut = (Utente) session.getAttribute("utente");
													if(ut!=null){
													%>
								
								   Ciao, <%= ut.getNome()%>!    
								<%	} 
								else { %> Account <%	} %> </span>
								
                                        
                                        </a>
                                    </div>
                                    <!-- /Account -->   
                                    
                                    <!-- Carrello -->
                                     <div>
                                        <a href="cart.jsp">
                                            <i class=" fa fa-shopping-cart" ></i>
                                             <span>Carrello</span>
                                             <%
											Carrello carrello = (Carrello) session.getAttribute("cart");
											if (carrello != null) {
											%>
                                             <div class="qty"> <%=carrello.getTotItem()%> </div>         
                                             <% } %>
                                        </a>
                                        
                                        	
                                    </div>
                                     <!-- /Carrello -->                           
                                           
                                    <!-- Menu Toogle  (Responsive Menu) -->				
								    <div class="menu-toggle">
                                        <a href="#">
                                            <i class="fa fa-bars"></i>
                                            <span>Menu</span>
                                        </a>
                                    </div>
                                    <!-- /Menu Toogle -->
                           
                           
                                </div>
                            </div>
                            <!-- /ACCOUNT -->

                        </div>
                        <!-- row -->
                      
                    </div>
                    <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

    