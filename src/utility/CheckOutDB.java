package utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import conn.Connect;
import object.Game;

public class CheckOutDB {
	
	Connect connect = new Connect();
	public CheckOutDB() {
		// TODO Auto-generated constructor stub
	}

	public int cartToDatabase(String userID, ArrayList<Game> cart) throws Exception {


		Connection conn = connect.connectMe();
		String sql = "INSERT INTO user_transaction(user_id) values (?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.executeUpdate();


		// Loops through cart to get game object, then updates the database
		// Last_insert_id will return the transaction id (AI)
		// Connect to transaction and upload last_insert_id(), and add as many
		// rows as there are games
		for (int i = 0; i < cart.size(); i++) {
			Game game = cart.get(i);
			sql = "INSERT INTO transaction VALUES(last_insert_id(),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, game.getGameID());
			pstmt.setInt(2, game.getQuantity());
			pstmt.executeUpdate();
			
			//Updates stock after insertion
			updateDatabaseStock(game.getGameID(),game.getQuantity());
		}
		
		//Lastly, return the transaction ID
		sql = "SELECT last_insert_id()";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int ID = 0;
		if(rs.next()){
			ID = rs.getInt("last_insert_id()");
		}
		return ID;

	}
	
	public void updateDatabaseStock(int pID, int quantity) throws Exception{
		
		Connection conn = connect.connectMe();
		String sql = "UPDATE game SET stock = stock - ? WHERE game_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, quantity);
		pstmt.setInt(2, pID);
		
		//Update time!
		pstmt.executeUpdate();
		
	}
	

}
