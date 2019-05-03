package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.Defines;
import model.bean.User;
import model.dao.AboutDAO;
import model.dao.AdverDAO;
import model.dao.CategoryDAO;
import model.dao.CommentLandDAO;
import model.dao.ContactDAO;
import model.dao.DistrictDAO;
import model.dao.DocumentDAO;
import model.dao.ImgDAO;
import model.dao.KnowDAO;
import model.dao.LandDAO;
import model.dao.NewsDAO;
import model.dao.ProjectDAO;
import model.dao.UsersDAO;
import util.SlugUtil;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	@Autowired
	private Defines defines;
	@Autowired
	private CategoryDAO catDAO;
	@Autowired 
	private LandDAO landDAO;
	@Autowired 
	private NewsDAO newsDAO;
	@Autowired 
	private KnowDAO knowDAO;
	@Autowired 
	private ProjectDAO projectDAO;
	@Autowired 
	private DistrictDAO districtDAO;
	@Autowired
	private AdverDAO adverDAO;
	@Autowired
	private  ContactDAO contactDAO;
	@Autowired
	private UsersDAO userDAO;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap,HttpServletRequest request) {
		modelMap.addAttribute("defines", defines);
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLoginAdmin");
		modelMap.addAttribute("userLogin", userLogin);
		Date date= new Date(session.getLastAccessedTime());
		modelMap.addAttribute("date", date);
		modelMap.addAttribute("landDAO", landDAO);
		modelMap.addAttribute("newsDAO", newsDAO);
		modelMap.addAttribute("knowDAO", knowDAO);
		modelMap.addAttribute("projectDAO", projectDAO);
	}
	@RequestMapping("")
	public String index(ModelMap modelMap){
		modelMap.addAttribute("countCat", catDAO.getCountCat());
		modelMap.addAttribute("countLand", landDAO.getCountLand());
		modelMap.addAttribute("countProject", projectDAO.getCountPro());
		modelMap.addAttribute("countNews", newsDAO.getCountNews());
		modelMap.addAttribute("countKnow", knowDAO.getCountKnow());
		modelMap.addAttribute("countAdv", adverDAO.getCountAdv());
		modelMap.addAttribute("countContact", contactDAO.getCounContact());
		modelMap.addAttribute("countUser", userDAO.getCountUser());
		ArrayList<Integer> tinLand=new ArrayList<>();
		ArrayList<Integer> tinPro=new ArrayList<>();
		ArrayList<Integer> tinNews=new ArrayList<>();
		ArrayList<Integer> tinKnow=new ArrayList<>();
		for (int i = 1; i <=12; i++) {
			tinLand.add(landDAO.getCount(i));
			tinPro.add(projectDAO.getCount(i));
			tinNews.add(newsDAO.getCount(i));
			tinKnow.add(knowDAO.getCount(i));
		}
		modelMap.addAttribute("tinLand", tinLand);
		modelMap.addAttribute("tinPro",tinPro);
		modelMap.addAttribute("tinNews", tinNews);
		modelMap.addAttribute("tinKnow", tinKnow);
		
		return "admin.index";
	}
	
}
