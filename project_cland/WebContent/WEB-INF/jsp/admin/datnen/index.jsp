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
			  <div class="add them" >
            	<a href="${pageContext.request.contextPath}/admin/land/add" class="btn btn-info  btn-line" style="background: url(<%=request.getContextPath() %>/templates/admin/assets/img/a.png) 4px 4px no-repeat;">Thêm đất nền</a>
              </div>
            <div id="collapse4" class="body">
                <table id="dataTable"  class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                    	<th>Id</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Create_day</th>
                        <th>Location</th>
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
	                                <td>${objL.create_day }</td>
	                                <td>${objL.location }</td>
	                                <td class="function-land">
	                                	<a href="${pageContext.request.contextPath}/admin/land/edit/${objL.id}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                              		<a href="${pageContext.request.contextPath}/admin/land/del/${objL.id}" onclick="return confirm('Bạn có thật sự muốn xóa?')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
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
            
