package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prodotto;
import model.ProductModel;

/**
 * Servlet implementation class CategoriaServlet
 */
@WebServlet("/categoriaServlet")
public class CategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoriaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String categoria = request.getParameter("categ");
		String sottocategoria = request.getParameter("sottocateg");
		if(sottocategoria==null) {
			try {
				ProductModel pm = new ProductModel();
				ArrayList<Prodotto> list = pm.doSearch(categoria);
				if (list.size() > 0) {
					RequestDispatcher view = request.getRequestDispatcher("result.jsp");
					request.setAttribute("list", list);
					view.forward(request, response);
				}
			} catch (Exception e) {
				System.out.println("Errore search");
			}
		}else {
			try {
				ProductModel pm = new ProductModel();
				ArrayList<Prodotto> list = pm.doSearch(categoria,sottocategoria);
				if (list.size() > 0) {
					RequestDispatcher view = request.getRequestDispatcher("result.jsp");
					request.setAttribute("list", list);
					view.forward(request, response);
				}
			} catch (Exception e) {
				System.out.println("Errore search");
			}
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
