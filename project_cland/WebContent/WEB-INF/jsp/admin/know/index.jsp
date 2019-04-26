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
                <h5>Kiến thức bất động sản </h5>
            </header>
             <c:if test="${not empty msg }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				  </div>
			  </c:if>
            <div id="collapse4" class="body">
            <form action="" method="POST">
                <table id="dataTable"  class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                    	<th>Id</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    	
                    		
                            <c:forEach items="${listknow}" var="objL">
                            
	                            <tr>
	                            	<td>${objL.id }</td>
	                                <td>
	                                	<p>${objL.title}</p>
	                                </td>
	                                <td>
	                                	<img style="width:100px; height:100px" alt="" src="${pageContext.request.contextPath}/files/${objL.image }">
	                                </td>
	                                <td>${objL.time }</td>
	                                <td class="function-land">
	                                	<a href="${pageContext.request.contextPath}/admin/know/edit/${objL.id}" title="" ><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                              		<a href="${pageContext.request.contextPath}/admin/know/del/${objL.id}" onclick="return confirm('Bạn có thật sự muốn xóa?')" title="" ><span class="glyphicon glyphicon-trash"></span> Xóa</a>
										<input type="checkbox" name="del[]" value="${objL.id }" />
	                                </td>
	                            </tr>
                            </c:forEach>
                    	
                           
                    </tbody>                </table>
                    <input type="submit"  value="Delete" class="btn btn-danger btn-xs btn-line"/>
                    </form>
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
            
