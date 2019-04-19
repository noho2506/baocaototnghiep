<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
                <div id="content">
                    <div class="outer">
                        <div class="inner bg-light lter">
                            <!--Begin Datatables-->
                            <style>
table, th, td {
  border: 1px solid #1cc3b2;
  border-collapse: collapse;
}
tr{
text-align: center;}
th{
padding :10px 60px;

color: #fff;
font-weight:bold;
background-color: #1cc3b2;}
td{
text-align: center;
 padding: 10px 20px;}
 table{
 margin-bottom: 20px;
 }
</style>
<div class="row">
  <div class="col-lg-12">
        <div class="box">
            <header class=" show-title title tieude">
                <div class="icons"><i class="fa fa-table"></i></div>
                <h5 >Thông tin sản phẩm</h5>
            </header>
            <div id="collapse4" class="body body-detail">
                <table >
							  <tr>
							    <td>Tên:</td>
							    <td>${land.title }</td>
							  </tr>
							  <tr>
							    <td>Mô tả:</td>
							    <td>${land.description }</td>
							  </tr>
							  <tr>
							    <td>Loại đất</td>
							    <td>${land.name_cat}</td>
							  </tr>
							  <tr>
							    <td>Giá</td>
							    <td>${land.price}</td>
							  </tr>
							  <tr>
							    <td>Vị trí</td>
							    <td>${land.location }</td>
							  </tr>
							  <tr>
							    <td>Hình ảnh</td>
							    <td>
							    	<c:choose>
				                    	<c:when test="${not empty  objL.image}">
				                    		<a href="#" class="post-thumbnail"><img style="width:100px; height:100px" class="img-post-thumbnail" src="${defines.urlAdmin}/assets/img/none.jpg" alt=""></a>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<a href="#" class="post-thumbnail"><img style="width:100px; height:100px" class="img-post-thumbnail" src="${pageContext.request.contextPath}/files/${land.image}" alt=""></a>
				                    	</c:otherwise>
				                    </c:choose>
							    </td>
							  </tr>
							  <tr>
							    <td>Ngày tạo</td>
							    <td>${land.create_day}</td>
							  </tr>
							  <tr>
							    <td>Diện tích</td>
							    <td>${land.area }</td>
							  </tr>
							  <tr>
							    <td>Vị trí</td>
							    <td>${land.location}</td>
							  </tr>
							   <tr>
							    <td>Thông tin người bán</td>
							    <td>
							    	<div style="margin-left:30px">
				                		<span>		-Tên liên lạc: ${seller.name }</span><br />
				                		<span>		-Điện thoại: ${seller.phone }</<span><br />
				                		<span>		-Địa chỉ: ${seller.address }</<span><br />
				                	</div>
							    </td>
							  </tr>
							  
							</table>
                
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
            
