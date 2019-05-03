package controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.Defines;
import model.bean.User;
import model.dao.ContactDAO;

@Controller
@RequestMapping("admin")
public class AdminContactController {
	@Autowired
	private ContactDAO contactDAO;
	@Autowired
	private Defines defines;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("active3", "active");
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLoginAdmin");
		modelMap.addAttribute("userLogin", userLogin);
		Date date= new Date(session.getLastAccessedTime());
		modelMap.addAttribute("date", date);
	}
	@RequestMapping("/contacts")
	public String index(ModelMap modelMAP, HttpServletRequest request) {
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		modelMAP.addAttribute("listContact",contactDAO.getItems());
		return "admin.contact.index";
	}
}
