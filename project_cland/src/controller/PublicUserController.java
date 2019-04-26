package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.Land;
import model.bean.User;
import model.dao.CategoryDAO;
import model.dao.DistrictDAO;
import model.dao.LandDAO;
import model.dao.SellerDAO;
import util.FileUtil;
import util.SlugUtil;

@Controller
public class PublicUserController {
	@Autowired
	private CategoryDAO catDAO;
	@Autowired 
	private LandDAO landDAO;
	@Autowired 
	private DistrictDAO districtDAO;
	@Autowired 
	private SellerDAO sellerDAO;
	@Autowired
	private Defines defines;
	@Autowired
	private SlugUtil slugUtil;
	
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtil", slugUtil);
	}
	@ModelAttribute
	public void commonsObject(ModelMap modelMap,HttpServletRequest request) {
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLogin");
		modelMap.addAttribute("userLogin", userLogin);
		modelMap.addAttribute("listCat", catDAO.getItems());
		modelMap.addAttribute("listQuan", districtDAO.getItems());
	}
	@RequestMapping(value="/add-land")
	public String register( HttpServletResponse response, HttpServletRequest request, ModelMap modelMap){
		
		return "public.add.user";
	}
	@RequestMapping(value="/add-land", method=RequestMethod.POST)
	public String add( @ModelAttribute("land") Land land, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra, ModelMap modelMap) {
		Date date = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		String create_day= fm.format(date);
		land.setCreate_day(create_day);
		String fileName = cmf.getOriginalFilename();
		if(landDAO.getCheckItem(land.getTitle()) > 0) {
			modelMap.addAttribute("objLand", land);
			ra.addFlashAttribute("msg1", "Trùng tên dự án! Vui lòng nhập lại!");
			return "redirect:/admin/land/add"; 
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
			land.setImage(fileName);
		}
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLogin");
		if (userLogin!=null) {
			if(sellerDAO.addItemContactUser(userLogin) > 0) {
				land.setId_contact(sellerDAO.getItemId().getId());
				if(landDAO.addItemUser(land) > 0) {
					ra.addFlashAttribute("msg", Defines.SUCCESS);
				}else {
					ra.addFlashAttribute("msg", Defines.ERROR);
				}
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		}
		return "redirect:/";
	}
}
