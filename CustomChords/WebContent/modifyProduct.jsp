
<%
	Utente u = (Utente) session.getAttribute("utente");
	if (u == null || !u.getAdmin()) {
		response.sendRedirect("index.jsp");
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
        <title>Modifica Prodotto </title>
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
	<%
		Prodotto p = (Prodotto) request.getAttribute("prodotto");
	%>
<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
			<!-- row -->
				<div class="row">

					<div class="col-md-7">
							<div class="section-title">
						<h3 class="title">Modifica Prodotto</h3>
							</div>

	<fieldset>
		<form action="modifyServlet" method="post" name="modifyForm"
			id="modifyForm">
			
			<div class="form-group">
			<label>Id: <input  class="input" type="text" name="idprodotto"
				value=<%=p.getId()%> id="idprodotto" readonly> <span
				class="errorMsg" id="errorId"></span>
			</label> 
			</div>
			
			<div class="form-group"> 
			<label>Nome: <input  class="input" type="text" name="nome"
				value=<%=p.getNome()%> id="nome"> <span class="errorMsg"
				id="errorNome"></span>
			</label> 
			</div>
			
			<div class="form-group"> 
			<label>Descrizione: <textarea  class="input" rows="5" cols="50"
					name="descrizione" id="descrizione"><%=p.getDescrizione()%></textarea>
				<span class="errorMsg" id="errorDescrizione"></span>
			</label>
			</div>
			
			 <div class="form-group"> 
			 <label>Categoria: <select   class="input" name="categoria"
				id="categoria" onchange="setOption()">
					<option id="chitarraOpt" value="chitarra">Chitarra</option>
					<option id="bassoOpt" value="basso">Basso</option>
					<option id="percussioneOpt" value="percussione">Percussione</option>
					<option id="tasteraOpt" value="tastiera">Tastiera</option>
					<option id="corsoOpt"value="corso">Corso</option>
			</select> <span class="errorMsg" id="errorCategoria"></span>
			</label>
			 </div>
			 
			 <div class="form-group"> 
			  <label>Sottocategoria: <select  class="input"
				name="sottocategoria" id="sottocategoria">
					<option value="classica">Classica</option>
					<option value="acustica">Acustica</option>
					<option value="elettrica">Elettrica</option>
			</select> <span class="errorMsg" id="errorSottocategoria"></span>
			</label> 
			 </div>
			 
			  <div class="form-group"> 
			  <label>Quantita: <input  class="input" type="number"
				value=<%=p.getQuantitaDisponibile()%> name="quantita" id="quantita">
				<span class="errorMsg" id="errorQuantita"></span>
			</label>
			</div> 
			
			<div class="form-group"> 
			 <label>Prezzo: <input  class="input" type="number" name="prezzo"
				value=<%=p.getPrezzo()%> id="prezzo" step=0.01> <span
				class="errorMsg" id="errorPrezzo"></span>
			</label> 
			</div> 
			
			<div class="form-group"> 
			 <label>Vetrina: <select  class="input" name="vetrina" id="vetrina">
				<option id="trueOpt" value="true"> true </option>
				<option id="falseOpt" value="false"> false </option>
				</select> <span
				class="errorMsg" id="errorPrezzo"></span>
			</label> 
			</div> 
			
			<div class="form-group"> 
			 <label>Iva: <input  class="input" type="number" name="iva"
				value=<%=p.getIva()%> id="iva" min="1" max="100" value="22">
				<span class="errorMsg" id="errorIva"></span>
			</label> 
			</div> 
			
			<button class="primary-btn" type="button" onclick="checkInsertData()">Modifica</button>
			<button class="primary-btn" type="reset" id="resetButton">Reset</button>
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
	
	
	
	
	
	
	
	
	<script>
	
		$(document).ready(function(){
			var obj= "#" + '<%=p.getCategoria()%>' + "Opt";
			var objV= "#" + '<%=p.isVetrina()%>' + "Opt";
			$(obj).attr("selected","selected");
			$('#sottocategoria').append("<option selected value=" + '<%=p.getSottoCategoria()%>' + ">" + '<%=p.getSottoCategoria()%>' + "</option>");
			$(objV).attr("selected","selected");
			
		});
		
		
		
		function checkInsertData() {
			$(".errorMsg").empty();

			var nome = $("#nome").val();
			var id = $("#idprodotto").val();
			var descrizione = $("#descrizione").val();
			var categoria = $("#categoria").val();
			var sottocategoria = $("#sottocategoria").val();
			var quantita = $("#quantita").val();
			var prezzo = $("#prezzo").val();
			var iva = $("#iva").val();

			if ((nome != null && nome != "")
					&& (id != null && id != "")
					&& (descrizione != null && descrizione != "")
					&& (categoria != null && categoria != "")
					&& (sottocategoria != null && sottocategoria != "")
					&& (quantita != null && quantita != "")
					&& (prezzo != null && prezzo != "")
					&& (iva != null && iva != "")) {
				$("#modifyForm").submit();
				s
			} else {
				if (nome == null || nome == "") {
					$("#errorNome").html("Nome non valido");
				}
				if (id == null || id == "") {
					$("#errorId").html("Id non valido");
				}
				if (descrizione == null || descrizione == "") {
					$("#errorDescrizione").html("Descrizione non valida");
				}
				if (categoria == null || categoria == "") {
					$("#errorCategoria").html("Categoria non valida");
				}
				if (sottocategoria == null || sottocategoria == "") {
					$("#errorSottocategoria").html("Sottocategoria non valida");
				}
				if (quantita == null || quantita == "" || quantita<0) {
					$("#errorQuantita").html("Quantità non valida, deve essere maggiore o uguale a 0");
				}
				if (prezzo == null || prezzo == "") {
					$("#errorPrezzo").html("Prezzo non valida");
				}
				if (iva == null || iva == "") {
					$("#errorIva").html("Iva non valida");
				}

			}
		}

		function setOption() {
			var category = $("#categoria").val();
			$("#sottocategoria").empty();
			switch (category) {
			case "chitarra":
				$('#sottocategoria').append(
						'<option value="classica">Classica</option>');
				$('#sottocategoria').append(
						'<option value="acustica">Acustica</option>');
				$('#sottocategoria').append(
						'<option value="elettrica">Elettrica</option>');
				break;
			case "basso":
				$('#sottocategoria').append(
						'<option value="elettrico">Elettrico</option>');
				$('#sottocategoria').append(
						'<option value="acustico">Acustico</option>');
				break;
			case "percussione":
				$('#sottocategoria').append(
						'<option value="batteria">Batteria</option>');
				break;
			case "tastiera":
				$('#sottocategoria').append(
						'<option value="midi">Midi</option>');
				$('#sottocategoria').append(
						'<option value="elettrica">Elettrica</option>');
				break;
			case "corso":
				$('#sottocategoria').append(
						'<option value="guida">Guida</option>');
				$('#sottocategoria').append(
						'<option value="videocorso">Videocorso</option>');

			}
		}
	</script>
</body>
</html>