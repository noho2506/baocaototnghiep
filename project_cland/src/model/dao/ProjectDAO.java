package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.ImageProject;
import model.bean.Land;
import model.bean.Project;

@Repository
public class ProjectDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Project> getItems() {
		String sql="SELECT projects.id,title,description,sellers,address,overview,projects.utility,location,id_image,vip,homepage AS trangchu,introduce AS gioithieu ,image.utility AS tienich,map AS vitri,design AS thietke FROM projects "
				+ " INNER JOIN image ON image.id = projects.id_image"
				+ " ORDER BY id DESC LIMIT 6";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Project>(Project.class));
	}
	public int addItemImg(Project project) { 
		String sql = "INSERT INTO image(homepage,introduce,utility,map,design) VALUES(?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {project.getTrangchu(),project.getGioithieu(),project.getTienich(),project.getVitri(),project.getThietke()});
	}
	public int getIdImg() {
		String sql= "SELECT id FROM image ORDER BY id DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public int addItem(Project project) {
		String sql = "INSERT INTO projects(title,description, sellers,id_image,overview,utility,location,vip,view) VALUES(?,?,?,?,?,?,?,0,0)";
		return jdbcTemplate.update(sql, new Object[] {project.getTitle(),project.getDescription(),project.getSellers(),project.getId_image(),project.getOverview(),project.getUtility(),project.getLocation()});
	}
	public int getCheckItem(String title) {
		String sql = "SELECT COUNT(*) AS countItem FROM projects WHERE title = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {title}, Integer.class);
	}
	public int getCheck(Project project) {
		String sql = "SELECT COUNT(*) AS countItem FROM projects WHERE title = ? AND id !=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {project.getTitle(),project.getId()}, Integer.class);
	}
	public Project getItem(int id) {
		try {
			String sql="SELECT projects.id,title,description,sellers,address,overview,projects.utility,location,id_image,vip,homepage AS trangchu,introduce AS gioithieu ,image.utility AS tienich,map AS vitri,design AS thietke FROM projects "
					+ " INNER JOIN image ON image.id = projects.id_image"
					+ " WHERE projects.id = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Project>(Project.class));
		} catch (Exception e) {
			return null;
		}
	}
	public int editItem(Project project) {
		String sql = "UPDATE projects SET title= ?,description=?,sellers=?,overview = ?,utility = ?,location = ? WHERE id=?";
		return jdbcTemplate.update(sql,new Object[] {project.getTitle(),project.getDescription(),project.getSellers(),project.getOverview(),project.getUtility(),project.getLocation(),project.getId()});
	}
	public int delItem(int id) {
		String sql= "DELETE FROM projects WHERE id =?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	public List<Project> getItemsVip() {
		String sql="SELECT projects.id,title,description,sellers,address,overview,projects.utility,location,id_image,vip,homepage AS trangchu,introduce AS gioithieu ,image.utility AS tienich,map AS vitri,design AS thietke FROM projects "
				+ " INNER JOIN image ON image.id = projects.id_image"
				+ " WHERE vip =1"
				+ " ORDER BY id DESC LIMIT 3";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Project>(Project.class));
	}
	public List<Project> getTopViewProject() {
		String sql="SELECT projects.id,title,description,sellers,address,overview,projects.utility,location,id_image,vip,homepage AS trangchu,introduce AS gioithieu ,image.utility AS tienich,map AS vitri,design AS thietke FROM projects "
				+ " INNER JOIN image ON image.id = projects.id_image"
				+ " ORDER BY view DESC LIMIT 6";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Project>(Project.class));
	}
	public int changeEnable(int id, int active) {
		String sql = "UPDATE projects SET vip=? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {active,id});
		
	}
	public int getCountPro() {
		String sql="SELECT count(*) AS sotin FROM projects ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public Integer getCount(int i) {
		String sql="SELECT count(*) AS sotin FROM projects WHERE Month(create_day)= "+i+  " && Year(create_day)= 2019" ; 
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	

}
