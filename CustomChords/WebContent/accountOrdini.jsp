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
<meta charset="ISO-8859-1">
</head>
<body>

		
		 
	
	<div class="section-title">	
	<h3 class="title"> I Tuoi Ordini </h3>
	</div>
	
	
        <div class="limiter">
         <div class="container-table100">
            <div class="wrap-table100">
               <div class="table100">
                 
                  <table class="main-table">
                     <thead>
                        <tr class="main-table-head">
                           <th class="column1">ID_Ordine</th>
                           <th class="column2">Data</th>                        
                           <th class="column3">Stato</th>
                           <th class="column4">Città</th>
                           <th class="column5">Indirizzo</th>
                        </tr>
                     </thead>
                  </table>
                        
<%
	ArrayList<Ordine> listaOrdini = (ArrayList<Ordine>) session.getAttribute("listaOrdini");
	ArrayList<DettagliOrdine> listaDettagliOrdini = (ArrayList<DettagliOrdine>) session.getAttribute("listaDettagliOrdini");
	 for(Ordine o : listaOrdini){ %>
	 
	 <table class="main-table">
                     <tbody>
                           <div>
                           <tr class="tablefx" >
                            <td class="column1"><%=o.getId()%></td>
                              <td class="column2"> <%=o.getData()%></td>                        
                              <td class="column3"><%=o.getStato()%></td>
                              <td class="column4"><%=o.getCittaSpedizione()%></td>
                              <td class="column5"><%=o.getIndirizzoSpedizione() %></td>
                            </tr>
	 
	 
	 								<tr class="sub-head">
                                    <th class="column1">ID Prodotto</th>
                                    <th class="column2">Quantità</th>                        
                                    <th class="column3">Prezzo</th>
                                    <th class="column4"></th>
                                    <th class="column5">IVA (Compresa nel Prezzo)</th>
                                 </tr>
	 
	 <%for(DettagliOrdine d : listaDettagliOrdini){
		 if(d.getIdOrdine() == o.getId()){ %>
	 
	 								<tr  class="sub-body">
                                       <td class="column1"><%=d.getIdProdotto()%></td>
                                       <td class="column2"><%=d.getQuantita()%></td>                        
                                       <td class="column3"><%=d.getPrezzo()%></td>
                                       <td class="column4"></td>
                                       <td class="column5"><%=d.getIva()%></td>
                                      
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