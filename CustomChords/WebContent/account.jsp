<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		<% Utente u = (Utente) session.getAttribute("utente");	%>

       
        <!-- SECTION -->
			
		<div class="section">
             <!-- container -->
			        <div class="container">
				        <!-- row -->
				        <div class="row">
				        
					         <div class="col-md-3">
                            <div id="modificaTesto">      
                              	<div class="section-title">
                                    <h3 class="title"> IL TUO ACCOUNT </h3>        
                                </div>          
                            <ul id="vert-menu">
                              <li id="accountInfo" ><a href="#">Info Account</a></li> 
                              
                              <li id="accountOrdini"><a href="#"> Cronologia Ordini</a></li> 
                               
							
								
							
								 <% if(u!=null && u.getAdmin()==true){%>	<li id="adminPage" ><a href="#"> Gestisci Sito </a></li>  <% } %>  
                              
                              <% 
								if(u!=null){
								%>
                              <li ><a href="logoutServlet"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li> 
                               <% } %>
                             </ul>       
                                 
                              </div>  
                      		</div>



                            <div class="col-md-9 ">
                             <div id="content" class="section-title">		
                             
								<fieldset>
								<% 
								if(u!=null){
								%>
								<legend> Login e Registrazione</legend>
								 <div class="section-title"> 
								 <% 
								if(u.getSesso().toString().equalsIgnoreCase("M")){
								%>
								 <h3 class="title"> Benvenuto <%= u.getNome()%>! </h3>   
								 
								 <%	} 
								else { if(u.getSesso().toString().equalsIgnoreCase("F")){ %> 
								 <h3 class="title"> Benvenuta <%= u.getNome()%>! </h3>   
								  <%} %>
								  
								  
								<%	} %>
								 </div>
								 <% } 
								else { %>
								
								<legend> Login e Registrazione</legend>
							

										<form name="loginform" id="loginform" method="post"
											action="loginServlet">
											<label>Email: <input type="text" class="input" name="email" id="email">
											<span id="errorEmail" class="errorMsg"> </span> </label> <br> <br> 
											
											<label> Password: <input type="password" class="input" name="pass" id="pass">
											<span id="errorPass" class="errorMsg"> </span> </label> <br> <br>
											<div id="msg" class="errorMsg"></div>
											<button type="button" class="primary-btn"
												onclick="checkData()"> Entra </button>
											<br> <br>
											<p>
												Non sei ancora registrato? <a href="registrazione.jsp">
													Registrati</a>
											</p>
										</form>
		

							<%	} %>	
							

							
                              </div>
                            </div>
                           
             			 </div>
          		  </div>
            </div>
			<!-- /SECTION -->





      <!-- FOOTER -->
<%@ include file="../fragments/footer.jsp" %>

    
<!-- jQuery Plugins -->

<%@ include file="../fragments/scripts.jsp" %>

<%
								Boolean b = (Boolean) request.getAttribute("errorMsg");
									if (b != null && b == true) {
							%>
							<script>
							$("#msg").html("Email e/o password non valide");
							</script>
							<%	} %>
							
							
							
<script type="text/javascript">
		function checkData() { 
			$(".errorMsg").empty();
			var emailRegExp = /^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/i;
			var passRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!.@#\$%\^&\*])(?=.{8,})/;

			var email = $("#email").val();
			var pass = $("input[type=password]").val();
			if (emailRegExp.test(email) && passRegExp.test(pass)) {
				$("#loginform").submit();
			} else {
				if (!emailRegExp.test(email)) {
					$("#errorEmail")
							.html(
									"L'email deve essere nel seguente formato: prova@prova.it");
				}
				if (!passRegExp.test(pass)) {
					$("#errorPass")
							.html(
									"La password deve essere lunga almeno 8 caratteri e contenete almeno un carattere maiuscolo,uno minuscolo e un carattere speciale (!.@#\$%\^&\*)");
				}
			}
		}
		
	</script>

<script type="text/javascript">
  
    $("#modificaTesto ul li").click(function() {
                    var param =  $(this).attr("id");
                    //alert(param);
                    $.ajax({  
                    	type: "GET", 
                    	url: param+".jsp",
                    	success: function(response) {
                            $("#content").html(response);                
                        } 
                    });
    		});
</script>


<!-- <script>

</script> -->



