package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Category;
import model.bean.Document;
import model.bean.Know;

@Repository
public class DocumentDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	/*public List<Category> getItems() {
		String sql="SELECT id, name FROM category";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	}*/
	public int addItem(Document document) {
		String sql ="INSERT INTO document(name,type,content,description) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {document.getName(),document.getType(),document.getContent(),document.getDescription()});
	}
	public List<Document> getItems() {
		String sql="SELECT id,name,type,description,content FROM document ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Document>(Document.class));
	}
	public Document getItem(int id) {
		try {
			String sql = "SELECT * FROM document WHERE id = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Document>(Document.class));
		} catch (Exception e) {
			return null;
		}
	}
	public int delItem(int id) {
		String sql ="DELETE FROM document WHERE id =? ";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

}
