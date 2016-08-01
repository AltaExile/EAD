package utility;
import java.sql.*;
import conn.Connect;
import object.User;
public class UserDB {
	private String email;
	private String password;
	Connect connect = new Connect();
	
	public int login(String email, String pwd) {
	
		int success = 0;
		try {
			Connection conn = connect.connectMe();

			PreparedStatement pstmt;

			String sql = "SELECT * FROM user_details WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
			if (pwd.equals(rs.getString("password"))) {
				this.email = email;
				this.password = rs.getString("password");
				success = 1;
				return success;
			}
	}
		} catch (Exception e) {// Error handling
			e.printStackTrace();
	}
		return success;
	}
	
	public int setUserDetails(User uBean) throws Exception{
			Connection conn = connect.connectMe();
			
			String sql = "INSERT INTO user_details VALUES(?,?,?,?,?,'N')";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uBean.getName());
				pstmt.setString(2, uBean.getAddress());
				pstmt.setString(3, uBean.getEmail());
				pstmt.setString(4, uBean.getContactNo());
				pstmt.setString(5, uBean.getPassword());
			int success = pstmt.executeUpdate();
			
			return success;
		}


	public int modUserDetails(User uBean, String email) throws Exception{
		
			Connection conn = connect.connectMe();

			String sql = "UPDATE user_details SET name = ?, address = ?, contactNo = ?, password = ?"
					+ "WHERE email = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uBean.getName());
				pstmt.setString(2, uBean.getAddress());
				pstmt.setString(3, uBean.getContactNo());
				pstmt.setString(4, uBean.getPassword());
				pstmt.setString(5, email);
			int success = pstmt.executeUpdate();
			
		return success;
	}
	
	public int deleteUserDetails(String email) throws Exception{
		Connection conn = connect.connectMe();
		
			String sql = "DELETE FROM user_details WHERE email = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
		
			int success = pstmt.executeUpdate();
		
			return success;
	}
	
	public User getUserDetails(String email) throws Exception{
			Connection conn = connect.connectMe();
		
			String sql = "SELECT * FROM user_details WHERE email = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			
			User uBean = new User();
			rs.next();
			uBean.setName(rs.getString(1));
			uBean.setAddress(rs.getString(2));
			uBean.setEmail(rs.getString(3));
			uBean.setContactNo(rs.getString(4));
			uBean.setPassword(rs.getString(5));
			uBean.setIsAdmin(rs.getString(6));
			
			
		return uBean;
	}
}
	