<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.renter.data.Admin" %>
<%@ page import="com.renter.data.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/page/view/";
    request.setAttribute("path", basePath);
%>
<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
        response.sendRedirect("/page/user/login.jsp");
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
                        <input type="text" class="form-control" placeholder="Search now" aria-label="search" aria-describedby="search" id="searchBox">
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" id="profileDropdown">
                        <img src="${path}images/faces/face5.jpg" alt="profile"/>
                        <span class="nav-profile-name">${loggedInUser.name}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="../../../logout">
                            <i class="mdi mdi-logout text-primary"></i>
                            Logout
                        </a>
                        <a class="dropdown-item" href="../../../logout" disabled="true">
                            <i class="mdi mdi-logout text-primary"></i>
                            账户余额：${loggedInUser.money}
                        </a>
                        <a class="dropdown-item" href="../../../logout">
                            <i class="mdi mdi-logout text-primary"></i>
                            充值
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
                    <a class="nav-link" href="${path}index.jsp">
                        <i class="mdi mdi-home menu-icon"></i>
                        <span class="menu-title">主页</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${path}pages/user/rentManagerList">
                        <i class="mdi mdi-view-headline menu-icon"></i>
                        <span class="menu-title">租赁</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                        <i class="mdi mdi-circle-outline menu-icon"></i>
                        <span class="menu-title">${loggedInUser.name}</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="ui-basic">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="${path}pages/user/myOrder.jsp">我的订单</a></li>
                            <li class="nav-item"> <a class="nav-link" href="${path}pages/user/personInfo.jsp">个人信息</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12 stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title">Recent Purchases</p>

                                <div>
                                    <button type="button" class="btn btn-inverse-primary btn-fw" data-toggle="modal" data-target="#query">
                                        筛选
                                    </button>
                                </div>
                                <div class="modal fade" id="query" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelQuery" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="">查询订单</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="../../../../page/view/pages/user/query" method="post" id="modifyOrderForm">
                                                    <div class="form-group">
                                                        <label for="order_id">房屋编号</label>
                                                        <input type="text" class="form-control" id="order_id" name="searchQuery">
                                                        <small class="form-text text-muted">输入要查询的订单编号(可选)</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="price_min">价格下限</label>
                                                        <input type="number" class="form-control" id="price_min" name="priceMin">
                                                        <small class="form-text text-muted">输入要查询的房屋的租金下限(可选)</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="price_max">价格上限</label>
                                                        <input type="number" class="form-control" id="price_max" name="priceMax">
                                                        <small class="form-text text-muted">输入要查询的房屋的租金上限(可选)</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="statusInput2">租赁状态</label>
                                                        <select class="form-control" id="statusInput2" name="status" required>
                                                            <option value="Y" >Y</option>
                                                            <option value="N" >N</option>
                                                            <option value="ALL" >ALL</option>
                                                        </select>
                                                        <small class="form-text text-muted">请选择租赁状态，必填项</small>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                                        <button type="submit" class="btn btn-primary">查询</button>
                                                    </div>
                                                </form>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table id="recent-purchases-listing" class="table">
                                        <thead>
                                        <tr>
                                            <th>房屋编号</th>
                                            <th>租价</th>
                                            <th>租赁状态</th>
                                            <th>租赁</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${currentOrders}" var="order">
                                            <tr>
                                                <td>${order.house_id}</td>
                                                <td>${order.price}</td>
                                                <td>${order.renting_status}</td>
                                                <td>
                                                    <button type="button" class="btn btn-outline-primary btn-fw" data-toggle="modal" data-target="#exampleModal${order.order_id}">
                                                        租赁
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <c:forEach items="${currentOrders}" var="order">
                                        <div class="modal fade" id="exampleModal${order.order_id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">修改订单 - ${order.order_id}</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="../../../../page/view/pages/admin/ModifyOrderSubmit" method="post" id="modifyOrderForm${order.order_id}">
                                                            <div class="form-group">
                                                                <label for="houseIdInput">房屋编号</label>
                                                                <input type="text" class="form-control" id="houseIdInput" name="houseId" value="${order.house_id}" required>
                                                                <small class="form-text text-muted">请输入新的房屋编号，必填项</small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="priceInput">租价</label>
                                                                <input type="number" class="form-control" id="priceInput" name="price" value="${order.price}" required>
                                                                <small class="form-text text-muted">请输入租金，必填项</small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="startInput">订单开始时间</label>
                                                                <input type="date" class="form-control" id="startInput" name="startTime" value="${order.startint_time}" required>
                                                                <small class="form-text text-muted">请输入订单开始时间，必填项</small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="endInput">订单结束时间</label>
                                                                <input type="date" class="form-control" id="endInput" name="endTime" value="${order.end_time}" required>
                                                                <small class="form-text text-muted">请输入订单结束时间，必填项</small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="statusInput">租赁状态</label>
                                                                <select class="form-control" id="statusInput" name="status" required>
                                                                    <option value="Y" >Y</option>
                                                                    <option value="N" >N</option>
                                                                </select>
                                                                <small class="form-text text-muted">请选择租赁状态，必填项</small>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                                                <button type="submit" class="btn btn-primary">保存修改</button>
                                                            </div>
                                                            <input type="hidden" name="orderId" value="${order.order_id}">
                                                            <input type="hidden" name="rowKey" value="${order.row}">
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                            <a class="page-link" href="?currentPage=${currentPage - 1}&pageSize=${pageSize}">上一页</a>
                                        </li>
                                        <li class="page-item ${currentPage == 1 ? 'active' : ''}">
                                            <a class="page-link" href="?currentPage=1&pageSize=${pageSize}">1</a>
                                        </li>
                                        <c:choose>
                                            <c:when test="${currentPage <= fixedPageCount + 2}">
                                                <!-- 遍历显示前固定数量的页码链接 -->
                                                <c:forEach begin="2" end="${fixedPageCount + 1}" var="i">
                                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                        <a class="page-link" href="?currentPage=${i}&pageSize=${pageSize}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item disabled"><a class="page-link">...</a></li>
                                            </c:when>
                                            <c:when test="${currentPage > totalPage - fixedPageCount - 1}">
                                                <!-- 遍历显示后固定数量的页码链接 -->
                                                <li class="page-item disabled"><a class="page-link">...</a></li>
                                                <c:forEach begin="${totalPage - fixedPageCount}" end="${totalPage - 1}" var="i">
                                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                        <a class="page-link" href="?currentPage=${i}&pageSize=${pageSize}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <!-- 显示当前页码前后固定数量的页码链接 -->
                                                <li class="page-item disabled"><a class="page-link">...</a></li>
                                                <c:forEach begin="${currentPage - fixedPageCount}" end="${currentPage + fixedPageCount}" var="i">
                                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                        <a class="page-link" href="?currentPage=${i}&pageSize=${pageSize}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item disabled"><a class="page-link">...</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                        <li class="page-item ${currentPage == totalPage ? 'active' : ''}">
                                            <a class="page-link" href="?currentPage=${totalPage}&pageSize=${pageSize}">${totalPage}</a>
                                        </li>
                                        <li class="page-item ${currentPage == totalPage ? 'disabled' : ''}">
                                            <a class="page-link" href="?currentPage=${currentPage + 1}&pageSize=${pageSize}">下一页</a>
                                        </li>
                                    </ul>
                                </nav>
                                <div class="row justify-content-center">
                                    <form class="form-inline" method="get" action="?">
                                        <div class="form-group mx-sm-3">
                                            <input type="hidden" name="pageSize" value="${pageSize}" />
                                            <input type="number" class="form-control" name="currentPage" placeholder="输入页码" min="1" max="${totalPage}">
                                        </div>
                                        <button type="submit" class="btn btn-inverse-primary btn-fw">跳转</button>
                                    </form>
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
<script src="${path}js/jquery%20-3.6.1/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"></script>
<!-- End custom js for this page-->

<script src="${path}js/jquery.cookie.js" type="text/javascript"></script>


</body>

</html>

