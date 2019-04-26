package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.Land;
import model.bean.NotifficationUser;
import model.bean.User;
import model.dao.CategoryDAO;
import model.dao.DistrictDAO;
import model.dao.LandDAO;
import model.dao.NotiUserDAO;
import model.dao.SellerDAO;
import util.FileUtil;

@Controller
@RequestMapping("admin")
public class AdminLandController {
	@Autowired
	private LandDAO landDAO;
	@Autowired
	private CategoryDAO catDAO;
	@Autowired 
	private DistrictDAO districtDAO;
	@Autowired
	private Defines defines;
	@Autowired
	private SellerDAO sellerDAO;
	@Autowired
	private NotiUserDAO notiDAO;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap,HttpServletRequest request) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("active5", "active");
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLoginAdmin");
		modelMap.addAttribute("userLogin", userLogin);
	}
	@RequestMapping(value="/lands", method= RequestMethod.GET)
	public String index(ModelMap modleMap,HttpServletRequest request){
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		modleMap.addAttribute("listLands", landDAO.getItems());
		return "admin.land.index";
	}
	/*public String back(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLoginAdmin");
		if(userLogin==null) {
			return "redirect:/auth/login";
		}
	}*/
	@RequestMapping(value="/lands/user", method= RequestMethod.GET)
	public String indexUser(ModelMap modleMap,HttpServletRequest request){
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		modleMap.addAttribute("listLands", landDAO.getItemsUser());
		return "admin.user.land.index";
	}
	@RequestMapping(value="user/lands", method=RequestMethod.POST)
	@ResponseBody
	public String active( RedirectAttributes ra, HttpServletRequest request,@ModelAttribute("aactive")int active,@ModelAttribute("aid")int id) {
		//enable user
		String chuoi = "";
			if(active == 1) {
				// bài viết bị chặn 
				landDAO.changeEnable(id,1);
				int id_user= landDAO.getIdUser(id);
				NotifficationUser noti =  new NotifficationUser(0, id, 4, 0, "", id_user);
				notiDAO.addItemNone(noti);
				
				landDAO.changeEnable(id,0);
				chuoi="<a href='javascript:void(0)' onclick='changeEnable("+id+",0)'><img class='img-vip-none' src='"+ defines.getUrlAdmin() +"/assets/img/none.png' /></a>";
			} else{
				
				landDAO.changeEnable(id,1);
				int id_user= landDAO.getIdUser(id);
				NotifficationUser noti =  new NotifficationUser(0, id, 2, 0, "", id_user);
				notiDAO.addItem(noti);
				chuoi = "<a href='javascript:void(0)' onclick='changeEnable("+id+",1)'><img class='img-vip' src='"+ defines.getUrlAdmin() +"/assets/img/tick2.jpg'/></a>";
			}
		return chuoi;
	}
	
	@RequestMapping(value="/land/del/{id}", method=RequestMethod.GET)
	public String del(@PathVariable("id") int id, RedirectAttributes ra, HttpServletRequest request) {
		Land land = landDAO.getItem(id);
		if(land != null) {
			String fileName = land.getImage();
			if(!"".equals(fileName)) {
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + Defines.DIR_UPLOAD;
				File file = new File(dirPath + File.separator + fileName);
				file.delete();
			}
			
			if(landDAO.delItem(id) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		}
		
		return "redirect:/admin/lands";
	}
	@RequestMapping(value="/user/land/del/{id}", method=RequestMethod.GET)
	public String delUser(@PathVariable("id") int id, RedirectAttributes ra, HttpServletRequest request) {
		Land land = landDAO.getItem(id);
		if(land != null) {
			String fileName = land.getImage();
			if(!"".equals(fileName)) {
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + Defines.DIR_UPLOAD;
				File file = new File(dirPath + File.separator + fileName);
				file.delete();
			}
			
			if(landDAO.delItemUser(id) > 0) {
				int id_user= landDAO.getIdUser(id);
				
				// đã bán
				NotifficationUser noti =  new NotifficationUser(0, id, 3, 0, "", id_user);
				notiDAO.addItemDaBan(noti);
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		}
		
		return "redirect:/admin/lands";
	}
	@RequestMapping(value="/land/show/{id}", method=RequestMethod.GET)
	public String show(ModelMap modelMap,@PathVariable("id") int id, RedirectAttributes ra, HttpServletRequest request) {
		Land land = landDAO.getItem(id);
		
		modelMap.addAttribute("land", land);
		modelMap.addAttribute("seller", sellerDAO.getItem(land.getId_contact()));
		return "admin.land.show";
	}
	@RequestMapping(value="/land/edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		Land land = landDAO.getItem(id);
		if(land != null) {
			System.out.println(land.getTitle());
			modelMap.addAttribute("objLand", land);
			modelMap.addAttribute("listCat", catDAO.getItems());
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
			return "redirect:/admin/lands";
		}
		return "admin.land.edit";
	}
	@RequestMapping(value="/land/edit/{id}", method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @ModelAttribute("land") Land land,ModelMap modelMap, RedirectAttributes ra) {
		land.setId(id);
		if(landDAO.editItem(land) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/lands";
	}
	@RequestMapping(value="/land/add", method=RequestMethod.GET)
	public String add(ModelMap modelMap, RedirectAttributes ra) {
		
		modelMap.addAttribute("listCat", catDAO.getItems());
		modelMap.addAttribute("listQuan", districtDAO.getItems());
		return "admin.land.add";
	}
	@RequestMapping(value="/land/add", method=RequestMethod.POST)
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
		if(sellerDAO.addItemContact(land) > 0) {
			land.setId_contact(sellerDAO.getItemId().getId());
			if(landDAO.addItem(land) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/lands";
	}
}
