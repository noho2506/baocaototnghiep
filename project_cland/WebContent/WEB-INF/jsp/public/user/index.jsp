<?xml version="1.0" encoding="UTF-8"?>
<taglib version="2.1" xmlns="http://java.sun.com/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-jsptaglibrary_2_1.xsd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/templates/taglib.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <!-- Breadcrumb Area End -->
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700);
/* written by riliwan balogun http://www.facebook.com/riliwan.rabo*/
.board{
    width: 75%;
margin: 60px auto;
background: #fff;
/*box-shadow: 10px 10px #ccc,-10px 20px #ddd;*/
box-shadow: 3px 3px 10px rgba(213,222,229,0.50) inset;
}
.board .nav-tabs {
    position: relative;
    /* border-bottom: 0; */
    /* width: 80%; */
    margin: 40px auto;
    margin-bottom: 0;
    box-sizing: border-box;

}

.board > div.board-inner{
    background: #fafafa url(http://subtlepatterns.com/patterns/geometry2.png);
    background-size: 30%;
}

p.narrow{
    width: 60%;
    margin: 10px auto;
}

.liner{
    height: 2px;
    background: #ddd;
    position: absolute;
    width: 80%;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: 50%;
    z-index: 1;
}

.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
    color: #555555;
    cursor: default;
    /* background-color: #ffffff; */
    border: 0;
    border-bottom-color: transparent;
}

span.round-tabs{
    width: 70px;
    height: 70px;
    line-height: 70px;
    display: inline-block;
    border-radius: 100px;
    background: white;
    z-index: 2;
    position: absolute;
    left: 0;
    text-align: center;
    font-size: 25px;
}

span.round-tabs.one{
    color: rgb(34, 194, 34);border: 2px solid rgb(34, 194, 34);
}

li.active span.round-tabs.one{
    background: #fff !important;
    border: 2px solid #ddd;
    color: rgb(34, 194, 34);
}

span.round-tabs.two{
    color: #febe29;border: 2px solid #febe29;
}

li.active span.round-tabs.two{
    background: #fff !important;
    border: 2px solid #ddd;
    color: #febe29;
}

span.round-tabs.three{
    color: #3e5e9a;border: 2px solid #3e5e9a;
}

li.active span.round-tabs.three{
    background: #fff !important;
    border: 2px solid #ddd;
    color: #3e5e9a;
}

span.round-tabs.four{
    color: #f1685e;border: 2px solid #f1685e;
}

li.active span.round-tabs.four{
    background: #fff !important;
    border: 2px solid #ddd;
    color: #f1685e;
}

span.round-tabs.five{
    color: #999;border: 2px solid #999;
}

li.active span.round-tabs.five{
    background: #fff !important;
    border: 2px solid #ddd;
    color: #999;
}

.nav-tabs > li.active > a span.round-tabs{
    background: #fafafa;
}
.nav-tabs > li {
    width: 33%;
}
/*li.active:before {
    content: " ";
    position: absolute;
    left: 45%;
    opacity:0;
    margin: 0 auto;
    bottom: -2px;
    border: 10px solid transparent;
    border-bottom-color: #fff;
    z-index: 1;
    transition:0.2s ease-in-out;
}*/
li:after {
    content: " ";
    position: absolute;
    left: 45%;
   opacity:0;
    margin: 0 auto;
    bottom: 0px;
    border: 5px solid transparent;
    border-bottom-color: #ddd;
    transition:0.1s ease-in-out;
    
}
li.active:after {
    content: " ";
    position: absolute;
    left: 45%;
   opacity:1;
    margin: 0 auto;
    bottom: 0px;
    border: 10px solid transparent;
    border-bottom-color: #ddd;
    
}
.nav-tabs > li a{
   width: 70px;
   height: 70px;
   margin: 20px auto;
   border-radius: 100%;
   padding: 0;
   z-index:1;
}

.nav-tabs > li a:hover{
    background: transparent;
}

.tab-content{
}
.tab-pane{
   position: relative;
padding-top: 50px;
}
.tab-content .head{
    font-family: 'Roboto Condensed', sans-serif;
    font-size: 25px;
    text-transform: uppercase;
    padding-bottom: 10px;
     padding-left: 30px;
}
.tab-content .head h3{
    border-left: 6px solid #0e2737;
    padding-left: 10px;
    color: #0e2737;
    font-weight: bold;
}
.btn-outline-rounded{
    padding: 10px 40px;
    margin: 20px 0;
    border: 2px solid transparent;
    border-radius: 25px;
}

.btn.green{
    background-color:#5cb85c;
    /*border: 2px solid #5cb85c;*/
    color: #ffffff;
}



@media( max-width : 585px ){
    
    .board {
width: 90%;
height:auto !important;
}
    span.round-tabs {
        font-size:16px;
width: 50px;
height: 50px;
line-height: 50px;
    }
    .tab-content .head{
        font-size:20px;
        }
    .nav-tabs > li a {
width: 50px;
height: 50px;
line-height:50px;
}

li.active:after {
content: " ";
position: absolute;
left: 35%;
}

.btn-outline-rounded {
    padding:12px 20px;
    }
}
.narrow-info{
border: 1px solid #efefe9;
padding: 20px;
margin-right: 30px;
}
.narrow-info i,
.narrow-info p a{
cursor:pointer;
     color: #1cc3bc !important;;
}
.narrow-info i{
 color: #1cc3bc;
 margin-left: 10px;
}
.edit-user{
position: absolute;
    top: 191px;
    left: 260px;
    z-index: 2000;
    background: #fff;
    width: 59%;
    box-shadow: 3px 3px 10px rgba(213,222,229,0.50)  inset;
}
.edit-user h3{text-align: center;}
.change-edit-user{padding: 10px 30px;}
.change-edit-user h6{font-size: 18px;}
.form-edit-user{background: #efefe3;padding: 20px 40px;border: 2px solid #EFEFFB;}
.form-edit-user input{
 border: 2px solid #EFEFFB;
 width: 100%;
 height: 42px;
}

.form-edit-user p{
color:#333;
font-size: 16px;
}
.change-edit-user h6 span{
	color:red;
}
.overlayedit {
  height: 100%;
  width: 100%;
  display: none;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4); 
}
.pass{
font-size: 17px;
}
.closeedit{
    float: right;
    margin-right: 261px;
    margin-top: 143px;
    font-size: 39px !important;
    font-weight: 700;
    line-height: 1;
    color: #fff !important;
    text-shadow: 0 1px 0 #fff;
    filter: alpha(opacity=20);
    opacity: 3.2;
}
.a-edit{
color: #1cc3b2 !important;
}
.field-icon {
  float: right;
  margin-left: -25px;
  margin-top: -25px;
  position: relative;
  z-index: 2;
}
.container-msg-edit{margin: 10px;}
.header-msg-edit{
}
.xacnhan-edit{
    background: #1cc3b2;
    margin-left: 21px;
}
.thongbao-edit{text-align: center;color: red;font-size: 22px;}
.msg-edit{margin-left: 20px;}
.info-title{
color:red;
}
.form-edit-user-info{margin-bottom: 20px;margin: 10px 30px;}
.form-edit-user-info p{display: inline;}
.input-nhap-firstname{
width: 81%;margin-left: 20px;
    border: 2px solid #EFEFFB;
    height: 42px;
    box-shadow: 3px 3px 10px rgba(213,222,229,0.50) inset;}
.info-title-info{color: #1cc3b2;border-bottom: 1px solid #efefe3;padding-bottom: 17px;margin-bottom:0px}
.form-edit-a{
}
.edit-radio input{
	margin-left: 20px;
}
.edit-radio{
    display: inline;
    margin-left: 20px;
}
.info-land-user-active{
color:red;
}
.info-land-user{margin: 0px 30px;}
.info-land-user p{display: inline;}
.info-land-user span{
    font-size: 17px;
}
.info-right{float: left;width: 50%;}
.info-left{
    float: left;
    width: 50%;
}
.color-view{
color:#fff}
.notification{
border: 1px solid #efefe9;
padding: 20px;
margin-right: 30px;
background: #f9fafb;
}
.notification-content{
    background: #fff;
    padding: 10px 20px;
        margin-bottom: 10px;
}
</style>
<c:choose>
    	<c:when test="${empty userLogin }">
    		<div class="alert alert-success">
				<strong>Vui lòng đăng nhập để sử dụng chức năng</strong>
			  </div>
    	</c:when>
    	<c:otherwise>
<div>
	<section style="background:#efe fe9;">
	        <div class="container">
	            <div class="row">
	                <div class="board">
	                    <!-- <h2>Welcome to IGHALO!<sup>™</sup></h2>-->
	                    <div class="board-inner">
	                    <ul class="nav nav-tabs" id="myTab">
	                    <div class="liner"></div>
	                     <li class="active">
	                     <a href="#home" data-toggle="tab" title="welcome">
	                      <span class="round-tabs one">
	                              <i class="glyphicon glyphicon-home"></i>
	                      </span> 
	                  </a></li>
	                 <li><a href="#messages" data-toggle="tab" title="bootsnipp goodies">
	                     <span class="round-tabs three">
	                          <i class="glyphicon glyphicon-check"></i>
	                     </span> </a>
	                     </li>
	
	                     <li><a href="#settings" data-toggle="tab" title="blah blah">
	                         <span class="round-tabs four">
	                              <i class="glyphicon glyphicon-bell"></i>
	                         </span> 
	                     </a></li>
	
	                    
	                     
	                     </ul></div>
	
	                     <div class="tab-content">
	                      <div class="tab-pane fade in active" id="home">
							<div class="head">
					                <h3>Thông tin tài khoản </h3>
					                <div class="narrow-info" >
					                	<p>Username: ${userLogin.username }<i class=" fa fa-edit"></i><a class="a-edit" onclick="openEditUsername()" > Edit </a></p>
					                	<p>Mật khẩu: <span class="pass">......</span><i class=" fa fa-edit"></i><a class="a-edit"  onclick="openEditPass()" > Edit </a></p>
					                </div>
				                </div>
				                <div class="head">
					                <h3>Thông tin cá nhân </h3>
					                <div class="narrow-info" >
					                	<p>Họ và tên : ${userLogin.firstname }</p>
					                	<p>Ngày sinh: ${userLogin.birthday }
					                		<c:choose>
					                			<c:when test="${ empty userLogin.birthday   }"> ${userLogin.birthday } </c:when>
					                			<c:otherwise> Chưa cập nhật</c:otherwise>
					                		</c:choose>
					                	</p>
					                	<p>Giới tính: 
					                		<c:choose>
					                			<c:when test="${userLogin.gender ==1 }">Nữ</c:when>
					                			<c:when test="${userLogin.gender ==0 }">Nam</c:when>
					                			<c:otherwise>Chưa cập nhật  </c:otherwise>
					                		</c:choose>
					                	</p>
					                	<p>Tình trang hôn nhân: 
					                		<c:choose>
					                			<c:when test="${userLogin.state ==0 }">Độc thân </c:when>
					                			<c:when test="${userLogin.state ==1 }">Đã có gia đình</c:when>
					                			<c:otherwise>Chưa cập nhật  </c:otherwise>
					                		</c:choose>
					                	</p>
					                	<p>Địa chỉ:  
					                		<c:choose>
					                			<c:when test="${ empty userLogin.address   }">Chưa cập nhật </c:when>
					                			<c:otherwise>${userLogin.address } </c:otherwise>
					                		</c:choose>
					                	</p>
					                	<a href="javascript:void(0)" class="btn btn-default a-edit" onclick="openEdit()"> <i class=" fa fa-edit"></i>Sửa</a>
					                </div>
				                </div>
	                      </div>
	                      
	                      <div class="tab-pane fade" id="messages">
	                     	 <div class="head">
					                <h3>Danh sách bài đăng  </h3>
					                <c:set var="i" value="1"></c:set>
					                <div class="narrow-info" >
					                	<c:forEach items="${listItemUser }" var="obj">
					                		<p>Bài đăng ${i }:<a class="a-edit" onclick="titleLand${obj.id}()" > ${obj.title}<i class="  fa fa-external-link"></i> </a></p>
					                		 <c:set var="i" value="${i+1 }"></c:set>
					                		 <!-- info land -->
											<div id="infoLand${obj.id}" class="overlayedit">
												   <a href="javascript:void(0)" class="closeedit" onclick="closeNav${obj.id}()">&times;</a>
												  <div class="edit-user">
													<h3 class="info-title-info">Thông tin bài đăng  </h3>
													<div class="change-edit-user-info">
														<div class="form-edit-a">
															<div class="info-left">
																<div class="info-land-user">
																	<p>Mã bài đăng: </p> <span>${obj.id }</span>
																</div>
																<div class="info-land-user">
																	<p>Tên bài đăng: </p> <span>${obj.title }</span>
																</div>
																<div class="info-land-user">
																	<p>Ngày đăng: </p> <span><%-- <fmt:formatDate value="${obj.create_day }" pattern="dd/MM/yyyy" var="ngay"/> ${ngay } --%>${obj.create_day }</span>
																</div>
															</div>
															<div class="info-right">
																<div class="info-land-user">
																	<p>Tình trang: </p>
																	 <span class="info-land-user-active">
																		 <c:choose>
												                			<c:when test="${obj.active ==0 }">Bài viết chưa duyệt  </c:when>
												                			<c:when test="${obj.active ==1 }">Bài viết đã duyệt </c:when>
												                			<c:otherwise></c:otherwise>
												                		</c:choose>
																	 </span>
																</div>
																<div class="info-land-user">
																	<p>Trạng thái: </p> <span class="info-land-user-active">
																		<c:choose>
													                			<c:when test="${obj.state ==0 }">Chưa bán </c:when>
													                			<c:when test="${obj.state ==1 }">Đã bán</c:when>
													                			<c:otherwise></c:otherwise>
													                		</c:choose>
																	</span>
																</div>
															</div>
															<p ><a href="${pageContext.request.contextPath }/dat-ban/${slugUtil.makeSlug(obj.title)}-${obj.id}" class="btn btn-success btn-outline-rounded green color-view"> Xem<span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a></p>
														</div>
													</div>
												</div>
											</div>
											<script type="text/javascript">
												function titleLand${obj.id}() {
													var a = ${obj.id};
												  document.getElementById("infoLand"+a).style.display = "block";
												}
											
												function closeNav${obj.id}() {
													var a = ${obj.id};
												  document.getElementById("infoLand"+a).style.display = "none";
												}
											</script>
					                	</c:forEach>
					                </div>
				                </div>
	                      </div>
	                      <div class="tab-pane fade" id="settings">
	                      <div class="head">
					                <h3>Thông báo </h3>
					                <div class="notification" >
					                <c:choose>
								    	<c:when test="${empty listNotiUser }">
					                			<div class="notification-content">
									                	<p class="notification-content-name">Bạn không có thông báo từ hệ thống</p>
									                </div> 
								    	</c:when>
								    	<c:otherwise>
					                	<c:forEach items="${listNotiUser }" var="noti">
					                		 <c:choose>
					                		 	<c:when test="${noti.kind ==1 }">
						                			<div class="notification-content">
									                	<p class="notification-content-name"><strong>${cmtDAO.getItemName(noti.id_cmt).name}</strong> đã bình luận bài viết <strong>${landDAO.getItemName(noti.id_land).title}</strong><a href="${pageContext.request.contextPath }/dat-ban/${slugUtil.makeSlug(landDAO.getItemName(noti.id_land).title)}-${noti.id_land}"class="a-edit" > Xem <i class="  fa fa-external-link"></i></a></p>
									                </div>
					                			</c:when>
					                			<c:when test="${noti.kind ==2 }">
						                			<div class="notification-content">
									                	<p class="notification-content-name">Admin: Đã phê duyệt bài viết <strong>${landDAO.getItemName(noti.id_land).title}</strong><a href="${pageContext.request.contextPath }/dat-ban/${slugUtil.makeSlug(landDAO.getItemName(noti.id_land).title)}-${noti.id_land}"class="a-edit" > Xem <i class="  fa fa-external-link"></i></a></p>
									                </div>
					                			</c:when>
					                			<c:when test="${noti.kind ==3 }">
						                			<div class="notification-content">
									                	<p class=" notification-content-name">Bài viết: <strong>${landDAO.getItemName(noti.id_land).title}</strong><a class="a-edit" > Đã bán<i class="fa fa-star-half-o"></i></a></p>
									                </div>
					                			</c:when>
					                			<c:when test="${noti.kind ==4 }">
						                			<div class="notification-content">
									                	<p class="notification-content-name">Bài viết: <strong>${landDAO.getItemName(noti.id_land).title}</strong> <a class="a-edit" > Đã chặn <i class="  fa fa-minus-circle"></i></a></p>
									                </div>
					                			</c:when>
					                			<c:otherwise></c:otherwise>
					                		</c:choose>
						                </c:forEach>
						                <a href="${pageContext.request.contextPath }/user/del/${userLogin.id}" class="btn btn-default a-edit" > <span class="glyphicon glyphicon-trash"></span>Xóa thông báo </a>
					                	  </c:otherwise>
    									</c:choose>
					                </div>
				                </div>
	                      </div>
	                     
						<div class="clearfix"></div>
						<!-- edit username -->
						<div id="editUser" class="overlayedit">
							  <a href="javascript:void(0)" class="closeedit" onclick="closeNav()">&times;</a>
							  <div class="edit-user">
								<h3>Thay đổi tên đăng nhập </h3>
								<div class="change-edit-user">
									<h6>Username hiện tại của bạn là: <SPAN>${userLogin.username }</SPAN> </h6>
									<div class="form-edit-user">
										<p>Vui lòng nhập username mới: </p>
										<INPUT type="text" name ="username" placeholder="Vui lòng nhập username" class="nhap-username" value=""/>
							            <p><a href="javascript:void(0)" onclick="edit_username(${userLogin.id })" class="btn btn-success btn-outline-rounded green"> EDIT<span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a></p>
									</div>
								</div>
								<%-- <div class="header-msg-edit">
									<div class="container-msg-edit">
											<h4 class="thongbao-edit">Thông báo </h4>
											<p class="msg-edit">Tài khoản đã có người sử dụng  </p>
											<a href="${pageContext.request.contextPath }/dang-ky" class="btn btn-metis-5 btn-lg xacnhan-edit"> Xác nhận </a>
									</div>
									</div> --%>
							</div>
						</div>
						<!-- edit pass -->
						<div id="editPass" class="overlayedit">
						  <a href="javascript:void(0)" class="closeedit" onclick="closeNav()">&times;</a>
						  <div class="edit-user">
							<h3 style="color:red">Thay đổi mật khẩu </h3>
							<div class="change-edit-user">
								<div class="form-edit-user">
									<p>Vui lòng nhập mật khẩu mới: </p>
									<input id="password-field" type="password" class="form-control-edit" name="password" value="${userLogin.password }"/>
									<span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
						            <p><a href="javascript:void(0)"  onclick="edit_pass(${userLogin.id })"class="btn btn-success btn-outline-rounded green"> EDIT<span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a></p>
								</div>
							</div>
						</div>
						</div>
						<!-- edit info user -->
						<div id="editInfo" class="overlayedit">
							  <a href="javascript:void(0)" class="closeedit" onclick="closeNav()">&times;</a>
							  <div class="edit-user">
								<h3 class="info-title-info">Thay đổi thông tin cá nhân  </h3>
								<div class="change-edit-user-info">
									<div class="form-edit-a">
										<div class="form-edit-user-info">
											<p>Họ và tên: </p>
											<INPUT type="text" name ="firstname" placeholder="Vui lòng nhập họ tên " id="input-firstname" class=" input-nhap-firstname" value="${userLogin.firstname }"/>
										</div>
										<div class="form-edit-user-info">
											<p>Ngày sinh: </p>
											<INPUT type="text" name ="birthday" placeholder="Vui lòng nhập ngày sinh " id="input-birthday" class=" input-nhap-firstname" value="${userLogin.birthday }"/>
										</div>
										<div class="form-edit-user-info">
											<p>Giới tính: </p>
											<div class="edit-radio">
										 		<input type="radio" name="gender" value="0"><span> Male</span>
  												<input type="radio" name="gender" value="1"> <span>Female</span>
										 	</div>
										</div>
										<div class="form-edit-user-info">
											<p>Tình trang hôn nhân : </p>
										 	<div class="edit-radio">
										 		<input type="radio" name="state" value="0"> <span>Độc thân </span>
 											 	<input type="radio" name="state" value="1"> <span>Đã có gia đình</span>
										 	</div>
										</div>
										<div class="form-edit-user-info">
											<p>Địa chỉ: </p>
											<INPUT type="text" name ="address" placeholder="Vui lòng nhập địa chỉ" id="input-address" class=" input-nhap-firstname" value="${userLogin.address }"/>
										</div>
										<p style="margin-left:30px"><a href="javascript:void(0)" onclick="edit_info(${userLogin.id })" class="btn btn-success btn-outline-rounded green"> EDIT<span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a></p>
									</div>
								</div>
							</div>
						</div>
						
						
						</div>
						<!-- form edit -->
						
					</div>
			</div>
	</div>
</section>
</div>
  </c:otherwise>
    </c:choose>

<script type="text/javascript">
function openEditUsername() {
	  document.getElementById("editUser").style.display = "block";
	}
function openEditPass() {
	  document.getElementById("editPass").style.display = "block";
	}
function openEdit() {
	  document.getElementById("editInfo").style.display = "block";
	}

	function closeNav() {
	  document.getElementById("editUser").style.display = "none";
	  document.getElementById("editPass").style.display = "none";
	  document.getElementById("editInfo").style.display = "none";
	}
$(function(){
	$('a[title]').tooltip();
	});
$(".toggle-password").click(function() {
	  $(this).toggleClass("fa-eye fa-eye-slash");
	  var input = $($(this).attr("toggle"));
	  if (input.attr("type") == "password") {
	    input.attr("type", "text");
	  } else {
	    input.attr("type", "password");
	  }
	});
</script>


<script type="text/javascript"> 
	function edit_username(id){
		var tep = $('.nhap-username').val();
		$.ajax({
			url:'${pageContext.request.contextPath }/user',
			type: 'POST',
			cache: false,
			data:{
					//Dữ liệu gửi đi
					name: tep,//temp file tạm// chú ý dấu 
					temp_id: id
					},
			success: function(data){// lấy dữ liệu về data// từ server gửi về data
				// Xử lý thành công
				$('.edit-user').html(data);
				
			},
			error: function (){
			// Xử lý nếu có lỗi
			alert("Lỗi !");
			//alert('Có lỗi xảy ra');
			}
		}); 
	}
</script>
<script type="text/javascript"> 
	function edit_pass(id){
		var temp_pass = $('.form-control-edit').val();
		$.ajax({
			url:'${pageContext.request.contextPath }/user/index',
			type: 'POST',
			cache: false,
			data:{
					//Dữ liệu gửi đi
					pass: temp_pass,//temp file tạm// chú ý dấu 
					temp_id: id
					},
			success: function(data){// lấy dữ liệu về data// từ server gửi về data
				// Xử lý thành công
				$('.edit-user').html(data);
				
			},
			error: function (){
			// Xử lý nếu có lỗi
			alert("Lỗi !");
			//alert('Có lỗi xảy ra');
			}
		}); 
	}
</script>
<script type="text/javascript"> 
	function edit_info(id){
		var temp_name = $('#input-firstname').val();
		var temp_address = $('#input-address').val();
		var temp_birthday = $('#input-birthday').val();
		console.log(temp_birthday)
		var temp_gender = $("input[name='gender']:checked").val();// nếu gán dữ liệu thì val('dkfjs')
		var temp_state = $("input[name='state']:checked").val();// nếu gán dữ liệu thì val('dkfjs')
		if (temp_name==''||temp_address==''||temp_birthday==''||temp_gender==null||temp_state==null) {
			alert("Vui lòng nhập các trường !");
		}else{
			$.ajax({
				url:'${pageContext.request.contextPath }/user/index/info',
				type: 'POST',
				cache: false,
				data:{
						//Dữ liệu gửi đi
						name: temp_name,
						birthday:temp_birthday,
						address: temp_address,
						gender: temp_gender,
						state:temp_state,
						temp_id:id
						},
				success: function(data){// lấy dữ liệu về data// từ server gửi về data
					// Xử lý thành công
					$('.edit-user').html(data);
					
				},
				error: function (){
				// Xử lý nếu có lỗi
				alert("Lỗi !");
				//alert('Có lỗi xảy ra');
				}
			}); 
		}
	}
</script>
  

    