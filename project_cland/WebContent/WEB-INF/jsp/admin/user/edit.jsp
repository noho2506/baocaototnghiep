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
                <h5>Sửa người dùng </h5>
            </header>
            <div id="collapse4" class="body">
                <table  class="table table-bordered table-condensed table-hover table-striped">
                   <form action="" method="POST">
					     <div class="col-md-12 panel-info">
					        
					         <div class="content-box-large box-with-header">
					             <div>
					                 <div class="row mb-10"></div>
					                 <div class="row">
                     <div class="col-sm-6">
                         <div class="form-group">
                             <label for="name">Tên đăng nhập</label>
                             <input type="text" name="username" class="form-control" value="${user.username }" placeholder="Nhập tên đăng nhập" readonly>
                         </div>
                         
                         <div class="form-group">
                             <label for="name">Họ tên</label>
                             <input type="text" name="firstname" class="form-control " value="${user.firstname }" placeholder="Nhập họ tên">
                         	 <p style="color:red">${msg }</p>
                         </div>
                         
                         <div class="form-group">
                             <label for="name">Mật khẩu</label>
                             <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu">
                         </div>
                         <c:if test="${userInfoAdmin.role_id ==1}">
                         <div class="form-group">
                           <label>Cấp bậc</label>
                           <select class="form-control" name="role_id">
                           	<c:set var="selected" value=""></c:set>
                           	<option  value="0">-Chọn-</option>
                           	<c:forEach items = "${listRoles }" var="role">
                           		<c:choose>
                           			<c:when test="${role.role_id == user.role_id }">
                           				<c:set var="selected" value="selected='selected'"></c:set>
                           			</c:when>
                           			<c:otherwise> <c:set var="selected" value=""></c:set> </c:otherwise>
                           		</c:choose>
							   <option ${selected } value="${role.role_id }">${role.name }</option>
							</c:forEach>
							</select>
							 <p style="color:red">${msg1 }</p>
                       	 </div>
                       	 </c:if>
                     </div>

                     <div class="col-sm-6"></div>

                 </div>
					                 <hr>
					
					                 <div class="row">
					                     <div class="col-sm-12">
					                         <input type="submit" value="Sửa" class="btn btn-success" />
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