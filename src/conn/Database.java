package conn;

import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

public class Database{
	
	private String id;
	private String password;
	
	public Connection connectMe() throws Exception{
		// Preparing the driver
		Class.forName("com.mysql.jdbc.Driver");
		// Loading Connection URL
		String connURL = "jdbc:mysql://localhost/assignment?user=root&password=root";
		// Establish connection to url
		Connection conn = DriverManager.getConnection(connURL);
		return conn;
	}
	
	//First function, login.
	public int login(String id, String pwd) { // Returns int '1' if login is
												// successful
		int token = 0;//login token
		try {//error catching
			
			Connection conn = connectMe(); //Preparing database
			
			// Prepare sql statements
			PreparedStatement pstmt;
			
			//End of connection preparation
			String sql = "SELECT * FROM login where username = ?";
			pstmt = conn.prepareStatement(sql);// prepared statement
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();// Assigning to resultset to
													// display table

			while (rs.next()) {
				if (pwd.equals(rs.getString("password"))) {
					HttpSession session = request.getSession();
					this.id = id;
					this.password = rs.getString("password");
					token = 1;
					return token;
				}
			}
		} catch (Exception e) {//Error handling
			e.printStackTrace();
		}
		return token;
	}
	//End of login method
	
	
	public String getID(){//Display username on every page
		if(id != null){
			return id;
		}
		else{
			return "You are not logged in.";
		}
	}

	
	//END OF LOGIN TABLE
	
	//START OF GAME TABLE
	private String[] gameID, gameTitle, Company, RDate, Desc, Price, imgL, own;
	
	public void gameSelect() throws Exception{//Selects data from game table
		Connection conn = connectMe();
		
		String sql = "SELECT * FROM game";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		int i = 0;
		
		while (rs.next()){
			gameID[i] = rs.getString("id");
			gameTitle[i] = rs.getString("title");
			Company[i] = rs.getString("company");
			RDate[i] = rs.getString("release date");
			Desc[i] = rs.getString("description");
			Price[i] = rs.getString("price");
			imgL[i] = rs.getString("img");
			own[i] = rs.getString("owned");
			i++;
		}
	}
	
	//Returns value from stored gameSelect
	public String getGame(int colNum, int rowNum){
		switch (colNum) {
		case 1:
			return gameID[rowNum];
		case 2:
			return gameTitle[rowNum];
		case 3: 
			return Company[rowNum];
		case 4: 
			return RDate[rowNum];
		case 5: 
			return Desc[rowNum];
		case 6: 
			return Price[rowNum];
		case 7: 
			return imgL[rowNum];
		case 8:
			return own[rowNum];
		default:
			return "nothing";
		}
	}
	
	
	//Connection to images
	
	public String getImages(String search){//Searches for an image in the database, returns the link to the image
		String link = "a";
		return link;
	}
}
