package controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.Category;
import model.bean.User;
import model.dao.CategoryDAO;
@Controller
@RequestMapping("admin")
public class AdminCategoryController {

	@Autowired
	private CategoryDAO catDAO;
	@Autowired
	private Defines defines;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("active", "active");
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLoginAdmin");
		modelMap.addAttribute("userLogin", userLogin);
		Date date= new Date(session.getLastAccessedTime());
		modelMap.addAttribute("date", date);
	}

	@RequestMapping(value="/cats", method= RequestMethod.GET)
	public String index(ModelMap modleMap, HttpServletRequest request){
		
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		modleMap.addAttribute("listLand", catDAO.getItems());
		return "admin.cat.index";
	}
	@RequestMapping(value="/cat/add", method=RequestMethod.GET)
	public String add(HttpServletRequest request) {
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		return "admin.cat.add";
	}
	@RequestMapping(value="/cat/add", method=RequestMethod.POST) 
	public String add( @ModelAttribute("land") Category land,BindingResult br, RedirectAttributes ra,ModelMap modelMap ) {
		/*ModelAttribute:đây là môt Annotation trong spring mvc dùng để lấy các tham số và trả về một đối tượng (Object).
		đây là môt Annotation trong spring mvc dùng để lấy các tham số và trả về một đối tượng (Object).*/
		/*if(br.hasErrors()) {
			return "admin.cat.add";
		}*/
		
		//kiểm tra trùng danh mục
		if(catDAO.getCheckItem(land.getName()) > 0) {
			modelMap.addAttribute("name", land.getName());
			ra.addFlashAttribute("msg1", "Trùng danh mục! Vui lòng nhập lại!");
			return "redirect:/admin/cat/add"; 
		}
		
		if(catDAO.addItem(land.getName()) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/cats";
	}
	@RequestMapping(value="/cat/del/{id}", method=RequestMethod.GET)
	public String del(@PathVariable("id") int id, RedirectAttributes ra) {
		if(catDAO.delItem(id) > 0) {
			//xóa tin
			/*if(newsDao.delItems(id) > 0) {*/
				ra.addFlashAttribute("msg", Defines.SUCCESS);
		/*	}*/
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/cats";
		
	}
	@RequestMapping(value="/cat/edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		Category cat = catDAO.getItem(id);
		if(cat != null) {
			modelMap.addAttribute("category", cat);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
			return "redirect:/admin/cats";
		}
		return "admin.cat.edit";
	}
	@RequestMapping(value="/cat/edit/{id}", method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @ModelAttribute("cat") Category cat, BindingResult br, RedirectAttributes ra, ModelMap modelMap) {
		cat.setId(id);
		
			if(catDAO.getCheckItem(cat.getName()) > 0) {
				modelMap.addAttribute("category", cat);
				ra.addFlashAttribute("msg1", "Trùng danh mục! Vui lòng nhập lại");
				return "redirect:/admin/cat/edit/{id}";
			}
		
		if(catDAO.editItem(cat) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/cats";
	}
}
