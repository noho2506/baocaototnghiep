package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.Defines;
import model.dao.ContactDAO;

@Controller
@RequestMapping("admin")
public class AdminContactController {
	@Autowired
	private ContactDAO contactDAO;
	@Autowired
	private Defines defines;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
	}
	@RequestMapping("/contacts")
	public String index(ModelMap modelMAP) {
		modelMAP.addAttribute("listContact",contactDAO.getItems());
		return "admin.contact.index";
	}
}
