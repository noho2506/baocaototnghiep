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
                <h5>Tin Quảng Cáo</h5>
            </header>
             <c:if test="${not empty msg }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				  </div>
			  </c:if>
			  <div class="add">
            	<a href="${pageContext.request.contextPath}/admin/adv/add" class="btn btn-metis-1  btn-line"><i class="fa fa-angle-double-right"></i>Thêm</a>
            </div>
            <div id="collapse4" class="body">
                <table id="dataTable"  class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                    	<th>Id</th>
                        <th>Tên công ty </th>
                        <th>Image</th>
                        <th>Ngày đăng</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    	<form action="">
                    		
                            <c:forEach items="${listAdv}" var="objL">
                            
	                            <tr>
	                            	<td>${objL.id }</td>
	                                <td>
	                                	<p>${objL.name}</p>
	                                </td>
	                                <td>
	                                	<img style="width:100px; height:100px" alt="" src="${pageContext.request.contextPath}/files/${objL.image }">
	                                </td>
	                                <td>${objL.time }</td>
	                                <td class="function-land">
	                                	<a href="${pageContext.request.contextPath}/admin/adv/edit/${objL.id}" title="" ><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                              		<a href="${pageContext.request.contextPath}/admin/adv/del/${objL.id}" onclick="return confirm('Bạn có thật sự muốn xóa?')" title="" ><span class="glyphicon glyphicon-trash"></span> Xóa</a>
	                                </td>
	                            </tr>
                            </c:forEach>
                    	</form>
                           
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
            
