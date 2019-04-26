package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.CommentLand;

@Repository
public class CommentLandDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int addCmt(CommentLand comment) {
		String sql ="INSERT INTO cmt_land(name,email,cmt,id_land,create_day,sub_id) VALUES(?,?,?,?,?,0)";
		return jdbcTemplate.update(sql, new Object[] {comment.getName(),comment.getEmail(),comment.getCmt(),comment.getId_land(),comment.getCreate_day()});
		
	}

	public CommentLand getItem() {
		try {
			String sql ="SELECT id,name,email,cmt,id_land,create_day FROM cmt_land ORDER BY id DESC LIMIT 1 ";
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<CommentLand>(CommentLand.class));
		} catch (Exception e) {
			return null;
		}
	}
	public CommentLand getItemName(int id) {
		try {
			String sql ="SELECT name FROM cmt_land WhERE id=? ";
			return jdbcTemplate.queryForObject(sql,new Object[] {id}, new BeanPropertyRowMapper<CommentLand>(CommentLand.class));
		} catch (Exception e) {
			return null;
		}
	}

	public List<CommentLand> getCmt(int id) {
		String sql="SELECT id,name,email,cmt,create_day,id_land,sub_id FROM cmt_land WHERE id_land = ? AND sub_id= 0 ORDER BY id DESC";
		return jdbcTemplate.query(sql, new Object[] {id},new BeanPropertyRowMapper<CommentLand>(CommentLand.class));
	}
	public int addCmtRep(CommentLand comment) {
		String sql ="INSERT INTO cmt_land(name,email,cmt,id_land,create_day,sub_id) VALUES(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {comment.getName(),comment.getEmail(),comment.getCmt(),comment.getId_land(),comment.getCreate_day(),comment.getSub_id()});
		
	}
	public List<CommentLand> getCmtRep(int sub_id) {
		String sql="SELECT id,name,email,cmt,create_day,id_land,sub_id FROM cmt_land WHERE sub_id = ?  ORDER BY id DESC";
		return jdbcTemplate.query(sql, new Object[] {sub_id},new BeanPropertyRowMapper<CommentLand>(CommentLand.class));
	}

}
