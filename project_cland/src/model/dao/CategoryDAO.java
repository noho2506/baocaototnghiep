package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Category;

@Repository
public class CategoryDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Category> getItems() {
		String sql="SELECT id, name FROM category";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	}
	public int addItem(String name) {
		String sql ="INSERT INTO category(name) VALUES(?)";
		return jdbcTemplate.update(sql, new Object[] {name});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM category WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	public int editItem(Category land) {
		String sql = "UPDATE category SET name = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {land.getName(),land.getId()});
	}
	public int getCheckItem(String cname) {
		String sql = "SELECT COUNT(*) AS countItem FROM category WHERE name = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {cname}, Integer.class);
	}
	public Category getItem(int id) {
		try {
			String sql = "SELECT * FROM category WHERE id = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Category>(Category.class));
		} catch (Exception e) {
			return null;
		}
		
	}
	public int getCountCat() {
		String sql="SELECT count(*) AS sotin FROM category ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
}
