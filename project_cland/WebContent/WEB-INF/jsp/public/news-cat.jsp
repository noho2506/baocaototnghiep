<?xml version="1.0" encoding="UTF-8"?>
<taglib version="2.1" xmlns="http://java.sun.com/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-jsptaglibrary_2_1.xsd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/templates/taglib.jsp" %>
     <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Breadcrumb Area End -->

    <!-- Rooms Area Start -->
    <div class="roberto-rooms-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8">
					<div class="cat">
						<h4 class="cat-new-title">Tin Tức Sự Kiện</h4>
					</div>
                   <c:forEach items="${getItemCat }" var="objA">
                    <!-- Single Room Area -->
                    <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp news-nd" data-wow-delay="900ms">
                        <!-- Room Thumbnail -->
                        <div class="thumbnail">
                        	<a class="image-popup-no-margins new-content-img" href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(objA.title)}-${objA.id}">
                        		<img src="${pageContext.request.contextPath }/files/${objA.image}" alt="">
                        	</a>
                        </div>
                        <!-- Room Content -->
                        <div class="new-content">
                            <h5><a class="content-news-detail" href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(objA.title)}-${objA.id}">${objA.title }</a></h5>
                            <p class="new-content-date content-know "><i class="fa fa-calendar-o"></i>${objA.time }</p>
                            <p>${slugUtil.substringWord(objA.description,150) }</p>
                            <a href="${pageContext.request.contextPath }/news/${slugUtil.makeSlug(objA.title)}-${objA.id}" class="btn view-detail-btn">View Details <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                        </div>
                    </div>
				</c:forEach>
                 <!-- Pagination -->
                   <c:if test="${sumPage!=1 }">
                    <nav class="roberto-pagination wow fadeInUp mb-100 pagination-roberto" data-wow-delay="1000ms">
                        <ul class="pagination">
                        	<li class="<c:if test="${page == 1 }"> disabled </c:if>"><a href="${pageContext.request.contextPath }/news-page-${page-1}"><i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>
                            <c:choose>
                            	<c:when test="${page >4}">
                            		<c:set var="a" value ="${page-2 }"></c:set>
                            		 <li class=" "><a class="" href="${pageContext.request.contextPath }/news">1</a></li>
                            		 <li  id="abc" class="disabled"><a    href="">...</a></li>
                            		</c:when>
                            	<c:otherwise>
                            		<c:set var="a" value ="1"></c:set>
                            	</c:otherwise>
                            </c:choose>
                            
                            <c:choose>
                            	<c:when test="${(page == sumPage)&&(sumPage>=5)}">
                            		<c:set var="a" value ="${page-4 }"></c:set>
                            		<c:set var="b" value ="${sumPage }"></c:set>
                            	</c:when>
                            	<c:when test="${(page > sumPage -2) &&(sumPage>=5)}">
                            		<c:set var="a" value ="${page-3 }"></c:set>
                            		<c:set var="b" value ="${page+1 }"></c:set>
                            	</c:when>
                            	<c:when test="${(page<=sumPage)&&(sumPage<=6)}">
                            		<c:set var="a" value ="1"></c:set>
                            		<c:set var="b" value ="${sumPage }"></c:set>
                            	</c:when>
                            	<c:when test="${sumPage>=6}">
                            		<c:set var="b" value ="${page+2 }"></c:set>
                            	</c:when>
                            	<c:otherwise>
                            	</c:otherwise>
                            </c:choose>
                            
                            <c:forEach begin="${a }"  end="${b}" var="i">
                            	<li class=" "><a class=" active <c:if test="${page==i }">acti</c:if> " href="${pageContext.request.contextPath }/news-page-${i}">${i }</a></li>
                            </c:forEach>
                            
                            <c:if test="${(page<(sumPage-3))}">
                           		  <c:if test="${page<sumPage }"> <li id="abc"class=" disabled" ><a class=" "  href="">...</a></li></c:if>
                            </c:if>
                            <c:if test="${ (page<sumPage-2)&&(sumPage>=5) }"><li class=""><a class="" href="${pageContext.request.contextPath }/news-page-${sumPage}">${sumPage}</a></li></c:if>
                          <li class="<c:if test="${page==sumPage }"> disabled</c:if>"><a class="" href="${pageContext.request.contextPath }/news-page-${page+1}"> <i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>
                        </ul>
                    </nav>
                   </c:if>
                </div>

                  <div class="col-12 col-lg-4">
                    <!-- Hotel Reservation Area -->
                    <div class="hotel-reservation--area mb-100 news-cat">
						<div>
							<h4 >Công cụ tìm kiếm</h4>
						</div>
                        <form action="" method="post">
                            <div class="form-group mb-30">
                               <select name="id_cat" id="room" class="form-control">
                               <option value="0">--Chọn loại đất-- </option>
                               <c:set var="cid" value="${land.id_cat }"></c:set>
                               	<c:forEach items="${listCat }" var="objC">
			                            <c:choose>
		                           			<c:when test="${objC.id == cid}">
		                           				<c:set var="selected" value="selected = 'selected'"></c:set>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<c:set var="selected" value=""></c:set>
			                           		</c:otherwise>
		                           		</c:choose>
									   <option ${selected} value="${objC.id }">${objC.name }</option>
	                               	</c:forEach>
                                </select>
                            </div>
                              <div class="form-group mb-30">
                                <select name="id_district" id="room" class="form-control">
                                	<option value="0">---- Chọn khu vực  ----</option>
                                	 <c:set var="id" value="${land.id_district }"></c:set>
	                                <c:forEach items="${listQuan }" var="objQ">
	                                	<c:choose>
		                           			<c:when test="${objQ.id == id}">
		                           				<c:set var="selected" value="selected = 'selected'"></c:set>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<c:set var="selected" value=""></c:set>
			                           		</c:otherwise>
		                           		</c:choose>
	                                 	<option ${selected} value="${objQ.id }">${objQ.name }</option>
	                                </c:forEach>
                                </select>
                            </div>
                            <div class="form-group mb-30">
                                <select name="dientich" id="room" class="form-control">
                                	<option value="0">Chọn diện tích</option>
                                    <option value="1" <c:if test="${dientich==1}">selected = 'selected'</c:if>>30- 100 m2</option>
                                    <option value="2"<c:if test="${dientich==2}">selected = 'selected'</c:if>>100-250 m2</option>
                                    <option value="3"<c:if test="${dientich==3}">selected = 'selected'</c:if>>250-500 m2</option>
                                    <option value="4" <c:if test="${dientich==4}">selected = 'selected'</c:if>>500-1000 m2</option>
                                    <option value="5" <c:if test="${dientich==5}">selected = 'selected'</c:if>>>=1000 m2</option>
                                </select>
                            </div>
                            <div class="form-group mb-30">
                                <select name="mucgia" id="adults" class="form-control">
                                    <option value="0">Chọn mức giá</option>
                                    <option value="1" <c:if test="${mucgia==1}">selected = 'selected'</c:if> >400 - 1 Tỷ</option>
                                    <option value="2"<c:if test="${mucgia==2}">selected = 'selected'</c:if>>1 - 4 Tỷ</option>
                                    <option value="3"<c:if test="${mucgia==3}">selected = 'selected'</c:if>>4 - 8 Tỷ</option>
                                    <option value="4"<c:if test="${mucgia==4}">selected = 'selected'</c:if>> >= 8 Tỷ</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn roberto-btn w-100">Tìm Kiếm</button>
                            </div>
                        </form>
                    </div>
                    
                    <!-- Hotel Reservation Area -->
                    <div class="hotel-reservation--area mb-100 news-cat">
                    
                    	<div class="tabbed">
						    <input type="radio" name="tabs" id="tab-nav-1" checked>
						    <label for="tab-nav-1">Đất Bán</label>
						    <input type="radio" name="tabs" id="tab-nav-2">
						    <label for="tab-nav-2">Dự Án</label>
						    <input type="radio" name="tabs" id="tab-nav-3">
						    <label for="tab-nav-3">Tin Tức</label>
						    <div class="tabs">
						    <!-- 	đất bán -->
								<div>
								<c:forEach items="${getTopViewLand }" var="objL">
									<!-- tin  -->
									<div class="row tin">
										<div class="  col-4 news-img">
											<a href=""><img src="${pageContext.request.contextPath}/files/${objL.image}" alt=""></a>
							      		</div>
							      		<div class=" col-8 news-content">
							      			<p><a href="">${objL.title }</a></p>
							      		</div>
						      		</div>
								</c:forEach>
								</div>
								 <!-- 	dự án -->
								<div>
								<c:forEach items="${getTopViewProject }" var="objP">
									<div class="row tin">
										<div class="  col-4 news-img">
											<a href=""><img src="${pageContext.request.contextPath}/files/${objP.trangchu}" alt=""></a>
							      		</div>
							      		<div class=" col-8 news-content">
							      			<p><a href="">${objP.title }</a></p>
							      		</div>
						      		</div>
								</c:forEach>
								</div>
								 <!-- 	tin tức -->
								<div>
								<c:forEach items="${getItemNewsView }" var="obj">
								<!-- tin  -->
									<div class="row tin">
										<div class="  col-4 news-img">
											<a href=""><img src="${pageContext.request.contextPath}/files/${obj.image}" alt=""></a>
							      		</div>
							      		<div class=" col-8 news-content">
							      			<p><a href="">${obj.title }</a></p>
							      		</div>
						      		</div>
								</c:forEach>
						      		
								</div>
								
						    </div>
						    
						    
						 </div>
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

    