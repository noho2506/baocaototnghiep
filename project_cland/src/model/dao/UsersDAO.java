package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Category;
import model.bean.Contact;
import model.bean.Users;

@Repository
public class UsersDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int addItem(Users user) {
		String sql ="INSERT INTO users(firstname, email,phone,username,password) VALUES(?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {user.getFirstname(),user.getEmail(),user.getPhone(),user.getUsername(),user.getPassword()});
	}

	public int checkUsername(String username) {
		String sql="SELECT count(*) FROM users WHERE username = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {username}, Integer.class);
	}

	public Users checkUser(String username, String password) {
		try {
			String sql = "SELECT * FROM users WHERE username = ? AND password =?";
			return jdbcTemplate.queryForObject(sql, new Object[] {username,password}, new BeanPropertyRowMapper<Users>(Users.class));
		} catch (Exception e) {
			return null;
		}
		
	}

}
