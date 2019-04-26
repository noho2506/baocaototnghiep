package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.District;
import model.bean.Land;
import model.bean.Seller;
import model.bean.User;

@Repository
public class SellerDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public Seller getItem(int id) {
		try {
			String sql="SELECT id,name,phone,address FROM sellers WHERE id=?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Seller>(Seller.class));
		} catch (Exception e) {
			System.out.println("chạy");
			return null;
		}
	}
	public int addItemContact(Land land) {
		String sql = "INSERT INTO sellers(name,phone,address,id_user) VALUES(?,?,?,0)";
		return jdbcTemplate.update(sql, new Object[] {land.getName_contact(),land.getPhone(),land.getAddress_contact()});
	}
	public Seller getItemId() {
			String sql="SELECT id,name,phone,address FROM sellers ORDER BY id DESC LIMIT 1";
			return jdbcTemplate.queryForObject(sql,  new BeanPropertyRowMapper<Seller>(Seller.class));
	}
	public int addItemContactUser(User userLogin) {
		String sql = "INSERT INTO sellers(name,phone,address,id_user) VALUES(?,?,'',?)";
		return jdbcTemplate.update(sql, new Object[] {userLogin.getFirstname(),userLogin.getPhone(),userLogin.getId()});
	}
}
