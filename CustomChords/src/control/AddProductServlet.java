package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/addProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Carrello cart = (Carrello) session.getAttribute("cart");
		String id = request.getParameter("id");
		if (id != null) {
			if (cart == null) {
				try {
					cart = new Carrello();
					ProductModel pm = new ProductModel();
					Prodotto p = pm.doRetrieveByKey(id);
					cart.addItem(p);
				} catch (Exception e) {
					System.out.println(e);
				}
			} else {
				try {
					ProductModel pm = new ProductModel();
					Prodotto p = pm.doRetrieveByKey(id);
					cart.addItem(p);
				} catch (Exception e) {
					System.out.println(e);
				}

			}
			session.setAttribute("cart", cart);
		}

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
