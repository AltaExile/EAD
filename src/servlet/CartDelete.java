package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import object.Game;

/**
 * Servlet implementation class CartDelete
 */
@WebServlet("/CartDelete")
public class CartDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession session = request.getSession();
		ArrayList<Game> cart = (ArrayList<Game>)session.getAttribute("cart");
		
		int pID = Integer.parseInt(request.getParameter("pID"));
		
		for(int i = 0; i < cart.size(); i++){
			Game game = cart.get(i);
			//Once the game is found, removes and breaks out of loop
			if(game.getGameID() == pID){
				cart.remove(i);
				break;
			}
		}
		
		//Resets the cart into session
		session.setAttribute("cart",cart);
		
		request.getRequestDispatcher("bootstrap-shop/product_summary.jsp").forward(request, response);
	}

}
