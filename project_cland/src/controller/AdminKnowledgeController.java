package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import jdk.nashorn.internal.parser.JSONParser;
import model.bean.Document;
import model.bean.FileBucket;
import model.bean.Know;
import model.bean.User;
import model.dao.DocumentDAO;
import model.dao.KnowDAO;
import util.FileUtil;

@Controller
@RequestMapping("admin")
public class AdminKnowledgeController {

    public final static Logger log = Logger.getLogger("OpenStreeMapUtils");

    private static AdminKnowledgeController instance = null;
    private JSONParser jsonParser;
	@Autowired
	private DocumentDAO docDAO;
	@Autowired
	private KnowDAO knowDAO;
	@Autowired
	private Defines defines;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("active4", "active");
		HttpSession session=request.getSession();
		User userLogin = (User)session.getAttribute("userLoginAdmin");
		modelMap.addAttribute("userLogin", userLogin);
		Date date= new Date(session.getLastAccessedTime());
		modelMap.addAttribute("date", date);
	}
	@RequestMapping(value="/knows", method= RequestMethod.GET)
	public String index(ModelMap modleMap, HttpServletRequest request){
		User userLogin = Defines.check(request);
		if (userLogin==null) {
			return "redirect:/auth/login";
		}
		modleMap.addAttribute("listknow", knowDAO.getItemsKnow());
		
		return "admin.know.index";
	}
	@RequestMapping(value= {"/know/del/{id}","/know/del"}, method=RequestMethod.GET)
	public String del(@PathVariable("id") int id, RedirectAttributes ra, HttpServletRequest request) {
		Know know = knowDAO.getItem(id);
		if(know != null) {
			String fileName = know.getImage();
			if(!"".equals(fileName)) {
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + Defines.DIR_UPLOAD;
				File file = new File(dirPath + File.separator + fileName);
				file.delete();
			}
			
			if(knowDAO.delItem(id) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		}
		return "redirect:/admin/knows";
	}
	@RequestMapping(value= "/knows", method=RequestMethod.POST)
	public String del(@RequestParam("del[]") Integer[] del , RedirectAttributes ra, HttpServletRequest request) {
		Integer a[] = del;
		String sql=" WHERE ",temp=" ";
		for (int i = 0; i < a.length; i++) {
			Know know = knowDAO.getItem(a[i]);
			
			if(know != null) {
				String fileName = know.getImage();
				if(!"".equals(fileName)) {
					String appPath = request.getServletContext().getRealPath("");
					String dirPath = appPath + Defines.DIR_UPLOAD;
					File file = new File(dirPath + File.separator + fileName);
					file.delete();
				}
				
			}
			if (i==a.length -1) {
				temp="";
			}else {
				temp=" OR ";
			}
			sql=sql+" id = "+a[i] +temp ;
		}
		if(knowDAO.delItem(sql) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		return "redirect:/admin/knows";
	}
	@RequestMapping(value="/know/edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap, RedirectAttributes ra) {
		Know know = knowDAO.getItem(id);
		if(know != null) {
			modelMap.addAttribute("objknow", know);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
			return "redirect:/admin/know";
		}
		return "admin.know.edit";
	}
	
	@RequestMapping(value="/know/edit/{id}", method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id,@ModelAttribute("know") Know know, BindingResult br,@RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra, ModelMap modelMap) {
		Know oldknow = knowDAO.getItem(id);
		String fileName = cmf.getOriginalFilename();
		//if(oldknow != null) {
			if(!"".equals(fileName)) {
				fileName = FileUtil.getFileReName(fileName);
				know.setImage(fileName);
				
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + Defines.DIR_UPLOAD;
				
				File createDir = new File(dirPath);
				if(!createDir.exists()) {
					createDir.mkdirs();
				}
				System.out.println(dirPath);
				
				//xóa file cũ
				String oldFile = dirPath + File.separator + oldknow.getImage();
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
				know.setImage(oldknow.getImage());
			}
			
			know.setId(id);
			
			if(knowDAO.editItem(know) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
		//}
		return "redirect:/admin/knows";
	}
	@RequestMapping(value="/document", method= RequestMethod.GET)
	public String document(ModelMap modleMap){
		modleMap.addAttribute("listDoc", docDAO.getItems());
		return "admin.document.index";
	}
	
	@RequestMapping(value = { "/add-document" }, method = RequestMethod.GET)
	public String addDocuments(ModelMap model) {
		return "admin.document.add";
	}
	@RequestMapping(value = { "/add-document" }, method = RequestMethod.POST)
	public String uploadDocument(FileBucket fileBucket, ModelMap model,RedirectAttributes ra) throws IOException{
			System.out.println("Fetching file");

			Document document = new Document();
			MultipartFile multipartFile = fileBucket.getFile();
			document.setName(multipartFile.getOriginalFilename());
			document.setDescription(fileBucket.getDescription());
			document.setType(multipartFile.getContentType());
			document.setContent(multipartFile.getBytes());
			if(docDAO.addItem(document) > 0) {
				ra.addFlashAttribute("msg", Defines.SUCCESS);
			}else {
				ra.addFlashAttribute("msg", Defines.ERROR);
			}
			
			return "redirect:/admin/document";
		}
	@RequestMapping(value = { "/document/del/{id}" }, method = RequestMethod.GET)
	public String deleteDocument(@PathVariable("id") int id,RedirectAttributes ra) {
		if(docDAO.delItem(id) > 0) {
			ra.addFlashAttribute("msg", Defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", Defines.ERROR);
		}
		
		return "redirect:/admin/document";
	}
	
	
}
