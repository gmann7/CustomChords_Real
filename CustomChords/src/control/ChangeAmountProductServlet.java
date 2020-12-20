package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;
import model.ItemCarrello;
import model.Prodotto;
import model.ProductModel;

/**
 * Servlet implementation class ChangeAmountProductServlet
 */
@WebServlet("/changeAmountProductServlet")
public class ChangeAmountProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Carrello cart = (Carrello) session.getAttribute("cart");
		ArrayList<ItemCarrello> items = new ArrayList<ItemCarrello>();
		items = cart.getCart();
		Prodotto pDb = new Prodotto();
		String id = request.getParameter("id");
		
		
		for(ItemCarrello i : items) {
			if (id != null) {
			if(i.getItem().getId().compareTo(id)==0) {
				pDb=i.getItem();				
			}
			
			}
		}
		
		
		int quantita = Integer.parseInt(request.getParameter("quantita"));
		
		
		if (id != null && pDb.getQuantitaDisponibile()>=quantita) {
			try {
				ProductModel pm = new ProductModel();
				Prodotto p = pm.doRetrieveByKey(id);
				cart.changeAmount(p, quantita);			
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		session.setAttribute("cart", cart);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
