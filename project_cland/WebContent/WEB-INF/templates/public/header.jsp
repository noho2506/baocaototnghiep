<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/templates/taglib.jsp" %>
	<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>NewLands</title>
    
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Favicon -->
    <link rel="icon" href="<%=request.getContextPath() %>/templates/public/img/core-img/favicon.png">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/fonts/icon-font.min.css">
    <!-- Stylesheet -->
   <link rel="stylesheet" type="text/css" href="${defines.getUrlPublic() }/css/register.css">
	<link rel="stylesheet" type="text/css" href="${defines.getUrlPublic() }/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/1.css">
     <link rel="stylesheet" type="text/css" href="${defines.getUrlPublic() }/css/2.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/animate.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/default-assets/classy-nav.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/nice-select.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/jquery-ui.min.css">
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/util.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/slick.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/slide.css">
  	
  	<link href=' http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  	<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
  	<!-- Magnific Popup core CSS file -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/slick-theme.css">
	
	
		<!-- Magnific Popup core CSS file -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/magnific-popup.css">
      <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" media="all" href="${defines.getUrlPublic() }/css/daterangepicker-bs3.css" />
      <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
	
</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- /Preloader -->

    <!-- Header Area Start -->
    <header class="header-area">
        <!-- Search Form -->
        <div class="search-form d-flex align-items-center">
            <div class="container">
                <form action="index.html" method="get">
                    <input type="search" name="search-form-input" id="searchFormInput" placeholder="Type your keyword ...">
                    <button type="submit"><i class="icon_search"></i></button>
                </form>
            </div>
        </div>

        <!-- Top Header Area Start -->
        <div class="top-header-area">
            <div class="container">
                <div class="row">

                    <div class="col-6">
                        <div class="top-header-content">
                            <a href="#"><i class="icon_phone"></i> <span>(123) 456-789-1230</span></a>
                            <a href="#"><i class="icon_mail"></i> <span>info.colorlib@gmail.com</span></a>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="top-header-content">
                            <!-- Top Social Area -->
                            <div class="top-social-area ml-auto">
                                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Top Header Area End -->

        <!-- Main Header Start -->
        <div class="main-header-area">
            <div class="classy-nav-container breakpoint-off">
                <div class="container header-menu">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between" id="robertoNav">

                        <!-- Logo -->
                        <a class="nav-brand" href="${pageContext.request.contextPath}/"><img class="logo-cland" src="<%=request.getContextPath() %>/templates/public/img/logo-VHS-02-7.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">
                            <!-- Menu Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>
                            <!-- Nav Start -->
                            <div class="classynav menu-header">
                                <ul id="nav">
                                    <li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
                                    <li><a href="">Đất Bán</a>
                                        <ul class="dropdown">
                                        <c:forEach items="${listCat }" var="objC">
                                            <li><a href="${pageContext.request.contextPath}/${slugUtil.makeSlug(objC.name)}-${objC.id}">${objC.name}</a></li>
                                         </c:forEach>
                                        </ul>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath }/projects">Dự Án</a></li>
                                    <li><a href="">Kiến Thức</a>
                                        <ul class="dropdown cat-know">
                                            <li ><a href="${pageContext.request.contextPath}/kien-thuc">Kiến Thức Bất Động Sản</a></li>
                                            <li><a href="${pageContext.request.contextPath}/cat/${objC.id}">Văn Bản Pháp Luật </a></li>
                                        </ul>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/news">Tin Tức</a></li>
                                    <li><a href="${pageContext.request.contextPath }/thongke">Thông Kê</a></li>
                                </ul>

                                <!-- Search -->
                                <div class="search-btn ml-4">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </div>

                                <!-- Book Now -->
                                <c:choose>
                                	<c:when test="${empty  userLogin}">
		                                <div class=" ml-3 ml-lg-5" style="display: inline">
		                                    <a style="cursor:pointer" onclick="openNav()" href="#">Đăng nhập  <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
		                                </div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class=" ml-3 ml-lg-5">
		                                    <ul id="nav">
		                                    	 <li class="login-dropdown">
		                                    	 	<img class="login-img" src="<%=request.getContextPath() %>/templates/public/img/images (1).png">
		                                    			<%-- <p class="login-name">${userLogin.firstname }</p> --%>
			                                        <div class="dropdown  dropdown1">
			                                        	<div class="row login-user">
			                                        		<div class=" user-img col-3 ">
			                                        			<img class="login-img1  " src="<%=request.getContextPath() %>/templates/public/img/images (1).png">
			                                        		</div>
			                                        		<div class="user-content col-8">
			                                        			<p class="login-name">${userLogin.firstname }</p>
			                                        			<p class="login-email">${userLogin.email}</p>
			                                        		</div>
			                                        	</div>
			                                        	<ul class="quanly">
			                                        		<li class="user-quanly">
			                                        			<i class=" fa fa-users"></i>
			                                        			<a href="${pageContext.request.contextPath }/user">Quản lý tài khoản</a>
			                                        		</li>
			                                        		<li class="user-quanly">
			                                        			<i class="fa fa-reddit"></i>
			                                        			<a href="${pageContext.request.contextPath }/user">Theo dõi bài đăng</a>
			                                        		</li>
			                                        		<li class="user-quanly">
			                                        			<i class="fa fa-hospital-o"></i>
			                                        			<a href="${pageContext.request.contextPath }/user">Thông báo bài đăng</a>
			                                        		</li>
			                                        	</ul>
			                                        	<div class="row logout-user">
			                                        		<a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
			                                        	</div>
			                                            <%-- <li><a href="${pageContext.request.contextPath}/cat/${objC.id}">fdsfdsfdsfdsfdsf</a></li> --%>
			                                        </div>
			                                    </li>
		                                    	
		                                    </ul>
		                                </div>
                                	
                                	</c:otherwise>
                                </c:choose>
                                <div class="book-now-btn ml-3 ml-lg-5" style="display: inline">
                                    <a href="${pageContext.request.contextPath }/add-land">Đăng tin miễn phí  <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                </div>
                                <div id="myNav" class="overlay">
								  <a href="javascript:void(0)" class=" close closebtn " onclick="closeNav()">&times;</a>
								  <div class="d-flex justify-content-center h-100">
									<div class="card">
										<div class="card-header">
											<h3>Welcome</h3>
											<p>Đăng nhập để đăng tin miễn phí</p>
											<div class="d-flex justify-content-end social_icon">
												<span><i class="fa fa-facebook-square"></i></span>
												<span><i class="fa fa-google-plus-square"></i></span>
												<span><i class="fa fa-twitter-square"></i></span>
											</div>
										</div>
										<div class="card-body">
											<form action="${pageContext.request.contextPath }/" method="post">
												<div class="input-group form-group">
													<div class="input-group-prepend">
														<span class="input-group-text"><i class="fa fa-user"></i></span>
													</div>
													<input type="text" name="username"class="form-control" placeholder="username">
													
												</div>
												<div class="input-group form-group">
													<div class="input-group-prepend">
														<span class="input-group-text"><i class="fa fa-key"></i></span>
													</div>
													<input type="password" name="password"class="form-control" placeholder="password">
												</div>
												<div class="row align-items-center remember">
													<input type="checkbox">Remember Me
												</div>
												<div class="form-group">
													<input type="submit"  class="btn float-right login_btn" value="Login">
												</div>
											</form>
										</div>
										<div class="card-footer">
											<div class="dangky-lg">
												Bạn có tài khoản chưa?
												<a href="${pageContext.request.contextPath}/dang-ky"class="dk">Đăng ký</a>
											</div>
											
										</div>
									</div>
								</div>
								</div>
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <style>


.overlay {
  height: 0%;
  width: 100%;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0, 0.9);
  overflow-y: hidden;
  transition: 0.5s;
}


.close {
  padding: 8px;
    text-decoration: none;
    font-size: 36px !important;
    color: #fff !important;
    display: block;
    position: absolute;
    top: 90px;
    left: 899px;
}


.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}
.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}
.dangky-lg{
	display:inline;
	color: #fff;
}
.dangky-lg a{
	display:inline;
	margin-left: 5px;
	color:#1cc3b2;
}
.dk{
 font-size: 17px !important;
}
</style>
    <script>
function openNav() {
  document.getElementById("myNav").style.height = "100%";
}

function closeNav() {
  document.getElementById("myNav").style.height = "0%";
}
</script>
    <!-- Header Area End -->