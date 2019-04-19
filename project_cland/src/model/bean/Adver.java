package model.bean;

public class Adver {
	private int id;
	private String name;
	private String image;
	private String time;
	private String link;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Adver(int id, String name, String image, String time, String link) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.time = time;
		this.link = link;
	}
	public Adver() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
