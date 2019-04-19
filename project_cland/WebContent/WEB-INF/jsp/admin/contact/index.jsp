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
                <h5>Liên hệ </h5>
            </header>
             <c:if test="${not empty msg }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				  </div>
			  </c:if>
            <div id="collapse4" class="body">
                <table  class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Phone</th>
                        <th>Message</th>
                    </tr>
                    </thead>
                    <tbody>
                            <c:forEach items="${listContact}" var="objL">
	                            <tr>
	                                <td>${objL.id}</td>
	                                <td>${objL.name }</td>
	                                <td>${objL.phone }</td>
	                                <td>${objL.message }</td>
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
                <!-- /#content -->
				</div>
                    
                    <!-- /#right -->
            </div>
            
            <!-- /#wrap -->
            
