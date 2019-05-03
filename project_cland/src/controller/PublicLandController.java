package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import model.bean.About;
import model.bean.Category;
import model.bean.CommentLand;
import model.bean.Contact;
import model.bean.District;
import model.bean.Know;
import model.bean.Land;
import model.bean.User;
import model.dao.AboutDAO;
import model.dao.AdverDAO;
import model.dao.CategoryDAO;
import model.dao.CommentLandDAO;
import model.dao.ContactDAO;
import model.dao.DistrictDAO;
import model.dao.DocumentDAO;
import model.dao.ImgDAO;
import model.dao.KnowDAO;
import model.dao.LandDAO;
import model.dao.NewsDAO;
import model.dao.ProjectDAO;
import util.SlugUtil;
@Controller
public class PublicLandController {
	@Autowired
	private CategoryDAO catDAO;
	@Autowired
	private ImgDAO imgDAO;
	@Autowired 
	private LandDAO landDAO;
	@Autowired 
	private NewsDAO newsDAO;
	@Autowired 
	private KnowDAO knowDAO;
	@Autowired 
	private ProjectDAO projectDAO;
	@Autowired 
	private DistrictDAO districtDAO;
	@Autowired 
	private CommentLandDAO cmtDAO;
	@Autowired
	private Defines defines;
	@Autowired
	private AdverDAO adverDAO;
	@Autowired
	private AboutDAO aboutDAO;
	@Autowired
	private DocumentDAO docDAO;
	@Autowired
	private SlugUtil slugUtil;
	@Autowired
	private  ContactDAO contactDAO;
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
		modelMap.addAttribute("getDate", Defines.getDate());
	}
	@RequestMapping("")
	public String index(ModelMap modelMap){
		ArrayList<Land> land = (ArrayList<Land>) landDAO.getItemsLandPubic();
		SimpleDateFormat newFormat = new SimpleDateFormat("dd/MM/yyyy");
		for (Land land2 : land) {
			Date date1;
			try {
				// hàm chuyển string sang date
				date1 = new SimpleDateFormat("yyyy-MM-dd").parse(land2.getCreate_day());
				// chuyển ngược lại 
				land2.setCreate_day(newFormat.format(date1));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		modelMap.addAttribute("listLands", land);
		modelMap.addAttribute("listProject", projectDAO.getItems());
		// lấy khu vực cao nhất 
		modelMap.addAttribute("getItemTop", landDAO.getItemTop());
		modelMap.addAttribute("getLandsTop", landDAO.getItemsTop());
		modelMap.addAttribute("getItemCat", newsDAO.getItemNews());
		modelMap.addAttribute("getItemKnow", knowDAO.getItems());
		return "public.land.index";
	}
	@RequestMapping(value= {"/{nameCat}-{id}/page-{page}","/{nameCat}-{id}","quan-{nameQuan}-{id_district}","/quan-{nameQuan}-{id_district}/page-{page}"}, method=RequestMethod.GET)
	public String cat(@PathVariable(value="id", required=false)Integer id,ModelMap modelMap,@PathVariable(value="page", required=false) Integer page,@PathVariable(value="id_district", required=false)Integer id_district ){
		// edit formatdate trong landsview
		ArrayList<Land> landview = (ArrayList<Land>) landDAO.getTopViewCat();
		SimpleDateFormat newFormat = new SimpleDateFormat("dd/MM/yyyy");
		for (Land land2 : landview) {
			Date date1;
			try {
				// hàm chuyển string sang date
				date1 = new SimpleDateFormat("yyyy-MM-dd").parse(land2.getCreate_day());
				// chuyển ngược lại 
				land2.setCreate_day(newFormat.format(date1));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// phân trang 
		if(page == null) {
			page=1;
		}
		int xacdinh=0;
		int sumPage = 0;
		int offset = (page -1) * Defines.ROW_COUNT;
		if (id!=null) {
			sumPage =(int)Math.ceil((float)landDAO.getCountCat(id)/Defines.ROW_COUNT);
			modelMap.addAttribute("getItemCat", landDAO.getItemsS(id,offset));
			modelMap.addAttribute("cat",catDAO.getItem(id));
			xacdinh=3;
		}
		if(id_district!=null) {
			sumPage =(int)Math.ceil((float)landDAO.getCountCatQuan(id_district)/Defines.ROW_COUNT);
			modelMap.addAttribute("getItemCat", landDAO.getItemsCatQuan(id_district,offset));
			modelMap.addAttribute("cat",districtDAO.getItem(id_district));
			xacdinh=1;
		}
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("xacdinh", xacdinh);
		modelMap.addAttribute("getTopViewLand", landview);
		return "public.land.cat";
	}
	// tìm kiếm 
	@RequestMapping(value= {"search"}, method=RequestMethod.GET)
	public String cat(ModelMap modelMap,@RequestParam("id_cat")int id_cat,@RequestParam("id_district")int id_district,@RequestParam("dientich")int dientich,@RequestParam("mucgia")int mucgia,@RequestParam("ngaydang") String ngaydang,@RequestParam(value="page", required=false) Integer page){
		// edit formatdate 
		ArrayList<Land> landview = (ArrayList<Land>) landDAO.getTopViewCat();
		SimpleDateFormat newFormat = new SimpleDateFormat("dd/MM/yyyy");
		for (Land land2 : landview) {
			Date date1;
			try {
				// hàm chuyển string sang date
				date1 = new SimpleDateFormat("yyyy-MM-dd").parse(land2.getCreate_day());
				// chuyển ngược lại 
				land2.setCreate_day(newFormat.format(date1));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// phân trang
		if(page == null) {
			page=1;
		}
		int sumPage = 0;
		int offset = (page -1) * Defines.ROW_COUNT;
		String sql_id= " ";
		Land land = new Land(0, "", "", "", "", "", "", "", "", 0,"","","",id_cat, "", id_district, " ","",0,0,0);
		sql_id=defines.search(id_cat,id_district,dientich,mucgia,ngaydang);
		modelMap.addAttribute("getSoTin", landDAO.soTinSearch(sql_id));
		System.out.println("tin:"+landDAO.soTinSearch(sql_id));
		sumPage =(int)Math.ceil((float)landDAO.soTinSearch(sql_id)/5);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("getItemCat", landDAO.getItemsCatS(sql_id,offset));
		modelMap.addAttribute("cat",catDAO.getItem(id_cat));
		modelMap.addAttribute("page", page);
		
		modelMap.addAttribute("xacdinh",2);
		modelMap.addAttribute("land", land);
		modelMap.addAttribute("mucgia", mucgia);
		modelMap.addAttribute("dientich", dientich);
		modelMap.addAttribute("getTopViewLand", landview);
		modelMap.addAttribute("quan",districtDAO.getItem(id_district));
		modelMap.addAttribute("ngaydang",ngaydang);
		return "public.land.cat";
	}
	@RequestMapping("/dat-ban/{nameDetail}-{id}")
	public String detail(@PathVariable("id")int id,ModelMap modelMap){
		Land land= landDAO.getItem(id);
		if (land!=null) {
			modelMap.addAttribute("getItem", landDAO.getItem(id));
			modelMap.addAttribute("ListItemsR", landDAO.getItemsRelate(landDAO.getItem(id).getId_cat()));
		}
		modelMap.addAttribute("listCmt",cmtDAO.getCmt(id));
		modelMap.addAttribute("cmtDAO",cmtDAO);
		return "public.land.detail";
	}
	@RequestMapping(value="reply",method=RequestMethod.POST)
	public String detail(HttpServletResponse response, HttpServletRequest request,ModelMap modelMap,@ModelAttribute("name")String  name,@ModelAttribute("email")String email,@ModelAttribute("cmt")String  cmt,@ModelAttribute("idC")int idC,@ModelAttribute("idL")int id_land){
		/*binhf luận */
		String chuoi="";
		Date date = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("dd-MM-yyy HH:mm");
		String date_create= fm.format(date);
		CommentLand comment = new CommentLand(0, name, email, cmt, id_land,date_create,idC);
		cmtDAO.addCmtRep(comment);
		comment= cmtDAO.getItem();
		System.out.println(defines.getUrlPublic());
		PrintWriter out;
		ArrayList<CommentLand> cmtRep =(ArrayList<CommentLand>)cmtDAO.getCmtRep(idC);
		modelMap.addAttribute("listCmtRep", cmtRep);
		try {
			out = response.getWriter();
			for (int i = 0; i < cmtRep.size(); i++) {
				System.out.println("vô for");
				chuoi+="<div class=\"single-room-review-area d-flex align-items-center binhluan-cmt \">\r\n" + 
						"                            <div class=\"reviwer-thumbnail bl-img-rep \">\r\n" + 
						"                                <img src='" +defines.getUrlPublic() +"/img/56a0bb98e9a99a4669bf7f07_user_icon.png' alt=\"\">\r\n" + 
						"                            </div>\r\n" + 
						"                            <div class=\"reviwer-content\">\r\n" + 
						"                                <div class=\"reviwer-title-rating d-flex align-items-center justify-content-between\">\r\n" + 
						"                                    <div class=\"reviwer-title\">\r\n" + 
						"                                        <span>"+cmtRep.get(i).getName()+"</span>\r\n" + 
						"                                        <h6>"+ cmtRep.get(i).getCreate_day()+"</h6>\r\n" + 
						"                                    </div>\r\n" + 
						"                                </div>\r\n" + 
						"                                <p>"+cmtRep.get(i).getCmt()+"</p>\r\n" + 
						"                            </div>\r\n" + 
						"                        </div>";
			}
			out.println(chuoi);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value="detail",method=RequestMethod.POST)
	public String detail(HttpServletResponse response, HttpServletRequest request,ModelMap modelMap,@ModelAttribute("name")String  name,@ModelAttribute("email")String email,@ModelAttribute("cmt")String  cmt,@ModelAttribute("id")int id_land){
		/*binhf luận */
		Date date = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("dd-MM-yyy HH:mm");
		String date_create= fm.format(date);
		CommentLand comment = new CommentLand(0, name, email, cmt, id_land,date_create,0);
		cmtDAO.addCmt(comment);
		comment= cmtDAO.getItem();
		String chuoi="";
		ArrayList<CommentLand> cmtLand= (ArrayList<CommentLand>)cmtDAO.getCmt(id_land);
		modelMap.addAttribute("listCmt", cmtLand);
		System.out.println(defines.getUrlPublic());
		PrintWriter out ;
		
		try {
			out = response.getWriter();
			for (int i = 0; i < cmtLand.size(); i++) {
				ArrayList<CommentLand> cmtLandRep= (ArrayList<CommentLand>)cmtDAO.getCmtRep(cmtLand.get(i).getId());
				chuoi+="<div class=\"single-room-review-area d-flex align-items-center\">\r\n" + 
						"                            <div class=\"reviwer-thumbnail bl-img-rep\">\r\n" + 
						"                                <img src='" +defines.getUrlPublic() +"/img/56a0bb98e9a99a4669bf7f07_user_icon.png' alt=\"\">\r\n" + 
						"                            </div>\r\n" + 
						"                            <div class=\"reviwer-content\">\r\n" + 
						"                                <div class=\"reviwer-title-rating d-flex align-items-center justify-content-between\">\r\n" + 
						"                                    <div class=\"reviwer-title\">\r\n" + 
						"                                        <span>"+cmtLand.get(i).getName()+"</span>\r\n" + 
						"                                        <a class='rep' href='javascript:void(0)' onclick='rep_a("+cmtLand.get(i).getId()+")'>Reply</a>" +
						"                                        <h6>"+ cmtLand.get(i).getCreate_day()+"</h6>\r\n" + 
						"                                    </div>\r\n" + 
						"                                </div>\r\n" + 
						"                                <p>"+cmtLand.get(i).getCmt()+"</p>\r\n" + 
						"                            </div>\r\n" + 
						"                        </div>"
						+ "<div class=\"repLand_"+cmtLand.get(i).getId()+"\" style=\"margin-left:80px\">";
					if (cmtLandRep!=null) {
						for (int j = 0; j < cmtLandRep.size(); j++) {
							chuoi+="<div class=\"single-room-review-area d-flex align-items-center binhluan-cmt \">\r\n" + 
									"                            <div class=\"reviwer-thumbnail bl-img-rep \">\r\n" + 
									"                                <img src='" +defines.getUrlPublic() +"/img/56a0bb98e9a99a4669bf7f07_user_icon.png' alt=\"\">\r\n" + 
									"                            </div>\r\n" + 
									"                            <div class=\"reviwer-content\">\r\n" + 
									"                                <div class=\"reviwer-title-rating d-flex align-items-center justify-content-between\">\r\n" + 
									"                                    <div class=\"reviwer-title\">\r\n" + 
									"                                        <span>"+cmtLandRep.get(j).getName()+"</span>\r\n" + 
									"                                        <h6>"+ cmtLandRep.get(j).getCreate_day()+"</h6>\r\n" + 
									"                                    </div>\r\n" + 
									"                                </div>\r\n" + 
									"                                <p>"+cmtLandRep.get(j).getCmt()+"</p>\r\n" + 
									"                            </div>\r\n"
									+ " </div>";
						}
					}
					chuoi+="</div>"
							+ "<div class=\"form_rep"+cmtLand.get(i).getId()+" rep_land_form\" style=\"margin-left:80px\">\r\n" + 
							"                        	<form action=\"#\" method=\"post\">\r\n" + 
							"	                            <div class=\"row contact-form rep-form\">\r\n" + 
							"	                            	<div class=\"col-12 col-lg-6 form-input1 \">\r\n" + 
							"	                            		<lable> Tên *:</lable>\r\n" + 
							"	                                    <input type=\"text\" name=\"message-name\" class=\"form-cmt col-6 ten_rep"+cmtLand.get(i).getId() +"\"  required>\r\n" + 
							"	                                </div>\r\n" + 
							"	                                <div class=\"col-12 col-lg-6 form-input1\" data-wow-delay=\"100ms\">\r\n" + 
							"	                                	Email * : \r\n" + 
							"	                                    <input type=\"email\" name=\"message-email\" class=\"form-cmt col-6 email_rep"+cmtLand.get(i).getId()+"\"  >\r\n" + 
							"	                                </div>\r\n" + 
							"	                            	<div class=\"col-12 wow fadeInUp\" data-wow-delay=\"100ms\">\r\n" + 
							"	                            		<lable> Bình luận </lable>\r\n" + 
							"	                                    <textarea name=\"message\" class=\"form-cmt-tex col-12 cmt_rep"+cmtLand.get(i).getId()+"\" placeholder=\"Your Message\"></textarea>\r\n" + 
							"	                                </div>\r\n" + 
							"	                                <div class=\"col-12 text-center wow fadeInUp\" data-wow-delay=\"100ms\">\r\n" + 
							"	                                    <a href=\"javascript:void(0)\"  class=\"btn roberto-btn mt-15\" onclick='doCommentRep("+cmtLand.get(i).getId()+","+cmtLand.get(i).getId_land()+")'>Phản hồi</a>\r\n" + 
							"	                                </div>\r\n" + 
							"	                            </div>\r\n" + 
							"	                        </form>\r\n" + 
							"                        </div>";
				}
		out.println(chuoi);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value= "/tke", method=RequestMethod.POST)
	public String returnForm(ModelMap modelMap,@ModelAttribute("idTK")int idTK, HttpServletResponse response, HttpServletRequest request){
		String chuoi= "" ;
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (idTK==1) {
					chuoi= "<div class=\" form-group mb-30\" style=\"background: url("+ defines.getUrlPublic() +"/img/h.png) 1px 44px no-repeat;\">\r\n" + 
							"	                               		 <label for=\"checkOut \" class=\"label-form\">Năm </label>\r\n" + 
							"	                                	<select name=\"year\" class=\"form-control \">\r\n" + 
							"	                                	 <c:set var=\"year\" value=\"${year}\"></c:set>\r\n" + 
							"	                                		<option value=\"0\">---</option>\r\n" + 
							"		                                    <option value=\"2019\">Năm 2019</option>\r\n" + 
							"		                                    <option value=\"2018\" >Năm 2018</option>\r\n" + 
							"		                                    <option value=\"2017\" >Năm 2017</option>\r\n" + 
							"		                                    <option value=\"2016\">Năm 2016</option>\r\n" + 
							"		                                    \r\n" + 
							"	                                	</select>\r\n" + 
							"	                            	</div>"
							+ "<div class=\"form-group mb-30\" style=\"background: url("+ defines.getUrlPublic() +"/img/d.png) 1px -5px no-repeat; \">\r\n" + 
							"		                                <label for=\"checkIn \" class=\"label-form\">Loại đất</label>\r\n" + 
							"		                               <select name=\"cat\" class=\"form-control\">\r\n" + 
							"		                               		<option value='0'>--Chọn loại-- </option>";
					for (Category obj : catDAO.getItems()) {
						chuoi+= "<option value='"+obj.getId()+"'>"+obj.getName()+"</option>" ;
						}
					chuoi+="		                                </select>\r\n" + 
							"		                            </div>";

				
				
		}
		if (idTK==2) {
			chuoi= "<div class='form-group mb-30' style=\"background: url("+ defines.getUrlPublic() +"/img/h.png) 1px 44px no-repeat;\">\r\n" + 
					"		                               		 <label for=\"checkOut \" class=\"label-form\">Năm </label>\r\n" + 
					"		                                	<select name=\"year\" class=\"form-control\">\r\n" + 
					"		                                	 <c:set var=\"year\" value=\"${year}\"></c:set>\r\n" + 
					"		                                		<option  value=\"0\">---</option>\r\n" + 
					"			                                    <option  value=\"2019\">Năm 2019</option>\r\n" + 
					"			                                    <option  value=\"2018\">Năm 2018</option>\r\n" + 
					"			                                    <option  value=\"2017\">Năm 2017</option>\r\n" + 
					"			                                    <option  value=\"2016\">Năm 2016</option>\r\n" + 
					"			                                    \r\n" + 
					"		                                	</select>\r\n" + 
					"		                            	</div>\r\n" + 
					"		                            	<div class=\"form-group mb-30\" style=\"background: url("+ defines.getUrlPublic() +"/img/f.jpg) 1px 5px no-repeat; \">\r\n" + 
					"			                                <label for=\"checkIn \" class=\"label-form\">Khu vực </label>\r\n" + 
					"			                               <select name=\"id_district\" id=\"room\" class=\"form-control\">\r\n" + 
					"			                               	<c:set var=\"qid\" value=\"${listQuan.id }\"></c:set>\r\n" + 
					"			                                	<option value=\"0\">---- Chọn ----</option>\r\n" ;
					
					
					for (District obj : districtDAO.getItems()) {
						chuoi+= "<option value='"+obj.getId()+"'>"+obj.getName()+"</option>" ;
						}
					chuoi+="		                                </select>\r\n" + 
							"		                            </div>";

		
		
		}
		if (idTK==3) {
			chuoi= "		                            	<div class=\"form-group mb-30\" style=\"background: url("+ defines.getUrlPublic() +"/img/f.jpg) 5px 50px no-repeat; \">\r\n" + 
					"			                                <label for=\"checkIn \" class=\"label-form\">Khu vực </label>\r\n" + 
					"			                               <select name=\"id_district\" id=\"room\" class=\"form-control\">\r\n" + 
					"			                               	<c:set var=\"qid\" value=\"${listQuan.id }\"></c:set>\r\n" + 
					"			                                	<option value=\"0\">---- Chọn ----</option>\r\n" ;
					for (District obj : districtDAO.getItems()) {
						chuoi+= "<option value='"+obj.getId()+"'>"+obj.getName()+"</option>" ;
						}
					chuoi+="		                                </select>\r\n" + 
							"		                            </div>"
							+ "<div class=\"form-group mb-30\" style=\"background: url("+ defines.getUrlPublic() +"/img/d.png) 1px -5px no-repeat; \">\r\n" + 
							"		                                <label for=\"checkIn \" class=\"label-form\">Loại đất</label>\r\n" + 
							"		                               <select name=\"cat\" class=\"form-control\">\r\n" + 
							"		                               		<option value='0'>--Chọn loại-- </option>";
					for (Category obj : catDAO.getItems()) {
						chuoi+= "<option value='"+obj.getId()+"'>"+obj.getName()+"</option>" ;
						}
					chuoi+="		                                </select>\r\n" + 
							"		                            </div>";

		
		
		}
		out.println(chuoi);
		return null;
	}
	@RequestMapping(value="thongke", method=RequestMethod.GET)
	public String chart(ModelMap modelMap){
		/*int id_cat=1;
		int year = 2018;
		int quan=0;
		Map<String , Integer> getMap= new LinkedHashMap();
		ArrayList<District> distric = (ArrayList<District>) districtDAO.getItems();
		for (int i = 0; i <distric.size(); i++) {
			quan= i+1;
			int soTin= landDAO.countTin(quan,id_cat,year);
			getMap.put(distric.get(i).getName(),soTin);
		}
		modelMap.addAttribute("getMap", getMap);
		for (String key : getMap.keySet()) {
			System.out.println(key + " " + getMap.get(key));

		}
		System.out.println(getMap.keySet());*/
		/*char chuoi= '100 m';
		/*String str="100 m ";*/
		/*Pattern pattern = Pattern.compile("\\d*");
		String[] chuoi =  str.split("\\s");
		for (String string : chuoi) {
			 Matcher matcher = pattern.matcher(string);
			 if (matcher.matches()) {
		            dt = Integer.parseInt(string);
		            System.out.println(string);
		       }
		}*/
		return "public.land.chart";
	}
	@RequestMapping(value="thongke", method=RequestMethod.POST)
	public String chart(ModelMap modelMap,@RequestParam(value="cat", required=false) Integer id_cat,@RequestParam("chitieu") int chitieu,@RequestParam(value="year", required=false) Integer year,@RequestParam("thongketheo") int thongketheo,@RequestParam(value="id_district", required=false) Integer id_district, RedirectAttributes ra){
		Map<String , Integer> getMap= new LinkedHashMap();
		Map<String , Integer> geta=new LinkedHashMap();
		Map<String , Integer> getb= new LinkedHashMap();
		Map<String , Integer> getc= new LinkedHashMap();
		Map<String , Integer> getd= new LinkedHashMap();
		Map<String , Integer> gete= new LinkedHashMap();
		ArrayList<District> distric = (ArrayList<District>) districtDAO.getItems();
		int quan=0;
		int dt,temp;
		if (thongketheo==1) {
			// thống kê theo năm và loại đất 
			if ((chitieu==1)&&(year!=0)&&(id_cat!=0)) {
				Pattern pattern = Pattern.compile("\\d*");
				for (int i = 0; i < distric.size(); i++) {
					dt=0;
					quan=i+1;
					List<Land> str = landDAO.getDienTich(id_cat, year, quan);
					for (Land land : str) {
						String[] chuoi =  land.getArea().split("\\s");
						for (String string : chuoi) {
							 Matcher matcher = pattern.matcher(string);
							 temp=0;
							 // kieemr tra là số hay k
							 
							 if (matcher.matches()) {
						            temp = Integer.parseInt(string);
						            dt+=temp;
						       }
						}
					}
					getMap.put(distric.get(i).getName(), dt);
				}
			}

			// tính theo mức giá
			if ((chitieu==2)&&(year!=0)&&(id_cat!=0)) {
				String price;
				int soTin= 0;
				Map<String , String> getPrice= new LinkedHashMap();
				getPrice.put(" price BETWEEN  400 AND 900","a");
				getPrice.put(" price BETWEEN   1 AND 3" ,"b");
				getPrice.put(" price BETWEEN  4 AND 7","c");
				getPrice.put(" price >= 8 && price LIKE '%Tỷ%' ","d");
				getPrice.put(" not (price BETWEEN 1 and 1000)  ","e");
				// đưa price sang jsp
				for (String key : getPrice.keySet()) {
					for (int j = 0; j <distric.size(); j++) {
						quan= j+1;
						if (getPrice.get(key).equals("a")) {
							soTin= landDAO.countTinMucGia(quan,id_cat,year,key);
							geta.put(distric.get(j).getName(), soTin);
						}
						
						if (getPrice.get(key).equals("b")) {
							soTin= landDAO.countTinMucGia(quan,id_cat,year,key);
							getb.put(distric.get(j).getName(), soTin);
						}
						if (getPrice.get(key).equals("c")) {
							soTin= landDAO.countTinMucGia(quan,id_cat,year,key);
							getc.put(distric.get(j).getName(), soTin);
						}
						if (getPrice.get(key).equals("d")) {
							soTin= landDAO.countTinMucGia(quan,id_cat,year,key);
							getd.put(distric.get(j).getName(), soTin);
						}
						if (getPrice.get(key).equals("e")) {
							soTin= landDAO.countTinMucGia(quan,id_cat,year,key);
							gete.put(distric.get(j).getName(), soTin);
						}
					}
					quan =0;
				}
				modelMap.addAttribute("getPrice", getPrice);
				// lấy lanDAO
				modelMap.addAttribute("geta", geta);
				modelMap.addAttribute("getb", getb);
				modelMap.addAttribute("getc", getc);
				modelMap.addAttribute("getd", getd);
				modelMap.addAttribute("gete", gete);
			}
			
			// tính theo số tin chưa bán
			if ((chitieu==3)&&(year!=0)&&(id_cat!=0)) {
				for (int i = 0; i <distric.size(); i++) {
					quan= i+1;
					int soTin= landDAO.countTinDangChuaBan(quan,id_cat,year);
					getMap.put(distric.get(i).getName(),soTin);
				}
			}
			
			// tính theo số tin đã bán
			if ((chitieu==4)&&(year!=0)&&(id_cat!=0)) {
				for (int i = 0; i <distric.size(); i++) {
					quan= i+1;
					int soTin= landDAO.countTinDangDaBan(quan,id_cat,year);
					getMap.put(distric.get(i).getName(),soTin);
				}
			}
			if (chitieu==0||year==0||id_cat==0) {
				ra.addFlashAttribute("msg", "Vui lòng nhập trường dữ liệu ");
				return "redirect:/thongke";
			}
			modelMap.addAttribute("year", year);
			modelMap.addAttribute("cat",catDAO.getItem(id_cat));
		}
		if (thongketheo==2) {
			// thống kê theo năm và khu vực 
			if ((chitieu==1)&&(year!=0)&&(id_district!=0)) {
				int countDienTich = 0 ;
				Map<String , String> getArea= new LinkedHashMap();
				getArea.put("  area BETWEEN 30 AND 90 ","a");
				getArea.put(" area BETWEEN 100 AND 250" ,"b");
				getArea.put(" area BETWEEN 250 AND 500 ","c");
				getArea.put("  area BETWEEN 500 AND 1000  ","d");
				getArea.put("  area >= 1000 ","e");
				for (String price : getArea.keySet()) {
					for (Category cat : catDAO.getItems()) {
						// kiểm tra cho mỗi trường hợp 
						if (getArea.get(price).equals("a")) {
							List<Land> str = landDAO.getDienTich(cat.getId(), year, id_district,price);
							int countdt =Defines.getTongDienTich(str);
							geta.put(cat.getName(), countdt);
						}
						
						if (getArea.get(price).equals("b")) {
							List<Land> str = landDAO.getDienTich(cat.getId(), year, id_district,price);
							int countdt =Defines.getTongDienTich(str);
							getb.put(cat.getName(), countdt);
						}
						if (getArea.get(price).equals("c")) {
							List<Land> str = landDAO.getDienTich(cat.getId(), year, id_district,price);
							int countdt =Defines.getTongDienTich(str);
							getc.put(cat.getName(), countdt);
						}
						if (getArea.get(price).equals("d")) {
							List<Land> str = landDAO.getDienTich(cat.getId(), year, id_district,price);
							int countdt =Defines.getTongDienTich(str);
							getd.put(cat.getName(), countdt);
						}
						if (getArea.get(price).equals("e")) {
							List<Land> str = landDAO.getDienTich(cat.getId(), year, id_district,price);
							int countdt =Defines.getTongDienTich(str);
							gete.put(cat.getName(), countdt);						}
						
					}
				}
				// lấy tên quận 
				modelMap.addAttribute("geta", geta);
				modelMap.addAttribute("getb", getb);
				modelMap.addAttribute("getc", getc);
				modelMap.addAttribute("getd", getd);
				modelMap.addAttribute("gete", gete);
				modelMap.addAttribute("getArea", getArea);
			}

				// tính theo mức giá
				if ((chitieu==2)&&(year!=0)&&(id_district!=0)) {
					int soTin= 0;
					Map<String , String> getPrice= new LinkedHashMap();
					getPrice.put(" price BETWEEN  400 AND 900","a");
					getPrice.put(" price BETWEEN   1 AND 3" ,"b");
					getPrice.put(" price BETWEEN  4 AND 7","c");
					getPrice.put(" price >= 8 && price LIKE '%Tỷ%' ","d");
					getPrice.put(" not (price BETWEEN 1 and 1000)  ","e");
					for (String key : getPrice.keySet()) {
						for (Category cat : catDAO.getItems()) {
							if (getPrice.get(key).equals("a")) {
								soTin= landDAO.countTinMucGia(id_district,cat.getId(),year,key);
								geta.put(cat.getName(), soTin);
							}
							
							if (getPrice.get(key).equals("b")) {
								soTin= landDAO.countTinMucGia(id_district,cat.getId(),year,key);
								getb.put(cat.getName(), soTin);
							}
							if (getPrice.get(key).equals("c")) {
								soTin= landDAO.countTinMucGia(id_district,cat.getId(),year,key);
								getc.put(cat.getName(), soTin);
							}
							if (getPrice.get(key).equals("d")) {
								soTin= landDAO.countTinMucGia(id_district,cat.getId(),year,key);
								getd.put(cat.getName(), soTin);
							}
							if (getPrice.get(key).equals("e")) {
								soTin= landDAO.countTinMucGia(id_district,cat.getId(),year,key);
								gete.put(cat.getName(), soTin);
							}
						}
					}
					modelMap.addAttribute("getPrice", getPrice);
					// lấy lanDAO
					modelMap.addAttribute("landDAO", landDAO);
					modelMap.addAttribute("geta", geta);
					modelMap.addAttribute("getb", getb);
					modelMap.addAttribute("getc", getc);
					modelMap.addAttribute("getd", getd);
					modelMap.addAttribute("gete", gete);
				}
				// tính theo số tin chưa bán
				if ((chitieu==3)&&(year!=0)&&(id_district!=0)) {
					Map<String , Float> getMapSoTin= new LinkedHashMap();
					for (Category cat : catDAO.getItems()) {
						float soTin= landDAO.countTinDangChuaBan(id_district,cat.getId(),year);
						float tong= landDAO.getCountCatQuanTong(id_district,year);
						
						float percentSotin=((float)(soTin/tong)*100);

						getMapSoTin.put(cat.getName(),(float) (Math.floor(percentSotin * 10) / 10));
					}
					
					modelMap.addAttribute("getMapSoTin", getMapSoTin);
				}
				// tính theo số tin đã bán
				if ((chitieu==4)&&(year!=0)&&(id_district!=0)) {
					for (Category cat : catDAO.getItems()) {
						for (int thang = 1; thang < 13; thang++) {
							int soTin= landDAO.countTinDangDaBan(id_district,cat.getId(),year,thang);
							if (cat.getId()==1) {
								geta.put("thang"+thang, soTin);
							}
							if (cat.getId()==2) {
								getb.put("thang"+thang, soTin);
							}
							if (cat.getId()==3) {
								getc.put("thang"+thang, soTin);
							}
							if (cat.getId()==4) {
								getd.put("thang"+thang, soTin);
							}
							
						}

					}
					modelMap.addAttribute("geta", geta);
					modelMap.addAttribute("getb", getb);
					modelMap.addAttribute("getc", getc);
					modelMap.addAttribute("getd", getd);
				}
				
				if (chitieu==0||year==0|| id_district == 0) {
					ra.addFlashAttribute("msg", "Vui lòng nhập trường dữ liệu ");
					return "redirect:/thongke";
				}
			
			modelMap.addAttribute("year", year);
			modelMap.addAttribute("quan", districtDAO.getItem(id_district));
		}
		// trường hợp chọn khu vực và loại đất 
		if (thongketheo==3) {
			// thống kê theo năm và khu vực 
			if ((chitieu==1)&&(id_cat!=0)&&(id_district!=0)) {
				// tính theo tổng cả diện tích bán và chưa bán 
				Map<String , String> getArea= new LinkedHashMap();
				getArea.put("  area BETWEEN 30 AND 90 ","a");
				getArea.put(" area BETWEEN 100 AND 250 " ,"b");
				getArea.put(" area BETWEEN 250 AND 500 ","c");
				getArea.put("  area BETWEEN 500 AND 1000  ","d");
				getArea.put("  area >= 1000 ","e");
				for (String area : getArea.keySet()) {
					for (int nam = 2016; nam <=2018; nam++) {
						// kiểm tra cho mỗi trường hợp 
						if (getArea.get(area).equals("a")) {
							List<Land> str = landDAO.getDienTichNam(nam, id_cat, id_district,area);
							int countdt =Defines.getTongDienTich(str);
							geta.put("Nam "+nam, countdt);
						}
						
						if (getArea.get(area).equals("b")) {
							List<Land> str = landDAO.getDienTichNam(nam, id_cat, id_district,area);
							int countdt =Defines.getTongDienTich(str);
							getb.put("Nam "+nam, countdt);
						}
						if (getArea.get(area).equals("c")) {
							List<Land> str = landDAO.getDienTichNam(nam, id_cat, id_district,area);
							int countdt =Defines.getTongDienTich(str);
							getc.put("Nam "+nam, countdt);
						}
						if (getArea.get(area).equals("d")) {
							List<Land> str = landDAO.getDienTichNam(nam, id_cat, id_district,area);
							int countdt =Defines.getTongDienTich(str);
							getd.put("Nam "+nam, countdt);
						}
						if (getArea.get(area).equals("e")) {
							List<Land> str = landDAO.getDienTichNam(nam, id_cat, id_district,area);
							int countdt =Defines.getTongDienTich(str);
							gete.put("Nam "+nam, countdt);						}
						
					}
				}
				// lấy tên quận 
				modelMap.addAttribute("geta", geta);
				modelMap.addAttribute("getb", getb);
				modelMap.addAttribute("getc", getc);
				modelMap.addAttribute("getd", getd);
				modelMap.addAttribute("gete", gete);
				modelMap.addAttribute("getArea", getArea);
			}

				// tính theo mức giá
				if ((chitieu==2)&&(id_cat!=0)&&(id_district!=0)) {
					int soTin= 0;
					Map<String , String> getPrice= new LinkedHashMap();
					getPrice.put(" price BETWEEN  400 AND 900","a");
					getPrice.put(" price BETWEEN   1 AND 3" ,"b");
					getPrice.put(" price BETWEEN  4 AND 7","c");
					getPrice.put(" price >= 8 && price LIKE '%Tỷ%' ","d");
					getPrice.put(" not (price BETWEEN 1 and 1000)  ","e");
					for (String key : getPrice.keySet()) {
						for (int nam = 2014; nam <=2018; nam++) {
							if (getPrice.get(key).equals("a")) {
								soTin= landDAO.countTinMucGiaTH3(id_district,nam,id_cat,key);
								geta.put("Nam"+nam, soTin);
							}
							
							if (getPrice.get(key).equals("b")) {
								soTin= landDAO.countTinMucGiaTH3(id_district,nam,id_cat,key);
								getb.put("Nam"+nam, soTin);
							}
							if (getPrice.get(key).equals("c")) {
								soTin= landDAO.countTinMucGiaTH3(id_district,nam,id_cat,key);
								getc.put("Nam"+nam, soTin);
							}
							if (getPrice.get(key).equals("d")) {
								soTin= landDAO.countTinMucGiaTH3(id_district,nam,id_cat,key);
								getd.put("Nam"+nam, soTin);
							}
							if (getPrice.get(key).equals("e")) {
								soTin= landDAO.countTinMucGiaTH3(id_district,nam,id_cat,key);
								gete.put("Nam"+nam, soTin);
							}
						}
					}
					modelMap.addAttribute("getPrice", getPrice);
					// lấy lanDAO
					modelMap.addAttribute("landDAO", landDAO);
					modelMap.addAttribute("geta", geta);
					modelMap.addAttribute("getb", getb);
					modelMap.addAttribute("getc", getc);
					modelMap.addAttribute("getd", getd);
					modelMap.addAttribute("gete", gete);
				}
				// tính theo số tin đã đăng 
				if ((chitieu==3)&&(id_cat!=0)&&(id_district!=0)) {
					Map<String , Float> getMapSoTin= new LinkedHashMap();
					for (int nam = 2014; nam <=2018; nam++) {
						float soTin= landDAO.countTinDaDang(id_district,nam,id_cat);
						float tong= landDAO.getCountCatQuan(id_district,id_cat);
						
						float percentSotin=((float)(soTin/tong)*100);

						getMapSoTin.put("Năm "+nam,(float) (Math.floor(percentSotin * 10) / 10));
					}
					
					modelMap.addAttribute("getMapSoTin", getMapSoTin);
				}
				// tính theo số tin đã bán
				if ((chitieu==4)&&(id_cat!=0)&&(id_district!=0)) {
					Map<String , Float> getMapSoTin= new LinkedHashMap();
					for (int nam = 2014; nam <=2018; nam++) {
						float soTin= landDAO.countTinDaDangBan(id_district,nam,id_cat);
						float tong= landDAO.getCountCatQuanBan(id_district,id_cat);
						
						float percentSotin=((float)(soTin/tong)*100);

						getMapSoTin.put("Năm "+nam,(float) (Math.floor(percentSotin * 10) / 10));
					}
					
					modelMap.addAttribute("getMapSoTin", getMapSoTin);
				}
				
				if (chitieu==0||id_cat==0|| id_district == 0) {
					ra.addFlashAttribute("msg", "Vui lòng nhập trường dữ liệu ");
					return "redirect:/thongke";
				}
			modelMap.addAttribute("cat",catDAO.getItem(id_cat));
			modelMap.addAttribute("quan", districtDAO.getItem(id_district));
		}
		modelMap.addAttribute("landDAO", landDAO);
		modelMap.addAttribute("distric", distric);
		modelMap.addAttribute("thongketheo", thongketheo);
		modelMap.addAttribute("getMap", getMap);
		modelMap.addAttribute("chitieu", chitieu);
		return "public.land.chart";
	}
	@RequestMapping("/project/{nam-project}-{id}")
	public String project(ModelMap modelMap,@PathVariable("id")int id){
		int id_img= projectDAO.getItem(id).getId_image();
		modelMap.addAttribute("getImg", imgDAO.getIdImg(id_img));
		modelMap.addAttribute("getProject", projectDAO.getItem(id));
		return "public.project.detail";
	}
	
	@RequestMapping(value="/project/{nam-project}-{id}",method=RequestMethod.POST)
	@ResponseBody
	  public  String sendText(@ModelAttribute("name")String  name,@ModelAttribute("email")String email,@ModelAttribute("phone")String  phone,@PathVariable("id")int id) throws AddressException, MessagingException {
	    String out="";
	    Contact contact = new Contact(id, name, email, phone, "",id);
	    if (contactDAO.addItemProject(contact)>0) {
			System.out.println("up lienhe");
		}
	    System.out.println("up lienhe1");
		Properties mailServerProperties;
	    Session getMailSession;
	    MimeMessage mailMessage;
	    // Step1: setup Mail Server
	    mailServerProperties = System.getProperties();
	    mailServerProperties.put("mail.smtp.port", "587");
	    mailServerProperties.put("mail.smtp.auth", "true");
	    mailServerProperties.put("mail.smtp.starttls.enable", "true");
	 
	    // Step2: get Mail Session
	    getMailSession = Session.getDefaultInstance(mailServerProperties, null);
	    mailMessage = new MimeMessage(getMailSession);
	 
	    mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));; //Thay abc bằng địa chỉ người nhận
	    mailMessage.setSubject("Demo send gmail from Java");
	    mailMessage.setText("Demo send text by gmail from Java");
	 
	    // Step3: Send mail
	    Transport transport = getMailSession.getTransport("smtp");
	 
	    // Thay your_gmail thành gmail của bạn, thay your_password thành mật khẩu gmail của bạn
	    transport.connect("smtp.gmail.com", "tranhoa24052405@gmail.com", "97duongny"); 
	    transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
	    transport.close();
	    out = "<form action=\"javascript:void()\" class=\"form-connect\">\r\n" + 
	    		"		                                <input name=\"name\" type=\"text\" class=\"form-control form-control-lienhe\" placeholder=\"Your name...\" required >\r\n" + 
	    		"		                                <input name=\"phone\" type=\"text\" class=\"form-control form-control-lienhe\" placeholder=\"Your phone...\" required >\r\n" + 
	    		"		                                <input name=\"email\" type=\"email\" class=\"form-control form-control-lienhe\" placeholder=\"Enter your email...\" required>\r\n" + 
	    		"		                                <button type=\"submit\" onclick=\"demo()\"><i class=\"fa fa-paper-plane\" aria-hidden=\"true\"></i></button>\r\n" + 
	    		"		                            </form>";
	    return out;
	  }
	@RequestMapping("/projects")
	public String project(ModelMap modelMap){
		modelMap.addAttribute("listProjectVip", projectDAO.getItemsVip());
		modelMap.addAttribute("listProject", projectDAO.getItems());
		return "public.project.index";
	}
	@RequestMapping(value={"/news","/news-page-{page}"})
	public String news(ModelMap modelMap,@PathVariable(value="page",required=false)Integer page){
		if(page == null) {
			page=1;
		}
		int offset = (page -1) * Defines.ROW_COUNT;
		int sumPage =(int)Math.ceil((float)newsDAO.getCountCat()/Defines.ROW_COUNT);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("getItemCat", newsDAO.getItems(offset));
		modelMap.addAttribute("getTopViewLand", landDAO.getTopView());
		modelMap.addAttribute("getItemNewsView", newsDAO.getItemView());
		modelMap.addAttribute("getTopViewProject", projectDAO.getTopViewProject());
		return "public.news.index";
	}
	@RequestMapping("/news/{name_news}-{id}")
	public String news(ModelMap modelMap,@PathVariable("id")int id){
		int view = newsDAO.getView(id);
		view+=1;
		if (newsDAO.getViewUpdate(view,id)>0) {
			System.out.println("tăng view");
		}
		modelMap.addAttribute("getItemNews", newsDAO.getItem(id));
		modelMap.addAttribute("getItemCat", newsDAO.getItemNews());
		modelMap.addAttribute("getItemNewsView", newsDAO.getItemView4());
		return "public.news.detail";
	}
	@RequestMapping(value={"/kien-thuc","/kien-thuc-page-{page}"})
	public String know(ModelMap modelMap,@PathVariable(value="page",required=false)Integer page){
		if(page == null) {
			page=1;
		}
		int offset = (page -1) * Defines.ROW_COUNT;
		int sumPage =(int)Math.ceil((float)knowDAO.getCountCat()/Defines.ROW_COUNT);
		About about = aboutDAO.getItem();
		modelMap.addAttribute("getItemKnow", knowDAO.getItemsCat(offset));
		modelMap.addAttribute("getTopViewKnow", knowDAO.getItemViewKnow());
		modelMap.addAttribute("getAdv", adverDAO.getItemAdv());
		modelMap.addAttribute("getAdv", adverDAO.getItemAdv());
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("about", about);
		return "public.know.index";
	}
	
	@RequestMapping(value= "/kien-thuc", method=RequestMethod.POST)
	public String know(ModelMap modelMap,@ModelAttribute("form")int form, HttpServletResponse response, HttpServletRequest request){
		modelMap.addAttribute("listProject", projectDAO.getItems());
		About Oldabout = aboutDAO.getItem();
		int temp;
		String sql="";
		if (1==form) {
			temp= Oldabout.getForm1() +1;
			sql= "form1 = "+temp+" WHERE id = "+Oldabout.getId();
			aboutDAO.updateItem(sql);
		}
		if (2==form) {
			System.out.println("ca");
			temp= Oldabout.getForm2() +1;
			sql= "form2 = "+temp+" WHERE id = "+Oldabout.getId();
			aboutDAO.updateItem(sql);		
				}
		if (3==form) {
			temp= Oldabout.getForm3() +1;
			sql= "form3 = "+temp+" WHERE id = "+Oldabout.getId();
			aboutDAO.updateItem(sql);
		}
		if (4==form) {
			temp= Oldabout.getForm4() +1;
			sql= "form4 = "+temp+" WHERE id = "+Oldabout.getId();
			aboutDAO.updateItem(sql);
		}
		if (5==form) {
			temp= Oldabout.getForm5() +1;
			sql= "form5 = "+temp+" WHERE id = "+Oldabout.getId();
			aboutDAO.updateItem(sql);
		}
		Oldabout = aboutDAO.getItem();
		Map<String , Integer> hinhthuc= new LinkedHashMap();
		About about = aboutDAO.getItem();
		hinhthuc.put("Google.com.vn, bing.com, ...", Oldabout.getForm1());
		hinhthuc.put("Bạn bè giới thiệu ", Oldabout.getForm2());
		hinhthuc.put("Báo chí, truyền thông", Oldabout.getForm3());
		hinhthuc.put("Mạng xã hội", Oldabout.getForm4());
		hinhthuc.put("Khác", Oldabout.getForm5());
		String chuoi="";
		try {
			int i=1;
			PrintWriter out = response.getWriter();
			for (String key : hinhthuc.keySet()) {
				chuoi= chuoi + " <div>"
						+ "<input type='radio' name='form' value='" + i+"' id='myRadio' >" + 
						"	<div class='name-khaosat'>" +key+ " </div>" + 
						"	<div class='meter'>" + 
						"		<span style='width:"+ Defines.percent(hinhthuc.get(key))+"%'></span>" + 
						"		 <p></p>" + 
						"	</div><SPAN class='numberofvote'>"+hinhthuc.get(key) +"phiếu</SPAN>"
						+ "</div>";
				i++;

			}
			out.println(chuoi);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/kien-thuc/{name-know}-{id}")
	public String know(ModelMap modelMap,@PathVariable("id")int id){
		Know know = knowDAO.getItem(id);
		int view = know.getView();
		view+=1;
		if (knowDAO.getViewUpdate(view,id)>0) {
			System.out.println("tăng view");
		}
		modelMap.addAttribute("know", know);
		modelMap.addAttribute("getItemCat", knowDAO.getItemsCatTop());
		modelMap.addAttribute("getItemKnowView", knowDAO.getItemView());
		return "public.know.detail";
	}
	@RequestMapping("/van-ban-phap-luat")
	public String know(ModelMap modelMap){
		modelMap.addAttribute("listDoc", docDAO.getItems());
		modelMap.addAttribute("getTopViewKnow", knowDAO.getItemViewKnow());
		About about = aboutDAO.getItem();
		modelMap.addAttribute("about", about);
		modelMap.addAttribute("listImg", landDAO.getItemsLandImg());
		return "public.know.doc";
	}
}
