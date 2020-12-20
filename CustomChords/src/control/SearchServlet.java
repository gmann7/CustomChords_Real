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
 * Servlet implementation class SearchServlet
 */
@WebServlet("/searchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ricerca = request.getParameter("search");
		
			try {
				ProductModel pm = new ProductModel();
				ArrayList<Prodotto> list = pm.doResearch(ricerca);
				if (list.size() >= 0) {
					RequestDispatcher view = request.getRequestDispatcher("result.jsp");
					request.setAttribute("list", list);
					view.forward(request, response);
				}
			} catch (Exception e) {
				System.out.println("Errore search");
			}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
