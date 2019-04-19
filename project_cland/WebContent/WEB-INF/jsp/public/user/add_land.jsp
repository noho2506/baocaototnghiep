<?xml version="1.0" encoding="UTF-8"?>
<taglib version="2.1" xmlns="http://java.sun.com/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-jsptaglibrary_2_1.xsd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/templates/taglib.jsp" %>
    <!-- Breadcrumb Area End -->

    <!-- Rooms Area Start -->
    <c:choose>
    	<c:when test="${empty userLogin }">
    		<div class="alert alert-success">
				<strong>Vui lòng đăng nhập để đăng tin miễn phí</strong>
			  </div>
    	</c:when>
    	<c:otherwise>
    
    <div class="roberto-rooms-area section-padding-100-0 add_land" style="background: url(${defines.urlPublic}/img/background.jpg) no-repeat;">
        <div class="container">
            <div class="row ">
           		<div class="form-content-addLand">
           			<h2>Chức năng thêm đất bán</h5>
           			<form action="" class="contact100-form validate-form" method="POST" enctype="multipart/form-data">
							<div class="wrap-input100 validate-input" data-validate="Name is required">
								<span class="label-input100 label-input100-add-land">Tên tin:</span>
								<input class="input100" type="text" name="title" placeholder="Nhập tên tin ">
								<span class="focus-input100"></span>
							</div>
							
							<div class=" validate-input col-6" data-validate="Cat is required">
								<span class="label-input100 label-input100-add-land">Danh mục tin :</span>
								<select class="form-control add-sel" name="id_cat">
		                           <c:set var="id" value="${objLand.id_cat }"></c:set>
		                           	<c:forEach items="${listCat }" var="cat">
		                           		<c:choose>
		                           			<c:when test="${cat.id == id}">
		                           				<c:set var="selected" value="selected = 'selected'"></c:set>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<c:set var="selected" value=""></c:set>
			                           		</c:otherwise>
		                           		</c:choose>
									   <option ${selected} value="${cat.id }">${cat.name }</option>
									</c:forEach>   
								</select>
								<span class="focus-input100"></span>
							</div>
							
							<div class=" validate-input col-6" data-validate="District is required">
								<span class="label-input100 label-input100-add-land">Khu vực  :</span>
								 <select class="form-control add-sel" name="id_district">
			                           <c:set var="id" value="${objLand.id_district }"></c:set>
			                           	<c:forEach items="${listQuan }" var="cat">
			                           		<c:choose>
			                           			<c:when test="${cat.id == id}">
			                           				<c:set var="selected" value="selected = 'selected'"></c:set>
				                           		</c:when>
				                           		<c:otherwise>
				                           			<c:set var="selected" value=""></c:set>
				                           		</c:otherwise>
			                           		</c:choose>
										   <option ${selected} value="${cat.id }">${cat.name }</option>
										</c:forEach>   
										</select>
								<span class="focus-input100"></span>
							</div>
			
							<div class="wrap-input100 validate-input" data-validate="Area is required">
								<span class="label-input100 label-input100-add-land">Diện tích:</span>
								<input class="input100" type="text" name="area" placeholder="Nhập diện tích">
								<span class="focus-input100"></span>
							</div>
							
							<div class="wrap-input100 validate-input" data-validate="Price is required">
								<span class="label-input100 label-input100-add-land">Gía bán:</span>
								<input class="input100" type="text" name="price" placeholder="Nhập giá bán">
								<span class="focus-input100"></span>
							</div>
							
							<div class="wrap-input100 validate-input" data-validate="Location is required">
								<span class="label-input100 label-input100-add-land">Vị trí:</span>
								<input class="input100" type="text" name="location" placeholder="Nhập vị trí">
								<span class="focus-input100"></span>
							</div>
			
							<div class=" validate-input" data-validate="Image is required">
								<span class="label-input100 label-input100-add-land">Hình ảnh:</span>
								<input class="input100 add-input" type="file" name="hinhanh">
								<span class="focus-input100"></span>
							</div>
							<div class="wrap-input100 validate-input" data-validate = "Description is required">
								<span class="label-input100 label-input100-add-land">Mô tả:</span>
								<textarea class="input100" name="description" placeholder="Nhập mô tả..."></textarea>
								<span class="focus-input100"></span>
							</div>
							
							<div class="wrap-input100 validate-input" data-validate = "Detail is required">
								<span class="label-input100 label-input100-add-land">Chi tiết:</span>
								<textarea class="input100" name="detail" placeholder="Nhập chi tiết..."></textarea>
								<span class="focus-input100"></span>
							</div>
			
							<div class="container-contact100-form-btn">
								<button class="contact100-form-btn">
									<span>
										Submit
										<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
									</span>
								</button>
							</div>
						</form>
           		
           		</div>
            
            </div>
         </div>
     </div>
     </c:otherwise>
    </c:choose>
    <!-- Rooms Area End -->

    

  

    