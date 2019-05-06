package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Project;
import model.bean.Roles;
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
			String sql = "SELECT id,firstname,username,password,email,phone,gender,state,address,birthday,role_id,enable FROM users WHERE username = ? AND password =?";
			return jdbcTemplate.queryForObject(sql, new Object[] {username,password}, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			return null;
		}
		
	}
	public User checkUserAdmin(String username, String password) {
		try {
			String sql = "SELECT id,firstname,username,password,email,phone,gender,state,address,birthday,enable,role_id FROM users WHERE username = ? AND password =? AND enable = 1 && (role_id=1 || role_id=2)";
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
			String sql = "SELECT id,firstname,username,password,email,users.role_id,phone,gender,state,address,birthday,enable FROM users "
					+ " INNER JOIN roles ON roles.role_id = users.role_id"
					+ " WHERE id=? ";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			return null;
		}
		
	}

	public List<User> getItems() {
		String sql="SELECT id,firstname,username,password,email,phone,gender,state,address,birthday ,enable,users.role_id FROM users"
				+ " INNER JOIN roles ON roles.role_id = users.role_id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
	}

	public int addItemAdmin(User user) {
		String sql ="INSERT INTO users(firstname, email,phone,username,password,role_id,enable) VALUES(?,?,?,?,?,?,1)";
		return jdbcTemplate.update(sql, new Object[] {user.getFirstname(),user.getEmail(),user.getPhone(),user.getUsername(),user.getPassword(),user.getRole_id()});
	}

	public int changeEnable(int id, int i) {
		String sql = "UPDATE users SET enable= ? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {i,id});
		
	}

	public int delItem(int id) {
		String sql ="DELETE FROM users WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

	public List<Roles> getItemsRole() {
		String sql="SELECT role_id,name FROM roles";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Roles>(Roles.class));
	}

	public int checkUsernameID(String username, int id) {
		String sql="SELECT count(*) FROM users WHERE username = ? && id=?";
		return jdbcTemplate.queryForObject(sql,new Object[] {username,id}, Integer.class);
	}

	public int editItem(User user) {
		String sql = "UPDATE users SET firstname=?,password=?, role_id =? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {user.getFirstname(), user.getPassword(), user.getRole_id(), user.getId()});
	}

	public int getCountUser() {
		String sql="SELECT count(*) AS sotin FROM users ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public int updateInfo(String phone, String name, String address, String birthday, Integer state, Integer gender,
			Integer id) {
		String sql = "UPDATE users SET phone=? ,firstname = ?, birthday=?,address=?,state=?,gender = ? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {phone,name,birthday,address,state,gender,id});
		
	}
	

}
