package utility;

import java.sql.*;

import conn.Connect;
import object.Game;

public class GameDB {

	public GameDB() {
		// TODO Auto-generated constructor stub
	}

	public Game getGameDetails(int pID) throws Exception {

		Connect connect = new Connect();
		Connection conn = connect.connectMe();

		String sql = "SELECT * FROM game WHERE game_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pID);
		ResultSet rs = pstmt.executeQuery();

		// Creating new game object
		Game game = new Game();

		if (rs.next()) {
			// Assigning game attributes from game table
			game.setCompany(rs.getString("company"));
			game.setDate(rs.getString("rdate"));
			game.setDescription(rs.getString("description"));
			game.setGameID(rs.getInt("game_ID"));
			game.setImg(rs.getString("img"));
			game.setOwn(rs.getString("own"));
			game.setPrice(rs.getDouble("price"));
			game.setTitle(rs.getString("title"));
			game.setStock(rs.getInt("stock"));
		}

		// Assigning genre attribute from genre table
		sql = "SELECT * FROM game_genre WHERE game_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pID);
		rs = pstmt.executeQuery();
		
		int rowcount = 0; //Counting the number of results
		if (rs.last()) {//Goes to the last row
		  rowcount = rs.getRow();
		  rs.beforeFirst(); //Goes back to the first row
		}
		
		//Storing genre id in an array
		int [] genre = new int[rowcount];
		
		//Counter i
		int i = 0;
		while(rs.next()){
			genre[i] = rs.getInt("genre_id");
			i++;
		}
		game.setGenre(genre);
		
		return game;
	}

}
