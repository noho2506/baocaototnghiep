package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.Contact;
import model.dao.ContactDAO;

@Controller
public class PublicContactController {
	@Autowired
	private Defines defines;
	@Autowired
	private ContactDAO contactDAO;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
	}
	@RequestMapping("contact")
	public String index(){
		return "public.contact.index";
	}
	@RequestMapping(value="contact",method=RequestMethod.POST)
	public String index(@ModelAttribute("contact") Contact contact, RedirectAttributes ra){
		if(contactDAO.addItem(contact) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "public.land.index";
	}
}
