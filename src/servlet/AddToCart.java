package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import object.User;
import utility.GameDB;
import object.Game;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCart() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession session = request.getSession();
		
		int pID = Integer.parseInt(request.getParameter("pID"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		@SuppressWarnings("unchecked")//Just because i don't want to see yellow lines LOL
		ArrayList<Game> cart = (ArrayList<Game>) session.getAttribute("cart");

		// If there's no cart, make a cart
		if (cart == null) {
			cart = new ArrayList<Game>();
		}

		GameDB GameDB = new GameDB();
		Game game;
		
		try {
			game = GameDB.getGameDetails(pID);
			
			//Sets quantity in game object
			game.setQuantity(quantity);
			int check = 0;
			
			//Array looping through cart
			for(int i = 0; i < cart.size(); i++){
				Game cartGame = cart.get(i); //Checks the game within cart
				
				//If game exists
				if(cartGame.getGameID() == game.getGameID()){
					//Sets the game quantity to be cart + game
					game.setQuantity(game.getQuantity() + cartGame.getQuantity());
					cart.remove(i);
					cart.add(game);
					check = 1;
				}
			}
			
			//If the game doesn't exist
			if(check != 1){
				cart.add(game);
			}
			
			// Re-sets the cart into session
			session.setAttribute("cart", cart);
		} catch (Exception e) {
			response.getWriter().append("Served at: ").append(e.getMessage());
			return;
		}
		
		request.getRequestDispatcher("bootstrap-shop/product_summary.jsp").forward(request, response);

	}

}
