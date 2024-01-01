<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.renter.data.Admin" %>
<%@ page import="com.renter.data.Order" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/page/view/";
    request.setAttribute("path", basePath);
%>
<%
    Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
    if (loggedInAdmin == null) {
        response.sendRedirect("/page/admin/login.jsp");
    }
%>
<html lang="en">

<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Majestic Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${path}vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${path}vendors/base/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet" href="${path}vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${path}css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="${path}images/favicon.png" />
</head>
<body>
<div class="container-scroller">
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="navbar-brand-wrapper d-flex justify-content-center">
            <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="mdi mdi-sort-variant"></span>
                </button>
            </div>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <ul class="navbar-nav mr-lg-4 w-100">
                <li class="nav-item nav-search d-none d-lg-block w-100">
                    <div class="input-group">
                        <div class="input-group-prepend">
                <span class="input-group-text" id="search">
                  <i class="mdi mdi-magnify"></i>
                </span>
                        </div>
                        <input type="text" class="form-control" placeholder="Search now" aria-label="search" aria-describedby="search">
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" id="profileDropdown">
                        <img src="${path}images/faces/face5.jpg" alt="profile"/>
                        <span class="nav-profile-name">${loggedInAdmin.name}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="../../../logout">
                            <i class="mdi mdi-logout text-primary"></i>
                            Logout
                        </a>
                    </div>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="mdi mdi-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.jsp -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="${path}home.jsp">
                        <i class="mdi mdi-home menu-icon"></i>
                        <span class="menu-title">主页</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${path}pages/admin/order">
                        <i class="mdi mdi-view-headline menu-icon"></i>
                        <span class="menu-title">订单管理</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${path}pages/admin/charts.jsp">
                        <i class="mdi mdi-chart-areaspline menu-icon"></i>
                        <span class="menu-title">图表</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${path}pages/admin/userManager.jsp">
                        <i class="mdi mdi-account menu-icon"></i>
                        <span class="menu-title">用户管理</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="main-panel">
            <div class="row">
                <div class="col-md-12 stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-title">Recent Purchases</p>
                            <div class="table-responsive">
                                <table id="recent-purchases-listing" class="table">
                                    <thead>
                                    <tr>
                                        <th>订单编号</th>
                                        <th>房屋编号</th>
                                        <th>租价</th>
                                        <th>订单开始时间</th>
                                        <th>订单结束时间</th>
                                        <th>租赁状态</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${currentOrders}" var="order">
                                        <tr>
                                            <td>${order.order_id}</td>
                                            <td>${order.house_id}</td>
                                            <td>${order.price}</td>
                                            <td>${order.startint_time}</td>
                                            <td>${order.end_time}</td>
                                            <td>${order.renting_status}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div>
                                    <p>当前页：${currentPage}</p>
                                    <p>每页显示：${pageSize}</p>
                                    <p>总页数：${totalPage}</p>
                                </div>
                                <div>
                                    <ul>
                                        <c:choose>
                                            <c:when test="${currentPage > 1}">
                                                <li><a href="${path}pages/admin/order?currentPage=${currentPage - 1}&pageSize=${pageSize}">上一页</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>上一页</li>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:forEach begin="1" end="${totalPage}" varStatus="status">
                                            <c:choose>
                                                <c:when test="${currentPage == status.index}">
                                                    <li><strong>${status.index}</strong></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a href="${path}pages/admin/order?currentPage=${status.index}&pageSize=${pageSize}">${status.index}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                        <c:choose>
                                            <c:when test="${currentPage < totalPage}">
                                                <li><a href="${path}pages/admin/order?currentPage=${currentPage + 1}&pageSize=${pageSize}">下一页</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>下一页</li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <!-- partial -->

        <!-- container-scroller -->

        <!-- plugins:js -->
        <script src="${path}vendors/base/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page-->
        <script src="${path}vendors/chart.js/Chart.min.js"></script>
        <script src="${path}vendors/datatables.net/jquery.dataTables.js"></script>
        <script src="${path}vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
        <!-- End plugin js for this page-->
        <!-- inject:js -->
        <script src="${path}js/off-canvas.js"></script>
        <script src="${path}js/hoverable-collapse.js"></script>
        <script src="${path}js/template.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src="${path}js/dashboard.js"></script>
        <script src="${path}js/data-table.js"></script>
        <script src="${path}js/jquery.dataTables.js"></script>
        <script src="${path}js/dataTables.bootstrap4.js"></script>
        <!-- End custom js for this page-->

        <script src="${path}js/jquery.cookie.js" type="text/javascript"></script>
</body>

</html>

