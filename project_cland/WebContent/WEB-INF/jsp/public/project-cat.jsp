
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/templates/taglib.jsp" %>
    <!-- Our Room Area Start -->
    <section class="roberto-rooms-area">
        <div class="rooms-slides owl-carousel">
           
		<c:forEach items="${listProjectVip }" var="objV">
			 <!-- Single Room Slide -->
            <div class="single-room-slide d-flex align-items-center">
                <!-- Thumbnail -->
                <div class="room-thumbnail h-100 bg-img" style="background-image: url(${pageContext.request.contextPath}/files/${objV.trangchu });"></div>

                <!-- Content -->
                <div class="room-content">
                    <h2  data-animation="fadeInUp" data-delay="100ms">${objV.title}</h2>
                    <h5 data-animation="fadeInUp" data-delay="300ms">${objV.address} </h5>
                    <ul class="room-feature" data-animation="fadeInUp" data-delay="500ms">
                        ${objV.description }
                    </ul>
                    <a href="${pageContext.request.contextPath }/project/${slugUtil.makeSlug(objV.title)}-${objV.id}" class="btn roberto-btn mt-30" data-animation="fadeInUp" data-delay="700ms">View Details</a>
                </div>
            </div>
		</c:forEach>
        </div>
    </section>
    <!-- Our Room Area End -->
    <!-- Blog Area Start -->
    <section class="roberto-blog-area section-padding-100-0">
        <div class="container">

            <div class="row">
				<c:forEach items="${listProject}" var="objP">
				<!-- Single Post Area -->
					<div class="col-12 col-md-6 col-lg-4">
	                    <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="300ms">
	                    <c:choose>
	                    	<c:when test="${empty  objP.trangchu}">
	                    		<a href="" class="post-thumbnail"><img class="img-post-thumbnail" src="${defines.urlPublic}/assets/img/none.jpg" alt=""></a>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a href="${pageContext.request.contextPath }/project/${slugUtil.makeSlug(objP.title)}-${objP.id}" class="post-thumbnail"><img class="img-post-thumbnail" src="${pageContext.request.contextPath}/files/${objP.trangchu}" alt=""></a>
	                    	</c:otherwise>
	                    </c:choose>
	                        <!-- Post Meta -->
	                        <!-- Post Title -->
	                        <a href="${pageContext.request.contextPath }/project/${slugUtil.makeSlug(objP.title)}-${objP.id}" class="post-title">${objP.title}</a>
	                        <p><i class=" fa fa-map-marker"></i>${objP.address }</p>
	                        <a href="${pageContext.request.contextPath }/project/${slugUtil.makeSlug(objP.title)}-${objP.id}" class="btn continue-btn"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	                    </div>
	                </div>
				</c:forEach>

            </div>
        </div>
    </section>
    <!-- Blog Area End -->
    

    <!-- Partner Area Start -->
    <div class="partner-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="partner-logo-content d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="300ms">
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="<%=request.getContextPath() %>/templates/public/img/core-img/p1.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="<%=request.getContextPath() %>/templates/public/img/core-img/p2.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="<%=request.getContextPath() %>/templates/public/img/core-img/p3.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="<%=request.getContextPath() %>/templates/public/img/core-img/p4.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="<%=request.getContextPath() %>/templates/public/img/core-img/p5.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Area End -->

    