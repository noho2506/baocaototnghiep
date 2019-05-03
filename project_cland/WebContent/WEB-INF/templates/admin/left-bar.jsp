<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file = "/templates/taglib.jsp" %>
    <div>
  <div id="left">
                        <div class="media user-media bg-dark dker">
                            <div class="user-media-toggleHover">
                                <span class="fa fa-user"></span>
                            </div>
                            <div class="user-wrapper bg-dark">
                                <a class="user-link" href="">
                                    <img class="media-object img-thumbnail user-img" alt="User Picture" src="${defines.urlAdmin}/assets/img/dic.png">
                                    <span class="label label-danger user-label">8</span>
                                </a>
                        
                                <div class="media-body">
                                    <h5 class="media-heading">${userLogin.firstname }</h5>
                                    <ul class="list-unstyled user-info">
                                        <li><a href="">Administrator</a></li>
                                        <li>Last Access : <br>
                                            <small><i class="fa fa-calendar"></i>&nbsp;<fmt:formatDate type="both" pattern="dd MMM hh:mm" value="${date }" var="a"></fmt:formatDate> ${a }</small>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- #menu -->
                        <ul id="menu" class="bg-blue dker " >
                                  <li class="nav-header">Menu</li>
                                  <li class="nav-divider"></li>
                                  <li >
                                    <a <c:if test="${ not empty active}">class="act"</c:if> href="${pageContext.request.contextPath }/admin/cats">
                                      <i class="fa fa-table"></i>
                                      <span class="link-title ">Danh Mục </span>
                                    </a>
                                  </li>
                                  <%-- <li>
                                    <a href="${pageContext.request.contextPath }/admin/lands">
                                      <i class="fa fa-landmark"></i>
                                      <span class="link-title">Đất Bán</span>
                                    </a>
                                  </li> --%>
                                  <li class="">
                                    <a <c:if test="${ not empty active5}">class="act"</c:if> href="javascript:;">
                                      <i class="fa fa-landmark"></i>
                                      <span class="link-title">Đất Bán</span>
                                      <span class="fa arrow"></span>
                                    </a>
                                    <ul class="collapse">
                                      <li>
                                        <a href="${pageContext.request.contextPath }/admin/lands">
                                          <i class="fa fa-angle-right"></i>&nbsp; Admin</a>
                                      </li>
                                      <li>
                                        <a href="${pageContext.request.contextPath }/admin/lands/user">
                                          <i class="fa fa-angle-right"></i>&nbsp; Thành viên  </a>
                                      </li>
                                    </ul>
                                  </li>
                                  <li>
                                    <a <c:if test="${ not empty active7}">class="act"</c:if> href="${pageContext.request.contextPath }/admin/projects">
                                      <i class="fa fa-angle-right"></i>
                                      <span class="link-title">Dự Án</span>
                                    </a>
                                  </li>
                                  <li class="">
                                    <a <c:if test="${ not empty active4}">class="act"</c:if> href="javascript:;">
                                      <i class="fa fa-calendar"></i>
                                      <span class="link-title">
                                     Kiến Thức
                        	  </span>
                                      <span class="fa arrow"></span>
                                    </a>
                                    <ul class="collapse">
                                      <li>
                                        <a href="${pageContext.request.contextPath }/admin/knows">
                                          <i class="fa fa-angle-right"></i>&nbsp; Bất động sản</a>
                                      </li>
                                      <li>
                                        <a href="${pageContext.request.contextPath }/admin/document">
                                          <i class="fa fa-angle-right"></i>&nbsp; Văn bản pháp luật  </a>
                                      </li>
                                    </ul>
                                  </li>
                                  <li>
                                    <a <c:if test="${ not empty active6}">class="act"</c:if> href="${pageContext.request.contextPath }/admin/news">
                                      <i class="fa fa-columns"></i>
                                      <span class="link-title">Tin Tức</span>
                                    </a>
                                  </li>
                                  <li>
                                    <a <c:if test="${ not empty active3}">class="act"</c:if> href="${pageContext.request.contextPath }/admin/contacts">
                                      <i class="fa fa-chain-broken"></i>
                                      <span class="link-title">Liên hệ</span>
                                    </a>
                                  </li>
                                  <li>
                                    <a <c:if test="${ not empty active2}">class="act"</c:if> href="${pageContext.request.contextPath }/admin/users">
                                      <i class="fa fa-landmark"></i>
                                      <span class="link-title">Người dùng </span>
                                    </a>
                                  </li>
                                  <li>
                                    <a <c:if test="${ not empty active1}">class="active"</c:if> href="${pageContext.request.contextPath }/admin/advertisement">
                                      <i class="fa fa fa-bar-chart-o"></i>
                                      <span class="link-title">
                                    Quảng Cáo
                                  </span>
                                    </a>
                                  </li>
                                  <li>
                                    <a href="${pageContext.request.contextPath }/auth/login">
                                      <i class="fa fa-sign-in"></i>
                                      <span class="link-title">
                            Login Page
                            </span>
                                    </a>
                                  </li>
                                  
                                  
                                  
                                </ul>
                        <!-- /#menu -->
                    </div>
                    <!-- /#left -->