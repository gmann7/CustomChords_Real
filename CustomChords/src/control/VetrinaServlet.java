package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prodotto;
import model.ProductModel;

/**
 * Servlet implementation class VetrinaServlet
 */
@WebServlet("/VetrinaServlet")
public class VetrinaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init() 
			   throws ServletException 
			{
			 // super.init();
			    
			    ServletContext context = getServletContext();
			    try {
					ProductModel pm = new ProductModel();
					ArrayList<Prodotto> list = pm.doRetrieveVetrina();
					if (list.size() >= 0) {
						context.setAttribute("vetrina", list);				
					}
				} catch (Exception e) {
					System.out.println("Errore Vetrina");
				}
			    
	
			}
}
