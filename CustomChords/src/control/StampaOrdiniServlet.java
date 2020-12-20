package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DettagliOrdine;
import model.OrderDetailsModel;
import model.OrderModel;
import model.Ordine;

/**
 * Servlet implementation class StampaOrdiniServlet
 */
@WebServlet("/stampaOrdiniServlet")
public class StampaOrdiniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String redirectPage = "resultOrders.jsp";
		ArrayList<Ordine> listaOrdini = null;
		ArrayList<DettagliOrdine> listaDettagliOrdini = null;
		try {
			OrderModel om = new OrderModel();
			OrderDetailsModel odm = new OrderDetailsModel();
			listaOrdini = om.takeAllOrders();
			listaDettagliOrdini = odm.takeAllOrderDetails();
			if(listaOrdini!=null && listaDettagliOrdini!=null) {
				request.setAttribute("listaOrdini", listaOrdini);
				request.setAttribute("listaDettagliOrdini", listaDettagliOrdini);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	RequestDispatcher dispatcher = request.getRequestDispatcher(redirectPage);
	dispatcher.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
