package model.bean;

public class ImageProject {
	private int id;
	private String homepage;
	private String introduce;
	private String utility;
	private String map;
	private String design;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getUtility() {
		return utility;
	}
	public void setUtility(String utility) {
		this.utility = utility;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getDesign() {
		return design;
	}
	public void setDesign(String design) {
		this.design = design;
	}
	
	public ImageProject(int id, String homepage, String introduce, String utility, String map, String design) {
		super();
		this.id = id;
		this.homepage = homepage;
		this.introduce = introduce;
		this.utility = utility;
		this.map = map;
		this.design = design;
	}
	public ImageProject() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
