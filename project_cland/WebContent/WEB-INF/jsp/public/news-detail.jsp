<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/templates/taglib.jsp" %>

    <!-- Breadcrumb Area Start -->
        <div class="container h-100">
                <div class="col-12 title-news">
						<span> Trang chủ </span><i class=" fa fa-angle-right"></i> <span>Tin Tức</span><i class=" fa fa-angle-right"></i><span>Lật tẩy chiêu rao bán nhà phố giá cao</span>
                </div>
        </div>
    <!-- Breadcrumb Area End -->

    <!-- Rooms Area Start -->
    <div class="roberto-rooms-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <!-- Single Room Details Area -->
                    <div class="single-room-details-area mb-50 view">
                        <h4>${getItemNews.title }</h4>
                        <span> <i class=" fa fa-calendar"></i><fmt:formatDate value="${getItemNews.time }" pattern="dd-MM-yyyy" var="objTime"/>${objTime}</span> <i class="fa fa-eye"></i> <span> Lượt xem: ${getItemNews.view} </span>
                        <p>${getItemNews.description}</p>
                        <img alt="" src="${pageContext.request.contextPath }/files/${getItemNews.image}">
                        <p>${getItemNews.detail }</p>
					</div>
					<!-- Post Author Area -->
                    <div class="post-author-area d-flex align-items-center justify-content-between mb-50">
                        <ul class="popular-tags">
                            <li><p class="return"> <a href="${pageContext.request.contextPath }/news">  <i class="fa fa-arrow-left"></i>Quay lại </a></p></li>
                        </ul>

                        <!-- Author Social Info -->
                        <div class="author-social-info d-flex align-items-center">
                            <p>Share:</p>
                            <a href="https://www.facebook.com"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="https://www.twitter.com"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <div class="room-review-area mb-100 new-add room-review-area-news">
                        <div class=" row-new" >
							<p >Tin mới nhất</p>
                        </div>
                        <!-- Single Review Area -->
                       	 <div class="tin">
                       	 	<ul>
                       	 		<c:forEach items="${getItemCat}" var="obj">
                       	 			<li><a href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(obj.title)}-${obj.id}">${obj.title }</a><span class="news-time">(<fmt:formatDate value="${obj.time }" pattern="dd-MM-yyyy" var="objC"/>${objC})</span></li> 
                       	 		</c:forEach>
                       	 	</ul>
                       	 </div>

                    </div>
                </div>

                <div class="col-12 col-lg-4">
                    <!-- Recent Post -->
                        <div class="single-widget-area mb-100">
                            <h4 class="widget-title mb-30">Tin nhiều người đọc </h4>
                            
                             <c:forEach items="${getItemNewsView }" var="obj">
                            <!-- Single Recent Post -->
                            <div class="single-recent-post d-flex">
                                <!-- Thumb -->
                                <div class="post-thumb">
                                    <a href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(obj.title)}-${obj.id}"><img src="${pageContext.request.contextPath }/files/${obj.image}" alt=""></a>
                                </div>
                                <!-- Content -->
                                <div class="post-content">
                                    <!-- Post Meta -->
                                    <div class="post-meta">
                                        <a  class="post-author"><fmt:formatDate value="${obj.time }" pattern="dd-MM-yyyy" var="objT"/>${objT}</a>
                                        <a href="#" class="post-tutorial">Event</a>
                                    </div>
                                    <a href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(obj.title)}-${obj.id}" class="post-title">${obj.title }</a>
                                </div>
                            </div>
                            </c:forEach>
                            
                        </div>


                        <!-- Instagram -->
                        <div class="single-widget-area mb-100 clearfix">
                            <h4 class="widget-title mb-30">Hình Ảnh</h4>
                            <!-- Instagram Feeds -->
                            <ul class="instagram-feeds">
                            	<c:forEach items="${getItemCat}" var="obj">
                            		 <li><a href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(obj.title)}-${obj.id}"><img src="${pageContext.request.contextPath }/files/${obj.image}" alt=""></a></li>
                       	 		</c:forEach>
                            </ul>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Rooms Area End -->

    <!-- Call To Action Area Start -->
    <section class="roberto-cta-area">
        <div class="container">
            <div class="cta-content bg-img bg-overlay jarallax" style="background-image: url(img/bg-img/1.jpg);">
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
                        <a href="#" class="partner-logo"><img src="img/core-img/p1.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="img/core-img/p2.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="img/core-img/p3.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="img/core-img/p4.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="img/core-img/p5.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Area End -->

