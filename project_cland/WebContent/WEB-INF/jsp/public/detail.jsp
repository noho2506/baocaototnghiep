<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/templates/taglib.jsp" %>

    <!-- Breadcrumb Area Start -->
    <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(img/bg-img/16.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-end">
                <div class="col-12">
                    <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                        <h2 class="room-title">Google Map</h2>
                        <h2 class="room-price">$180 <span>/ Per Night</span></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->

    <!-- Rooms Area Start -->
    <div class="roberto-rooms-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <!-- Single Room Details Area -->
                    <div class="single-room-details-area mb-50">
                        <!-- Room Thumbnail Slides -->
                        <div class="room-thumbnail-slides mb-50">
                            <div id="room-thumbnail--slide" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="${pageContext.request.contextPath }/files/${getItem.image}" class="d-block w-100" alt="">
                                    </div>
                                    
                                </div>
                            </div>
                        </div>

                        <!-- Room Features -->
                        <h4>${getItem.title}</h4>
                        <div class="room-features-area d-flex flex-wrap mb-50">
                            <h6>Giá: <span>${getItem.price}</span></h6>
                            <h6>Diện tích: <span>${getItem.area }</span></h6>
                            <h6>Khu vực: <span>${getItem.location }</span></h6>
                            <h6>Danh mục: <span>${getItem.name_cat}</span></h6>
                        </div>
						 <strong>Thông tin mô tả </strong>
                        <p>${getItem.detail}</p>
						<strong>Thông tin liên lạc  </strong>
                        <ul>
                            <li><i class="fa fa-check"></i>Tên liên lạc:</li>
                            <li><i class="fa fa-check"></i> Địa chỉ: </li>
                            <li><i class="fa fa-check"></i> Mobile: </li>
                        </ul>
                    </div>

                    <!-- Room Review -->
                    <div class="room-review-area mb-100">
                        <h4>Bình luận bài viết</h4>
                         <div class="roberto-contact-form">
	                        <form action="#" method="post">
	                            <div class="row contact-form">
	                            	<div class="col-12 col-lg-6 form-input1 ">
	                            		<lable> Tên *:</lable>
	                                    <input type="text" name="message-name" class="form-cmt col-6 ten"  required >
	                                </div>
	                                <div class="col-12 col-lg-6 form-input1" data-wow-delay="100ms">
	                                	Email * : 
	                                    <input type="email" name="message-email" class="form-cmt col-6 email"  required >
	                                </div>
	                            	<div class="col-12 wow fadeInUp" data-wow-delay="100ms">
	                            		<lable> Bình luận </lable>
	                                    <textarea name="message" class="form-cmt-tex col-12 cmt" placeholder="Your Message"></textarea>
	                                </div>
	                                <div class="col-12 text-center wow fadeInUp" data-wow-delay="100ms">
	                                    <a href="javascript:void(0)"  class="btn roberto-btn mt-15" onclick="doComment1()">Phản hồi</a>
	                                </div>
	                            </div>
	                        </form>
	                    </div>
                        <!-- Single Review Area -->
                      	<div>
	                      	<div class="binhluan">
	                      		<c:forEach items="${listCmt}" var="objR"> 
			                       	 <c:if test="${objR.sub_id == 0 }">
				                       	 <div class="single-room-review-area d-flex align-items-center binhluan-cmt">
				                            <div class="reviwer-thumbnail bl-img">
				                                <img src="<%=request.getContextPath() %>/templates/public/img/56a0bb98e9a99a4669bf7f07_user_icon.png" alt="">
				                            </div>
				                            <div class="reviwer-content">
				                                <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
				                                    <div class="reviwer-title">
				                                        <span>${objR.name } </span>
				                                         <a class='rep' href='javascript:void(0)' onclick='rep_a(${objR.id})'>Reply</a>   
				                                        <h6>${objR.create_day }</h6>
				                                    </div>
				                                </div>
				                                <p>${objR.cmt }</p>
				                            </div>
				                         </div>
			                       	 </c:if>
	                      <!-- end cmt -->
                        <div class="repLand_${objR.id}" style="margin-left:80px">
                        <!-- chạy list rep -->
                            <c:forEach items="${cmtDAO.getCmtRep(objR.id)}" var="obj">
	                        	<div class="single-room-review-area d-flex align-items-center binhluan-cmt">
		                            <div class="reviwer-thumbnail bl-img-rep">
		                                <img src="<%=request.getContextPath() %>/templates/public/img/56a0bb98e9a99a4669bf7f07_user_icon.png" alt="">
		                            </div>
		                            <div class="reviwer-content">
		                                <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
		                                    <div class="reviwer-title">
		                                        <span>${obj.name } </span>
		                                        
		                                        <h6>${obj.create_day }</h6>
		                                    </div>
		                                </div>
		                                <p>${obj.cmt }</p>
		                            </div>
		                        </div>
	                        </c:forEach>
                        
                        </div>
                        <!-- form rep -->
                        <div class="form_rep${objR.id} rep_land_form" style="margin-left:80px">
                        	<form action="#" method="post">
	                            <div class="row contact-form rep-form">
	                            	<div class="col-12 col-lg-6 form-input1 ">
	                            		<lable> Tên *:</lable>
	                                    <input type="text" name="message-name" class="form-cmt col-6 ten_rep${objR.id }"  required>
	                                </div>
	                                <div class="col-12 col-lg-6 form-input1" data-wow-delay="100ms">
	                                	Email * : 
	                                    <input type="email" name="message-email" class="form-cmt col-6 email_rep${objR.id }"  >
	                                </div>
	                            	<div class="col-12 wow fadeInUp" data-wow-delay="100ms">
	                            		<lable> Bình luận </lable>
	                                    <textarea name="message" class="form-cmt-tex col-12 cmt_rep${objR.id }" placeholder="Your Message"></textarea>
	                                </div>
	                                <div class="col-12 text-center wow fadeInUp" data-wow-delay="100ms">
	                                    <a href="javascript:void(0)"  class="btn roberto-btn mt-15" onclick="doCommentRep(${objR.id},${getItem.id})">Phản hồi</a>
	                                </div>
	                            </div>
	                        </form>
                        </div>
                      <!--  end  form rep -->
	                       </c:forEach>
	                      </div>
                       </div>
                      </div>
                      <!-- end review -->

                    </div>
              <!--   end col8 -->

                <div class="col-12 col-lg-4">
		           <div class="wrap-contact100">
						<div class="contact100-form-title" style="background-image: url(${defines.urlPublic}/img/bg-01.jpg);">
							<span class="contact100-form-title-1">
								Contact Us
							</span>
			
						</div>
			
						<form action="${pageContext.request.contextPath }/contact" class="contact100-form validate-form" method="POST">
							<div class="wrap-input100 validate-input" data-validate="Name is required">
								<span class="label-input100">Full Name:</span>
								<input class="input100" type="text" name="name" placeholder="Enter full name">
								<span class="focus-input100"></span>
							</div>
			
							<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
								<span class="label-input100">Email:</span>
								<input class="input100" type="text" name="email" placeholder="Enter email addess">
								<span class="focus-input100"></span>
							</div>
			
							<div class="wrap-input100 validate-input" data-validate="Phone is required">
								<span class="label-input100">Phone:</span>
								<input class="input100" type="text" name="phone" placeholder="Enter phone number">
								<span class="focus-input100"></span>
							</div>
			
							<div class="wrap-input100 validate-input" data-validate = "Message is required">
								<span class="label-input100">Message:</span>
								<textarea class="input100" name="message" placeholder="Your Comment..."></textarea>
								<span class="focus-input100"></span>
							</div>
			
							<div class="container-contact100-form-btn">
								<button class="contact100-form-btn">
									<span>
										Submit
										<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
									</span>
								</button>
							</div>
						</form>
					</div>
					<div class="room-review-area mb-100">
                        <h4>Xem thêm tin liên quan </h4>

                        <!-- Single Review Area -->
                       <c:forEach items="${ListItemsR}" var="objR">
                       	 <div class="single-room-review-area d-flex align-items-center">
                            <div class="reviwer-thumbnail">
                                <img src="${pageContext.request.contextPath }/files/${objR.image}" alt="">
                            </div>
                            <div class="reviwer-content">
                                <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
                                    <div class="reviwer-title">
                                        <span>${objR.create_day }</span>
                                    </div>
                                </div>
                                <p><a href="${pageContext.request.contextPath }/detail/${objR.id}">${objR.title }</a></p>
                            </div>
                        </div>
                       </c:forEach>

                    </div>
                </div>
                <!--   end col4 -->
             
            </div>
             <!--   end row -->
        </div>
       <!--  end container -->
    </div>
    <!-- Rooms Area End -->

    <!-- Call To Action Area Start -->
    <section class="roberto-cta-area">
        <div class="container">
            <div class="cta-content bg-img bg-overlay jarallax" style="background-image: url(img/bg-img/1.jpg);">
                <div class="row align-items-center">
                    <div class="col-12 col-md-7">
                        <div class="cta-text mb-50">
                            <h2>Contact us now!</h2>
                            <h6>Contact (+12) 345-678-9999 to book directly or for advice</h6>
                        </div>
                    </div>
                    <div class="col-12 col-md-5 text-right">
                        <a href="#" class="btn roberto-btn mb-50">Contact Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Call To Action Area End -->

    <!-- Partner Area Start -->
    <div class="partner-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="partner-logo-content d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="300ms">
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="img/core-img/p1.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="img/core-img/p2.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="img/core-img/p3.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="img/core-img/p4.png" alt=""></a>
                        <!-- Single Partner Logo -->
                        <a href="#" class="partner-logo"><img src="img/core-img/p5.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   <script type="text/javascript">
   function rep_a(idCmt){  
	   $(".form_rep"+idCmt).slideToggle();
	}

   function doCommentRep(idCmt,idLand){  
		var temp_idCmt = idCmt;
		var temp_idLand = idLand;
		var temp_ten = $(".ten_rep"+idCmt).val();
		var temp_email = $(".email_rep"+idCmt).val();
		var temp_cmt = $(".cmt_rep"+idCmt).val();
		$(".ten_rep"+idCmt).val('');
		$(".email_rep"+idCmt).val('');
		$(".cmt_rep"+idCmt).val('');
		console.log(temp_ten)
		console.log(temp_email)
		console.log(temp_cmt)
		// nếu gán dữ liệu thì val('dkfjs')
		$.ajax({
			url:'${pageContext.request.contextPath }/reply',
			type: 'POST',
			cache: false,
			data:{
					idC: temp_idCmt,//temp file tạm// chú ý dấu , 
					name: temp_ten,
					email: temp_email,
					cmt: temp_cmt,
					idL:temp_idLand,
					
					},
			success: function(data){// lấy dữ liệu về data// từ server gửi về data
				// Xử lý thành công
				$('.repLand_'+temp_idCmt).html(data);//truy cập đến thẻ mẹ là .ajax-data
				console.log(temp_ten)
			},
			error: function (){
			// Xử lý nếu có lỗi
			alert("Vui lòng chọn !");
			//alert('Có lỗi xảy ra');
			}
		});
	}
    function doComment1(){  
		var temp_ten = $(".ten").val();
		var temp_email = $(".email").val();
		var temp_id = ${getItem.id};
		var temp_cmt = $(".cmt").val();
		
		$(".ten").val('');
		$(".email").val('');
		$(".cmt").val('');
		console.log(temp_cmt)
		// nếu gán dữ liệu thì val('dkfjs')
		$.ajax({
			url:'${pageContext.request.contextPath }/detail',
			type: 'POST',
			cache: false,
			data:{
					//Dữ liệu gửi đi
					id: temp_id,//temp file tạm// chú ý dấu , 
					name: temp_ten,
					email: temp_email,
					cmt: temp_cmt,
					
					},
			success: function(data){// lấy dữ liệu về data// từ server gửi về data
				// Xử lý thành công
				$('.binhluan').html(data);//truy cập đến thẻ mẹ là .ajax-data
				
			},
			error: function (){
			// Xử lý nếu có lỗi
			alert("Vui lòng chọn !");
			//alert('Có lỗi xảy ra');
			}
		});
	}
    
   
	</script>
    <!-- Partner Area End -->

