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
                <h5>Văn bản pháp luật </h5>
            </header>
             <c:if test="${not empty msg }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				  </div>
			  </c:if>
			  <div class="row">
			  <div class="add them" >
            	<a href="${pageContext.request.contextPath}/admin/add-document" class="btn btn-info  btn-line" style="background: url(<%=request.getContextPath() %>/templates/admin/assets/img/dib.png) 4px 4px no-repeat;">Thêm </a>
              </div>
              </div>
            <div id="collapse4" class="body">
            <table id="dataTable"  class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                    	<th>Id</th>
                        <th>Tên nội dung</th>
                        <th>type</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    	
                    		
                            <c:forEach items="${listDoc}" var="objL">
                            
	                            <tr>
	                            	<td>${objL.id }</td>
	                                <td >
	                                	<p>${objL.description}</p>
	                                </td>
	                                <td>${objL.type }</td>
	                                <td class="function-land">
	                                	<a href="${pageContext.request.contextPath}/document/down/${objL.id}" title="" ><span class="glyphicon glyphicon-download-alt"></span> download</a>
	                              		<a href="${pageContext.request.contextPath}/admin/document/del/${objL.id}" onclick="return confirm('Bạn có thật sự muốn xóa?')" title="" ><span class="glyphicon glyphicon-trash"></span> delete</a>
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
            
