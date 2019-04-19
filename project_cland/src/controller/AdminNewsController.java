package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

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
import model.bean.News;
import model.dao.NewsDAO;
import util.FileUtil;

@Controller
@RequestMapping("admin")
public class AdminNewsController {
	@Autowired
	private NewsDAO newsDAO;
	@Autowired
	private Defines defines;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
	}
	@RequestMapping(value="/news", method= RequestMethod.GET)
	public String index(ModelMap modleMap){
		modleMap.addAttribute("listNews", newsDAO.getItemsNews());
		return "admin.news.index";
	}
	
	@RequestMapping(value= {"/news/del/{id}","/news/del"}, method=RequestMethod.GET)
	public String del(@PathVariable("id") int id, RedirectAttributes ra, HttpServletRequest request) {
		News news = newsDAO.getItem(id);
		if(news != null) {
			String fileName = news.getImage();
			if(!"".equals(fileName)) {
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + Defines.DIR_UPLOAD;
				File file = new File(dirPath + File.separator + fileName);
				file.delete();
			}
			
			if(newsDAO.delItem(id) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		}
		return "redirect:/admin/news";
	}
	@RequestMapping(value= "/news", method=RequestMethod.POST)
	public String del(@RequestParam("del[]") Integer[] del , RedirectAttributes ra, HttpServletRequest request) {
		Integer a[] = del;
		String sql=" WHERE ",temp=" ";
		for (int i = 0; i < a.length; i++) {
			News news = newsDAO.getItem(a[i]);
			
			if(news != null) {
				String fileName = news.getImage();
				if(!"".equals(fileName)) {
					String appPath = request.getServletContext().getRealPath("");
					String dirPath = appPath + Defines.DIR_UPLOAD;
					File file = new File(dirPath + File.separator + fileName);
					file.delete();
				}
				
			}
			if (i==(a.length -1)) {
				temp="";
			}else {
				temp=" OR ";
			}
			sql=sql+" id = "+a[i] + temp;
		}
		System.out.println(sql);
		if(newsDAO.delItem(sql) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/news";
	}
	@RequestMapping(value="/news/edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		News news = newsDAO.getItem(id);
		if(news != null) {
			modelMap.addAttribute("objNews", news);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
			return "redirect:/admin/news";
		}
		return "admin.news.edit";
	}
	
	@RequestMapping(value="/news/edit/{id}", method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id,@ModelAttribute("news") News news, BindingResult br,@RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra, ModelMap modelMap) {
		News oldNews = newsDAO.getItem(id);
		String fileName = cmf.getOriginalFilename();
		//if(oldNews != null) {
			if(!"".equals(fileName)) {
				fileName = FileUtil.getFileReName(fileName);
				news.setImage(fileName);
				
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + Defines.DIR_UPLOAD;
				
				File createDir = new File(dirPath);
				if(!createDir.exists()) {
					createDir.mkdirs();
				}
				System.out.println(dirPath);
				
				//xóa file cũ
				String oldFile = dirPath + File.separator + oldNews.getImage();
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
				news.setImage(oldNews.getImage());
			}
			
			news.setId(id);
			
			if(newsDAO.editItem(news) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		//}
		return "redirect:/admin/news";
	}
	
}
