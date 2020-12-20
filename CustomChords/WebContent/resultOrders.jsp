<%
	Utente u = (Utente) session.getAttribute("utente");
	if (u == null || !u.getAdmin()) {
		response.sendRedirect("index.jsp");
	}
%>

<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ordini Clienti </title>
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
		<!-- container -->
		<div class="container">
		  <div class="col-md-12 ">
		  				<div class="section-title">
						<h3 class="title">Ordini:</h3>
						</div>

			<div class="limiter">
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table100">
						
						 <table class="main-table">
                     <thead>
                        <tr class="main-table-head">
                           <th class="column1">ID_Ordine</th>
                           <th class="column2">Email</th>  
                           <th class="column3">Data</th>                        
                           <th class="column4">Stato</th>
                           <th class="column5">Città</th>
                           <th class="column6">Indirizzo</th>
                        </tr>
                     </thead>
                  </table>

							<%
								ArrayList<Ordine> listaOrdini = (ArrayList<Ordine>) request.getAttribute("listaOrdini");
								ArrayList<DettagliOrdine> listaDettagliOrdini = (ArrayList<DettagliOrdine>) request
										.getAttribute("listaDettagliOrdini");
								for (Ordine o : listaOrdini) {
							%>
							
							<table class="main-table">
                     <tbody>
                           <div>
                           <tr class="tablefx" >
                            <td class="column1"><%=o.getId()%></td>
                             <td class="column2"> <%=o.getEmail()%></td>        
                              <td class="column3"> <%=o.getData()%></td>                        
                              <td class="column4"><%=o.getStato()%></td>
                              <td class="column5"><%=o.getCittaSpedizione()%></td>
                              <td class="column6"><%=o.getIndirizzoSpedizione() %></td>
                            </tr>
	 
	 
	 								<tr class="sub-head">
                                    <th class="column1">ID Prodotto</th>
                                    <th class="column2">Quantità</th>                        
                                    <th class="column3">Prezzo</th>
                                    <th class="column4"></th>
                                    <th class="column5"></th>
                                    <th class="column6">IVA (Compresa nel Prezzo)</th>
                                 </tr>
											
							<%for(DettagliOrdine d : listaDettagliOrdini){
			if(d.getIdOrdine() == o.getId()){  %>
			
			<tr  class="sub-body">
                                       <td class="column1"><%=d.getIdProdotto()%></td>
                                       <td class="column2"><%=d.getQuantita()%></td>                        
                                       <td class="column3"><%=d.getPrezzo()%></td>
                                       <th class="column4"></th>
                                    	<th class="column5"></th>
                                       <td class="column6"><%=d.getIva()%></td>
                                      
                                    </tr>
                                    
                                    </div>

							

		
			<% }%>
		 
		 
	<%  }%>
	 
	 </tbody>
	<%  } %>
	</table>
	
	
	</div>
</div>
</div>
</div>
	</div>
</div>
	<!-- FOOTER -->
<%@ include file="../fragments/footer.jsp" %>

    
<!-- jQuery Plugins -->

<%@ include file="../fragments/scripts.jsp" %>
	<script>
//script per ordini in account

$('.sub-head').hide(); //nasconde sottocategorie per default
$('.sub-body').hide();

$(document).ready(function() {
	$('.tablefx').click(function() {
	  $(this).nextAll('tr.sub-head, tr.sub-body').slideToggle('fast');
	  
	 // $(this).children('tr.sub-body').slideToggle('fast');
	});
  });
  </script>
	
</body>
</html>