  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/templates/taglib.jsp" %>
<div id="content">
                    <div class="outer">
                        <div class="inner bg-light lter">
                            <!--Begin Datatables-->
<div class="row">
  <div class="col-lg-12">
        <div class="box">
            <header>
                <div class="icons"><i class="fa fa-table"></i></div>
                <h5>Thêm Danh Mục </h5>
            </header>
            <div id="collapse4" class="body">
                <table  class="table table-bordered table-condensed table-hover table-striped">
                   <form action="" method="POST">
					     <div class="col-md-12 panel-info">
					        
					         <div class="content-box-large box-with-header">
					             <div>
					                 <div class="row mb-10"></div>
					                 <div class="row">
					                     <div class="col-sm-6">
					                         <div class="form-group">
					                             <label for="name">Tên danh mục</label>
					                             <input type="text" name = "name" class="form-control" value="${name}" placeholder="Nhập tên danh mục">
					                         	 <form:errors path="cat.cname" cssStyle="color: red"></form:errors>
					                         	 <p style="color: red">${msg1 }</p>
					                         </div>
					                     </div>
					
					                     <div class="col-sm-6"></div>
					
					                 </div>
					                 <hr>
					
					                 <div class="row">
					                     <div class="col-sm-12">
					                         <input type="submit" value="Thêm" class="btn btn-success" />
					                         <input type="reset" value="Nhập lại" class="btn btn-default" />
					                     </div>
					                 </div>
					
					             </div>
					         </div>
					     </div>
					     </form>             
				</table>
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