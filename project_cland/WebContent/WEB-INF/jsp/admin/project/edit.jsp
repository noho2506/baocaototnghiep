  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/templates/taglib.jsp" %>
<div id="content">
                    <div class="outer">
                        <div class="inner bg-light lter">
                            <!--Begin Datatables-->
<div class="row">
  <form action="" method="POST" enctype="multipart/form-data">
   <div class="col-md-12 panel-info">
       <div class="content-box-header panel-heading">
           <div class="panel-title ">Sửa thông tin dự án</div>
       </div>
       <div class="content-box-large box-with-header">
           <div>
               <div class="row mb-10"></div>

               <div class="row">
                   <div class="col-sm-12">
                      <div class="inf-project col-sm-6">
	                       <div class="form-group">
	                           <label for="name">Tên dự án</label> <p style="color: red">${msg1 }</p>
	                           <input type="text" name="title" value="${project.title }" class="form-control" placeholder="Nhập tên tin">
	                       </div>
	
	                       <div class="form-group">
	                           <label>Mô tả</label>
	                           <textarea name="description" value="${project.description }" class="form-control ckeditor" rows="3"></textarea>
	                       </div>
	
	  						<div class="form-group">
	                           <label for="name">Người bán</label>
	                           <input type="text" name="sellers" value="${project.sellers }" class="form-control" placeholder="Nhập diện tích">
	                       </div>
	                       
	                       <div class="form-group">
	                           <label for="name">Giới thiệu </label>
	                           <textarea name="overview" value="${project.overview }" class="form-control ckeditor" rows="3"></textarea>
	                       </div>
	                       
	                       <div class="form-group">
	                           <label for="name">Tiện ích</label>
	                           <textarea name="utility" value="${news.utility }" class="form-control ckeditor" rows="3"></textarea>
	                       </div>
	
	                       <div class="form-group">
	                           <label>Vị trí</label>
	                           <textarea name="location" value="${news.location }" class="form-control ckeditor" rows="3"></textarea>
	                       </div>
                      </div>
                       <div class="img-project col-sm-5">
                       <div class="form-group">
	                           <label>Hình ảnh</label>
	                           <input type="file" name="tc" class="btn btn-default">
	                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
	                       </div>
                       		<div class="form-group">
	                           <label>Hình ảnh(Giới thiệu)</label>
	                           <input type="file" name="gt" class="btn btn-default">
	                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
	                       </div>
	                       <div class="form-group">
	                          <label>Hình ảnh(Tiện ích)</label>
	                           <input type="file" name="ti" class="btn btn-default">
	                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
	                       </div>
	                       <div class="form-group">
	                           <label>Hình ảnh(Vị trí)</label>
	                           <input type="file" name="vt" class="btn btn-default">
	                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
	                       </div>
	                       <div class="form-group">
	                           <label>Hình ảnh(Thiết kế)</label>
	                           <input type="file" name="tk" class="btn btn-default">
	                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
	                       </div>
	                       
                       <!--  <div class="form-group">
                           <label>Hình ảnh(Giới thiệu)</label>
                           <input type="file" name="gioithieu" class="btn btn-default" >
                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
                       </div>
                        <div class="form-group">
                           <label>Hình ảnh(Tiện ích)</label>
                           <input type="file" name="tienich" class="btn btn-default">
                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
                       </div>
                       <div class="form-group">
                           <label>Hình ảnh(Vị trí)</label>
                           <input type="file" name="vitri" class="btn btn-default" >
                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
                       </div>
                       <div class="form-group">
                           <label>Hình ảnh(Thiết kế)</label>
                           <input type="file" name="thietke" class="btn btn-default" >
                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
                       </div> -->
                       </div>
                       
						<div class="row">
		                   <div class="col-sm-12 submit-pro">
		                       <input type="submit" value="Thêm" class="btn btn-success" />
		                       <input type="reset" value="Nhập lại" class="btn btn-default" />
		                   </div>
	               		</div>

                   </div>

                   <div class="col-sm-6"></div>
               </div>

               <hr>


           </div>
       </div>
   </div>
   </form>
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