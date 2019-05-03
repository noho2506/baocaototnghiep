<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

                  
                <div id="content">
                    <div class="outer">
                        <div class="inner bg-light lter">
                            <div class="text-center">
</div>
<hr>
<div class="text-center">

    <a class="quick-btn" href="#">
	<i class="fa fa-bolt fa-2x"></i>
	<span>Danh mục </span>
	<span class="label label-default">${countCat}</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-check fa-2x"></i>
	<span>Đất bán </span>
	<span class="label label-danger">${countLand }</span>
    </a>
    <a class="quick-btn" href="#">
	<i class=" fa fa-bank fa-2x"></i>
	<span>Dự án</span>
	<span class="label label-danger">${countProject }</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-envelope fa-2x"></i>
	<span>Kiến thức</span>
	<span class="label label-success">${countKnow }</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-signal fa-2x"></i>
	<span>Tin tức</span>
	<span class="label label-warning">${countNews }</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-bolt fa-2x"></i>
	<span>Liên hệ </span>
	<span class="label btn-metis-2">${countContact }</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-lemon-o fa-2x"></i>
	<span>Quảng cáo</span>
	<span class="label btn-metis-4">${countAdv }</span>
    </a>
    <a class="quick-btn" href="#">
	<i class="fa fa-glass fa-2x"></i>
	<span>Người dùng</span>
	<span class="label btn-metis-3">${countUser }</span>
    </a>

</div>
<hr>
<div class="row">
    <div class="col-lg-8">
	<div class="box">
	    <header>
		<h5>Line Chart</h5>
	    </header>
	    <div class="body" id="trigo" style="height: 250px;"></div>
	</div>
    </div>
    <div class="col-lg-4">
	<div class="box">
	    <div class="body">
		<table class="table table-condensed table-hovered sortableTable">
		    <thead>
			<tr>
			    <th>Tháng <i class="fa"></i></th>
			    <th>Đất bán<i class="fa "></i></th>
			    <th>Dự án <i class="fa "></i></th>
			    <th>Tin tức <i class="fa "></i></th>
			    <th>Kiến thức<i class="fa "></i></th>
			</tr>
		    </thead>
		    <tbody>
			<c:forEach begin="1" end="12" var="i">
				<tr <c:if test="${i%2 ==0}">class="danger"</c:if>>
				    <td>${i }</td>
				    <td>${landDAO.getCount(i) }</td>
				   <td>${projectDAO.getCount(i) }</td>
				    <td>${newsDAO.getCount(i)}</td>
				   <td>${knowDAO.getCount(i)}</td>
				</tr>
			</c:forEach>
		    </tbody>
		</table>
	    </div>
	</div>
    </div>
</div>
<hr>

                        </div>
                        <!-- /.inner -->
                    </div>
                    <!-- /.outer -->
                </div>
                <!-- /#content -->
                    
                    <!-- /#right -->
            </div>
            
            <!-- /#wrap -->
          <script type="text/javascript">
          var land=${tinLand};
          var project=${tinPro};
          var news=${tinNews};
          var know=${tinKnow};
          console.log(land)
          Highcharts.chart('trigo', {
        	  chart: {
        	    type: 'spline'
        	  },
        	  title: {
        	    text: 'Thống kê số lượng bài đăng - Năm 2019'
        	  },
        	  xAxis: {
        	    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        	      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        	  },
        	  yAxis: {
        	    title: {
        	      text: 'Số tin '
        	    },
        	  },
        	  tooltip: {
        	    crosshairs: true,
        	    shared: true
        	  },
        	  plotOptions: {
        	    spline: {
        	      marker: {
        	        radius: 4,
        	        lineColor: '#666666',
        	        lineWidth: 1
        	      }
        	    }
        	  },
        	  series: [{
        	    name: 'Đất bán',
        	    marker: {
        	      symbol: 'square'
        	    },
        	    data: land

        	  }, {
        	    name: 'Dự án',
        	    marker: {
        	      symbol: 'diamond'
        	    },
        	    data: project
        	  }, {
        	    name: 'Tin tức',
        	    marker: {
        	      symbol: 'diamond'
        	    },
        	    data: news
        	  }, {
        	    name: 'Kiến thức',
        	    marker: {
        	      symbol: 'diamond'
        	    },
        	    data: know
        	  }]
        	});
          </script>  
