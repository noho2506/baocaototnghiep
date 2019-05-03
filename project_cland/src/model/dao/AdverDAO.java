package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Adver;

@Repository
public class AdverDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Adver> getItems() {
		String sql="SELECT id,name, link,image,time FROM advertisement ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Adver>(Adver.class));
	}
	public Adver getItem(int id) {
		try {
			String sql = "SELECT id,name, link,image,time FROM advertisement  WHERE id = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Adver>(Adver.class));
		} catch (Exception e) {
			return null;
		}
	}
	public int delItem(int id) {
		String sql = "DELETE FROM advertisement WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	public int editItem(Adver adv) {
		String sql = "UPDATE advertisement SET name=?, link=?, image =? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {adv.getName(),adv.getLink(),adv.getImage(),adv.getId()});
	}
	public int getCheckItem(String name) {
		String sql = "SELECT COUNT(*) AS countItem FROM advertisement  WHERE name = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {name}, Integer.class);
	}
	public int addItem(Adver adv) {
		String sql = "INSERT INTO advertisement(name,link,image) VALUES(?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {adv.getName(),adv.getLink(),adv.getImage()});
	}
	public List<Adver> getItemAdv() {
		String sql="SELECT id,name, link,image,time FROM advertisement "
				+ " ORDER BY id DESC  LIMIT 3";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Adver>(Adver.class));
	}
	public int getCountAdv() {
		String sql="SELECT count(*) AS sotin FROM advertisement ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	

}
