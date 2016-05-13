package conn;

import java.sql.*;

public class Database {
	private String id;
	private String password;
	
				// Preparing the driver
				Class.forName("com.mysql.jdbc.Driver");
				// Loading Connection URL
				String connURL = "jdbc:mysql://localhost/assignment?user=root&password=root";
				// Establish connection to url
				Connection conn = DriverManager.getConnection(connURL);
				// Prepare sql statements
				String sql;
				PreparedStatement pstmt;
				//End of connection preparation
				
	//First function, login.
	public int login(String id, String pwd) { // Returns int '1' if login is
												// successful
		int token = 0;//login token
		try {//error catching
			
			sql = "Select * from login";
			pstmt = conn.prepareStatement(sql);// prepared statement
			ResultSet rs = pstmt.executeQuery(sql);// Assigning to resultset to
													// display table

			while (rs.next()) {
				if (id == rs.getString("username") && pwd == rs.getString("password")) {
					id = rs.getString("username");
					password = rs.getString("password");
					token = 1;
					break;
				}
			}
		} catch (Exception e) {//Error handling
			e.printStackTrace();
		}
		return token;
	}
	//End of login method
	
	
	public String getID(){//Display username on every page
		return id;
	}

	
	//END OF LOGIN TABLE
	
	//START OF GAME TABLE
	private String[] gameID, gameTitle, Company, RDate, Desc, Price, imgL, own;
	
	public void gameSelect(){//Selects data from game table
		sql = "SELECT * FROM game";
		pstmt = conn.prepareStatement(sql);
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
			break;
			
		case 2:
			return gameTitle[rowNum];
			break;
			
		case 3: 
			return Company[rowNum];
			break;
		case 4: 
			return RDate[rowNum];
			break;
			
		case 5: 
			return Desc[rowNum];
			break;
		case 6: 
			return Price[rowNum];
			break;
		case 7: 
			return imgL[rowNum];
			break;
		case 8:
			return own[rowNum];
			break;

		default:
			break;
		}
	}
	
	
	//Connection to images
	
	public String getImages(String search){//Searches for an image in the database, returns the link to the image
		String link;
		return link;
	}
}
