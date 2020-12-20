package control;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import model.Utente.Sesso;
/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/registrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String datanascita = request.getParameter("datanascita");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String telefono = request.getParameter("phone");
		String nazione = request.getParameter("nazione");
		String citta = request.getParameter("citta");
		String indirizzo = request.getParameter("indirizzo");
		String sesso = request.getParameter("sesso");
		Utente u = null;
		try {
			u = new Utente(nome, cognome, new SimpleDateFormat("yyyy-mm-dd").parse(datanascita), Sesso.valueOf(sesso), email, telefono, indirizzo, citta, nazione, false);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		String redirectPage = "#";
		try {
			ClienteModel cm = new ClienteModel();
			if(cm.checkEmail(email)) {
				request.setAttribute("errorMsg", true);
				redirectPage = "registrazione.jsp";
				
				
			}else {
				cm.doSave(u, password);
				HttpSession session = request.getSession();
				session.setAttribute("utente", u);
				redirectPage="account.jsp";
				
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(redirectPage);
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
