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
            <header class=" show-title title ">
                <div class="icons"><i class="fa fa-table"></i></div>
                <h5>Thông tin sản phẩm</h5>
            </header>
            <div id="collapse4" class="body body-detail">
                <h4>Tên: ${land.title }</h4>
                <p>Mô tả: </p><span>${land.description }</spand><br />
                <p>Loại đất: </p><span>${land.name_cat}</span><br />
                <p>Giá: </p><span>${land.price}</span><br />
                <p>Hình ảnh: 
                	 <c:choose>
	                    	<c:when test="${empty  objL.image}">
	                    		<a href="#" class="post-thumbnail"><img style="width:100px; height:100px" class="img-post-thumbnail" src="${defines.urlAdmin}/assets/img/none.jpg" alt=""></a>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a href="#" class="post-thumbnail"><img style="width:100px; height:100px" class="img-post-thumbnail" src="${pageContext.request.contextPath}/files/${land.image}" alt=""></a>
	                    	</c:otherwise>
	                    </c:choose>
                </p><br />
                <p>Ngày tạo : </p><span>${land.create_day}</spand><br />
                <p>Diện tích: </p><span>${land.area }</span><br />
                <p>Vị trí: </p><span>${land.location}</span><br />
                <p>Thông tin người bán : </p><br />
                <div>
                	<div style="margin-left:30px">
                		<span>		-Tên liên lạc: ${seller.name }</span><br />
                		<span>		-Điện thoại: ${seller.phone }</<span><br />
                		<span>		-Địa chỉ: ${seller.address }</<span><br />
                	</div>
                </div>
                
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
            
