package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.ImageProject;
import model.bean.Project;
import model.dao.ImgDAO;
import model.dao.ProjectDAO;
import util.FileUtil;

@Controller
@RequestMapping("admin")
public class AdminProjectController {
	@Autowired
	private ProjectDAO projectDAO;
	@Autowired
	private ImgDAO imgDAO;
	@Autowired
	private Defines defines;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
	}
	@RequestMapping(value="/projects", method= RequestMethod.GET)
	public String index(ModelMap modleMap){
		modleMap.addAttribute("listProject", projectDAO.getItems());
		return "admin.project.imdex";
	}
	@RequestMapping(value="/project/add", method=RequestMethod.GET)
	public String add(ModelMap modelMap) {
		return "admin.project.add";
	}
	@RequestMapping(value="/project/add", method=RequestMethod.POST)
	public String add( @ModelAttribute("project") Project project, @RequestParam("tc") CommonsMultipartFile cmt_trangchu, @RequestParam("gt") CommonsMultipartFile cmt_gioithieu, @RequestParam("ti") CommonsMultipartFile cmt_tienich,@RequestParam("vt") CommonsMultipartFile cmt_vitri,@RequestParam("tk") CommonsMultipartFile cmt_thietke, HttpServletRequest request, RedirectAttributes ra, ModelMap modelMap) {
		String trangchu,gioithieu,tienich,vitri,thietke = " ";
		trangchu = cmt_trangchu.getOriginalFilename();
		gioithieu = cmt_gioithieu.getOriginalFilename();
		tienich = cmt_tienich.getOriginalFilename();
		vitri = cmt_vitri.getOriginalFilename();
		thietke = cmt_thietke.getOriginalFilename();
		if(projectDAO.getCheckItem(project.getTitle()) > 0) {
			modelMap.addAttribute("project", project);
			ra.addFlashAttribute("msg1", "Trùng tên dự án! Vui lòng nhập lại!");
			return "redirect:/admin/project/add"; 
		}
		if(!"".equals(trangchu)) {
			//có upload
			trangchu = FileUtil.getFileReName(trangchu);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			System.out.println("dir:"+dirPath);
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + trangchu;
			System.out.println(filePath);
			try {
				cmt_trangchu.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			project.setTrangchu(trangchu);
		}
		if(!"".equals(gioithieu)) {
			//có upload
			gioithieu = FileUtil.getFileReName(gioithieu);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			System.out.println("dir:"+dirPath);
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + gioithieu;
			System.out.println(filePath);
			try {
				cmt_gioithieu.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			project.setGioithieu(gioithieu);
		}
		if(!"".equals(tienich)) {
			//có upload
			tienich = FileUtil.getFileReName(tienich);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			System.out.println("dir:"+dirPath);
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + tienich;
			System.out.println(filePath);
			try {
				cmt_tienich.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			project.setTienich(tienich);
		}
		if(!"".equals(vitri)) {
			//có upload
			vitri = FileUtil.getFileReName(vitri);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			System.out.println("dir:"+dirPath);
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + vitri;
			try {
				cmt_vitri.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			project.setVitri(vitri);
		}
		if(!"".equals(thietke)) {
			//có upload
			thietke = FileUtil.getFileReName(thietke);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			System.out.println("dir:"+dirPath);
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + thietke;
			System.out.println(filePath);
			try {
				cmt_thietke.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			project.setThietke(thietke);
		}
		if(projectDAO.addItemImg(project) > 0) {
			int id_image = projectDAO.getIdImg();
			project.setId_image(id_image);
			if(projectDAO.addItem(project) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		}else {
			System.out.println("hình thất bịa ");
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/projects";
	}
	@RequestMapping(value="/project/edit/{id}", method=RequestMethod.GET)
	public String edit(ModelMap modelMap,@PathVariable("id") int id, RedirectAttributes ra) {
		Project projects = projectDAO.getItem(id);
		if(projects != null) {
			modelMap.addAttribute("project", projects);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
			return "redirect:/admin/projects";
		}
		return "admin.project.edit";
	}
	@RequestMapping(value="/project/edit/{id}", method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @ModelAttribute("project") Project project, @RequestParam("tc") CommonsMultipartFile cmt_trangchu, @RequestParam("gt") CommonsMultipartFile cmt_gioithieu, @RequestParam("ti") CommonsMultipartFile cmt_tienich,@RequestParam("vt") CommonsMultipartFile cmt_vitri,@RequestParam("tk") CommonsMultipartFile cmt_thietke, HttpServletRequest request, RedirectAttributes ra, ModelMap modelMap) {
		Project old_Projects = projectDAO.getItem(id);
		String trangchu,gioithieu,tienich,vitri,thietke = " ";
		trangchu = cmt_trangchu.getOriginalFilename();
		gioithieu = cmt_gioithieu.getOriginalFilename();
		tienich = cmt_tienich.getOriginalFilename();
		vitri = cmt_vitri.getOriginalFilename();
		thietke = cmt_thietke.getOriginalFilename();
		if(projectDAO.getCheck(project) > 0) {
			modelMap.addAttribute("project", project);
			ra.addFlashAttribute("msg1", "Trùng tên dự án! Vui lòng nhập lại!");
			return "redirect:/admin/project/add"; 
		}
		if(!"".equals(trangchu)) {
			//có upload
			trangchu = FileUtil.getFileReName(trangchu);
			project.setTrangchu(trangchu);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + trangchu;
			try {
				cmt_trangchu.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			project.setTrangchu(trangchu);
		}else {
			old_Projects.setTrangchu(old_Projects.getTrangchu());
		}
		if(!"".equals(gioithieu)) {
			//có upload
			gioithieu = FileUtil.getFileReName(gioithieu);
			project.setGioithieu(gioithieu);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + gioithieu;
			try {
				cmt_gioithieu.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			project.setGioithieu(gioithieu);
		}else {
			old_Projects.setGioithieu(old_Projects.getGioithieu());
		}
		
		if(!"".equals(tienich)) {
			//có upload
			tienich = FileUtil.getFileReName(tienich);
			project.setTienich(tienich);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + tienich;
			try {
				cmt_tienich.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			project.setTienich(tienich);
		}else {
			old_Projects.setTienich(old_Projects.getTienich());
		}
		
		if(!"".equals(vitri)) {
			//có upload
			vitri = FileUtil.getFileReName(vitri);
			project.setVitri(vitri);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + vitri;
			try {
				cmt_vitri.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			project.setVitri(vitri);
		}else {
			old_Projects.setVitri(old_Projects.getVitri());
		}
		
		if(!"".equals(thietke)) {
			//có upload
			thietke = FileUtil.getFileReName(thietke);
			project.setThietke(thietke);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			System.out.println("dir:"+dirPath);
			File createDir = new File(dirPath);
			if(!createDir.exists()) {
				createDir.mkdirs();
			}
			
			String filePath = dirPath + File.separator + thietke;
			System.out.println(filePath);
			try {
				cmt_thietke.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			project.setThietke(thietke);
		}else {
			old_Projects.setThietke(old_Projects.getThietke());
		}
		project.setId(id);
		project.setId_image(old_Projects.getId_image());
		if(imgDAO.editImgPro(project) > 0) {
			if(projectDAO.editItem(project) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		}else {
			System.out.println("hình thất bịa ");
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/projects";
	}
	@RequestMapping(value="/project/del/{id}", method=RequestMethod.GET)
	public String del(@PathVariable("id") int id, RedirectAttributes ra, HttpServletRequest request) {
		Project project = projectDAO.getItem(id);
		if(project != null) {
			int id_image = project.getId_image();
			ImageProject img = imgDAO.getIdImg(id_image);
			if(img!=null) {
				String trangchu = img.getHomepage();
				String gioithieu=img.getIntroduce();
				String tienich= img.getUtility();
				String thietke = img.getDesign();
				String vitri = img.getMap();
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + Defines.DIR_UPLOAD;
				if(trangchu!=null) {
					File file = new File(dirPath + File.separator + trangchu);
					file.delete();
				}
				if(gioithieu!=null) {
					File file = new File(dirPath + File.separator + gioithieu);
					file.delete();				
								}
				if(tienich!=null) {
					File file = new File(dirPath + File.separator + tienich);
					file.delete();
				}
				if(thietke!=null) {
					File file = new File(dirPath + File.separator + thietke);
					file.delete();
				}
				if(vitri!=null) {
					File file = new File(dirPath + File.separator + vitri);
					file.delete();			
				}
				if(imgDAO.delItem(id_image) > 0) {
					ra.addFlashAttribute("msg", Defines.SUCCESS);
				}else {
					ra.addFlashAttribute("msg", Defines.ERROR);
				}
			}
			if(projectDAO.delItem(id) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		}
		
		return "redirect:/admin/projects";
	}
	@RequestMapping(value="/projects",method=RequestMethod.POST)
	public String index(ModelMap modelMap, @RequestParam("aid") int id, @RequestParam("aactive") int active, HttpServletResponse response, HttpServletRequest request) {
		modelMap.addAttribute("listProject", projectDAO.getItems());
		//enable user
		try {
			PrintWriter out = response.getWriter();
			if(active == 1) {
				projectDAO.changeEnable(id,0);
				out.println("<a href='javascript:void(0)' onclick='return changeEnable("+id+",0)'><img class='img-vip-none' src='"+ defines.getUrlAdmin() +"/assets/img/img_363058.png' /></a>");
			} else{
				projectDAO.changeEnable(id,1);
				out.println("<a href='javascript:void(0)' onclick='return changeEnable("+id+",1)'><img class='img-vip' src='"+ defines.getUrlAdmin() +"/assets/img/749564e69c.png'/></a>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
