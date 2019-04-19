package model.bean;

public class Users {
	private int id;
	private String firstname;
	private String email;
	private String username;
	private String phone;
	private String password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Users(int id, String firstname, String email, String username, String phone, String password) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.email = email;
		this.username = username;
		this.phone = phone;
		this.password = password;
	}
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
