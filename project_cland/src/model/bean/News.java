package model.bean;

import java.sql.Timestamp;

public class News {
	private int id;
	private String title;
	private String description;
	private String image;
	private Timestamp time;
	private String  detail;
	private int view;
	
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	public String getDetail() {
		return detail;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public News(int id, String title, String description, String image, Timestamp time, String detail, int view) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.image = image;
		this.time = time;
		this.detail = detail;
		this.view = view;
	}
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
