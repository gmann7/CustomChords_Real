<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registrazione</title>
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
<body> <!-- HEADER -->
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
					
						<!-- Registration Details -->
						<div class="section-title">
						<h3 class="title">Registrati ora!</h3>
							</div>
		<fieldset>

		<form name="registrationform" id="registrationform" method="post"
			action="registrationServlet">
				<div class="form-group">																					
					<input class="input" type="text" name="nome" id="nome" placeholder="Nome"> 
					<span class="errorMsg" id="errorNome"></span>
				</div>
				<div class="form-group">	
				<input class="input" type="text" name="cognome" id="cognome" placeholder="Cognome">
				 <span class="errorMsg" id="errorCognome"></span>
				 </div>
				 <div class="form-group">	
			<input class="input" type="date" name="datanascita" id="datanascita">
				 <span class="errorMsg" id="errorDataNascita"></span>
				 </div>
				 <div class="form-group">			 
				<input class="input" type="text" name="email" id="email" placeholder="email"> 
				<span class="errorMsg" id="errorEmail"></span>
				</div>
				<div class="form-group">	
				<input class="input" type="password" name="pass" id="pass" placeholder="password"> 
				<span class="errorMsg" id="errorPassword"></span>
				</div>
				<div class="form-group">	
			<input class="input" type="tel" name="phone" id="phone" placeholder="Numero di telefono" required>
				<span class="errorMsg" id="errorTelefono"></span>
				</div>
				<div class="form-group">
			<input class="input" type="text" name="nazione" id="nazione" placeholder="Nazione"> 
			<span class="errorMsg" id="errorNazione"></span>
			</div>
			<div class="form-group">
			 <input class="input" type="text" name="citta" id="citta" placeholder="Città">
			 <span	class="errorMsg" id="errorCitta"></span>
			 </div>
			<div class="form-group">
			 <input class="input" type="text" name="indirizzo" id="indirizzo" placeholder="Indirizzo">
				<span class="errorMsg" id="errorIndirizzo"></span>
				</div>
			<div class="form-group">
			<select class="input" name="sesso">
					<option value="M">M</option>
					<option value="F">F</option>
			</select> 
			<span class="errorMsg" id="errorSesso"></span>
			</div>
			<div id="msg" class="errorMsg"></div>
			<button class="primary-btn" type="button" onclick="checkData()">Entra</button>
			

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



	<% Boolean b = (Boolean) request.getAttribute("errorMsg");
		if(b!=null && b==true){%>
		<script>
			$("#msg").html("E' gia presente un account con questo indirizzo email");
		</script>
	<%	}
	%>

	<script>
		function checkData() {
			$(".errorMsg").empty();
			
			var emailRegExp = /^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/i;
			var passRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!.@#\$%\^&\*])(?=.{8,})/;

			
			var nome = $("#nome").val();
			var cognome = $("#cognome").val();
			var datanascita = $("#datanascita").val();
			var email = $("#email").val();
			var pass = $("input[type=password]").val();
			var numero = $("#phone").val();
			var citta = $("#citta").val();
			var nazione = $("#nazione").val();
			var indirizzo = $("#indirizzo").val();
			var sesso = $("select").val();

			if ((nome != null && nome != "")
					&& (cognome != null && cognome != "")
					&& (datanascita != null && datanascita != "")
					&& (email != null && email != "" && emailRegExp.test(email))
					&& (pass != null && pass != "" && passRegExp.test(pass))
					&& (numero != null && numero != "")
					&& (citta != null && citta != "")
					&& (nazione != null && nazione != "")
					&& (indirizzo != null && indirizzo != "")
					&& (sesso != null && sesso != "")) {
				$("#registrationform").submit();
			} else {
				if (nome == null || nome == "") {
					$("#errorNome").html("Nome non valido");
				}
				if (cognome == null || cognome == "") {
					$("#errorCognome").html("Cognome non valido");
				}
				if (datanascita == null || datanascita == "") {
					$("#errorDataNascita").html("Data di nascita non valida");
				}
				if (email == null || email == "" || !emailRegExp.test(email)) {
					$("#errorEmail").html("L'email deve essere nel seguente formato : prova@prova.it");
				}
				if (pass == null || pass == "" || !passRegExp.test(pass)) {
					$("#errorPassword").html("La password deve essere lunga almeno 8 caratteri e contenete almeno un carattere maiuscolo,uno minuscolo e un carattere speciale(!.@#\$%\^&\*)");
				}
				if (numero == null || numero == "") {
					$("#errorTelefono").html("Numero di telefono non valido");
				}
				if (citta == null || citta == "") {
					$("#errorCitta").html("Citta non valida");
				}
				if (nazione == null || nazione == "") {
					$("#errorNazione").html("Nazione non valido");
				}
				if (indirizzo == null || indirizzo == "") {
					$("#errorIndirizzo").html("Indirizzo non valido");
				}

			}
		}
	</script>

</body>
</html>