package model.bean;

public class Land {
	private int id;
	private String title;
	private String description;
	private String price;
	private String image;
	private String create_day;
	private String area;
	private String location;
	private String detail;
	private int id_contact;
	private String name_contact;
	private String phone;
	private String address_contact;
	private int id_cat;
	private String name_cat;
	private int id_district;
	private String name_district;
	private String date_create;
	private int active;
	private int state;
	

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getName_contact() {
		return name_contact;
	}

	public void setName_contact(String name_contact) {
		this.name_contact = name_contact;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress_contact() {
		return address_contact;
	}

	public void setAddress_contact(String address_contact) {
		this.address_contact = address_contact;
	}

	public String getName_district() {
		return name_district;
	}

	public void setName_district(String name_district) {
		this.name_district = name_district;
	}

	public String getName_cat() {
		return name_cat;
	}

	public void setName_cat(String name_cat) {
		this.name_cat = name_cat;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCreate_day() {
		return create_day;
	}
	public void setCreate_day(String create_day) {
		this.create_day = create_day;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getId_contact() {
		return id_contact;
	}
	public void setId_contact(int id_contact) {
		this.id_contact = id_contact;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public int getId_district() {
		return id_district;
	}
	public void setId_district(int id_district) {
		this.id_district = id_district;
	}
	public String getDate_create() {
		return date_create;
	}
	public void setDate_create(String date_create) {
		this.date_create = date_create;
	}


	

	public Land(int id, String title, String description, String price, String image, String create_day, String area,
			String location, String detail, int id_contact, String name_contact, String phone, String address_contact,
			int id_cat, String name_cat, int id_district, String name_district, String date_create, int active,
			int state) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.price = price;
		this.image = image;
		this.create_day = create_day;
		this.area = area;
		this.location = location;
		this.detail = detail;
		this.id_contact = id_contact;
		this.name_contact = name_contact;
		this.phone = phone;
		this.address_contact = address_contact;
		this.id_cat = id_cat;
		this.name_cat = name_cat;
		this.id_district = id_district;
		this.name_district = name_district;
		this.date_create = date_create;
		this.active = active;
		this.state = state;
	}

	public Land() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
