package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;

@WebServlet("/checkoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public CheckoutServlet() {
		super();

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Utente u = (Utente)session.getAttribute("utente");
		String redirectPage="index.jsp";
		if(u==null) {
			 redirectPage="login.jsp";//Gianluco qui si deve inserire la pagine per il login quando non è loggato
		}else {
			String cittaSpedizione = request.getParameter("cittaspedizione");
			String indirizzospedizione = request.getParameter("indirizzospedizione");
			String carta = request.getParameter("carta");
			Carrello cart = (Carrello) session.getAttribute("cart");
			ArrayList<ItemCarrello> list = cart.getCart();
			try {
				OrderModel om = new OrderModel();
				OrderDetailsModel odm = new OrderDetailsModel();
				String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
				om.doSave(new Ordine(0, new SimpleDateFormat("dd-MM-yyyy").parse(date) , STATO_DEFAULT, COMMENTO_DEFAULT, u.getEmail(), cittaSpedizione, indirizzospedizione, carta));
				int numOrdine = om.getLastId();
				ProductModel pm = new ProductModel();
				
				for(ItemCarrello i:list) {
					DettagliOrdine det = new DettagliOrdine(numOrdine, i.getItem().getId(), i.getQuantita(), (i.getQuantita()*i.getItem().getPrezzo()), i.getItem().getIva());
					odm.doSave(det);
					pm.doDecraseProduct(i.getItem().getId(),i.getQuantita());
					
					
				}
				session.invalidate();
				session = request.getSession(true);
				session.setAttribute("utente", u);
				redirectPage = "index.jsp";
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect(redirectPage);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	private static final String STATO_DEFAULT = "Attesa";
	private static final String COMMENTO_DEFAULT = "Niente";


}
