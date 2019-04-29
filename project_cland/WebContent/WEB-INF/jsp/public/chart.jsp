<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/templates/taglib.jsp" %>
    <script type = "text/javascript" src = "${defines.getUrlPublic() }/js/highcharts.js"></script>
   <!--  <script src="https://code.highcharts.com/highcharts.js"></script> -->
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style>
table, th, td {
  border: 1px solid #1cc3b2;
  border-collapse: collapse;
}
tr{
text-align: center;}
th{
    padding: 10px 29px;
    color: #fff;
    font-weight: bold;
    background-color: #212529;}
td{
text-align: center;}
</style>
    <!-- Rooms Area Start -->
    <div class="roberto-rooms-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-9">
                <c:if test="${not empty msg }">
			      <div class="alert alert-success">
					<strong>${msg }</strong>
				</div>
				</c:if>
                <c:choose>
                	<c:when test="${chitieu==1 && thongketheo ==1}">
                		<div id="dientich"></div>
                		<script type="text/javascript">
                		var a =${getMap.values()};
                		var b =${getMap.keySet()};
                		console.log(b)
							Highcharts.chart('dientich', {
								  chart: {
								    type: 'column'
								  },
								  title: {
								    text: 'Tổng diện tích đất trống theo khu vực - Năm ${year} - Loại đất: ${cat.name}'
								  },
								  xAxis: {
									  categories:[ 
									    	<c:forEach var="reportName" items="${getMap.keySet()}">
									    	"${reportName}",
									    	</c:forEach>],
								    	 title: {
								   	      text: 'Khu vực '
								   	    }
								  },
								  yAxis: {
								    min: 0,
								    title: {
								      text: 'Tổng diện tích'
								    },
								  },
								  tooltip: {
								    headerFormat: '<b>{point.x}</b><br/>',
								    pointFormat: '{series.name}: {point.y}<br/>'
								  },
								  plotOptions: {
								    column: {
								      stacking: 'normal',
								      dataLabels: {
								        enabled: true,
								        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
								      }
								    }
								  },
								  series: [{
									  name: 'Năm ${year}',
								      data: a
									  
								  }]
								});
							</script>
                		<div style="width:100%;margin: 50px 0px">
                			<table >
							  <tr>
							    <th>STT</th>
							    <th>Quận</th> 
							    <th>Diện tích đất bán </th>
							  </tr>
							  <c:set var="i" value="0"></c:set>
							  <c:forEach items="${getMap}" var="objM">
							  <c:set var="a" value="${i=i+1}"></c:set>
							  	 <tr>
							    <td>${a}</td>
							    <td>${objM.key}</td>
							    <td>${objM.value}</td>
							  </tr>
							  </c:forEach>
							</table>
                		</div>
                	</c:when>
                	<c:when test="${chitieu==2 && thongketheo==1}">
                		<div id="mucgia"></div>
                		<script type="text/javascript">
                		var nam=${year};
                		var namecat = '${cat.name}';
                		var a = ${geta.values()};
                		var b = ${getb.values()};
                		var c = ${getc.values()};
                		var d = ${getd.values()};
                		var e = ${gete.values()};
                		/* var a = ${geta.keySet()}
                		for (let b of a) {
                			
                			console.log("b")
						} */
							Highcharts.chart('mucgia', {
								  chart: {
								    type: 'column'
								  },
								  title: {
									  text: 'Thống kê mức giá theo khu vực -Năm '+nam+ '- Loại đất ' +namecat
								  },
								  xAxis: {
									  categories:[ 
									    	<c:forEach var="reportName" items="${geta.keySet()}">
									    	"${reportName}",
									    	</c:forEach>],
								    title: {
								        text: 'Khu vực '
								      }
								  },
								  yAxis: {
								    min: 0,
								    title: {
								      text: 'Số tin đăng bán '
								    }
								  },
								  tooltip: {
								    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
								    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
								      '<td style="padding:0"><b>{point.y} tin</b></td></tr>',
								    footerFormat: '</table>',
								    shared: true,
								    useHTML: true
								  },
								  plotOptions: {
								    column: {
								      pointPadding: 0.2,
								      borderWidth: 0
								    }
								  },
								  series: [{
									    name: 'Từ 400 - 1 Tỷ VNĐ',
									    data: a
							
									  },{
								    name: 'Từ 1 - 4 Tỷ VNĐ',
								    data: b
							
								  }, {
								    name: 'Từ 4 - 8 Tỷ VNĐ',
								    data: c
							
								  }, {
								    name: 'Lớn hơn 8 Tỷ',
								    data: d
							
								  },{
								    name: 'Loại khác',
								    data: e
								
									 }]
								});
						
							</script>
                		
                		<div style="width:100%;margin: 50px 0px">
                			<table >
							  <tr>
							    <!-- <th>STT</th> -->
							     <th>Khu vực </th> 
							    <th>Từ 400 --> 1 Tỷ</th> 
							    <th>Từ 1 --> 4 Tỷ</th>
							    <th>Từ 4 --> 8 Tỷ</th>
							    <th>>= 8 Tỷ</th>
							    <th>Loại khác</th>
							  </tr>
							  <tr>
							  <c:forEach items="${distric }" var="obj">
							  	<tr>
								  	<td>${obj.name }</td>
								  	<c:forEach items="${getPrice.keySet()}" var="objGia">
								  		<td>${landDAO.getThongKeGia(obj.id,cat.id,year,objGia) }</td>
								  	</c:forEach>
							  	</tr>
							  </c:forEach>
							  </tr>
							</table>
                		</div>
                	</c:when>
                	<c:when test="${(chitieu==3&& thongketheo==1) || (chitieu==4&& thongketheo==1)}">
                		<div id="sotin"></div>
                		<script type="text/javascript">
						var a = ${getMap.values()};
						Highcharts.chart('sotin', {
							title: {
							    text: 'Tổng bài đăng của ${cat.name} theo khu vực - Năm ${year}'
							  },
						    xAxis: {
						    	categories:[" ", 
						    	<c:forEach var="reportName" items="${getMap.keySet()}">
						    	"${reportName}",
						    	</c:forEach>],
						    	 title: {
						   	      text: 'Khu vực '
						   	    }
						    },
						    yAxis: {
						        title: {
						            text: 'Tin đất bán'
						        }
						    },
					
						    plotOptions: {
						        series: {
						            label: {
						                connectorAllowed: false
						            },
						            pointStart: 1
						        }
						    },
					
						    series: [ {
						        name: 'Năm ${year}',
						        data: a
						    }],
					
						    responsive: {
						        rules: [{
						            condition: {
						                maxWidth: 500
						            },
						            chartOptions: {
						                legend: {
						                    layout: 'horizontal',
						                    align: 'center',
						                    verticalAlign: 'bottom'
						                }
						            }
						        }]
						    }
						});
					
					
					</script>
                		<div style="width:100%;margin: 50px 0px">
                			<table >
							  <tr>
							    <th>STT</th>
							    <th>Quận</th> 
							    <th>Số tin </th>
							  </tr>
							  <c:set var="i" value="0"></c:set>
							  <c:forEach items="${getMap}" var="objM">
							  <c:set var="a" value="${i=i+1}"></c:set>
							  	 <tr>
							    <td>${a}</td>
							    <td>${objM.key}</td>
							    <td>${objM.value}</td>
							  </tr>
							  </c:forEach>
							</table>
                		</div>
                	</c:when>
                	<c:when test="${chitieu==1 && thongketheo==2}">
                		<div id="dientich2"></div>
                		<script type="text/javascript">
                		var nam=${year};
                		var nameQuan = '${quan.name}';
                		var a = ${geta.values()};
                		var b = ${getb.values()};
                		var c = ${getc.values()};
                		var d = ${getd.values()};
                		var e = ${gete.values()};
							
							Highcharts.chart('dientich2', {
							    chart: {
							        type: 'column'
							    },
							    title: {
							        text: 'Thống kê diện tích  theo loại đất  -Năm '+nam+ '- Tại khu vực ' +nameQuan
							    },
							    xAxis: {
							        categories: [<c:forEach var="reportName" items="${geta.keySet()}">
							    	"${reportName}",
							    	</c:forEach>],
							    },
							    yAxis: {
							        min: 0,
							        title: {
							            text: 'Tổng diện tích'
							        },
							        stackLabels: {
							            enabled: true,
							            style: {
							                fontWeight: 'bold',
							                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
							            }
							        }
							    },
							    legend: {
							        align: 'right',
							        x: -30,
							        verticalAlign: 'top',
							        y: 25,
							        floating: true,
							        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
							        borderColor: '#CCC',
							        borderWidth: 1,
							        shadow: false
							    },
							    tooltip: {
							        headerFormat: '<b>{point.x}</b><br/>',
							        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
							    },
							    plotOptions: {
							        column: {
							            stacking: 'normal',
							            dataLabels: {
							                enabled: true,
							                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
							            }
							        }
							    },
							    series: [{
								    name: '30- 100 m2',
								    data: a
						
								  },{
							    name: '100-250 m2',
							    data: b
						
							  }, {
							    name: '250-500 m2',
							    data: c
						
							  }, {
							    name: '500-1000 m2',
							    data: d
						
							  },{
							    name: '>=1000 m2',
							    data: e
							
								 }]
							});
							</script>
                		
                		<div style="width:100%;margin: 50px 0px">
                			<table >
							  <tr>
							    <!-- <th>STT</th> -->
							     <th>Mức diện tích</th> 
							    <th>Từ 30 - 100 m2</th> 
							    <th>Từ 100-250 m2</th>
							    <th>Từ 250-500 m2</th>
							    <th>Từ 500-1000 m2</th>
							    <th>>=1000 m2</th>
							  </tr>
							  <tr>
							  <c:forEach items="${listCat }" var="obj">
							  	<tr>
								  	<td>${obj.name }</td>
								  	<c:forEach items="${getArea.keySet()}" var="objPrice">
								  		<td>${defines.getTongDienTich(landDAO.getDienTich(obj.id,year,quan.id,objPrice)) }</td>
								  	</c:forEach>
							  	</tr>
							  </c:forEach>
							  </tr>
							</table>
                		</div>
                	</c:when>
                	<c:when test="${chitieu==2 && thongketheo==2}">
                		<div id="mucgia2"></div>
                		<script type="text/javascript">
                		var nam=${year};
                		var nameQuan = '${quan.name}';
                		var a = ${geta.values()};
                		var b = ${getb.values()};
                		var c = ${getc.values()};
                		var d = ${getd.values()};
                		var e = ${gete.values()};
							Highcharts.chart('mucgia2', {
								  chart: {
								    type: 'column'
								  },
								  title: {
									  text: 'Thống kê mức giá theo loại đất  -Năm '+nam+ '- Tại khu vực ' +nameQuan
								  },
								  xAxis: {
									  categories:[ 
									    	<c:forEach var="reportName" items="${geta.keySet()}">
									    	"${reportName}",
									    	</c:forEach>],
								    title: {
								        text: 'Loại đất '
								      }
								  },
								  yAxis: {
								    min: 0,
								    title: {
								      text: 'Số tin đăng bán '
								    }
								  },
								  tooltip: {
								    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
								    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
								      '<td style="padding:0"><b>{point.y} tin</b></td></tr>',
								    footerFormat: '</table>',
								    shared: true,
								    useHTML: true
								  },
								  plotOptions: {
								    column: {
								      pointPadding: 0.2,
								      borderWidth: 0
								    }
								  },
								  series: [{
									    name: 'Từ 400 - 1 Tỷ VNĐ',
									    data: a
							
									  },{
								    name: 'Từ 1 - 4 Tỷ VNĐ',
								    data: b
							
								  }, {
								    name: 'Từ 4 - 8 Tỷ VNĐ',
								    data: c
							
								  }, {
								    name: 'Lớn hơn 8 Tỷ',
								    data: d
							
								  },{
								    name: 'Loại khác',
								    data: e
								
									 }]
								});
							</script>
                		
                		<div style="width:100%;margin: 50px 0px">
                			<table >
							  <tr>
							    <!-- <th>STT</th> -->
							     <th>Khu vực </th> 
							    <th>Từ 400 --> 1 Tỷ</th> 
							    <th>Từ 1 --> 4 Tỷ</th>
							    <th>Từ 4 --> 8 Tỷ</th>
							    <th>>= 8 Tỷ</th>
							    <th>Loại khác</th>
							  </tr>
							  <tr>
							  <c:forEach items="${listCat }" var="obj">
							  	<tr>
								  	<td>${obj.name }</td>
								  	<c:forEach items="${getPrice.keySet()}" var="objGia">
								  		<td>${landDAO.countTinMucGia(quan.id,obj.id,year,objGia) }</td>
								  	</c:forEach>
							  	</tr>
							  </c:forEach>
							  </tr>
							</table>
                		</div>
                	</c:when>
                	<c:when test="${chitieu==3 && thongketheo==2}">
                		<div id="sotin2"></div>
                		<script type="text/javascript">
                		var nam=${year};
                		var nameQuan = '${quan.name}';
                		Highcharts.chart('sotin2', {
                		    chart: {
                		        plotBackgroundColor: null,
                		        plotBorderWidth: null,
                		        plotShadow: false,
                		        type: 'pie'
                		    },
                		    title: {
                		        text: 'Phần trăm số tin theo loại đất -Năm '+nam+' tại khư vực '+nameQuan
                		    },
                		    tooltip: {
                		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                		    },
                		    plotOptions: {
                		        pie: {
                		            allowPointSelect: true,
                		            cursor: 'pointer',
                		            dataLabels: {
                		                enabled: true,
                		                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                		                style: {
                		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                		                }
                		            }
                		        }
                		    },
                		    series: [{
                		        name: 'Brands',
                		        colorByPoint: true,
                		        data: [
                		        	<c:forEach var="reportName" items="${getMapSoTin.keySet()}">
                		        	{
                    		            name:'${reportName}',
                    		            y: ${getMapSoTin.get(reportName)},
                    		        },
							    	</c:forEach>],
                		        	
                		        
                		    }]
                		});
						
					</script>
                		<div style="width:100%;margin: 50px 0px">
                			<table >
							  <tr>
							    <th>STT</th>
							    <th>Loại đất</th> 
							    <th>Số tin </th>
							  </tr>
							  <c:set var="i" value="0"></c:set>
							  <c:forEach items="${getMapSoTin}" var="objM">
							  <c:set var="a" value="${i=i+1}"></c:set>
							  	 <tr>
							    <td>${a}</td>
							    <td>${objM.key}</td>
							    <td>${objM.value}%</td>
							  </tr>
							  </c:forEach>
							</table>
                		</div>
                	</c:when>
                	<c:when test="${chitieu==4 && thongketheo==2}">
                		<div id="daban"></div>
                		<script type="text/javascript">
                		var nam=${year};
                		var nameQuan = '${quan.name}';
                		var a = ${geta.values()};
                		var b = ${getb.values()};
                		var c = ${getc.values()};
                		var d = ${getd.values()}; 
                		Highcharts.chart('daban', {
                		    chart: {
                		        type: 'column'
                		    },
                		    title: {
                		        text: 'Số lượng bán theo loại đất -Năm '+nam + 'Tại khu vực'+nameQuan
                		    },
                		    xAxis: {
                		    	categories: [
                		            'Jan',
                		            'Feb',
                		            'Mar',
                		            'Apr',
                		            'May',
                		            'Jun',
                		            'Jul',
                		            'Aug',
                		            'Sep',
                		            'Oct',
                		            'Nov',
                		            'Dec'
                		        ],
                		        crosshair: true
                		    },
                		    yAxis: {
                		        min: 0,
                		        title: {
                		            text: 'Số lượng bán '
                		        },
                		        stackLabels: {
                		            enabled: true,
                		            style: {
                		                fontWeight: 'bold',
                		                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                		            }
                		        }
                		    },
                		    legend: {
                		        align: 'right',
                		        x: -30,
                		        verticalAlign: 'top',
                		        y: 25,
                		        floating: true,
                		        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
                		        borderColor: '#CCC',
                		        borderWidth: 1,
                		        shadow: false
                		    },
                		    tooltip: {
                		        headerFormat: '<b>{point.x}</b><br/>',
                		        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
                		    },
                		    plotOptions: {
                		        column: {
                		            stacking: 'normal',
                		            dataLabels: {
                		                enabled: true,
                		                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                		            }
                		        }
                		    },
                		    series: [{
                		        name: 'Đất thổ cư',
                		        data: a
                		    }, {
                		        name: 'Đất nông nghiệp ',
                		        data: b
                		    }, {
                		        name: 'Đất công nghiệp',
                		        data: c
                		    }, {
                		        name: 'Đất khác',
                		        data: d
                		    }]
                		});
							</script>
                		
                		<div style="width:100%;margin: 50px 0px">
                			<table >
							  <tr>
							    <!-- <th>STT</th> -->
							     <th>Loại đất</th> 
							     <c:forEach items="${listCat }" var="obj">
							   		 <th>${obj.name}</th> 
							   	</c:forEach>
							    
							  </tr>
							 <c:forEach begin="1" end="12" var="i">
								 <tr>
								      	<td>Tháng ${i }</td>
								      	<c:forEach items="${listCat }" var="obj">
									   		 <td>${landDAO.countTinDangDaBan(quan.id,obj.id,year,i)}</td> 
									   	</c:forEach>
								</tr>
							  </c:forEach>
							</table>
                		</div>
                	</c:when>
                	<c:when  test="${chitieu==1 && thongketheo==3}">
                		<div id="dientich3"></div>
                		<script type="text/javascript">
	                		var namCat='${cat.name}';
	                		var nameQuan = '${quan.name}';
	                		var a = ${geta.values()};
	                		var b = ${getb.values()};
	                		var c = ${getc.values()};
	                		var d = ${getd.values()}; 
	                		var e = ${gete.values()}; 
                		Highcharts.chart('dientich3', {
                		    chart: {
                		        type: 'column'
                		    },
                		    title: {
                		        text: 'Tổng diện tích đất theo các năm tại '+nameQuan +' - Loại '+namCat
                		    },
                		    xAxis: {
                		        categories: ['Năm 2016', 'Năm 2017', 'Năm 2018']
                		    },
                		    yAxis: {
                		        min: 0,
                		        title: {
                		            text: 'Tổng diện tích'
                		        },
                		        stackLabels: {
                		            enabled: true,
                		            style: {
                		                fontWeight: 'bold',
                		                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                		            }
                		        }
                		    },
                		    legend: {
                		        align: 'right',
                		        x: -30,
                		        verticalAlign: 'top',
                		        y: 25,
                		        floating: true,
                		        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
                		        borderColor: '#CCC',
                		        borderWidth: 1,
                		        shadow: false
                		    },
                		    tooltip: {
                		        headerFormat: '<b>{point.x}</b><br/>',
                		        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
                		    },
                		    plotOptions: {
                		        column: {
                		            stacking: 'normal',
                		            dataLabels: {
                		                enabled: true,
                		                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                		            }
                		        }
                		    },
                		    series: [{
                		        name: '30-100 m2',
                		        data: a
                		    }, {
                		        name: '100-250 m2',
                		        data: b
                		    }, {
                		        name: '250-500 m2',
                		        data: c
                		    }, {
                		        name: '500-1000 m2',
                		        data: d
                		    }, {
                		        name: '>= 1000 m2',
                		        data: e
                		    }]
                		});
                		</script>
                		<div style="width:100%;margin: 50px 0px">
                			<table >
							  <tr>
							    <!-- <th>STT</th> -->
							     <th>Mức diện tích</th> 
							    <th>Từ 30 - 100 m2</th> 
							    <th>Từ 100-250 m2</th>
							    <th>Từ 250-500 m2</th>
							    <th>Từ 500-1000 m2</th>
							    <th>>=1000 m2</th>
							  </tr>
							  <tr>
							  <c:forEach begin="2016" end="2018" var="i">
							  	<tr>
								  	<td>Năm ${i}</td>
								  	<c:forEach items="${getArea.keySet()}" var="objA">
								  		<td>${defines.getTongDienTich(landDAO.getDienTichNam(i,cat.id,quan.id,objA)) }</td>
								  	</c:forEach>
							  	</tr>
							  </c:forEach>
							  </tr>
							</table>
                		</div>
                	</c:when>
                	<c:when  test="${chitieu==2 && thongketheo==3}">
                		<div id="mucgia3"></div>
                		<script type="text/javascript">
	                		var tenCat='${cat.name}';
	                		var nameQuan = '${quan.name}';
	                		var a = ${geta.values()};
	                		var b = ${getb.values()};
	                		var c = ${getc.values()};
	                		var d = ${getd.values()}; 
	                		var e = ${gete.values()}; 
	                		Highcharts.chart('mucgia3', {

	                		    title: {
	                		        text: 'Số lượng tin theo mức giá , 2014-2018 tại khu vực '+nameQuan +'loai '+tenCat
	                		    },

	                		    

	                		    yAxis: {
	                		        title: {
	                		            text: 'số lượng tin '
	                		        }
	                		    },
	                		    legend: {
	                		        layout: 'vertical',
	                		        align: 'right',
	                		        verticalAlign: 'middle'
	                		    },

	                		    plotOptions: {
	                		        series: {
	                		            label: {
	                		                connectorAllowed: false
	                		            },
	                		            pointStart: 2014
	                		        }
	                		    },

	                		    series: [{
	                		        name: 'Từ 400-1 Tỷ VNĐ',
	                		        data: a
	                		    }, {
	                		        name: 'Từ 1 - 4 Tỷ VNĐ',
	                		        data: b
	                		    }, {
	                		        name: 'Từ 4 - 8 Tỷ VNĐ',
	                		        data: c
	                		    }, {
	                		        name: '>= 8 Tỷ VNĐ',
	                		        data: d
	                		    }, {
	                		        name: 'Loại khác',
	                		        data: e
	                		    }],

	                		    responsive: {
	                		        rules: [{
	                		            condition: {
	                		                maxWidth: 500
	                		            },
	                		            chartOptions: {
	                		                legend: {
	                		                    layout: 'horizontal',
	                		                    align: 'center',
	                		                    verticalAlign: 'bottom'
	                		                }
	                		            }
	                		        }]
	                		    }

	                		});
                		</script>
                		<div style="width:100%;margin: 50px 0px">
                			<table >
							  <tr>
							    <!-- <th>STT</th> -->
							     <th>Khu vực </th> 
							    <th>Từ 400 --> 1 Tỷ</th> 
							    <th>Từ 1 --> 4 Tỷ</th>
							    <th>Từ 4 --> 8 Tỷ</th>
							    <th>>= 8 Tỷ</th>
							    <th>Loại khác</th>
							  </tr>
							  <tr>
							  <c:forEach begin="2014" end="2018" var="i">
							  	<tr>
								  	<td>Năm ${i}</td>
								  	<c:forEach items="${getPrice.keySet()}" var="objP">
								  		<td>${landDAO.countTinMucGiaTH3(quan.id,i,cat.id,objP) }</td>
								  	</c:forEach>
							  	</tr>
							  </c:forEach>
							  </tr>
							</table>
                		</div>
                	</c:when>
                	<c:when test="${chitieu==4 && thongketheo==3}">
                		<div id="sotin3b"></div>
                		<script type="text/javascript">
                		/* var a= {${getMapSoTin.keySet()}}; */
                		var name='${cat.name}';
                		var nameQuan = '${quan.name}';
                		Highcharts.chart('sotin3b', {
                		    chart: {
                		        plotBackgroundColor: null,
                		        plotBorderWidth: null,
                		        plotShadow: false,
                		        type: 'pie'
                		    },
                		    title: {
                		        text: 'Phần trăm số tin theo loại đất ' +name+' tại khư vực '+nameQuan
                		    },
                		    tooltip: {
                		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                		    },
                		    plotOptions: {
                		        pie: {
                		            allowPointSelect: true,
                		            cursor: 'pointer',
                		            dataLabels: {
                		                enabled: true,
                		                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                		                style: {
                		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                		                }
                		            }
                		        }
                		    },
                		    series: [{
                		    	name: ' '+name + '- '+nameQuan ,
                		        colorByPoint: true,
                		        data: [
                		        	<c:forEach var="reportName" items="${getMapSoTin.keySet()}">
                		        	{
                    		            name:'${reportName}',
                    		            y: ${getMapSoTin.get(reportName)},
                    		        },
							    	</c:forEach>],
                		        	
                		        
                		    }]
                		});
						
					</script>
                		<div style="width:100%;margin: 30px 0px 20px 200px">
                			<table >
							  <tr>
							    <th>STT</th>
							    <th>Loại đất</th> 
							    <th>Số tin </th>
							  </tr>
							  <c:set var="i" value="0"></c:set>
							  <c:forEach items="${getMapSoTin}" var="objM">
							  <c:set var="a" value="${i=i+1}"></c:set>
							  	 <tr>
							    <td>${a}</td>
							    <td>${objM.key}</td>
							    <td>${objM.value}%</td>
							  </tr>
							  </c:forEach>
							</table>
                		</div>
                	</c:when>
                	<c:when test="${chitieu==3 && thongketheo==3}">
                		<div id="sotin3"></div>
                		<script type="text/javascript">
                		/* var a= {${getMapSoTin.keySet()}}; */
                		var name='${cat.name}';
                		var nameQuan = '${quan.name}';
                		Highcharts.chart('sotin3', {
                		    chart: {
                		        plotBackgroundColor: null,
                		        plotBorderWidth: null,
                		        plotShadow: false,
                		        type: 'pie'
                		    },
                		    title: {
                		        text: 'Phần trăm số tin đã bán theo loại đất ' +name+' tại khư vực '+nameQuan
                		    },
                		    tooltip: {
                		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                		    },
                		    plotOptions: {
                		        pie: {
                		            allowPointSelect: true,
                		            cursor: 'pointer',
                		            dataLabels: {
                		                enabled: true,
                		                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                		                style: {
                		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                		                }
                		            }
                		        }
                		    },
                		    series: [{
                		        name: ' '+name + '- '+nameQuan ,
                		        colorByPoint: true,
                		        data: [
                		        	<c:forEach var="reportName" items="${getMapSoTin.keySet()}">
                		        	{
                    		            name:'${reportName}',
                    		            y: ${getMapSoTin.get(reportName)},
                    		        },
							    	</c:forEach>],
                		        	
                		        
                		    }]
                		});
						
					</script>
                		<div style="width:100%;margin: 30px 0px 20px 200px">
                			<table >
							  <tr>
							    <th>STT</th>
							    <th>Loại đất</th> 
							    <th>Số tin </th>
							  </tr>
							  <c:set var="i" value="0"></c:set>
							  <c:forEach items="${getMapSoTin}" var="objM">
							  <c:set var="a" value="${i=i+1}"></c:set>
							  	 <tr>
							    <td>${a}</td>
							    <td>${objM.key}</td>
							    <td>${objM.value}%</td>
							  </tr>
							  </c:forEach>
							</table>
                		</div>
                	</c:when>
                	<c:otherwise>
                	</c:otherwise>
                </c:choose>
                </div>
                <div class="col-12 col-lg-3">
                    <!-- Hotel Reservation Area -->
                    <div class="hotel-reservation--area mb-100">
                        <form action="" method="POST">
                            <div class="form-group mb-30 " style="background: url(<%=request.getContextPath()%>/templates/public/img/chart-of-accounts.png) 1px 0px no-repeat;">
                                <label for="checkIn " class="label-form"> Thống kê theo </label>
                               <select name="thongketheo"  class=" show1 form-control" >
	                               <option value="0">---</option>
	                               <option value="1" <c:if test="${thongketheo==1}">selected = 'selected'</c:if>>Theo năm và Loại đất </option>
	                               <option value="2" <c:if test="${thongketheo==2}">selected = 'selected'</c:if>>Theo năm và khu vực </option>
	                               <option value="3" <c:if test="${thongketheo==3}">selected = 'selected'</c:if>>Theo khu vực và loại đất  </option>
                                </select>
                            </div>
                              <div class="form-group mb-30" style="background: url(<%=request.getContextPath()%>/templates/public/img/b.jpg) 1px 44px no-repeat;">
                               <label for="checkOut " class="label-form">Chỉ tiêu thống kê</label>
                                <select name="chitieu"class="form-control">
                                <c:set var="id" value="${chitieu}"></c:set>
                                	<option value="0">---</option>
                                	<option value="1" <c:if test="${id==1}">selected = 'selected'</c:if>>Tổng diện tích</option>
                                	<option value="2" <c:if test="${id==2}">selected = 'selected'</c:if> >Mức giá </option>
                                	<option value="3" <c:if test="${id==3}">selected = 'selected'</c:if> >Số tin đăng</option>
                                	<option value="4" <c:if test="${id==4}">selected = 'selected'</c:if> >Tin đã bán</option>
                                </select>
                            </div>
                            <div class="form-thongke-tieuchi">
                            <c:choose>
                            	<c:when test="${thongketheo==1 }">
	                            	<div class="form-group mb-30" style="background: url(<%=request.getContextPath()%>/templates/public/img/h.png) 1px 44px no-repeat;">
	                               		 <label for="checkOut " class="label-form">Năm </label>
	                                	<select name="year" class="form-control">
	                                	 <c:set var="year" value="${year}"></c:set>
	                                		<option value="0">---</option>
		                                    <option value="2019" <c:if test="${year==2019}">selected = 'selected'</c:if>>Năm 2019</option>
		                                    <option value="2018" <c:if test="${year==2018}">selected = 'selected'</c:if>>Năm 2018</option>
		                                    <option value="2017"  <c:if test="${year==2017}">selected = 'selected'</c:if>>Năm 2017</option>
		                                    <option value="2016" <c:if test="${year==2016}">selected = 'selected'</c:if>>Năm 2016</option>
		                                    
	                                	</select>
	                            	</div>
	                            	<div class="form-group mb-30" style="background: url(<%=request.getContextPath()%>/templates/public/img/d.png) 1px 42px no-repeat; ">
		                                <label for="checkIn " class="label-form">Loại đất</label>
		                               <select name="cat" class="form-control">
		                                <c:set var="cid" value="${cat.id }"></c:set>
		                               		<option value="0">--Chọn loại-- </option>
			                               	<c:forEach items="${listCat }" var="objC">
					                            <c:choose>
				                           			<c:when test="${objC.id == cid}">
				                           				<c:set var="selected" value="selected = 'selected'"></c:set>
					                           		</c:when>
					                           		<c:otherwise>
					                           			<c:set var="selected" value=""></c:set>
					                           		</c:otherwise>
				                           		</c:choose>
											   <option ${selected} value="${objC.id }">${objC.name }</option>
			                               	</c:forEach>
		                                </select>
		                            </div>
                            	</c:when>
                            	<c:when test="${thongketheo==2 }">
	                            	<div class="form-group mb-30" style="background: url(<%=request.getContextPath()%>/templates/public/img/h.png) 1px 44px no-repeat;">
		                               		 <label for="checkOut " class="label-form">Năm </label>
		                                	<select name="year" class="form-control">
		                                	 <c:set var="year" value="${year}"></c:set>
		                                		<option value="0">---</option>
			                                    <option value="2019" <c:if test="${year==2019}">selected = 'selected'</c:if>>Năm 2019</option>
			                                    <option value="2018" <c:if test="${year==2018}">selected = 'selected'</c:if>>Năm 2018</option>
			                                    <option value="2017"  <c:if test="${year==2017}">selected = 'selected'</c:if>>Năm 2017</option>
			                                    <option value="2016" <c:if test="${year==2016}">selected = 'selected'</c:if>>Năm 2016</option>
			                                    
		                                	</select>
		                            	</div>
		                            	<div class="form-group mb-30" style="background: url(<%=request.getContextPath()%>/templates/public/img/f.jpg) 1px 42px no-repeat; ">
			                                <label for="checkIn " class="label-form">Khu vực </label>
			                               <select name="id_district"  class="form-control">
			                               	<c:set var="qid" value="${quan.id }"></c:set>
			                                	<option value="0">---- Chọn ----</option>
				                                <c:forEach items="${listQuan }" var="objQ">
				                                 	<c:choose>
					                           			<c:when test="${objQ.id == qid}">
					                           				<c:set var="selected" value="selected = 'selected'"></c:set>
						                           		</c:when>
						                           		<c:otherwise>
						                           			<c:set var="selected" value=""></c:set>
						                           		</c:otherwise>
				                           			</c:choose>
											   <option ${selected} value="${objQ.id }">${objQ.name }</option>
				                                </c:forEach>
			                                </select>
			                            </div>
                            	</c:when>
                            	<c:when test="${thongketheo==3 }">
	                            	<div class="form-group mb-30" style="background: url(<%=request.getContextPath()%>/templates/public/img/f.jpg) 1px 42px no-repeat; ">
			                                <label for="checkIn " class="label-form">Khu vực </label>
			                               <select name="id_district"  class="form-control">
			                               	<c:set var="qid" value="${quan.id }"></c:set>
			                                	<option value="0">---- Chọn ----</option>
				                                <c:forEach items="${listQuan }" var="objQ">
				                                 	<c:choose>
					                           			<c:when test="${objQ.id == qid}">
					                           				<c:set var="selected" value="selected = 'selected'"></c:set>
						                           		</c:when>
						                           		<c:otherwise>
						                           			<c:set var="selected" value=""></c:set>
						                           		</c:otherwise>
				                           			</c:choose>
											   <option ${selected} value="${objQ.id }">${objQ.name }</option>
				                                </c:forEach>
			                                </select>
			                            </div>
	                            	<div class="form-group mb-30" style="background: url(<%=request.getContextPath()%>/templates/public/img/d.png) 1px 42px no-repeat; ">
		                                <label for="checkIn " class="label-form">Loại đất</label>
		                               <select name="cat" class="form-control">
		                                <c:set var="cid" value="${cat.id }"></c:set>
		                               		<option value="0">--Chọn loại-- </option>
			                               	<c:forEach items="${listCat }" var="objC">
					                            <c:choose>
				                           			<c:when test="${objC.id == cid}">
				                           				<c:set var="selected" value="selected = 'selected'"></c:set>
					                           		</c:when>
					                           		<c:otherwise>
					                           			<c:set var="selected" value=""></c:set>
					                           		</c:otherwise>
				                           		</c:choose>
											   <option ${selected} value="${objC.id }">${objC.name }</option>
			                               	</c:forEach>
		                                </select>
		                            </div>
                            	</c:when>
                		
                            	<c:otherwise></c:otherwise>
                            </c:choose>
                             
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn roberto-btn w-100">Lọc thông tin </button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
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
                       <!--  <a href="#" class="partner-logo"><img src="img/core-img/p1.png" alt=""></a>
                        Single Partner Logo
                        <a href="#" class="partner-logo"><img src="img/core-img/p2.png" alt=""></a>
                        Single Partner Logo
                        <a href="#" class="partner-logo"><img src="img/core-img/p3.png" alt=""></a>
                        Single Partner Logo
                        <a href="#" class="partner-logo"><img src="img/core-img/p4.png" alt=""></a>
                        Single Partner Logo
                        <a href="#" class="partner-logo"><img src="img/core-img/p5.png" alt=""></a> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Area End -->
    <script  type="text/javascript">

	 $('.show1').on('change', function() {
		var thongke = this.value;
		$.ajax({
			url:'${pageContext.request.contextPath }/tke',
			type: 'POST',
			cache: false,
			data:{
					idTK: thongke,//temp file tạm// chú ý dấu , 
					},
			success: function(data){// lấy dữ liệu về data// từ server gửi về data
				// Xử lý thành công
				$('.form-thongke-tieuchi').html(data);//truy cập đến thẻ mẹ là .ajax-data
			},
			error: function (){
			// Xử lý nếu có lỗi
			alert("Vui lòng chọn !");
			//alert('Có lỗi xảy ra');
			}
		});
	}); 
</script>
  