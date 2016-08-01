package object;
public class User {
	private String name;
	private String address;
	private String email;
	private String contactNo;
	private String password;
	private String isAdmin;
	
	public String getName() {
		return name;
	}
	public String getAddress() {
		return address;
	}
	public String getEmail() {
		return email;
	}
	public String getContactNo() {
		return contactNo;
	}
	public String getPassword() {
		return password;
	}
	public String getisAdmin(){
		return isAdmin;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	
}
