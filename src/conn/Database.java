package conn;

import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

public class Database {
	// <---------------- LOGIN TABLE ------------->
	private String username;
	private String password;

	public Connection connectMe() throws Exception {
		// Preparing the driver
		Class.forName("com.mysql.jdbc.Driver");
		// Loading Connection URL
		String connURL = "jdbc:mysql://localhost/assignment?user=root&password=root";
		// Establish connection to url
		Connection conn = DriverManager.getConnection(connURL);
		return conn;
	}

	// First function, login.
	public int login(String username, String pwd) { // Returns int '1' if login
													// is
		// successful
		int token = 0;// login token
		try {// error catching

			Connection conn = connectMe(); // Preparing database

			// Prepare sql statements
			PreparedStatement pstmt;

			// End of connection preparation
			String sql = "SELECT * FROM login where username = ?";
			pstmt = conn.prepareStatement(sql);// prepared statement
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();// Assigning to resultset to
												// display table

			while (rs.next()) {
				if (pwd.equals(rs.getString("password"))) {
					this.username = username;
					this.password = rs.getString("password");
					token = 1;
					return token;
				}
			}
		} catch (Exception e) {// Error handling
			e.printStackTrace();
		}
		return token;
	}
	// End of login method

	public Database(String username, String password) {
		this.username = username;
		this.password = password;
	}

	//In order to use session
	HttpSession session;

	public String getID() {// Display username on every page
		return username;
	}

	// END OF LOGIN TABLE

	// <----------------------------- GAME TABLE ======================-------------------------------->
	// START OF GAME TABLE
/*	private String[] gameID, gameTitle, Company, RDate, Desc, Price, imgL, own;*/

	public ResultSet gameSelect() throws Exception {// Selects data from game table
		Connection conn = connectMe();

		String sql = "SELECT * FROM game";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}
	

	// function to insert game
	public int insertGame(String title, String company, String date, String desc, double price,
			String img, String own,int[] genre) throws Exception {

		//Prepending default directory to file name
		String imgLink = "images/";
		imgLink += img;
		
		// Connecting to server
		Connection conn = connectMe();
		String sql = "INSERT INTO game (title,company,rdate,description,price,img,own) values (?,?,?,?,?,?,?)";// Preparing
																	// sql
																	// statement
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// Setting ? values
		pstmt.setString(1,title);
		pstmt.setString(2,company);
		pstmt.setString(3,date);
		pstmt.setString(4,desc);
		pstmt.setDouble(5,price);
		pstmt.setString(6,imgLink);
		pstmt.setString(7,own);
		
		// Updating table
		int success = pstmt.executeUpdate();

		//Adding to game_genre
		sql = "INSERT INTO game_genre (game_id,genre_id) values (last_insert_id(),?)";
		pstmt = conn.prepareStatement(sql);
		
		for (int i = 0; i < genre.length; i++) {
			pstmt.setInt(1, genre[i]);
			pstmt.executeUpdate();
		}
		
		return success;
	}

	//UPDATE FUNCTION YO!!!
	//Returns number of rows affected by the update (1)
	public int updateGame (int pID,String title, String company, String date, String desc, double price,
			String img, String own, int [] genre) throws Exception{
		
		//Prepending default directory to file name
				String imgLink = "images/";
				imgLink += img;
		
		Connection conn = connectMe();
		String sql = "UPDATE game "
				+ "SET title = ?, company = ?, rdate = ?, description = ?, price = ?, img = ?, own = ? WHERE "
				+ "game_id = ?";
				
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, title);
		pstmt.setString(2, company);
		pstmt.setString(3, date);
		pstmt.setString(4, desc);
		pstmt.setDouble(5, price);
		pstmt.setString(6, imgLink);
		pstmt.setString(7, own);
		pstmt.setInt(8, pID);
		
		int success = pstmt.executeUpdate();
		
		//Deleting previous records for a cleaner, easier update
		sql = "DELETE FROM game_genre WHERE game_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pID);
		pstmt.executeUpdate();
		
		//Reinserting new update values
		sql = "INSERT INTO game_genre (game_id,genre_id) VALUES (?,?)";
		pstmt = conn.prepareStatement(sql);
		for (int i = 0; i < genre.length; i++) {
			pstmt.setInt(1, pID);
			pstmt.setInt(2, genre[i]);
			pstmt.executeUpdate();
		}
		
		return success;
	}
	
	// Function for game deletion
	public int deleteGame(int pID) throws Exception {

		// Preparing Connection to database
		Connection conn = connectMe();
		// Preparing sql string
		String sql = "DELETE FROM game WHERE game_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// Setting ? variable
		pstmt.setInt(1, pID);

		// Executing game deletion
		int success = pstmt.executeUpdate();

		return success;
	}
	
	
	//<--------------------GENRE TABLE ===================--------------------------->
	
	public ResultSet selectGenre() throws Exception{// Lists all current genre, returns a resultset
		Connection conn = connectMe();
		String sql = "SELECT * FROM genre";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		return rs;
	}
	
	//Sets genre to get easily
	private String genre = "";
	
	public int[] setGenre(int pID) throws Exception{
		String genre = "";
		Connection conn = connectMe();
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
		Connection conn = connectMe();
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
		Connection conn = connectMe();
		String sql = "INSERT INTO genre (genre_name) values (?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, genre);
		int success = pstmt.executeUpdate();
		
		return success;
	}
	
	//DELETING A CURRENT GENRE
	public int deleteGenre(int genreID) throws Exception{
		Connection conn = connectMe();
		String sql = "DELETE FROM genre WHERE genre_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, genreID);
		
		int success = pstmt.executeUpdate();
		return success;
	}

	// <-----------SEARCH BAR =========================================>
	public ResultSet stringSearch(String search, String own, int genre) throws Exception { // Returns
																	// resultset
																	// so the
																	// JSP page
																	// can
																	// display
																	// the
																	// results

		// Preparing connection to database
		Connection conn = connectMe();
		// Preparing sql string
		String sql = "SELECT * FROM game ga "
				+ "join game_genre gg "
				+ "on gg.game_id = ga.game_id "
				+ "where CONCAT_WS('OR',ga.title,ga.company,ga.rdate,ga.description,ga.price) like ? "
				+ "and ga.own like ?";// Searches through all relevant columns
		
		//If genre == 0, selects from all genre
		if(genre != 0){//Selects 1 genre
			sql += "and gg.genre_id = ?";
		}
		else{
			sql += "group by ga.game_id";//So it doesn't return duplicate results
		}
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+search+"%"); // Setting search substring
		pstmt.setString(2, "%"+own+"%");
		
		if(genre != 0){//Sets 1 genre
		pstmt.setInt(3, genre);
		};
	

		// Executing game select
		ResultSet rs = pstmt.executeQuery();

		return rs;

	}

	private String pOwn, pTitle, pCompany, pDate, pDesc, pImg;
	private int pID;
	private double pPrice;

	// PRODUCT DETAILS PAGE
	public void pidSearch(int pID) throws Exception {
		// Preparing connection to database
		Connection conn = connectMe();
		// Preparing sql string
		String sql = "SELECT * FROM game WHERE game_id = ?"; // Searches through all
														// relevant columns
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pID); // Setting search substring

		// Executing game select
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			this.pID = rs.getInt("game_id");
			this.pTitle = rs.getString("title");
			this.pCompany = rs.getString("company");
			this.pDate = rs.getString("rdate");
			this.pDesc = rs.getString("description");
			this.pPrice = rs.getDouble("price");
			this.pImg = rs.getString("img");
			this.pOwn = rs.getString("own");
		}
	}

	public int getpID() {
		return pID;
	}

	public String getpTitle() {
		return pTitle;
	}

	public String getpCompany() {
		return pCompany;
	}

	public String getpDate() {
		return pDate;
	}

	public String getpDesc() {
		return pDesc;
	}

	public double getpPrice() {
		return pPrice;
	}

	public String getpImg() {
		return pImg;
	}

	public String getpOwn() {
		return pOwn;
	}

	//<----------COMMENTS ARE HERE ======================-------------->
	public ResultSet selectComment(int pID) throws Exception{
		Connection conn = connectMe();
		
		String sql = "SELECT * FROM comments where game_id = ?";// Shows comments for product
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pID);
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}
	
	public int insertComment(int pID, String name, String comment,String date, int rating) throws Exception{
		//Preparing connection
		Connection conn = connectMe();
		
		//Preparing sql statement
		String sql = "INSERT INTO comments (game_id,name,comments,date,rating) values (?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,pID);
		pstmt.setString(2,name);
		pstmt.setString(3,comment);
		pstmt.setString(4,date);
		pstmt.setInt(5,rating);
		
		//Executing update
		int success = pstmt.executeUpdate();
		return success;
	}

}


