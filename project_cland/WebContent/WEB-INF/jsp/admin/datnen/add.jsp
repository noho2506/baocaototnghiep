<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="${defines.urlAdmin}/assets/css/addland.css">
                <div id="content">
                    <div class="outer">
                        <div class="inner bg-light lter">
                            <!--Begin Datatables-->
<div class="row">
  <div class="col-lg-12">
        <div class="box">
            <header class="title tieude">
                <div class="icons"><i class="fa fa-table"></i></div>
                <h5>Thêm đất bán</h5>
            </header>
             <c:if test="${not empty msg1 }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				  </div>
			  </c:if>
            <div id="collapse4" class="body">
            <form action="" method="POST"  enctype="multipart/form-data">
            <div class="tabs">
  
  <input type="radio" id="tab1" name="tab-control" checked>
  <input type="radio" id="tab2" name="tab-control">
  <input type="radio" id="tab3" name="tab-control">  
  <input type="radio" id="tab4" name="tab-control">
  <ul>
    <li title="Thông Tin Đất"><label for="tab1" role="button"><svg viewBox="0 0 24 24"><path d="M14,2A8,8 0 0,0 6,10A8,8 0 0,0 14,18A8,8 0 0,0 22,10H20C20,13.32 17.32,16 14,16A6,6 0 0,1 8,10A6,6 0 0,1 14,4C14.43,4 14.86,4.05 15.27,4.14L16.88,2.54C15.96,2.18 15,2 14,2M20.59,3.58L14,10.17L11.62,7.79L10.21,9.21L14,13L22,5M4.93,5.82C3.08,7.34 2,9.61 2,12A8,8 0 0,0 10,20C10.64,20 11.27,19.92 11.88,19.77C10.12,19.38 8.5,18.5 7.17,17.29C5.22,16.25 4,14.21 4,12C4,11.7 4.03,11.41 4.07,11.11C4.03,10.74 4,10.37 4,10C4,8.56 4.32,7.13 4.93,5.82Z"/>
</svg><br><span>Thông Tin Đất</span></label></li>
    <li title="Người Bán"><label for="tab2" role="button"><svg viewBox="0 0 24 24"><path d="M2,10.96C1.5,10.68 1.35,10.07 1.63,9.59L3.13,7C3.24,6.8 3.41,6.66 3.6,6.58L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.66,6.72 20.82,6.88 20.91,7.08L22.36,9.6C22.64,10.08 22.47,10.69 22,10.96L21,11.54V16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V10.96C2.7,11.13 2.32,11.14 2,10.96M12,4.15V4.15L12,10.85V10.85L17.96,7.5L12,4.15M5,15.91L11,19.29V12.58L5,9.21V15.91M19,15.91V12.69L14,15.59C13.67,15.77 13.3,15.76 13,15.6V19.29L19,15.91M13.85,13.36L20.13,9.73L19.55,8.72L13.27,12.35L13.85,13.36Z" />
</svg><br><span>Người Bán</span></label></li>
      
  </ul>

  <div class="slider"><div class="indicator"></div></div>
  <div class="content">
    <section class="section1">
                 <div class="edit-detail">
                       <div class="form-group">
                           <label for="name">Tên tin</label>
                           <input type="text" name="title" value="${objLand.title}" class="form-control" placeholder="Nhập tên tin">
                       </div>
						
						 <div class=" col-12 col-lg-6 form-group">
                           <label>Danh mục tin</label>
                           <select class="form-control" name="id_cat">
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
                       </div>
                        <div class="col-12 col-lg-6 form-group ">
                           <label>Khu vực </label>
                           <select class="form-control" name="id_district">
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
                       </div>
                      
              			<div class="form-group col-12 col-lg-6 ">
                           <label for="name">Diện tích</label>
                           <input type="text" name="area" value="${objLand.area }" class="form-control" placeholder="Nhập diện tích">
                       </div>
                       <div class="form-group col-12 col-lg-6">
                           <label for="name">Gía Bán</label>
                           <input type="text" name="price" value="${objLand.price }" class="form-control" placeholder="Nhập giá">
                       </div>
                       
                       <div class="form-group">
                           <label for="name">Vị trí</label>
                           <input type="text" name="location" value="${objLand.location}" class="form-control" placeholder="Nhập địa chỉ">
                       </div>
                       <div class="form-group">
                             <label>Hình ảnh</label>
                             <input type="file" name="hinhanh" class="btn btn-default">
                             <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
                      </div>

                       <div class="form-group">
                           <label>Mô tả</label>
                           <textarea name="description" class="form-control ckeditor" rows="3">${objLand.description}</textarea>
                       </div>
                        <div class="form-group">
                           <label>Chi tiết</label>
                           <textarea name="detail" class="form-control ckeditor" rows="3">${objLand.description}</textarea>
                       </div>
                       

                   </div>
                   
                    <!-- The Modal -->

    </section>
    
        <section class="section2">
                       <div class="form-group">
                           <label for="name">Tên người bán</label>
                           <input type="text" name="name_contact" value="" class="form-control" placeholder="Nhập tên người bán">
                       </div>
                       <div class="form-group">
                           <label for="name">Phone</label>
                           <input type="text" name="phone" value="" class="form-control" placeholder="sđt">
                       </div>
                       <div class="form-group">
                           <label for="name">Địa chỉ </label>
                           <input type="text" name="address_contact" value="" class="form-control" placeholder="Địa chỉ">
                       </div>
            <div class="row" style="text-align: center; ">
                         <div class="col-sm-12">
                             <input type="submit" value="Thêm " class="btn btn-success" />
                             <input type="reset" value="Nhập lại" class="btn btn-default" />
                         </div>
                     </div>

			
        </section>
      
        <!-- </form> -->
  </div>
  
</div>
 </form>
            </div>
        </div>
    </div>
</div>
<!-- /.row -->
<!--End Datatables-->

                        </div>
                        <!-- /.inner -->
                    </div>
                    <!-- /.outer -->
                </div>
                <!-- /#content -->
				</div>
                    
                    <!-- /#right -->
            </div>
            
            <!-- /#wrap -->
            
