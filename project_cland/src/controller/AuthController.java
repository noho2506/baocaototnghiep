package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.User;
import model.dao.UsersDAO;
import util.SlugUtil;

@Controller
@RequestMapping("auth")
public class AuthController {
	@Autowired
	private Defines defines;
	@Autowired
	private UsersDAO userDAO;
	@Autowired
	private SlugUtil slugUtil;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtil", slugUtil);
	}
	
	@RequestMapping("/login")
	public String index(@RequestParam(value="msg", required=false) String msg, ModelMap modelMap ){
		if(msg != null) {
			modelMap.addAttribute("msg", msg);
		}
		return "auth.login";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(ModelMap modelMap,HttpServletRequest request,@ModelAttribute("username")String username,@ModelAttribute("password")String password, RedirectAttributes ra){
		HttpSession session=request.getSession();
		//kiểm tra khi chưa nhập dữ liệu
		User userLogin = null;
		if(("".equals(username))||("".equals(password))){
			userLogin = new User();
			ra.addFlashAttribute("msg", "Vui lòng nhập dữ liệu");
			return "redirect:/auth/login";
		}else {
			userLogin= userDAO.checkUserAdmin(username,password);
			if (userLogin!=null) {
				session.setAttribute("userLoginAdmin",userLogin);
			}else {
				ra.addFlashAttribute("msg", "Tài khoản hoặc mật khẩu không hợp lệ ");
				return "redirect:/auth/login";
			}
			// có tài khoản trong list
		}
		return "redirect:/admin/lands";
	}
	@RequestMapping("/logout")
	public String index(HttpServletRequest request){
		HttpSession session= request.getSession();
		session.removeAttribute("userLoginAdmin");
		return "redirect:/auth/login";
	}
}
