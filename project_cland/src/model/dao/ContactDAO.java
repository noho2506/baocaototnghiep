package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Contact;

@Repository
public class ContactDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Contact> getItems() {
		String sql="SELECT id, name,phone,email,message FROM contact";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Contact>(Contact.class));
	}
	
	public int addItem(Contact contact) {
		String sql ="INSERT INTO contact(name, email, phone, message) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {contact.getName(),contact.getEmail(),contact.getPhone(),contact.getMessage()});
	}
	public int addItemProject(Contact contact) {
		System.out.println(contact.getName());
	    System.out.println(contact.getEmail());
	    System.out.println(contact.getId());
	    System.out.println(contact.getPhone());
		String sql ="INSERT INTO contact(name, email, phone,id_project) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {contact.getName(),contact.getEmail(),contact.getPhone(),contact.getId_project()});
	}

	public void addItemProject() {
		// TODO Auto-generated method stub
		
	}
}
