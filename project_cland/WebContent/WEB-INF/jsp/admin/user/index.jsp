<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                <div id="content">
                    <div class="outer">
                        <div class="inner bg-light lter">
                            <!--Begin Datatables-->
                            
<div class="row">
  <div class="col-lg-12">
        <div class="box">
            <header class="title tieude">
                <div class="icons"><i class="fa fa-table"></i></div>
                <h5>Người dùng</h5>
            </header>
             <c:if test="${not empty msg }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				  </div>
			  </c:if>
			  <div class="add them" >
            	<a href="${pageContext.request.contextPath}/admin/user/add" class="btn btn-info  btn-line" style="background: url(<%=request.getContextPath() %>/templates/admin/assets/img/a.png) 4px 4px no-repeat;">Thêm người dùng</a>
              </div>
            <div id="collapse4" class="body">
                <table id="dataTable"  class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                    	<th>Id</th>
                        <th>Họ tên </th>
                        <th>Username</th>
                        <th>Trạng thái</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody>
                            <c:forEach items="${listUser}" var="objL">
	                            <tr>
	                            	<td>${objL.id }</td>
	                                <td class="firstname_info">${objL.firstname}</td>
	                                <td>${objL.username}</td>
	                                <td class="change-user-${objL.id } " style=" text-align: center;">
		                            	 <a href= "javascript:void(0)" onclick="return changeEnable(${objL.id },${objL.enable })">
				                          	<c:if test="${objL.enable == 1 }">
				                          		<img class="img-user-active"src="${defines.urlAdmin}/assets/img/Capture.PNG"/ >
				                          	</c:if>
				                          	<c:if test="${objL.enable != 1 }">
				                          		<img class="img-user-active"  src="${defines.urlAdmin}/assets/img/C.PNG" />
				                          	</c:if>
			                          	</a>
	                                </td>
	                                <td class="function-land">
	                                	<a href="${pageContext.request.contextPath}/admin/user/edit/${objL.id}" title="Sua" ><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
                              <a href="${pageContext.request.contextPath}/admin/user/del/${objL.id}" onclick="return confirm('Bạn có thật sự muốn xóa?')" title="Xoa" ><span class="glyphicon glyphicon-trash"></span> Xóa</a>
	                            </tr>
	                            
                            </c:forEach>
                           
                    </tbody>                </table>
                    <!-- The Modal -->
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
	    url: "${pageContext.request.contextPath}/admin/users",
	    type: 'POST',
	    cache: false,
	    data: {
	      aactive : active,
	      aid: id
	    },
	    success: function(data){
	      $(".change-user"+'-'+id).html(data); 
	    },
	    error: function (){
	      alert('Có lỗi');
	    }
	  }); 
	}
</script>

            
