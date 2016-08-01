package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.Connect;
import object.Game;
import object.User;
import utility.CheckOutDB;

import java.sql.*;

/**
 * Servlet implementation class CheckOut
 */
@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOut() {
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

		// Initially, check whether user is logged in
		HttpSession session = request.getSession(false);
		if (session.getAttribute("uBean") == null) {
			request.getRequestDispatcher("bootstrap-shop/login.jsp").forward(request, response);
		} else {
			User user = (User) session.getAttribute("uBean");
			String userID = user.getEmail();// Assigns username to string to
											// insert into db

			// Then, retrieve cart from session
			ArrayList<Game> cart = (ArrayList<Game>) session.getAttribute("cart");
			
			

			// Connect to database to upload to user_transaction the user ID
			CheckOutDB CheckOutDB = new CheckOutDB();
			int transID = 0;
			//Attempts to upload to database
			try {
				transID = CheckOutDB.cartToDatabase(userID, cart);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				response.getWriter().append("Sorry!: ").append(e.getMessage());
				return;
			}
			session.setAttribute("transID", transID);
			request.getRequestDispatcher("bootstrap-shop/purchase_summary.jsp").forward(request, response);


		}
		
	}

}
