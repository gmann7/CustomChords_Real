package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
@WebServlet("/AccountDetailsServlet")
public class AccountDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Utente u = (Utente)session.getAttribute("utente");
		String redirectPage = "account.jsp";
		if(u!=null) {
			ArrayList<Ordine> listaOrdini = null;
			ArrayList<DettagliOrdine> listaDettagliOrdini = null;
			
			try {
				OrderModel om = new OrderModel();
				OrderDetailsModel odm = new OrderDetailsModel();
				listaOrdini = om.doRetrieveByEmail(u.getEmail());
				listaDettagliOrdini = odm.doRetrieveOrdersByEmail(u.getEmail());
				//System.out.println(listaOrdini);
				//System.out.println(listaDettagliOrdini);
				if(listaOrdini!=null && listaDettagliOrdini!=null) {
					session.setAttribute("listaOrdini", listaOrdini);
					session.setAttribute("listaDettagliOrdini", listaDettagliOrdini);
					redirectPage = "account.jsp";
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(redirectPage);
		dispatcher.forward(request, response);
		

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
