package model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.User;

@Repository
public class UsersDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int addItem(User user) {
		String sql ="INSERT INTO users(firstname, email,phone,username,password) VALUES(?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {user.getFirstname(),user.getEmail(),user.getPhone(),user.getUsername(),user.getPassword()});
	}

	public int checkUsername(String username) {
		String sql="SELECT count(*) FROM users WHERE username = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {username}, Integer.class);
	}

	public User checkUser(String username, String password) {
		try {
			String sql = "SELECT id,firstname,username,password,email,phone,gender,state,address,birthday FROM users WHERE username = ? AND password =?";
			return jdbcTemplate.queryForObject(sql, new Object[] {username,password}, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			return null;
		}
		
	}
	public User checkUserAdmin(String username, String password) {
		try {
			String sql = "SELECT id,firstname,username,password,email,phone,gender,state,address,birthday FROM users WHERE username = ? AND password =? AND enable = 1 && role_id=1";
			return jdbcTemplate.queryForObject(sql, new Object[] {username,password}, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			return null;
		}
		
	}

	public int check(String username, int id) {
			String sql = "SELECT count(*) AS soTin FROM users WHERE username = ? AND id !=?";
			return jdbcTemplate.queryForObject(sql, new Object[] {username,id}, Integer.class);
	}

	public int update(String username, int id) {
		String sql = "UPDATE users SET username=? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {username,id});
		
	}
	public int updatePass(String pass, int id) {
		String sql = "UPDATE users SET password=? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {pass,id});
		
	}
	public User getItem(int id) {
		try {
			String sql = "SELECT id,firstname,username,password,email,phone,gender,state,address,birthday FROM users WHERE id=?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			return null;
		}
		
	}

	public int updateInfo(String name, String address, String birthday, Integer state, Integer gender, Integer id) {
		String sql = "UPDATE users SET firstname = ?, birthday=?,address=?,state=?,gender = ? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {name,birthday,address,state,gender,id});
		
	}

}
