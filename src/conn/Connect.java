package conn;

import java.sql.*;

public class Connect {

	public Connect() {
		// TODO Auto-generated constructor stub
	}
	
	//For connection to database
	public Connection connectMe() throws Exception {
		// Preparing the driver
		Class.forName("com.mysql.jdbc.Driver");
		// Loading Connection URL
		String connURL = "jdbc:mysql://localhost/assignment?user=root&password=root";
		// Establish connection to url
		Connection conn = DriverManager.getConnection(connURL);
		return conn;
	}
}
