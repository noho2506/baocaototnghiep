package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.Defines;

@Controller
@RequestMapping("admin")
public class AdminIndexontroller {
	private Defines defines;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap,HttpServletRequest request) {
		modelMap.addAttribute("defines", defines);
	}
	@RequestMapping("")
	public String index(ModelMap modelMap){
		return "admin.index";
	}
	
}
