package utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import conn.Connect;

public class GenreDB {
	
	Connect connect = new Connect();
	public GenreDB() {
		// TODO Auto-generated constructor stub
	}
	
	public ResultSet selectGenre() throws Exception{// Lists all current genre, returns a resultset
		Connection conn = connect.connectMe();
		String sql = "SELECT * FROM genre";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		return rs;
	}
	
	//Sets genre to get easily
	private String genre = "";
	
	public int[] setGenre(int pID) throws Exception{
		String genre = "";
		Connection conn = connect.connectMe();
		String sql = "SELECT * FROM game_genre WHERE game_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pID);
		ResultSet rs = pstmt.executeQuery();
		
		
		
		int rowcount = 0; //Counting the number of results
		if (rs.last()) {//Goes to the last row
		  rowcount = rs.getRow();
		  rs.beforeFirst(); //Goes back to the first row
		}
		
		//Storing genre id in an array
		int [] gen = new int[rowcount];
		
		//Counter i
		int i = 0;
		while(rs.next()){
			gen[i] = rs.getInt("genre_id");
			i++;
		}
		//Test
		sql = "SELECT * FROM genre WHERE genre_id = ?";

		for (i = 1; i < gen.length; i++) { // Additional parameters depending on no. of genre
			sql += " OR genre_id = ?";
		}
		pstmt = conn.prepareStatement(sql);
		i = 1; //Used to progress setInt
		for (int j = 0; j < gen.length; j++,i++) {
			pstmt.setInt(i, gen[j]);
			
		}

		rs = pstmt.executeQuery();
		
		while(rs.next()){
			genre += rs.getString("genre_name") + "<br>";
		}
		this.genre = genre;
		return gen; // Returns gen id array, so this can be used to
					// get the list of genre
	}
	
	public String getGenre(){ //Returns private String genre, must be called after setGenre(pID);
		return genre;
	}
	
	public String getGenre(int genre_id) throws Exception{//Returns genre name based on genre id
		Connection conn = connect.connectMe();
		String sql = "SELECT * FROM genre WHERE genre_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, genre_id);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			String genre = rs.getString("genre");
		}
		return genre;
	}
	
	//INSERTING A NEW GENRE INTO THE GENRE TABLE
	public int insertGenre(String genre)throws Exception{
		Connection conn = connect.connectMe();
		String sql = "INSERT INTO genre (genre_name) values (?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, genre);
		int success = pstmt.executeUpdate();
		
		return success;
	}
	
	//DELETING A CURRENT GENRE
	public int deleteGenre(int genreID) throws Exception{
		Connection conn = connect.connectMe();
		String sql = "DELETE FROM genre WHERE genre_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, genreID);
		
		int success = pstmt.executeUpdate();
		return success;
	}

}
