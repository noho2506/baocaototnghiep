
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/templates/taglib.jsp" %>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Welcome Area Start -->
    <section class="welcome-area">
        <div class="welcome-slides owl-carousel">
            <!-- Single Welcome Slide -->
            <c:forEach items="${listProject }" var="objP">
            	 <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(${pageContext.request.contextPath}/files/${objP.trangchu });" data-img-url="img/bg-img/16.jpg">
                <!-- Welcome Content -->
                <div class="welcome-content h-100">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <!-- Welcome Text -->
                            <div class="col-12">
                                <div class="welcome-text text-center">
                                    <h6 data-animation="fadeInLeft" data-delay="200ms">Đất nền phân lô</h6>
                                    <h2 data-animation="fadeInLeft" data-delay="500ms">${objP.title }</h2>
                                    <a href="${pageContext.request.contextPath }/project/${slugUtil.makeSlug(objP.title)}-${objP.id}" class="btn roberto-btn btn-2" data-animation="fadeInLeft" data-delay="800ms">Discover Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </section>
    <!-- Welcome Area End -->

    <!-- About Us Area Start -->
    <section class="roberto-about-area section-padding-100-0">
        <!-- Hotel Search Form Area -->
        <div class="hotel-search-form-area">
            <div class="container-fluid">
                <div class="hotel-search-form">
                    <form action="${pageContext.request.contextPath}/search" method="get">
                        <div class="row justify-content-between align-items-end">
                            <div class="col-5 col-md-2 col-lg-2">
                                <label for="checkIn">Loại đất</label>
                               <select name="id_cat" id="room" class="form-control">
                               <option class="col-lg-12" value="0">--Chọn loại-- </option>
                               	<c:forEach items="${listCat }" var="objC">
                               		<option class="col-lg-12" value="${objC.id }">${objC.name }</option>
                               	</c:forEach>
                                </select>
                            </div>
                            <div class="col-4 col-md-3">
                                <label for="checkOut">Địa điểm</label>
                                <select name="id_district" id="room" class="form-control">
                                	<option value="0">---- Chọn ----</option>
	                                <c:forEach items="${listQuan }" var="objQ">
	                                 	<option value="${objQ.id }">${objQ.name }</option>
	                                </c:forEach>
                                </select>
                            </div>
                             <div class="col-4 col-md-2">
                                <label for="room">Diện tích</label>
                                <select name="dientich" id="room" class="form-control">
                                    <option value="0">Chọn diện tích</option>
                                    <option value="1">30- 100 m2</option>
                                    <option value="2">100-250 m2</option>
                                    <option value="3">250-500 m2</option>
                                    <option value="4">500-1000 m2</option>
                                    <option value="5">>=1000 m2</option>
                                </select>
                            </div>
                            <div class="col-4 col-md-2">
                                <label for="adults">Mức giá</label>
                                <select name="mucgia" id="adults" class="form-control">
                                    <option value="0">Chọn mức giá</option>
                                    <option value="1" >400 - 1 Tỷ</option>
                                    <option value="2">1 - 4 Tỷ</option>
                                    <option value="3">4 - 8 Tỷ</option>
                                    <option value="4"> >= 8 Tỷ</option>
                                    <option value="5">KHÁC</option>
                                </select>
                            </div>
                             <div class="col-5 col-md-3 form-control-date">
                         			<label for="adults">Ngày đăng</label>
                            	 	<div class="input-prepend input-group ">
			                    	<div class="form-control ">
			                       		<input type="text" class=" input-search" name="ngaydang" id="reservation" value="MM/dd/yyyy" /> 
			                   		 </div>
			                    </div>
                            </div>
                           
                            <div class="col-12 col-md-3">
                                <button type="submit" class="form-botton-search  form-control btn roberto-btn w-100">Tìm Kiếm</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- About Us Area End -->
    <!-- Blog Area Start -->
    <section class="roberto-blog-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <!-- Section Heading -->
                <div class="col-12">
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                        <h6>đất bán</h6>
                        <h2>Tin Cập Nhật Mới Nhật</h2>
                    </div>
                </div>
            </div>

            <div class="row">
				<c:forEach items="${listLands}" var="objL">
				<!-- Single Post Area -->
					<div class="col-12 col-md-6 col-lg-4">
	                    <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="300ms">
	                    <c:choose>
	                    	<c:when test="${empty  objL.image}">
	                    		<a href="${pageContext.request.contextPath }/detail/${objL.id}" class="post-thumbnail"><img class="img-post-thumbnail" src="${defines.urlPublic}/assets/img/none.jpg" alt=""></a>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a href="${pageContext.request.contextPath }/detail/${objL.id}" class="post-thumbnail"><img class="img-post-thumbnail" src="${pageContext.request.contextPath}/files/${objL.image}" alt=""></a>
	                    	</c:otherwise>
	                    </c:choose>
	                        <!-- Post Meta -->
	                        <div class="post-meta">
	                            <a href="#" class="post-date">${objL.create_day}</a>
	                            <!-- <a href="#" class="post-catagory">Event</a> -->
	                        </div>
	                        <!-- Post Title -->
	                        <a href="${pageContext.request.contextPath }/detail/${objL.id}" class="post-title">${objL.title}</a>
	                        <p>${objL.description }</p>
	                        <a href="${pageContext.request.contextPath }/detail/${objL.id}" class="btn continue-btn"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	                    </div>
	                </div>
				</c:forEach>

            </div>
        </div>
    </section>
    <!-- Blog Area End -->


    <!-- Testimonials Area Start -->
    <section class="roberto-testimonials-area section-padding-100-0 index-news">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 col-md-6 tintuc-col">
                	<div class="section-heading">
                        <h6 class="kienthuc tintuc">Tin Tức Sự Kiện </h6>
                    </div>
                    <div class="testimonial-thumbnail single-testimonial-slide owl-carousel mb-100 new">
                    	<c:forEach items="${getItemCat }" var="obj">
                    		<div>
	                    		<p><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(obj.title)}-${obj.id}">${obj.title }</a></p>
	                    		<h6 class="new-datedf">Ngày đăng <span class="new-date">- ${obj.time}</span></h6>
	                    		<a href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(obj.title)}-${obj.id}"><img class="tintuc-img" src="${pageContext.request.contextPath }/files/${obj.image}" alt="${obj.image}"></a>
	                    	</div>
                    	</c:forEach>
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <!-- Section Heading -->
                    <div class="section-heading">
                        <h6 class="kienthuc ">Kiến Thức</h6>
                        <h2 class="bds">Bất động sản</h2>
                    </div>
                    <!-- Testimonial Slide -->
                    <div class="testimonial-slides owl-carousel mb-100">
						<c:forEach items="${getItemKnow }" var="obj">
                        <!-- Single Testimonial Slide -->
                        <div class="single-testimonial-slide">
                            <h5><a  href="${pageContext.request.contextPath }/kien-thuc/${slugUtil.makeSlug(obj.title)}-${obj.id}">“${slugUtil.substringWord(obj.description,200)}”</a></h5>
                            <div class="rating-title">
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                </div>
                                <h6 class="new-datedf">Ngày đăng : <span>- ${obj.time }</span></h6>
                            </div>
                        </div>
						</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonials Area End -->
    
     <!-- About Us Area Start -->
        <div class="container mt-100">
            <div class="row align-items-center">
                <div class="col-12 col-lg-4">
                    <!-- Section Heading -->
                    <div class="section-heading wow fadeInUp" data-wow-delay="100ms">
                        <h4>Đất bán </h4> 
                        <h6>THEO KHU VỰC</h6>
                    </div>
                    
                    <div class="about-us-content mb-100">
                        <ul class="room-feature" >
                        <c:forEach items="${listQuan }" var="objQ">
                        	<a href="${pageContext.request.contextPath}/quan-${slugUtil.makeSlug(objQ.name)}-${objQ.id}"><li><i class="fa fa-circle" aria-hidden="true"></i><span> ${objQ.name }</span></li></a>
                        </c:forEach>
                    	</ul>
                    </div>
                </div>

                <div class="col-12 col-lg-8">
                    <div class="about-us-thumbnail mb-100 wow fadeInUp" data-wow-delay="700ms">
                        <div class="row no-gutters">
                            <div class="col-6">
                                <c:forEach items="${getLandsTop }" var="objT">
                                	<div class="single-thumb">
                                     <a href="${pageContext.request.contextPath}/quan-${slugUtil.makeSlug(objT.name_district)}-${objT.id_district}"><img class="img-khuvuc"src="${pageContext.request.contextPath }/files/${objT.image }" alt=""></a>
                                     <%-- <a href=""><img src="<%=request.getContextPath() %>/templates/public/img/bg-img/13.jpg" alt=""></a> --%>
                                     <div class="quan-back"> <a class="quan">${objT.name_district}</a></div>
                                </div>
                                </c:forEach>
                            </div>
                            <div class="col-6">
                                <div class="single-thumb">
                                    <a href="${pageContext.request.contextPath}/quan-${slugUtil.makeSlug(getItemTop.name_district)}-${getItemTop.id_district}"><img  class="img-khuvuc-2"src="${pageContext.request.contextPath }/files/${getItemTop.image }" alt=""></a>
                                   <%-- <img src="<%=request.getContextPath() %>/templates/public/img/bg-img/15.jpg" alt=""> --%>
                                    <div class="quan-back"> <a class="quan">${getItemTop.name_district} </a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    <!-- Call To Action Area Start -->
    <section class="roberto-cta-area">
        <div class="container">
            <div class="cta-content bg-img bg-overlay jarallax" style="background-image: url(<%=request.getContextPath() %>/templates/public/img/bg-img/1.jpg);">
                <div class="row align-items-center">
                    <div class="col-12 col-md-7">
                        <div class="cta-text mb-50">
                            <h2>Contact us now!</h2>
                            <h6>Contact (+12) 345-678-9999 to book directly or for advice</h6>
                        </div>
                    </div>
                    <div class="col-12 col-md-5 text-right">
                        <a href="#" class="btn roberto-btn mb-50">Contact Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Call To Action Area End -->

    <!-- Partner Area Start -->
    <div class="partner-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="partner-logo-content d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="300ms">
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="<%=request.getContextPath() %>/templates/public/img/core-img/p1.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="<%=request.getContextPath() %>/templates/public/img/core-img/p2.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="<%=request.getContextPath() %>/templates/public/img/core-img/p3.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="<%=request.getContextPath() %>/templates/public/img/core-img/p4.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="<%=request.getContextPath() %>/templates/public/img/core-img/p5.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
					              
    <!-- Partner Area End -->
     <script type="text/javascript">
       $(document).ready(function() {
          $('#reservation').daterangepicker(null, function(start, end, label) {
        	  console.log('abc')
            console.log(start.toISOString(), end.toISOString(), label);
          });
       });
       </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    