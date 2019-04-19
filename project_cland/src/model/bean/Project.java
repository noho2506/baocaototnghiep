package model.bean;

public class Project {
	private int id;
	private String title;
	private String description;
	private String sellers;
	private int id_image;
	private int vip;
	private String address;
	private String overview;
	private String utility;
	private String location;
	private String trangchu;
	private String gioithieu;
	private String tienich;
	private String vitri;
	private String thietke;
	
	
	public int getVip() {
		return vip;
	}
	public void setVip(int vip) {
		this.vip = vip;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTrangchu() {
		return trangchu;
	}
	public void setTrangchu(String trangchu) {
		this.trangchu = trangchu;
	}
	public String getGioithieu() {
		return gioithieu;
	}
	public void setGioithieu(String gioithieu) {
		this.gioithieu = gioithieu;
	}
	public String getTienich() {
		return tienich;
	}
	public void setTienich(String tienich) {
		this.tienich = tienich;
	}
	public String getVitri() {
		return vitri;
	}
	public void setVitri(String vitri) {
		this.vitri = vitri;
	}
	public String getThietke() {
		return thietke;
	}
	public void setThietke(String thietke) {
		this.thietke = thietke;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSellers() {
		return sellers;
	}
	public void setSellers(String sellers) {
		this.sellers = sellers;
	}
	public int getId_image() {
		return id_image;
	}
	public void setId_image(int id_image) {
		this.id_image = id_image;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public String getUtility() {
		return utility;
	}
	public void setUtility(String utility) {
		this.utility = utility;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
	
	public Project(int id, String title, String description, String sellers, int id_image, int vip, String address,
			String overview, String utility, String location, String trangchu, String gioithieu, String tienich,
			String vitri, String thietke) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.sellers = sellers;
		this.id_image = id_image;
		this.vip = vip;
		this.address = address;
		this.overview = overview;
		this.utility = utility;
		this.location = location;
		this.trangchu = trangchu;
		this.gioithieu = gioithieu;
		this.tienich = tienich;
		this.vitri = vitri;
		this.thietke = thietke;
	}
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
