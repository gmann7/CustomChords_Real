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
 * Servlet implementation class ModifyAndDeleteServlet
 */
@WebServlet("/modifyAndDeleteServlet")
public class ModifyAndDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyAndDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String op = request.getParameter("op");
		if(op.equals("cancel")) {
			try {
				ProductModel pm = new ProductModel();
				pm.setQuantityToZero(id);
				ArrayList<Prodotto> list = pm.doResearchWithNull("");
				request.setAttribute("list", list);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(op.equals("modify")) {
			Prodotto p = null;
			try {
				ProductModel pm = new ProductModel();
				p=pm.doRetrieveByKey(id);
				request.setAttribute("prodotto", p);
				RequestDispatcher dispatcher = request.getRequestDispatcher("modifyProduct.jsp");
				dispatcher.forward(request, response);

			}catch(Exception e) {
				e.printStackTrace();
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
