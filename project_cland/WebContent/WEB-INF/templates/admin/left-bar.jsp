<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div>
  <div id="left">
                        <div class="media user-media bg-dark dker">
                            <div class="user-media-toggleHover">
                                <span class="fa fa-user"></span>
                            </div>
                            <div class="user-wrapper bg-dark">
                                <a class="user-link" href="">
                                    <img class="media-object img-thumbnail user-img" alt="User Picture" src="assets/img/user.gif">
                                    <span class="label label-danger user-label">16</span>
                                </a>
                        
                                <div class="media-body">
                                    <h5 class="media-heading">Archie</h5>
                                    <ul class="list-unstyled user-info">
                                        <li><a href="">Administrator</a></li>
                                        <li>Last Access : <br>
                                            <small><i class="fa fa-calendar"></i>&nbsp;16 Mar 16:32</small>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- #menu -->
                        <ul id="menu" class="bg-blue dker " >
                                  <li class="nav-header">Menu</li>
                                  <li class="nav-divider"></li>
                                  <li>
                                    <a href="${pageContext.request.contextPath }/admin/cats">
                                      <i class="fa fa-table"></i>
                                      <span class="link-title">Danh Mục </span>
                                    </a>
                                  </li>
                                  <%-- <li>
                                    <a href="${pageContext.request.contextPath }/admin/lands">
                                      <i class="fa fa-landmark"></i>
                                      <span class="link-title">Đất Bán</span>
                                    </a>
                                  </li> --%>
                                  <li class="">
                                    <a href="javascript:;">
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
                                    <a href="${pageContext.request.contextPath }/admin/projects">
                                      <i class="fa fa-angle-right"></i>
                                      <span class="link-title">Dự Án</span>
                                    </a>
                                  </li>
                                  <li>
                                    <a href="${pageContext.request.contextPath }/admin/knows">
                                      <i class="fa fa-calendar"></i>
                                      <span class="link-title">
                                    Kiến Thức
                                  </span>
                                    </a>
                                  </li>
                                  <li>
                                    <a href="${pageContext.request.contextPath }/admin/news">
                                      <i class="fa fa-columns"></i>
                                      <span class="link-title">Tin Tức</span>
                                    </a>
                                  </li>
                                  <li>
                                    <a href="${pageContext.request.contextPath }/admin/contacts">
                                      <i class="fa fa-chain-broken"></i>
                                      <span class="link-title">Liên hệ</span>
                                    </a>
                                  </li>
                                  <li>
                                    <a href="${pageContext.request.contextPath }/admin/lands">
                                      <i class="fa fa-landmark"></i>
                                      <span class="link-title">Người dùng </span>
                                    </a>
                                  </li>
                                  <li>
                                    <a href="${pageContext.request.contextPath }/admin/advertisement">
                                      <i class="fa fa fa-bar-chart-o"></i>
                                      <span class="link-title">
                                    Quảng Cáo
                                  </span>
                                    </a>
                                  </li>
                                  
                                  
                                  
                                </ul>
                        <!-- /#menu -->
                    </div>
                    <!-- /#left -->