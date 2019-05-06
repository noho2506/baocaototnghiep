package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.User;
import model.dao.UsersDAO;

@Controller
@RequestMapping("admin")
public class AdminUserController {
	@Autowired
	private UsersDAO userDao;
	
	@Autowired
	private Defines defines;
	
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("active8", "active");
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLoginAdmin");
		modelMap.addAttribute("userLogin", userLogin);
		Date date= new Date(session.getLastAccessedTime());
		modelMap.addAttribute("date", date);
	}
	
	@RequestMapping(value="/users",method=RequestMethod.GET)
	public String index(ModelMap modelMap, HttpServletRequest request) {
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		modelMap.addAttribute("listUser", userDao.getItems());
		return "admin.user.index";
	
	}
	@RequestMapping(value="/users",method=RequestMethod.POST)
	public String indexUsser(ModelMap modelMap, @RequestParam("aid") int id, @RequestParam("aactive") int active, HttpServletResponse response, HttpServletRequest request) {
		
		//enable user
		
		try {
			PrintWriter out = response.getWriter();
			if(active == 1) {
				userDao.changeEnable(id,0);
				out.println("<a href='javascript:void(0)' onclick='return changeEnable("+id+",0)'><img class=\"img-user-active\" src='"+ defines.getUrlAdmin() +"/assets/img/C.PNG' /></a>");
			} else{
				userDao.changeEnable(id,1);
				out.println("<a href='javascript:void(0)' onclick='return changeEnable("+id+",1)'><img  class=\"img-user-active\" src='"+ defines.getUrlAdmin() +"/assets/img/Capture.PNG'/></a>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/user/add",method=RequestMethod.GET)
	public String add() {
		return "admin.user.add";
	}
	
	@RequestMapping(value="/user/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("user") User user,RedirectAttributes ra, ModelMap modelMap) {
		if (user.getUsername()=="" || user.getPassword()=="") {
			ra.addFlashAttribute("msg1", "Vui lòng nhập dự liệu");
			return "redirect:/admin/user/add";
		}
		//kiem tra trung username
		if(userDao.checkUsername(user.getUsername()) > 0) {
			modelMap.addAttribute("user", user);
			ra.addFlashAttribute("msg1", "Trùng username!");
			return "redirect:/admin/user/add";
		}
		if(userDao.addItemAdmin(user) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/users";
	}
	
	@RequestMapping(value="/user/del/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") int id,HttpSession session, RedirectAttributes ra, HttpServletRequest request) {
		User userInfo = (User) session.getAttribute("userLoginAdmin");
		if(userInfo.getRole_id()==2) {
			ra.addFlashAttribute("msg", "Không có quyền xóa admin ");
			return "redirect:/admin/users";
		}
		if(userDao.delItem(id) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/users";
	}
	@RequestMapping(value="/user/edit/{id}",method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap, HttpSession session, RedirectAttributes ra, HttpServletRequest request) {
		User user = userDao.getItem(id);
		User userInfoAdmin = (User) session.getAttribute("userLoginAdmin");
		System.out.println("FDSFDS"+userInfoAdmin.getRole_id());
		//user.setId(id);
		/*if((userInfoAdmin.getId() != id) && (userInfoAdmin.getRole_id()==2)) {
			ra.addFlashAttribute("msg", "Bạn không có quyền sửa tài khoản này!");
			return "redirect:/admin/users";
		}
		*/
		if(user != null) {
			modelMap.addAttribute("user", user);
		}else {
			ra.addFlashAttribute("msg", "Tài khoản không tồn tại !");
			return "redirect:/admin/users";
		}
		modelMap.addAttribute("listRoles", userDao.getItemsRole());
		modelMap.addAttribute("userInfoAdmin", userInfoAdmin);
		return "admin.user.edit";
	}
	
	@RequestMapping(value="/user/edit/{id}",method=RequestMethod.POST)
	public String edit(@ModelAttribute("user") User user, @PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		if("".equals(user.getFirstname())) {
			modelMap.addAttribute("user", user);
			ra.addFlashAttribute("msg", "Vui lòng nhập Họ tên !");
			return "redirect:/admin/user/edit/{id}";
		}
		user.setId(id);
		if(user.getRole_id() == 0) {
			modelMap.addAttribute("user", user);
			ra.addFlashAttribute("msg1", "Vui lòng chọn quyền!");
			return "redirect:/admin/user/edit/{id}";
		}
		
		if("".equals(user.getPassword())) {
			user.setPassword(userDao.getItem(id).getPassword());
		}
		if(userDao.editItem(user) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/users";
	}
	
}
