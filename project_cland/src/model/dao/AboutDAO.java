package model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.About;
import model.bean.Adver;
@Repository
public class AboutDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public About getItem() {
		try {
			String sql = "SELECT id,form1,form2,form3,form4,form5 FROM about ORDER BY id DESC LIMIT 1";
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<About>(About.class));
		} catch (Exception e) {
			return null;
		}
	}

	public int updateItem(String sql_temp) {
		String sql = "UPDATE about SET "+sql_temp ;
		return jdbcTemplate.update(sql);
	}
}
