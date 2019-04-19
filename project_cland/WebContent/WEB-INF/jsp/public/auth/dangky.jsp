<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@include file = "/templates/taglib.jsp" %>

 <div class=" login-dangky roberto-rooms-area section-padding-100-0 ">
            <div class="row">
				<div class="dky" style="background:url(${defines.urlPublic}/img/customLogo.gif) no-repeat;" >
					<h1 class="w3ls">WELCOME</h1>
					<div class="content-w3ls  back-form">
						<div class="content-agile1">
							<h2 class="agileits1" style="background: url(${defines.urlPublic}/img/content.jpg) no-repeat; height: 630px;">Official</h2>
						</div>
						<div class="content-agile2">
							<form action="javascript:void()" method="post">
								<div class="form-control-dk w3layouts"> 
									<input type="text" id="firstname" name="firstname" placeholder="Họ Tên" title="Please enter your First Name" required="">
								</div>
					
								<div class="form-control-dk w3layouts">	
									<input type="email" id="email" name="email" placeholder="mail@example.com" title="Please enter a valid email" required="">
								</div>
								
								<div class="form-control-dk w3layouts"> 
									<input type="text" id="phone" name="phone" placeholder="Số điện thoại " title="Please enter your Phone" required="">
								</div>
								
								<div class="form-control-dk w3layouts"> 
									<input type="text" id="username" name="username" placeholder="Username" title="Please enter your Username" required="">
								</div>
					
								<div class="form-control-dk agileinfo">	
									<input type="password" class="lock" name="password" placeholder="Password" id="password1" required="">
								</div>	
					
								<div class="form-control-dk agileinfo">	
									<input type="password" class="lock" name="confirm-password" placeholder="Confirm Password" id="password2" required="">
								</div>			
								
								<input type="submit" onclick="register_dk()" class="register" value="Register" >
							</form>
							<script type="text/javascript">
								window.onload = function () {
									document.getElementById("password1").onchange = validatePassword;
									document.getElementById("password2").onchange = validatePassword;
								}
								function validatePassword(){
									var pass2=document.getElementById("password2").value;
									var pass1=document.getElementById("password1").value;
									if(pass1!=pass2)
										document.getElementById("password2").setCustomValidity("Passwords Don't Match");
									else
										document.getElementById("password2").setCustomValidity('');	 
										//empty string means no validation error
								}
							</script>
							<p class="wthree w3l">Đăng ký để được đăng tin miễn phí</p>
							<ul class="social-agileinfo wthree2">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-youtube"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				
			</div>
			<!-- end dky -->
			<div class="ketqua-register">
				<%-- <div class="header-msg">
				<div class="container-msg">
						<h4 class="thongbao">Thông báo </h4>
						<p class="msg">Tài khoản đã có người sử dụng  </p>
						<a href="${pageContext.request.contextPath }/dang-ky" class="btn btn-metis-5 xacnhan"> Xác nhận </a>
				</div>
				</div> --%>
			</div>
	</div>
</div>
<script type = "text/javascript">
function register_dk(){  
	var temp_ten = $("input[name='firstname']").val();
	console.log(temp_ten)
	var temp_email = $("input[name='email']").val();
	var temp_phone = $("input[name='phone']").val();
	var temp_username = $("input[name='username']").val();
	var temp_password = $("input[name='password']").val();
	
	if (temp_ten=''||temp_email==''||temp_phone=''||temp_username==''||temp_password='') {
		alert("Vui lòng nhập các trường !");
	}else{
		$.ajax({
			url:'${pageContext.request.contextPath }/dang-ky',
			type: 'POST',
			cache: false,
			data:{
					//Dữ liệu gửi đi
					ten: temp_ten,//temp file tạm// chú ý dấu , 
					email: temp_email,
					phone:temp_phone,
					username :temp_username,
					password:temp_password,
					},
			success: function(data){// lấy dữ liệu về data// từ server gửi về data
				// Xử lý thành công
				$('.ketqua-register').html(data);
				$("input[name='firstname']").val('');
				$("input[name='email']").val('');
				$("input[name='phone']").val('');
				$("input[name='username']").val('');
				 $("input[name='password']").val('');
				
			},
			error: function (){
			// Xử lý nếu có lỗi
			alert("Lỗi !");
			//alert('Có lỗi xảy ra');
			}
		});
	}	
}

</script>
