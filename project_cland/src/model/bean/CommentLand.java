package model.bean;

public class CommentLand {
	private int id;
	private String name;
	private String email;
	private String cmt;
	private int id_land;
	private String create_day;
	private int sub_id;
	
	
	
	public int getSub_id() {
		return sub_id;
	}
	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
	}
	public String getCreate_day() {
		return create_day;
	}
	public void setCreate_day(String create_day) {
		this.create_day = create_day;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	
	public int getId_land() {
		return id_land;
	}
	public void setId_land(int id_land) {
		this.id_land = id_land;
	}
	
	
	public CommentLand(int id, String name, String email, String cmt, int id_land, String create_day, int sub_id) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.cmt = cmt;
		this.id_land = id_land;
		this.create_day = create_day;
		this.sub_id = sub_id;
	}
	public CommentLand() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
