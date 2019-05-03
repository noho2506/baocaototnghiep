            <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,300,700'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
                <div id="content">
                    <div class="outer">
                        <div class="inner bg-light lter">
                            <!--Begin Datatables-->
<div class="row">
  <div class="col-lg-12">
        <div class="box">
            <header class="title tieude">
                <div class="icons"><i class="fa fa-table"></i></div>
                <h5>Thêm dự án</h5>
            </header>
             <c:if test="${not empty msg1 }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				  </div>
			  </c:if>
			   <form action="" method="POST" enctype="multipart/form-data">
            <section id="fancyTabWidget" class="tabs t-tabs tabs-project">
        <ul class="nav nav-tabs fancyTabs" role="tablist">
        
                    <li class="tab fancyTab active">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>	
                        <a id="tab0" href="#tabBody0" role="tab" aria-controls="tabBody0" aria-selected="true" data-toggle="tab" tabindex="0"><span class="fa fa-desktop"></span><span class="hidden-xs">Thông tin </span></a>
                    	<div class="whiteBlock"></div>
                    </li>
                    
                    <li class="tab fancyTab">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a id="tab1" href="#tabBody1" role="tab" aria-controls="tabBody1" aria-selected="true" data-toggle="tab" tabindex="0"><span class="fa fa-firefox"></span><span class="hidden-xs">Hình Ảnh</span></a>
                        <div class="whiteBlock"></div>
                    </li>
                    
                   
        </ul>
        <div id="myTabContent" class="tab-content fancyTabContent" aria-live="polite">
                    <div class="tab-pane  fade active in" id="tabBody0" role="tabpanel" aria-labelledby="tab0" aria-hidden="false" tabindex="0">
                        <div>
                        	<div class="row">
                            	
                                <div class="col-md-12">
                                 <div class="form-group">
			                           <label for="name">Tên dự án</label> <p style="color: red">${msg1 }</p>
			                           <input type="text" name="title" value="${project.title }" class="form-control" placeholder="Nhập tên tin">
			                       </div>
			
			                       <div class="form-group">
			                           <label>Mô tả</label>
			                           <textarea name="description"  class="form-control ckeditor" rows="3">${project.description }</textarea>
			                       </div>
			
			  						<div class="form-group">
			                           <label for="name">Người bán</label>
			                           <input value="${project.sellers }" type="text" name="sellers"  class="form-control" placeholder="Nhập diện tích">
			                       </div>
			                       
			                       <div class="form-group">
			                           <label for="name">Giới thiệu </label>
			                           <textarea name="overview" class="form-control ckeditor" cols="12" rows="3">${project.overview }</textarea>
			                       </div>
			                       
			                       <div class="form-group">
			                           <label for="name">Tiện ích</label>
			                           <textarea name="utility"  class="form-control ckeditor" rows="12" cols="12"> ${project.utility }</textarea>
			                       </div>
			
			                       <div class="form-group">
			                           <label>Vị trí</label>
			                           <textarea name="location" class="form-control ckeditor" cols="12" rows="3">${project.location }"</textarea>
			                       </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane  fade" id="tabBody1" role="tabpanel" aria-labelledby="tab1" aria-hidden="true" tabindex="0">
                        <div class="row">
                            	
                                <div class="col-md-12">
									<div class="form-group">
		                           		<label>Hình ảnh</label>
			                           <input type="file" name="tc" class="btn btn-default btn-default-input-add">
			                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
			                       </div>
		                       		<div class="form-group">
			                           <label>Hình ảnh(Giới thiệu)</label>
			                           <input type="file" name="gt" class="btn btn-default btn-default-input-add ">
			                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
			                       </div>
			                       <div class="form-group">
			                          <label>Hình ảnh(Tiện ích)</label>
			                           <input type="file" name="ti" class="btn btn-default btn-default-input-add ">
			                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
			                       </div>
			                       <div class="form-group">
			                           <label>Hình ảnh(Vị trí)</label>
			                           <input type="file" name="vt" class="btn btn-default btn-default-input-add">
			                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
			                       </div>
			                       <div class="form-group">
			                           <label>Hình ảnh(Thiết kế)</label>
			                           <input type="file" name="tk" class="btn btn-default btn-default-input-add">
			                           <p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
			                       </div>  
			                       <div class="col-sm-12 submit-pro">
				                       <input type="submit" value="Thêm" class="btn btn-success" />
				                       <input type="reset" value="Nhập lại" class="btn btn-default" />
				                   </div>                                 
                                </div>
                            </div>
                    </div>
                    
                    
                    
        </div>

    </section>
    </form>
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
            
            