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
                <div class="col-12 col-lg-9">
                    <!-- Single Room Details Area -->
                    <div class="single-room-details-area mb-50 view">
                        <h4>${getItemNews.title }</h4>
                        <span> <i class=" fa fa-calendar"></i>${getItemNews.time }</span> <i class="fa fa-eye"></i> <span> Lượt xem: ${getItemNews.view} </span>
                        <p>${getItemNews.description}</p>
                        <img alt="" src="${pageContext.request.contextPath }/files/${getItemNews.image}">
                        <p>${getItemNews.detail }</p>
                        <p class="return"> <i class="fa fa-arrow-left"></i>Quay lại</p>
					</div>
                    <!-- Room Review -->
                    <div class="room-review-area mb-100 new-add">
                        <div class=" row-new" >
							<p >Tin đọc nhiều nhất</p>
							<div class="rating top">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                </div>
                        </div>
                        <!-- Single Review Area -->
                       	 <div class="tin">
                       	 	<ul>
                       	 		<c:forEach items="${getItemNewsView}" var="objR">
                       	 			<li><a href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(objR.title)}-${objR.id}">${objR.title }</a><span class="news-time">(${objR.time })</span></li> 
                       	 		</c:forEach>
                       	 	</ul>
                       	 </div>

                    </div>
                    <div class="room-review-area mb-100 new-add">
                        <div class=" row-new" >
							<p >Tin mới nhất</p>
                        </div>
                        <!-- Single Review Area -->
                       	 <div class="tin">
                       	 	<ul>
                       	 		<c:forEach items="${getItemCat}" var="obj">
                       	 			<li><a href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(obj.title)}-${obj.id}">${obj.title }</a><span class="news-time">(${obj.time })</span></li> 
                       	 		</c:forEach>
                       	 	</ul>
                       	 </div>

                    </div>
                </div>

                <div class="col-12 col-lg-3">
                    <!-- Hotel Reservation Area -->
                    <div class="hotel-reservation--area mb-100">
                        <form action="#" method="post">
                            <div class="form-group mb-30">
                                <label for="checkInDate">Date</label>
                                <div class="input-daterange" id="datepicker">
                                    <div class="row no-gutters">
                                        <div class="col-6">
                                            <input type="text" class="input-small form-control" name="checkInDate" id="checkInDate" placeholder="Check In">
                                        </div>
                                        <div class="col-6">
                                            <input type="text" class="input-small form-control" name="checkOutDate" placeholder="Check Out">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mb-30">
                                <label for="guests">Guests</label>
                                <div class="row">
                                    <div class="col-6">
                                        <select name="adults" id="guests" class="form-control">
                                            <option value="adults">Adults</option>
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                        </select>
                                    </div>
                                    <div class="col-6">
                                        <select name="children" id="children" class="form-control">
                                            <option value="children">Children</option>
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mb-50">
                                <div class="slider-range">
                                    <div class="range-price">Max Price: $0 - $3000</div>
                                    <div data-min="0" data-max="3000" data-unit="$" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="0" data-value-max="3000" data-label-result="Max Price: ">
                                        <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn roberto-btn w-100">Check Available</button>
                            </div>
                        </form>
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

