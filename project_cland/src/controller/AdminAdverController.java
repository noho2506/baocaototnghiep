package controller;

import java.io.File;
import java.io.IOException;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.Adver;
import model.bean.News;
import model.bean.Project;
import model.bean.User;
import model.dao.AdverDAO;
import model.dao.NewsDAO;
import util.FileUtil;

@Controller
@RequestMapping("admin")
public class AdminAdverController {
	@Autowired
	private AdverDAO adverDAO;
	@Autowired
	private Defines defines;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap,HttpServletRequest request) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("active1", "active");
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLoginAdmin");
		if(userLogin==null) {
			login();
		}
		modelMap.addAttribute("userLogin", userLogin);
	}
	public String login(){
		return "redirect:/auth/login";
	}
	@RequestMapping(value="/advertisement", method= RequestMethod.GET)
	public String index(ModelMap modleMap,HttpServletRequest request){
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		modleMap.addAttribute("listAdv", adverDAO.getItems());
		return "admin.adv.index";
	}
	@RequestMapping(value= {"/adv/del/{id}"}, method=RequestMethod.GET)
	public String del(@PathVariable("id") int id, RedirectAttributes ra, HttpServletRequest request) {
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		Adver adv = adverDAO.getItem(id);
		if(adv != null) {
			String fileName = adv.getImage();
			if(!"".equals(fileName)) {
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + Defines.DIR_UPLOAD;
				File file = new File(dirPath + File.separator + fileName);
				file.delete();
			}
			
			if(adverDAO.delItem(id) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		}
		return "redirect:/admin/advertisement";
	}
	@RequestMapping(value="/adv/add", method=RequestMethod.GET)
	public String add(ModelMap modelMap, RedirectAttributes ra, HttpServletRequest request) {
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		return "admin.adv.add";
	}
	@RequestMapping(value="/adv/add", method=RequestMethod.POST)
	public String add( @ModelAttribute("adv") Adver adv, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra, ModelMap modelMap) {
		String fileName = cmf.getOriginalFilename();
		if(adverDAO.getCheckItem(adv.getName()) > 0) {
			modelMap.addAttribute("adv", adv);
			ra.addFlashAttribute("msg1", "Trùng tên dự án! Vui lòng nhập lại!");
			return "redirect:/admin/adv/add"; 
		}
		if(!"".equals(fileName)) {
			//có upload
			fileName = FileUtil.getFileReName(fileName);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			System.out.println("dir:"+dirPath);
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + fileName;
			System.out.println(filePath);
			try {
				cmf.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			adv.setImage(fileName);
		}
		
		if(adverDAO.addItem(adv) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/advertisement";
	}
	@RequestMapping(value="/adv/edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra, HttpServletRequest request) {
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		Adver adv = adverDAO.getItem(id);
		if(adv != null) {
			modelMap.addAttribute("obj", adv);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
			return "redirect:/admin/advertisement";
		}
		return "admin.adv.edit";
	}
	
	@RequestMapping(value="/adv/edit/{id}", method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id,@ModelAttribute("Adver") Adver Adver, BindingResult br,@RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra, ModelMap modelMap) {
		System.out.println(Adver.getName());
		Adver oldAdv = adverDAO.getItem(id);
		String fileName = cmf.getOriginalFilename();
		//if(oldNews != null) {
			if(!"".equals(fileName)) {
				fileName = FileUtil.getFileReName(fileName);
				Adver.setImage(fileName);
				
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + Defines.DIR_UPLOAD;
				
				File createDir = new File(dirPath);
				if(!createDir.exists()) {
					createDir.mkdirs();
				}
				System.out.println(dirPath);
				
				//xóa file cũ
				String oldFile = dirPath + File.separator + oldAdv.getImage();
				File fileDel = new File(oldFile);
				fileDel.delete();
				
				//ghi file mới
				String filePath = dirPath + File.separator + fileName;
				try {
					cmf.transferTo(new File(filePath));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				Adver.setImage(oldAdv.getImage());
			}
			
			Adver.setId(id);
			
			if(adverDAO.editItem(Adver) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		//}
		return "redirect:/admin/advertisement";
	}
	
}
