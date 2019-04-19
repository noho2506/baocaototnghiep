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
            <div id="collapse4" class="body">
                <table id="dataTable"  class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                    	<th>Id</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Location</th>
                        <th>Active</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody>
                            <c:forEach items="${listLands}" var="objL">
                            
	                            <tr>
	                            	<td>${objL.id }</td>
	                                <td>
	                                	<a id="myBtn" href="${pageContext.request.contextPath}/admin/land/show/${objL.id}">${objL.title}</a>
	                                </td>
	                                <td>
	                                	<img style="width:100px; height:100px" alt="" src="${pageContext.request.contextPath}/files/${objL.image }">
	                                </td>
	                                <td>${objL.price }</td>
	                                <td>${objL.location }</td>
	                                <td style="text-align: center" class="change-${objL.id }" >
			                          	<a href= "javascript:void(0)" onclick="changeEnable(${objL.id },${objL.active})">
				                          	<c:if test="${objL.active == 1 }">
				                          		<img class="img-vip" src="${defines.urlAdmin}/assets/img/tick2.jpg"/>
				                          	</c:if>
				                          	<c:if test="${objL.active != 1 }">
				                          		<img class="img-vip-none" src="${defines.urlAdmin}/assets/img/none.png" />
				                          	</c:if>
			                          	</a>
									</td>
	                                <td class="function-land">
	                                	<a href="${pageContext.request.contextPath}/admin/land/edit/${objL.id}" title="" class="btn btn-primary"><span class=""></span> Sửa</a>
	                              		<a href="${pageContext.request.contextPath}/admin/user/land/del/${objL.id}" onclick="return confirm('Bạn có thật sự muốn xóa?')" title="" class="btn btn-danger"><span class=""></span> Xóa</a>
	                                	
	                                </td>
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
	    url: "${pageContext.request.contextPath}/admin/user/lands",
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