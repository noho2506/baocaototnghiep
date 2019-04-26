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
            <header class="title tieude">
                <div class="icons"><i class="fa fa-table"></i></div>
                <h5>Đất nền</h5>
            </header>
             <c:if test="${not empty msg }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				  </div>
			  </c:if>
			  <div class="add">
            	<a href="${pageContext.request.contextPath}/admin/project/add" class="btn btn-info  btn-line">Thêm dự án </a>
              </div>
            <div id="collapse4" class="body">
                <table id="dataTable"  class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                    	<th>Id</th>
                        <th>Tiêu đề</th>
                        <th>Hình Ảnh</th>
                        <th>NGười bán</th>
                        <th>Vip</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody>
                            <c:forEach items="${listProject}" var="objL">
                            
	                            <tr>
	                            	<td>${objL.id }</td>
	                                <td>${objL.title}</td>
	                                <td>
	                                	<img class="img-input" src="${pageContext.request.contextPath}/files/${objL.trangchu}" alt="">
	                                </td>
	                                <td>${objL.sellers }</td>
	                                <td style="text-align: center" class="change-${objL.id }" >
			                          	<a href= "javascript:void(0)" onclick="return changeEnable(${objL.id },${objL.vip })">
				                          	<c:if test="${objL.vip == 1 }">
				                          		<img class="img-vip" src="${defines.urlAdmin}/assets/img/749564e69c.png"/>
				                          	</c:if>
				                          	<c:if test="${objL.vip != 1 }">
				                          		<img class="img-vip-none" src="${defines.urlAdmin}/assets/img/img_363058.png" />
				                          	</c:if>
			                          	</a>
									</td>
	                                <td class="function-land">
	                                	<a href="${pageContext.request.contextPath}/admin/project/edit/${objL.id}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                              		<a href="${pageContext.request.contextPath}/admin/project/del/${objL.id}" onclick="return confirm('Bạn có thật sự muốn xóa?')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
	                                </td>
	                            </tr>
	                            
                            </c:forEach>
                           
                    </tbody>                </table>
s                    <!-- The Modal -->
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
            
<script type="text/javascript"> 
	function changeEnable(id, active){
	  $.ajax({
	    url: "${pageContext.request.contextPath}/admin/projects",
	    type: 'POST',
	    cache: false,
	    data: {
	      aactive : active,
	      aid: id
	    },
	    success: function(data){
	      $(".change"+'-'+id).html(data); 
	    },
	    error: function (){
	      alert('Có lỗi');
	    }
	  }); 
	}
</script>

