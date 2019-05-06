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
                <h5>Thêm Văn bản pháp luật </h5>
            </header>
            <div id="collapse4" class="body">
                <table  class="table table-bordered table-condensed table-hover table-striped">
                   <form action="" method="POST" enctype="multipart/form-data" class="form-horizontal">
					     <div class="col-md-12 panel-info">
					        
					         <div class="content-box-large box-with-header">
					             <div>
					                 <div class="row mb-10"></div>
					                 <div class="row">
					                 		<div class="form-group col-md-12">
					                            <label class="col-md-3 control-lable" for="description">Tên tập tin </label>
					                            <div class="col-md-7">
					                                <input type="text" name="description" class="form-control input-sm"/>
					                            </div>
				                             
				                        	</div>
					                     	<div class="form-group col-md-12">
					                             <label class="col-md-3 control-lable" for="file">Upload a document</label>
					                             <div class="col-md-7">
					                            	 <input  type="file"  name="file" class="form-control input-sm"/>
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