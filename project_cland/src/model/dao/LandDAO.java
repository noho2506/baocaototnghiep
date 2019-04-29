package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import constant.Defines;
import model.bean.Adver;
import model.bean.Land;
import model.bean.NotifficationUser;

@Repository
public class LandDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Land> getItems() {
		String sql="SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,id_district FROM lands AS l "
				+ " INNER JOIN category AS c ON l.id_cat = c.id "
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " WHERE id_user = 0 "
				+ " ORDER BY l.id DESC ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Land>(Land.class));
	}
	public List<Land> getItemsUser() {
		String sql="SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,id_district,active FROM lands AS l "
				+ " INNER JOIN category AS c ON l.id_cat = c.id "
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " WHERE id_user != 0 AND state = 0 "
				+ " ORDER BY l.id DESC ";
				
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Land>(Land.class));
	}
	public List<Land> getItemsLandPubic() {
		String sql="SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,id_district FROM lands AS l " + 
				" INNER JOIN category AS c ON l.id_cat = c.id "
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " INNER JOIN district AS d ON d.id = id_district"
				+ " WHERE state = 0 && active =1 "
				+ " ORDER BY id DESC LIMIT 6";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Land>(Land.class));
	}
	public List<Land> getItemsLandImg() {
		String sql="SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,id_district FROM lands AS l " + 
				" INNER JOIN category AS c ON l.id_cat = c.id "
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " INNER JOIN district AS d ON d.id = id_district"
				+ " WHERE state = 0 && active =1 "
				+ " ORDER BY id DESC LIMIT 12";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Land>(Land.class));
	}
	public Land getItem(int id) {
		try {
			String sql = "SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,c.name AS name_cat,id_district FROM lands AS l "
					+ "INNER JOIN category AS c ON l.id_cat = c.id "
					/*+ "INNER JOIN district AS d ON d.id = id_district"*/
					+ " WHERE l.id = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Land>(Land.class));
		} catch (Exception e) {
			return null;
		}
	}
	public Land getItemName(int id) {
		try {
			String sql = "SELECT title FROM lands  "
					+ " WHERE id = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Land>(Land.class));
		} catch (Exception e) {
			return null;
		}
	}
	public int delItem(int id) {
		String sql = "DELETE FROM lands WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	public int delItemUser(int id) {
		String sql = "UPDATE lands SET state = 1 WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	public int editItem(Land land) {
		String sql = "UPDATE lands SET title=?, description=?, id_cat=?, area=?, location=?  WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {land.getTitle(),land.getDescription(),land.getId_cat(),land.getArea(),land.getLocation(),land.getId()});
	}
	public int countTinDangChuaBan(int quan, int id_cat, int year) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE id_district=? && id_cat=? && Year(create_day)=? && state = 0 ";
		return jdbcTemplate.queryForObject(sql, new Object[] {quan,id_cat,year}, Integer.class);
	}
	
	public int countTinDangDaBan(int quan, int id_cat, int year) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE id_district=? && id_cat=? && Year(create_day)=? && state = 1 ";
		return jdbcTemplate.queryForObject(sql, new Object[] {quan,id_cat,year}, Integer.class);
	}
	public List<Land> getItemsRelate(int id_cat) {
		String sql="SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,c.name AS name_cat,id_district FROM lands AS l "
				+ "INNER JOIN category AS c ON l.id_cat = c.id "
				+ "INNER JOIN district AS d ON d.id = id_district"
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " WHERE id_cat= ?"
				+ "  LIMIT 4";
		return jdbcTemplate.query(sql, new Object[] {id_cat},new BeanPropertyRowMapper<Land>(Land.class));
	}
	public List<Land> getItemsCatS(String  sql_id_district, int offset) {
		String sql="SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,c.name AS name_cat,id_district FROM lands AS l "
				+ "INNER JOIN category AS c ON l.id_cat = c.id "
				+ "INNER JOIN district AS d ON d.id = id_district"
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " WHERE "+sql_id_district + " && state = 0 && active = 1 "
				+ " ORDER BY l.id DESC LIMIT ?,5";
		return jdbcTemplate.query(sql, new Object[] {offset},new BeanPropertyRowMapper<Land>(Land.class));
	}
	public List<Land> getDienTich(int id_cat, int year, int quan) {
		// TODO Auto-generated method stub
		// tính tông diện tích trống
		String sql="SELECT area  FROM `lands` WHERE id_district=? && id_cat=? && Year(create_day)=? && state = 0 ";
		return jdbcTemplate.query(sql, new Object[] {quan,id_cat,year},  new BeanPropertyRowMapper<Land>(Land.class));
	}
	public int countTinMucGia(int quan, int id_cat, int year, String price) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE " + price +" && id_district= "+quan+" && id_cat= "+id_cat+" && Year(create_day)= "+year + " &&  state = 0 ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int getThongKeGia(int quan, int id_cat, int year, String price) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE " + price +" && id_district= "+quan+" && id_cat= "+id_cat+" && Year(create_day)= "+year + " &&  state = 0 ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int soTinSearch(String sql_id) {
		String sql="SELECT count(*) AS sotin FROM `lands` AS l "
				+ "  INNER JOIN category AS c ON l.id_cat = c.id "
				+ " INNER JOIN district AS d ON d.id = id_district"
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " WHERE " + sql_id + " && state = 0 && active = 1 ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public List<Land> getItemsS(int id, int offset) {
		String sql="SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,c.name AS name_cat,id_district FROM lands AS l "
				+ "  INNER JOIN category AS c ON l.id_cat = c.id "
				+ "INNER JOIN district AS d ON d.id = id_district"
				+ " WHERE id_cat= ? && state = 0 "
				+ " ORDER BY l.id DESC LIMIT ?,? ";
		return jdbcTemplate.query(sql, new Object[] {id,offset,Defines.ROW_COUNT},new BeanPropertyRowMapper<Land>(Land.class));
	}
	public int getCountCat(int id) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE id_cat = ? && state = 0";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, Integer.class);
	}
	public Land getItemTop() {
		try {
			String sql="SELECT count(*),d.name AS name_district,id_district,image FROM lands AS l "
					+ "INNER JOIN category AS c ON l.id_cat = c.id "
					+ "INNER JOIN district AS d ON d.id = id_district"
					+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
					+ " WHERE state = 0 && active =1 "
					+ "  GROUP BY id_district ORDER BY l.id DESC LIMIT 1";
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Land>(Land.class));
		} catch (Exception e) {
			return null;
		}
	}
	public List<Land> getItemsTop() {
		String sql="SELECT count(*),d.name AS name_district ,id_district,image FROM lands AS l "
				+ "INNER JOIN category AS c ON l.id_cat = c.id "
				+ "INNER JOIN district AS d ON d.id = id_district "
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " WHERE state = 0 && active =1 "
				+ "  GROUP BY id_district ORDER BY l.id DESC LIMIT 1,2";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Land>(Land.class));
	}
	public int getCountCatQuan(int id_district) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE id_district = "+id_district + " && state = 0 "; 
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public int getCountCatQuanTong(int id_district,int year) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE id_district = "+id_district+" && Year(create_day)= "+year  + "  && state = 0 " ; 
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public List<Land> getItemsCatQuan(int id_district, int offset) {
		String sql="SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,c.name AS name_cat,id_district FROM lands AS l "
				+ "  INNER JOIN category AS c ON l.id_cat = c.id "
				+ "INNER JOIN district AS d ON d.id = id_district"
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " WHERE id_district= ? && state = 0 "
				+ " ORDER BY l.id DESC LIMIT ?,? ";
		return jdbcTemplate.query(sql, new Object[] {id_district,offset,Defines.ROW_COUNT},new BeanPropertyRowMapper<Land>(Land.class));
	}
	public List<Land> getTopView() {
		String sql="SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,c.name AS name_cat,id_district FROM lands AS l "
				+ "  INNER JOIN category AS c ON l.id_cat = c.id "
				+ "INNER JOIN district AS d ON d.id = id_district"
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " WHERE active=1 && state = 0 "
				+ " ORDER BY view DESC LIMIT 6 ";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Land>(Land.class));
	}
	public List<Land> getTopViewCat() {
		String sql="SELECT l.id,title,description,price,image,create_day,area,location,detail,id_contact,id_cat,c.name AS name_cat,id_district FROM lands AS l "
				+ "  INNER JOIN category AS c ON l.id_cat = c.id "
				+ "INNER JOIN district AS d ON d.id = id_district"
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " WHERE active=1 && state = 0 "
				+ " ORDER BY view DESC LIMIT 4 ";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Land>(Land.class));
	}
	public int getCheckItem(String name) {
		String sql = "SELECT COUNT(*) AS countItem FROM lands  WHERE title = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {name}, Integer.class);
	}
	public int addItem(Land land) {
		String sql = "INSERT INTO lands(title,description,price,image,area,create_day,location,detail,id_contact,id_cat,id_district,active) VALUES(?,?,?,?,?,?,?,?,?,?,?,1)";
		return jdbcTemplate.update(sql, new Object[] {land.getTitle(),land.getDescription(),land.getPrice(),land.getImage(),land.getArea(),land.getCreate_day(),land.getLocation(),land.getDetail(),land.getId_contact(),land.getId_cat(),land.getId_district()});
	}
	public int addItemUser(Land land) {
		String sql = "INSERT INTO lands(title,description,price,image,area,create_day,location,detail,id_contact,id_cat,id_district,active) VALUES(?,?,?,?,?,?,?,?,?,?,?,0)";
		return jdbcTemplate.update(sql, new Object[] {land.getTitle(),land.getDescription(),land.getPrice(),land.getImage(),land.getArea(),land.getCreate_day(),land.getLocation(),land.getDetail(),land.getId_contact(),land.getId_cat(),land.getId_district()});
	}
	public int changeEnable(int id, int i) {
		String sql="UPDATE lands SET active =? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {i,id});
	}
	public List<Land> getDienTich(int id, int year, Integer id_district, String price) {
		String sql="SELECT area  FROM `lands` WHERE "+price+" && id_district=? && id_cat=? && Year(create_day)=? && state = 0 ";
		return jdbcTemplate.query(sql, new Object[] {id_district,id,year},  new BeanPropertyRowMapper<Land>(Land.class));
	}
	public int countTinDangDaBan(Integer id_district, int id, int year, int thang) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE id_district=? && id_cat=? && Year(create_day)=? && Month(create_day)= ? && state = 1 ";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_district,id,year,thang}, Integer.class);
	}
	public List<Land> getDienTichNam(int nam, Integer id_cat, Integer id_district, String area) {
		String sql="SELECT area  FROM `lands` WHERE "+area+" && id_district=? && id_cat=? && Year(create_day)=? ";
		return jdbcTemplate.query(sql, new Object[] {id_district,id_cat,nam},  new BeanPropertyRowMapper<Land>(Land.class));
	}
	public int countTinMucGiaTH3(Integer id_district, int nam, Integer id_cat, String key) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE " + key +" && id_district= "+id_district+" && id_cat= "+id_cat+" && Year(create_day)= "+nam ;
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public int countTinDaDang(Integer id_district, int nam, Integer id_cat) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE id_district=? && id_cat=? && Year(create_day)=? ";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_district,id_cat,nam}, Integer.class);
	}
	public int getCountCatQuan(Integer id_district, Integer id_cat) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE id_district=? && id_cat=? && year(create_day)>2013 AND year(create_day)<2019";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_district,id_cat}, Integer.class);
	}
	public int countTinDaDangBan(Integer id_district, int nam, Integer id_cat) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE id_district=? && id_cat=? && Year(create_day)=? && state= 1 ";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_district,id_cat,nam}, Integer.class);
	}
	public int getCountCatQuanBan(Integer id_district, Integer id_cat) {
		String sql="SELECT count(*) AS sotin FROM `lands` WHERE id_district=? && id_cat=? && year(create_day)>2013 AND year(create_day)<2019 && state = 1";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_district,id_cat}, Integer.class);
	}
	public List<Land> getItemUser(int id) {
		try {
			String sql="SELECT l.id,title,create_day,id_contact,active,l.state,view FROM lands AS l "
					+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
					+ "  INNER JOIN users  ON users.id = sellers.id_user "
					+ " WHERE id_user = ? ";
			return jdbcTemplate.query(sql, new Object[] {id},new BeanPropertyRowMapper<Land>(Land.class));
		} catch (Exception e) {
			return null;
		}
	}
	public int getIdUser(int id) {
		String sql="SELECT id_user FROM `lands` AS l "
				+ " INNER JOIN sellers  ON l.id_contact = sellers.id "
				+ " WHERE l.id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, Integer.class);
	}
	public NotifficationUser getUser(int id_land, int id_cmt) {
		try {
			String sql="SELECT id_user,cmt_land.id as id_cmt,id_land FROM `lands` INNER JOIN sellers ON lands.id_contact = sellers.id INNER JOIN cmt_land ON lands.id= cmt_land.id_land WHERE lands.id =? && cmt_land.id=? ";
			return jdbcTemplate.queryForObject(sql, new Object[] {id_land,id_cmt},new BeanPropertyRowMapper<NotifficationUser>(NotifficationUser.class));
		} catch (Exception e) {
			return null;
		}
	}

}
