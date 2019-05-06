
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/templates/taglib.jsp" %>
    <!-- Welcome Area Start -->
    <div class="wrapper-home">
		<div class="menu-logo ">
			<div class="container col-12">
					<div class="row">
						<nav class="nav-menu">
							<ul class="list-menu" id="home-menu">
								<li class="active item-menu "><a class="link-menu" href="#">Giới thiệu</a></li>
								<li class="item-menu"><a href="#TIENICH" class="link-menu" >Tiện ích</a></li>
								<li class="item-menu"><a href="#VITRI" class="link-menu" >Vị trí</a></li>
								<li class="item-menu"><a href="#THIETKE" class="link-menu" >Thiết kế</a></li>
								<li class="item-menu"><a href="#LIENHE" class="link-menu" >Liên hệ</a></li>
  
							</ul>
						</nav>

					</div>
				</div>
		</div>
		<div class="home-slider">
			<div class="container col-12">
				<section class="trangchu ">
					      <img  class="trangchu-img "src="${pageContext.request.contextPath }/files/${getImg.homepage}">
				</section>
				<div class="row">
					<div class="home-content">
						<%-- <h2>${getProject.title}</h2>
						<p class="home-content-text">Lorem ipsumget nunc vitae tellus luctus ullamcorper. Nam porttitor lit id laoreet. Quisque </p>
						<a  href="#"><button class="button-download">Download</button></a>
                        <a href="#"><button class="button-download">Learn More</button></a>
						<div class="Aavailable">
							<p>Aavailable on :
								<a href=""><i class="fa fa-apple "></i></a>
								<a href=""><i class="fa fa-android "></i></a>

							</p>
						</div> --%>
						<div class="room-content">
		                    <h2 class="title" data-animation="fadeInUp" data-delay="100ms">${getProject.title}</h2>
		                    <h6 data-animation="fadeInUp" data-delay="300ms">${getProject.address} </h6>
		                    <ul class="room-feature project-description" data-animation="fadeInUp" data-delay="500ms">
		                        ${getProject.description }
		                    </ul>
		                    <a href="#LIENHE" class="btn roberto-btn mt-30" data-animation="fadeInUp" data-delay="700ms">NHẬN TƯ VẤN</a>
		                </div>

					</div>

				</div>
			</div>
		</div>
		<div class="row gioithieu">
			<div class=" col-12 col-lg-7 gioithieu-content">
			${getProject.overview}
			</div>
			<div class="col-12 col-lg-5">
				<img  class="trangchu-img "src="${pageContext.request.contextPath }/files/${getImg.introduce}">
			</div>
		</div>
		<div id="TIENICH" class="row tienich">
			<div class="col-12 col-lg-5">
				<img  class="trangchu-img "src="${pageContext.request.contextPath }/files/${getImg.utility}">
			</div>
			<div class=" col-12 col-lg-7 gioithieu-content">
			${getProject.utility}
			</div>
		</div>
		<div id="VITRI" class="row vitri">
			<div class=" col-12 col-lg-7 gioithieu-content">
			${getProject.location}
			</div>
			<div class="col-12 col-lg-5">
				<img  class="trangchu-img "src="${pageContext.request.contextPath }/files/${getImg.map}">
			</div>
		</div>
		<div id="THIETKE" class="row thietke">
			<div class=" col-12  gioithieu-content">
				<h4><i class="fa fa-leaf"></i>Hình ảnh thiết kế</h4>
			</div>
			<div class="col-12">
				<img  class="trangchu-img "src="${pageContext.request.contextPath }/files/${getImg.design}">
			</div>
		</div>
		
		
		<div id="LIENHE" class="row lienhe">
			<div class=" col-12  gioithieu-content content-lienhe">
				<h4><i class="fa fa-angle-double-down"></i>Liên hệ dự án</h4>
			</div>
			<div class="col-12">
				<div class="main-footer-area back-lienhe">
	            <div class="container container-form">
	                <div class="row align-items-baseline justify-content-between row-lienhe">
	                   
	
	                    <!-- Single Footer Widget Area -->
	                    <div class="col-12 col-sm-6 col-lg-3">
	                        <div class="single-footer-widget mb-80">
	                            <!-- Widget Title -->
	                            <h5 class="widget-title">HOTLINE</h5>
	
	                            <!-- Single Blog Area -->
	                            <div class="latest-blog-area">
	                                <a href="#" class="post-title">0945 xxx xxx (Click để xem SĐT)</a>
	                                <span class="post-date"><i class="fa fa-clock-o" aria-hidden="true"></i> 0945 xxx xxx (Click để xem SĐT)</span>
	                            </div>
	
	                            <!-- Single Blog Area -->
	                            <div class="latest-blog-area">
	                                <a href="#" class="post-title">Free Advertising For Your Online</a>
	                                <span class="post-date"><i class="fa fa-clock-o" aria-hidden="true"></i> Jan 02, 2019</span>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="col-12 col-sm-8 col-lg-4">
	                        <div class="single-footer-widget mb-80 form-lienhe">
	                            <!-- Widget Title -->
	                            <h5 class="widget-title"><i class="fa fa-link"></i>Đăng ký tư vấn</h5>
	                            <span>Nơi cung cấp những thông tin chính xác cho người dùng.</span>
	
	                            <!-- Newsletter Form -->
	                            <div class="form_project">
	                            	<form action="javascript:void()" class="form-connect">
		                                <input name="name" type="text" class="form-control form-control-lienhe" placeholder="Your name..."  >
		                                <input name="phone" type="text" class="form-control form-control-lienhe" placeholder="Your phone..." >
		                                <input name="email" type="email" class="form-control form-control-lienhe" placeholder="Enter your email..." >
		                                <button type="submit" onclick="demo()"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
		                            </form>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
        </div>
			</div>
		</div>
    <!-- Partner Area End -->
    <script type = "text/javascript">
			
			function demo(){
		    	var temp_name= $("input[name='name']").val();
		    	var temp_phone= $("input[name='phone']").val();
		    	var temp_email= $("input[name='email']").val();
		    	console.log(temp_name)
		    	if (temp_name==''||temp_phone==''||temp_email=='') {
		    		alert("Vui lòng chọn nhập");
				}else{
					$.ajax({
						url:'${pageContext.request.contextPath }/project/${getProject.title}-${getProject.id}',
						type: 'POST',
						cache: false,
						data:{
								name: temp_name,
								email: temp_email,
								phone: temp_phone,
								
								},
						success: function(data){// lấy dữ liệu về data// từ server gửi về data
							// Xử lý thành công
							$('.form_project').html(data);//truy cập đến thẻ mẹ là .ajax-data
							$("input[name='name']").val('');
					    	$("input[name='phone']").val('');
					    	$("input[name='email']").val('');
						},
						error: function (){
						// Xử lý nếu có lỗi
						alert("Có lỗi!");
						//alert('Có lỗi xảy ra');
						}
					});
				}
		    }
		</script>
    
    

    