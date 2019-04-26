package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Land;
import model.bean.NotifficationUser;

@Repository
public class NotiUserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	

	public int addItem(NotifficationUser noti) {
		String sql ="INSERT INTO notification(id_land,kind,id_cmt,id_user) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {noti.getId_land(),2,0,noti.getId_user()});
		
	}


	public int addItemDaBan(NotifficationUser noti) {
		String sql ="INSERT INTO notification(id_land,kind,id_cmt,id_user) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {noti.getId_land(),3,0,noti.getId_user()});
		
	}


	public int addItemNone(NotifficationUser noti) {
		String sql ="INSERT INTO notification(id_land,kind,id_cmt,id_user) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {noti.getId_land(),4,0,noti.getId_user()});
		
	}


	public List<NotifficationUser> getNoti(int id) {
		String sql="SELECT id,id_land,kind,id_cmt,id_user FROM notification  "
				+ " WHERE id_user= ?"
				+ " ORDER BY id DESC ";
		return jdbcTemplate.query(sql, new Object[] {id},new BeanPropertyRowMapper<NotifficationUser>(NotifficationUser.class));
	}


	public int addItemCmt(NotifficationUser noti) {
		String sql ="INSERT INTO notification(id_land,kind,id_cmt,id_user) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {noti.getId_land(),1,noti.getId_cmt(),noti.getId_user()});
		
	}


	public int delItem(int id) {
		String sql ="DELETE FROM notification WHERE id_user = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
}
