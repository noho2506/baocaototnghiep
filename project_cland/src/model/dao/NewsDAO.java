package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.News;

@Repository
public class NewsDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<News> getItems(int offset) {
		String sql="SELECT id,title, description,image,time,detail,view FROM news "
				+ " ORDER BY id DESC LIMIT ?,7";
		return jdbcTemplate.query(sql, new Object[] {offset}, new BeanPropertyRowMapper<News>(News.class));
	}
	public List<News> getItemNews() {
		String sql="SELECT id,title, description,image,time,detail,view FROM news "
				+ " ORDER BY id DESC LIMIT 7";
		return jdbcTemplate.query(sql,  new BeanPropertyRowMapper<News>(News.class));
	}
	public List<News> getItemsNews() {
		String sql="SELECT id,title, description,image,time,detail,view FROM news ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<News>(News.class));
	}
	public News getItem(int id) {
		try {
			String sql = "SELECT id,title, description,image,time,detail,view FROM news WHERE id = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<News>(News.class));
		} catch (Exception e) {
			return null;
		}
	}
	public int delItem(int id) {
		String sql = "DELETE FROM news WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	public int delItem(String temp) {
		String sql = "DELETE FROM news "+ temp;
		return jdbcTemplate.update(sql);
	}
	public int editItem(News news) {
		String sql = "UPDATE news SET title=?, description=?, image =?, detail =? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {news.getTitle(),news.getDescription(),news.getImage(),news.getDetail(),news.getId()});
	}
	public List<News> getItemView() {
		String sql="SELECT id,title, description,image,time,detail,view FROM news "
				+ " ORDER BY view DESC LIMIT 6";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<News>(News.class));
	}
	public List<News> getItemView4() {
		String sql="SELECT id,title, description,image,time,detail,view FROM news "
				+ " ORDER BY view DESC LIMIT 4";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<News>(News.class));
	}
	public int getView(int id) {
		String sql = "SELECT view FROM news WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id},Integer.class);
	}
	public int getViewUpdate(int view, int id) {
		String sql = "UPDATE news SET view = ? WHERE id= ? ";
		return jdbcTemplate.update(sql, new Object[] {view,id});
	}
	public int getCountCat() {
		String sql="SELECT count(*) AS sotin FROM news ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public int getCountNews() {
		String sql="SELECT count(*) AS sotin FROM news ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public Integer getCount(int i) {
		String sql="SELECT count(*) AS sotin FROM news WHERE Month(time)= "+i+  " && Year(time)= 2019" ; 
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	

}
