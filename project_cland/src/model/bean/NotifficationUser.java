package model.bean;

public class NotifficationUser {
	private int id;
	private int id_land;
	private int kind;
	private int id_cmt;
	private String name;
	private int id_user;
	
	
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_land() {
		return id_land;
	}
	public void setId_land(int id_land) {
		this.id_land = id_land;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getId_cmt() {
		return id_cmt;
	}
	public void setId_cmt(int id_cmt) {
		this.id_cmt = id_cmt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public NotifficationUser(int id, int id_land, int kind, int id_cmt, String name, int id_user) {
		super();
		this.id = id;
		this.id_land = id_land;
		this.kind = kind;
		this.id_cmt = id_cmt;
		this.name = name;
		this.id_user = id_user;
	}
	public NotifficationUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
