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
	
	public Database(String id, String password){
		login(id,password);
	}
	
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
		ResultSet rs = pstmt.executeQuery();
		int i = 0;
		
		while (rs.next()){
			this.gameID[i] = rs.getString("id");
			this.gameTitle[i] = rs.getString("title");
			this.Company[i] = rs.getString("company");
			this.RDate[i] = rs.getString("release date");
			this.Desc[i] = rs.getString("description");
			this.Price[i] = rs.getString("price");
			this.imgL[i] = rs.getString("img");
			this.own[i] = rs.getString("owned");
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
	
	//function to insert game
	public String insertGame(String id, String title, String company, String date, String desc, String price, String img, String own) throws Exception{
		
		//Connecting to server
		Connection conn = connectMe();
		//Assigning all variables to one string array
		String[] val = {id,title,company,date,desc,price,img,own};
		
		String sql = "INSERT INTO login VALUES (?,?,?,?,?,?,?,?)";//Preparing sql statement
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//Setting ? values
		for (int i = 0; i < val.length; i++) {
			pstmt.setString(i, val[i]);
		}
		//Updating table
		pstmt.executeUpdate(sql);
		
		return "Game inserted.";
	}
	
	//Function for game deletion
	public String deleteGame (String id) throws Exception{
		
		//Preparing Connection to database
		Connection conn = connectMe();
		//Preparing sql string
		String sql = "DELETE FROM game WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//Setting ? variable
		pstmt.setString(1, id);
		
		//Executing game deletion
		pstmt.executeUpdate(sql);
		
		return "Game deleted.";
	}
	
	//Function for game search
	public ResultSet searchGame(String search) throws Exception{ //Returns resultset so the JSP page can display the results
		
		//Preparing connection to databse
		Connection conn = connectMe();
		//Preparing sql string
		String sql = "SELECT * FROM game WHERE CONCAT_WS(\"OR\",id,title,company,rdate,description,price) like ?"; //Searches through all relevant columns
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+search+"%"); //Setting search substring
		
		//Executing game select
		ResultSet rs = pstmt.executeQuery();
		
		return rs;
		
	}
	
	//Connection to images
	public String getImages(String search){//Searches for an image in the database, returns the link to the image
		String link = "a";
		return link;
	}
}
