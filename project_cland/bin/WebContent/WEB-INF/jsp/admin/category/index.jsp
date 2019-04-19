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
            <header>
                <div class="icons"><i class="fa fa-table"></i></div>
                <h5>Danh mục </h5>
            </header>
             <c:if test="${not empty msg }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				  </div>
			  </c:if>
            <div class="add">
            	<a href="${pageContext.request.contextPath}/admin/cat/add" class="btn btn-metis-1  btn-line">Thêm danh mục </a>
            </div>
            <div id="collapse4" class="body">
                <table  class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Danh mục </th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody>
                            <c:forEach items="${listLand}" var="objL">
	                            <tr>
	                                <td>${objL.id}</td>
	                                <td>${objL.name }</td>
	                                <td class="function">
	                                	<a href="${pageContext.request.contextPath}/admin/cat/edit/${objL.id}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                              		<a href="${pageContext.request.contextPath}/admin/cat/del/${objL.id}" onclick="return confirm('Bạn có thật sự muốn xóa?')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
	                                </td>
	                            </tr>
                            </c:forEach>
                           
                    </tbody>                </table>
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
            
