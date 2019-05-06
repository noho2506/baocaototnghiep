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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.User;
import model.dao.CategoryDAO;
import model.dao.CommentLandDAO;
import model.dao.DistrictDAO;
import model.dao.KnowDAO;
import model.dao.LandDAO;
import model.dao.NewsDAO;
import model.dao.NotiUserDAO;
import model.dao.ProjectDAO;
import model.dao.SellerDAO;
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
	@Autowired
	private NotiUserDAO notiDAO;
	@Autowired 
	private CommentLandDAO cmtDAO;
	@Autowired 
	private SellerDAO sellerDAO;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtil", slugUtil);
	}
	@ModelAttribute
	public void commonsObject(ModelMap modelMap) {
		modelMap.addAttribute("listCat", catDAO.getItems());
		modelMap.addAttribute("listQuan", districtDAO.getItems());
		modelMap.addAttribute("landDAO", landDAO);
		modelMap.addAttribute("cmtDAO", cmtDAO);
	}
	@RequestMapping("/dang-ky")
	public String register( ModelMap modelMap ){
		return "public.login";
	}
	@RequestMapping(value="/dang-ky",method=RequestMethod.POST)
	public String register( HttpServletResponse response, HttpServletRequest request, ModelMap modelMap,@ModelAttribute("ten") String firstname,@ModelAttribute("email") String email,@ModelAttribute("phone") String phone,@ModelAttribute("username") String username,@ModelAttribute("password") String password){
		User user = new User(0, firstname, email, username, phone, password,"",0,0,"",0,1);
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
		User userLogin = null;
		if(("".equals(username))||("".equals(password))){
			userLogin = new User();
		}else {
			userLogin= userDAO.checkUser(username,password);
			if (userLogin!=null) {
				session.setAttribute("userLogin",userLogin);
				/*System.out.println("aa");*/
			}
			// có tài khoản trong list
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
	public String logout( ModelMap modelMap ,HttpServletRequest request){
		HttpSession session= request.getSession();
		session.removeAttribute("userLogin");
		return "redirect:/";
	}
	@RequestMapping("/user")
	public String index( ModelMap modelMap,HttpServletRequest request){
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLogin");
		modelMap.addAttribute("userLogin", userLogin);
		modelMap.addAttribute("listItemUser", landDAO.getItemUser(userLogin.getId()));
		modelMap.addAttribute("listNotiUser", notiDAO.getNoti(userLogin.getId()));
		/*System.out.println("ten:"+cmtDAO.getItemName(233).getName());*/
		return "public.user.index";
	}
	@RequestMapping(value="/user",method=RequestMethod.POST)
	public String index( @RequestParam("name") String username,@RequestParam("temp_id") Integer id,HttpServletResponse response, HttpServletRequest request){
		String chuoi="";
		PrintWriter out;
		try {
			out = response.getWriter();
			if (userDAO.check(username,id)>0) {
				// trùng 
				chuoi= "<h3>Thay đổi tên đăng nhập </h3>\r\n" + 
						"								<div class=\"change-edit-user\">\r\n" + 
						"									<h6> <SPAN>Username đã tồn tại</SPAN> </h6>\r\n" + 
						"									<div class=\"form-edit-user\">\r\n" + 
						"										<p>Vui lòng nhập username mới: </p>\r\n" + 
						"										<INPUT type=\"text\" name =\"username\" placeholder=\"Vui lòng nhập username\" class=\"nhap-username\" value='"+username+"'/>\r\n" + 
						"							            <p><a href=\"javascript:void(0)\" onclick=\"edit_username("+id+")\" class=\"btn btn-success btn-outline-rounded green\"> EDIT<span style=\"margin-left:10px;\" class=\"glyphicon glyphicon-send\"></span></a></p>\r\n" + 
						"									</div>\r\n" + 
						"								</div>";
			}else {
				userDAO.update(username,id);
				User userLogin = userDAO.getItem(id);
				HttpSession session=request.getSession();
				session.setAttribute("userLogin",userLogin);
				chuoi= "<div class=\"header-msg-edit\">\r\n" + 
						"									<div class=\"container-msg-edit\">\r\n" + 
						"											<h4 class=\"thongbao-edit\">Thông báo </h4>\r\n" + 
						"											<p class=\"msg-edit\">Cập nhật thành công   </p>\r\n" + 
						"						<a href='"+request.getContextPath()+"/user' class=\"btn btn-metis-5 btn-lg xacnhan-edit\"> Xác nhận </a>\r\n" + 
						"									</div>\r\n" + 
						"									</div>";
			}
			out.println(chuoi);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value="/user/index",method=RequestMethod.POST)
	public String editPass( @RequestParam("pass") String pass,@RequestParam("temp_id") Integer id,HttpServletResponse response, HttpServletRequest request){
		String chuoi="";
		PrintWriter out;
		try {
			out = response.getWriter();
				userDAO.updatePass(pass,id);
				User userLogin = userDAO.getItem(id);
				HttpSession session=request.getSession();
				session.setAttribute("userLogin",userLogin);
				chuoi= "<div class=\"header-msg-edit\">\r\n" + 
						"									<div class=\"container-msg-edit\">\r\n" + 
						"											<h4 class=\"thongbao-edit\">Thông báo </h4>\r\n" + 
						"											<p class=\"msg-edit\">Cập nhật thành công   </p>\r\n" + 
						"						<a href='"+request.getContextPath()+"/user' class=\"btn btn-metis-5 btn-lg xacnhan-edit\"> Xác nhận </a>\r\n" + 
						"									</div>\r\n" + 
						"									</div>";
			
			out.println(chuoi);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value="/user/index/info",method=RequestMethod.POST)
	public String editInfo(@RequestParam("address") String address,@RequestParam("birthday") String birthday, @RequestParam("name") String name,@RequestParam("gender") Integer gender,@RequestParam("temp_id") Integer id,@RequestParam("state") Integer state,@RequestParam("phone") String phone,HttpServletResponse response, HttpServletRequest request){
		String chuoi="";
		PrintWriter out;
		try {
			out = response.getWriter();
				userDAO.updateInfo(phone,name,address,birthday,state,gender,id);
				sellerDAO.updateInfo(phone,name,address,id);
				User userLogin = userDAO.getItem(id);
				HttpSession session=request.getSession();
				session.setAttribute("userLogin",userLogin);
				chuoi= "<div class=\"header-msg-edit\">\r\n" + 
						"									<div class=\"container-msg-edit\">\r\n" + 
						"											<h4 class=\"thongbao-edit\">Thông báo </h4>\r\n" + 
						"											<p class=\"msg-edit\">Cập nhật thành công   </p>\r\n" + 
						"						<a href='"+request.getContextPath()+"/user' class=\"btn btn-metis-5 btn-lg xacnhan-edit\"> Xác nhận </a>\r\n" + 
						"									</div>\r\n" + 
						"									</div>";
			
			out.println(chuoi);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value="/user/del/{id}", method=RequestMethod.GET)
	public String del(@PathVariable("id") int id, RedirectAttributes ra) {
		if(notiDAO.delItem(id) > 0) {
			//xóa tin
				ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/user";
		
	}
}
