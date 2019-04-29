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

                  <div class="col-12 col-lg-4">
                    <div class="wrap-contact100">
						<div class="contact100-form-title contact100-form-title-search" style="    background-image: url(/Cland/templates/public/img/abc.jpg);height: 73px;">
							<span class="contact100-form-title-1">
								CÔNG CỤ TÌM KIẾM
							</span>
			
						</div>
			
						<form action="${pageContext.request.contextPath}/search" class="contact100-form validate-form"  method="get">
							<div class="wrap-input100 validate-input wrap-input100-search " >
								<span class="label-input100">Loại đất :</span>
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
							</div>
			
							<div class="wrap-input100 validate-input wrap-input100-search " >
								<span class="label-input100">Khu vực :</span>
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
							</div>
			
							<div class="wrap-input100 validate-input wrap-input100-search" >
								<span class="label-input100">Mức giá:</span>
								<div class="form-group mb-30">
                                <select name="mucgia" id="adults" class="form-control">
                                    <option value="0">Chọn mức giá</option>
                                    <option value="1" <c:if test="${mucgia==1}">selected = 'selected'</c:if> >400 - 1 Tỷ</option>
                                    <option value="2"<c:if test="${mucgia==2}">selected = 'selected'</c:if>>1 - 4 Tỷ</option>
                                    <option value="3"<c:if test="${mucgia==3}">selected = 'selected'</c:if>>4 - 8 Tỷ</option>
                                    <option value="4"<c:if test="${mucgia==4}">selected = 'selected'</c:if>> >= 8 Tỷ</option>
                                    <option value="5"<c:if test="${mucgia==5}">selected = 'selected'</c:if>>KHÁC</option>
                                </select>
                            </div>
							</div>
			
							<div class="wrap-input100 validate-input wrap-input100-search " >
								<span class="label-input100">Diện tích:</span>
								 <div class="form-group mb-30">
                                <select name="dientich"  class="form-control">
                                	<option value="0">Chọn diện tích</option>
                                    <option value="1" <c:if test="${dientich==1}">selected = 'selected'</c:if>>30- 100 m2</option>
                                    <option value="2"<c:if test="${dientich==2}">selected = 'selected'</c:if>>100-250 m2</option>
                                    <option value="3"<c:if test="${dientich==3}">selected = 'selected'</c:if>>250-500 m2</option>
                                    <option value="4" <c:if test="${dientich==4}">selected = 'selected'</c:if>>500-1000 m2</option>
                                    <option value="5" <c:if test="${dientich==5}">selected = 'selected'</c:if>>>=1000 m2</option>
                                </select>
                            </div>
							</div>
							
							<div class="wrap-input100 validate-input wrap-input100-search ">
								<span class="label-input100">Ngày đăng:</span>
								 <div class="form-group mb-30">
										<div class="input-prepend input-group ">
					                    	<div class="form-control ">
					                       		<input type="text" class=" input-search" name="ngaydang" id="reservation" value="MM/dd/yyyy" /> 
					                   		 </div>
					                    </div>

                            		</div>
							</div>
							
							<div class="container-contact100-form-btn">
								<button class="contact100-form-btn">
									<span>
										Tìm kiếm
										<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
									</span>
								</button>
							</div>
						</form>
					</div>
					 <!-- Recent Post -->
                        <div class="single-widget-area mb-100">
                            <h4 class="widget-title mb-30">TIN NHIỀU NGƯỜI ĐỌC </h4>
                            <c:forEach items="${getTopViewLand }" var="obj">
                            <!-- Single Recent Post -->
                            <div class="single-recent-post d-flex">
                                <!-- Thumb -->
                                <div class="post-thumb">
                                    <a href="${pageContext.request.contextPath }/dat-ban/${slugUtil.makeSlug(obj.title)}-${obj.id}"><img src="${pageContext.request.contextPath }/files/${obj.image}" alt=""></a>
                                </div>
                                <!-- Content -->
                                <div class="post-content">
                                    <!-- Post Meta -->
                                    <div class="post-meta">
                                        <a  class="post-author">${obj.create_day }</a>
                                        <a  class="post-tutorial"> $ ${obj.price} </a>
                                    </div>
                                    <a href="${pageContext.request.contextPath }/dat-ban/${slugUtil.makeSlug(obj.title)}-${obj.id}" class="post-title">${obj.title }</a>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                </div>
                  <div class="col-12 col-lg-8">
                <c:if test="${not empty getSoTin }">
	                <div class="title-module">
	            		<span>Kết quả tìm được (${getSoTin})</span>
	            	</div>
	            </c:if>
                <c:choose>
                	<c:when test="${xacdinh==1 }">
	                	<c:set var="truonghop" value="quan-"></c:set>
	                </c:when>
	                <c:otherwise>
	                	<c:set var="truonghop" value=""></c:set>
	                </c:otherwise>
                </c:choose>
                   <c:forEach items="${getItemCat }" var="objA">
                    <!-- Single Room Area -->
                    <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="900ms">
                        <!-- Room Thumbnail -->
                        <div class="room-thumbnail">
                        	<a class="image-popup-no-margins" href="${pageContext.request.contextPath }/dat-ban/${slugUtil.makeSlug(objA.title)}-${objA.id}">
                        		<img src="${pageContext.request.contextPath }/files/${objA.image}" alt="">
                        	</a>
                        </div>
                        <!-- Room Content -->
                        <div class="room-content">
                            <h2>${objA.title }</h2>
                            <h4>Giá: ${objA.price }</h4>
                            <div class="room-feature">
                                <h6 class="content-cat">Danh mục: <span class="content-cat-name" >${objA.name_cat }</span></h6>
                                <h6 class="content-cat">Địa điểm: <span class="content-cat-name" >${objA.location }</span></h6>
                            </div>
                            <a href="${pageContext.request.contextPath }/dat-ban/${slugUtil.makeSlug(objA.title)}-${objA.id}" class="btn view-detail-btn">View Details <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                        </div>
                    </div>
				</c:forEach>
                    <!-- Pagination -->
                   <c:if test="${sumPage!=1 }">
                    <nav class="roberto-pagination wow fadeInUp mb-100 pagination-roberto" data-wow-delay="1000ms">
                        <ul class="pagination">
                        	<c:if test="${xacdinh==1 || xacdinh==3 }"><li class="<c:if test="${page == 1 }"> disabled </c:if>"><a href="${pageContext.request.contextPath }/${truonghop}${slugUtil.makeSlug(cat.name)}-${cat.id}/page-${page-1}"><i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li></c:if>
                        	<c:if test="${xacdinh==2 }"><li class="<c:if test="${page == 1 }"> disabled </c:if>"><a href="${pageContext.request.contextPath }/search?id_cat=${land.id_cat}&id_district=${land.id_district}&dientich=${dientich }&mucgia=${mucgia }&ngaydang=${ngaydang}&page=${page-1}"><i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li></c:if>
                            <c:choose>
                            	<c:when test="${page >4}">
                            		<c:set var="a" value ="${page-2 }"></c:set>
                            		 <c:if test="${xacdinh==1 || xacdinh==3 }"><li class=" "><a class="" href="${pageContext.request.contextPath }/${truonghop}${slugUtil.makeSlug(cat.name)}-${cat.id}">1</a></li></c:if>
                            		 <c:if test="${xacdinh==2 }"><li class=" "><a class="" href="${pageContext.request.contextPath }/search?id_cat=${land.id_cat}&id_district=${land.id_district}&dientich=${dientich }&mucgia=${mucgia }&ngaydang=${ngaydang}&page=1">1</a></li></c:if>
                            		 <li  id="abc" class="disabled"><a>...</a></li>
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
                            	 <c:if test="${xacdinh==1 || xacdinh==3 }"><li class=" "><a class=" active <c:if test="${page==i }">acti</c:if> " href="${pageContext.request.contextPath }/${truonghop}${slugUtil.makeSlug(cat.name)}-${cat.id}/page-${i}">${i }</a></li></c:if>
                            	<c:if test="${xacdinh==2}"><li class=" "><a class=" active <c:if test="${page==i }">acti</c:if> " href="${pageContext.request.contextPath }/search?id_cat=${land.id_cat}&id_district=${land.id_district}&dientich=${dientich }&mucgia=${mucgia }&ngaydang=${ngaydang}&page=${i}">${i }</a></li></c:if>
                            </c:forEach>
                            <c:if test="${(page<(sumPage-3))}">
                           		  <c:if test="${page<sumPage }"> <li id="abc" class=" disabled" ><a class=" " >...</a></li></c:if>
                            </c:if>
                            
                            <c:if test="${xacdinh==1 || xacdinh==3 }"><c:if test="${ (page<sumPage-2)&&(sumPage>=5) }"><li class=""><a class="" href="${pageContext.request.contextPath }/${truonghop}${slugUtil.makeSlug(cat.name)}-${cat.id}/page-${sumPage}">${sumPage}</a></li></c:if></c:if>
                           <c:if test="${xacdinh==2}"><c:if test="${ (page<sumPage-2)&&(sumPage>=5) }"><li class=""><a class="" href="${pageContext.request.contextPath }/search?id_cat=${land.id_cat}&id_district=${land.id_district}&dientich=${dientich }&mucgia=${mucgia }&ngaydang=${ngaydang}&page=${sumPage}">${sumPage}</a></li></c:if></c:if>
                            
                             <c:if test="${xacdinh==1 || xacdinh==3 }"><li class="<c:if test="${page==sumPage }"> disabled</c:if>"><a class="" <c:if test="${page!=sumPage }">  href="${pageContext.request.contextPath }/${truonghop}${slugUtil.makeSlug(cat.name)}-${cat.id}/page-${page+1}"</c:if>> <i class="fa fa-angle-right"></i> <i class="fa fa-angle-right"></i></a></li></c:if>
                        	<c:if test="${xacdinh==2}"><li class="<c:if test="${page==sumPage }"> disabled</c:if>"><a class="" <c:if test="${page!=sumPage }">  href="${pageContext.request.contextPath }/search?id_cat=${land.id_cat}&id_district=${land.id_district}&dientich=${dientich }&mucgia=${mucgia }&ngaydang=${ngaydang}&page=${page+1}"</c:if>> <i class="fa fa-angle-right"></i> <i class="fa fa-angle-right"></i></a></li></c:if>
                        </ul>
                    </nav>
                   </c:if>
                
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
                        <a href="#" class="partner-logo"><img src="${defines.getUrlPublic() }/img/core-img/p1.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="${defines.getUrlPublic() }/img/core-img/p2.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="${defines.getUrlPublic() }/img/core-img/p3.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="${defines.getUrlPublic() }/img/core-img/p4.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="${defines.getUrlPublic() }/img/core-img/p5.png" alt=""></a>
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
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
            type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/start/jquery-ui.css"
          rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("#txtFrom").datepicker({
                numberOfMonths: 2,
                onSelect: function (selected) {
                    var dt = new Date(selected);
                    dt.setDate(dt.getDate() + 1);
                    $("#txtTo").datepicker("option", "minDate", dt);
                }
            });
            $("#txtTo").datepicker({
                numberOfMonths: 2,
                onSelect: function (selected) {
                    var dt = new Date(selected);
                    dt.setDate(dt.getDate() - 1);
                    $("#txtFrom").datepicker("option", "maxDate", dt);
                }
            });
        });
    </script>

    