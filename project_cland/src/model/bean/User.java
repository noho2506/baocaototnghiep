package model.bean;

public class User {
	private int id;
	private String firstname;
	private String email;
	private String username;
	private String phone;
	private String password;
	private String birthday;
	private Integer gender;
	private Integer state;
	private String address;
	private Integer enable;
	private int role_id;
	
	
	public Integer getEnable() {
		return enable;
	}
	public void setEnable(Integer enable) {
		this.enable = enable;
	}
	
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
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
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	

	public User(int id, String firstname, String email, String username, String phone, String password, String birthday,
			Integer gender, Integer state, String address, Integer enable, int role_id) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.email = email;
		this.username = username;
		this.phone = phone;
		this.password = password;
		this.birthday = birthday;
		this.gender = gender;
		this.state = state;
		this.address = address;
		this.enable = enable;
		this.role_id = role_id;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
