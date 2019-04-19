<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!-- Footer Area Start -->
    <footer class="footer-area section-padding-80-0">
        <!-- Main Footer Area -->
        <div class="main-footer-area">
            <div class="container">
                <div class="row align-items-baseline justify-content-between">
                    <!-- Single Footer Widget Area -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-footer-widget mb-80">
                            <!-- Footer Logo -->
                            <a href="#" class="footer-logo"><img src="img/core-img/logo2.png" alt=""></a>

                            <h4>+12 345-678-9999</h4>
                            <span>Info.colorlib@gmail.com</span>
                            <span>856 Cordia Extension Apt. 356, Lake Deangeloburgh, South Africa</span>
                        </div>
                    </div>

                    <!-- Single Footer Widget Area -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-footer-widget mb-80">
                            <!-- Widget Title -->
                            <h5 class="widget-title">Our Blog</h5>

                            <!-- Single Blog Area -->
                            <div class="latest-blog-area">
                                <a href="#" class="post-title">Freelance Design Tricks How</a>
                                <span class="post-date"><i class="fa fa-clock-o" aria-hidden="true"></i> Jan 02, 2019</span>
                            </div>

                            <!-- Single Blog Area -->
                            <div class="latest-blog-area">
                                <a href="#" class="post-title">Free Advertising For Your Online</a>
                                <span class="post-date"><i class="fa fa-clock-o" aria-hidden="true"></i> Jan 02, 2019</span>
                            </div>
                        </div>
                    </div>

                    <!-- Single Footer Widget Area -->
                    <div class="col-12 col-sm-4 col-lg-2">
                        <div class="single-footer-widget mb-80">
                            <!-- Widget Title -->
                            <h5 class="widget-title">Links</h5>

                            <!-- Footer Nav -->
                            <ul class="footer-nav">
                                <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> About Us</a></li>
                                <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Our Room</a></li>
                                <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> Career</a></li>
                                <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i> FAQs</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Single Footer Widget Area -->
                    <div class="col-12 col-sm-8 col-lg-4">
                        <div class="single-footer-widget mb-80">
                            <!-- Widget Title -->
                            <h5 class="widget-title">Subscribe Newsletter</h5>
                            <span>Subscribe our newsletter gor get notification about new updates.</span>

                            <!-- Newsletter Form -->
                            <form action="index.html" class="nl-form">
                                <input type="email" class="form-control" placeholder="Enter your email...">
                                <button type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Copywrite Area -->
        <div class="container">
            <div class="copywrite-content">
                <div class="row align-items-center">
                    <div class="col-12 col-md-8">
                        <!-- Copywrite Text -->
                        <div class="copywrite-text">
                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <!-- Social Info -->
                        <div class="social-info">
                            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Area End -->

    <!-- **** All JS Files ***** -->
    <!-- jQuery 2.2.4 -->
   <%--  <script src="<%=request.getContextPath() %>/templates/public/js/jquery.min.js"></script> --%>
    <!-- Popper -->
    <script src="<%=request.getContextPath() %>/templates/public/js/popper.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=request.getContextPath() %>/templates/public/js/bootstrap.min.js"></script>
    <!-- All Plugins -->
    <script src="<%=request.getContextPath() %>/templates/public/js/roberto.bundle.js"></script>
    <!-- Active -->
    <script src="<%=request.getContextPath() %>/templates/public/js/default-assets/active.js"></script>


  <script src="<%=request.getContextPath() %>/templates/public/js/slick.js" type="text/javascript" charset="utf-8"></script>
	  <!-- Magnific Popup core JS file -->
		<script src="<%=request.getContextPath() %>/templates/public/js/jquery.magnific-popup.min.js"></script>
		<%-- <script type = "text/javascript" src = "${defines.getUrlPublic() }/js/jquery-3.2.1.min.js"></script> --%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script type = "text/javascript" src = "${defines.getUrlPublic() }/js/jquery.validate.min.js"></script>
  
  <script type="text/javascript">
    $(document).ready(function() {
    	$('.image-popup-no-margins').magnificPopup({
    		type: 'image',
    		closeOnContentClick: true,
    		closeBtnInside: false,
    		fixedContentPos: true,
    		mainClass: 'mfp-no-margins mfp-with-zoom', // class to remove default margin from left and right side
    		image: {
    			verticalFit: true
    		},
    		zoom: {
    			enabled: true,
    			duration: 300 // don't foget to change the duration also in CSS
    		}
    	});
	});
	
</script>
<!-- Magnific Popup core JS file -->
<script src="<%=request.getContextPath() %>/templates/public/js/main.js"></script>
<script src="<%=request.getContextPath() %>/templates/public/js/scroll.js"></script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
 <script type="text/javascript" src="${defines.getUrlPublic() }/js/moment.js"></script>
      <script type="text/javascript" src="${defines.getUrlPublic() }/js/daterangepicker.js"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
</body>

</html>
