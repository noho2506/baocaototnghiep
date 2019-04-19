package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import constant.Defines;
import model.bean.Users;
import model.dao.CategoryDAO;
import model.dao.DistrictDAO;
import model.dao.KnowDAO;
import model.dao.LandDAO;
import model.dao.NewsDAO;
import model.dao.ProjectDAO;
import model.dao.UsersDAO;
import util.SlugUtil;

@Controller
public class PublicAuthController {
	@Autowired
	private Defines defines;
	@Autowired
	private CategoryDAO catDAO;
	@Autowired
	private UsersDAO userDAO;
	@Autowired
	private SlugUtil slugUtil;
	@Autowired 
	private DistrictDAO districtDAO;
	@Autowired 
	private LandDAO landDAO;
	@Autowired 
	private NewsDAO newsDAO;
	@Autowired 
	private KnowDAO knowDAO;
	@Autowired 
	private ProjectDAO projectDAO;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtil", slugUtil);
	}
	@ModelAttribute
	public void commonsObject(ModelMap modelMap) {
		modelMap.addAttribute("listCat", catDAO.getItems());
		modelMap.addAttribute("listQuan", districtDAO.getItems());
	}
	@RequestMapping("/dang-ky")
	public String register( ModelMap modelMap ){
		return "public.login";
	}
	@RequestMapping(value="/dang-ky",method=RequestMethod.POST)
	public String register( HttpServletResponse response, HttpServletRequest request, ModelMap modelMap,@ModelAttribute("ten") String firstname,@ModelAttribute("email") String email,@ModelAttribute("phone") String phone,@ModelAttribute("username") String username,@ModelAttribute("password") String password){
		Users user = new Users(0, firstname, email, username, phone, password);
		String chuoi="";
		PrintWriter out;
		try {
			out = response.getWriter();
			if(userDAO.checkUsername(username)>0) {
				chuoi= "<div class=\"header-msg\">\r\n" + 
						"				<div class=\"container-msg\">\r\n" + 
						"						<h4 class=\"thongbao\">Thông báo </h4>\r\n" + 
						"						<p class=\"msg\">Tài khoản đã có người sử dụng  </p>\r\n" + 
						"						<a href='"+request.getContextPath()+"/dang-ky' class=\"btn btn-metis-5 xacnhan\"> Xác nhận </a>" + 
						"				</div>\r\n" + 
						"				</div>";
			}else {
				userDAO.addItem(user);
				chuoi= "<div class=\"header-msg\">\r\n" + 
						"				<div class=\"container-msg\">\r\n" + 
						"						<h4 class=\"thongbao\">Thành công</h4>\r\n" + 
						"						<p class=\"msg\">Đăng nhập để đăng tin miễn phí</p>\r\n" + 
						"						<a href='"+request.getContextPath()+"' class=\"btn btn-metis-5 xacnhan\"> Xác nhận </a>\r\n" + 
						"				</div>\r\n" + 
						"				</div>";
			}
			out.println(chuoi);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value="/",method=RequestMethod.POST)
	public String register( ModelMap modelMap,HttpServletRequest request,@ModelAttribute("username")String username,@ModelAttribute("password")String password){
		HttpSession session=request.getSession();
		//kiểm tra khi chưa nhập dữ liệu
		Users user = null;
		if(("".equals(username))||("".equals(password))){
			System.out.println("thaats baif");
			user = new Users();
		}else {
			user= userDAO.checkUser(username,password);
			// có tài khoản trong list
			session.setAttribute("userLogin",user);
		}
		modelMap.addAttribute("listLands", landDAO.getItemsLandPubic());
		modelMap.addAttribute("listProject", projectDAO.getItems());
		// lấy khu vực cao nhất 
		modelMap.addAttribute("getItemTop", landDAO.getItemTop());
		modelMap.addAttribute("getLandsTop", landDAO.getItemsTop());
		modelMap.addAttribute("getItemCat", newsDAO.getItemNews());
		modelMap.addAttribute("getItemKnow", knowDAO.getItems());
		return "public.land.index";
	}
	@RequestMapping("/logout")
	public String index( ModelMap modelMap ,HttpServletRequest request){
		HttpSession session= request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping("/user")
	public String index( ModelMap modelMap){
		return "public.user.index";
	}
}
