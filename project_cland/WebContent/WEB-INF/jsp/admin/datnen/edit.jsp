<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
                <div id="content">
                    <div class="outer">
                        <div class="inner bg-light lter">
                            <!--Begin Datatables-->
<div class="row">
  <div class="col-lg-12">
        <div class="box">
            <header class="title">
                <div class="icons"><i class="fa fa-table"></i></div>
                <h5>Sửa thông tin </h5>
            </header>
             <c:if test="${not empty msg }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				  </div>
			  </c:if>
            <div id="collapse4" class="body">
            <form action="" method="POST">
                 <div class="edit-detail">
                       <div class="form-group">
                           <label for="name">Tên tin</label>
                           <input type="text" name="title" value="${objLand.title}" class="form-control" placeholder="Nhập tên tin">
                       </div>

                       <div class="form-group">
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

  						<div class="form-group">
                           <label for="name">Diện tích</label>
                           <input type="text" name="area" value="${objLand.area }" class="form-control" placeholder="Nhập diện tích">
                       </div>
                       
                       <div class="form-group">
                           <label for="name">Vị trí</label>
                           <input type="text" name="location" value="${objLand.location}" class="form-control" placeholder="Nhập địa chỉ">
                       </div>

                       <div class="form-group">
                           <label>Mô tả</label>
                           <textarea name="description" class="form-control ckeditor" rows="3">${objLand.description}</textarea>
                       </div>
					 	<div class="row" style="text-align: center; ">
		                     <div class="col-sm-12">
		                         <input type="submit" value="Sửa" class="btn btn-success" />
		                         <input type="reset" value="Nhập lại" class="btn btn-default" />
		                     </div>
		                 </div>

                   </div>
                    <!-- The Modal -->
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
            
