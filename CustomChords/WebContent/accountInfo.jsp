<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class= "section-title accountInfo" >
		<% Utente u = (Utente) session.getAttribute("utente");%>
			
				Email: <%= u.getEmail() %> <br>
				Nome: <%=u.getNome()%><br>
				Cognome: <%=u.getCognome()%><br>
				Indirizzo: <%= u.getIndirizzo()%> <br>
				Nazione: <%= u.getNazione()%> <br>
				Citta: <%= u.getCitta()%> <br>
				Data Nascita: <%= u.getDatanascita().getDate() +"/"+ u.getDatanascita().getMonth()+1 +"/"+u.getDatanascita().getYear() %> <br>

	</div>
</body>
</html>