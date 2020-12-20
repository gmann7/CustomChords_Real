package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ClienteModel;
import model.Utente;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email  = request.getParameter("email");
		String password = request.getParameter("pass");
		String redirectPage="index.jsp";
		Utente u = null;
		try {
			ClienteModel cm = new ClienteModel();
			if(cm.checkLogin(email,password)) {
				u = cm.doRetrieveByKey(email);
				HttpSession session = request.getSession();
				session.setAttribute("utente", u);
				redirectPage="index.jsp";
				/*if(u.getAdmin()) {
					redirectPage = "adminPage.jsp";
				}*/
				
				
				}else {
				request.setAttribute("errorMsg", true);
				redirectPage = "account.jsp";
				}
		} catch (Exception e) {
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
