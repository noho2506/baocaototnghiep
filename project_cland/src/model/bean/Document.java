package model.bean;

public class Document {
	private int id;
	private String type;
	private String name;
	private String description;
	private byte[] content;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public byte[] getContent() {
		return content;
	}
	public void setContent(byte[] content) {
		this.content = content;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Document(int id, String type, String name, String description, byte[] content) {
		super();
		this.id = id;
		this.type = type;
		this.name = name;
		this.description = description;
		this.content = content;
	}
	public Document() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
