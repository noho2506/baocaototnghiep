package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.District;

@Repository
public class DistrictDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<District> getItems() {
		String sql="SELECT id,name FROM district";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<District>(District.class));
	}
	public District getItem(int id_district) {
		try {
			String sql="SELECT id,name FROM district WHERE id = "+id_district;
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<District>(District.class));
		} catch (Exception e) {
			return null;
		}
	}
}
