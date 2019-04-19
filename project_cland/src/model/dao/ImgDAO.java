package model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.ImageProject;
import model.bean.Project;

@Repository
public class ImgDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ImageProject getIdImg(int id) {
		try {
			String sql = " SELECT id,homepage,introduce,map,design,utility FROM image WHERE id=?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<ImageProject>(ImageProject.class));
		} catch (Exception e) {
			return null;
		}
	}

	public int delItem(int id_image) {
		String sql= "DELETE FROM image WHERE id =?";
		return jdbcTemplate.update(sql, new Object[] {id_image});
	}
	/*public int editImgPro(Project project) {
		String sql = "UPDATE image SET trangchu = "+project.getTrangchu()+" ,gioithieu="+project.getGioithieu()+" ,tienich="+project.getTienich()+" ,vitri="+project.getVitri()+" ,thietke="+project.getThietke()+" WHERE id= "+project.getId_image();
		System.out.println(sql);
		return jdbcTemplate.update(sql, new Object[] {id});
	}*/
	public int editImgPro(Project project) {
		String sql = "UPDATE image SET homepage = ? ,introduce= ?,utility= ? ,map= ?,design=? WHERE id= ?";
		return jdbcTemplate.update(sql, new Object[] {project.getTrangchu(),project.getGioithieu(),project.getTienich(),project.getVitri(),project.getThietke(),project.getId_image()});
	}

}
