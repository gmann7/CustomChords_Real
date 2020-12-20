package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prodotto;
import model.ProductModel;


@WebServlet("/modifyServlet")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("idprodotto");
		String nome = request.getParameter("nome");
		String descrizione = request.getParameter("descrizione");
		String categoria = request.getParameter("categoria");
		String sottocategoria = request.getParameter("sottocategoria");
		String vetrina = request.getParameter("vetrina");
		int quantita = Integer.parseInt(request.getParameter("quantita"));
		double prezzo = Double.parseDouble(request.getParameter("prezzo"));
		double iva = Double.parseDouble(request.getParameter("iva"));
		Boolean v = new Boolean(vetrina);
		
		Prodotto p = new Prodotto(id, nome, descrizione, categoria, sottocategoria, quantita, prezzo, v, iva);
		try {
			ProductModel pm = new ProductModel();
			pm.doModify(p);
			response.sendRedirect("modifyAndDeleteListServlet");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
