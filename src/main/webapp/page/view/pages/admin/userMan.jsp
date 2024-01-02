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
    <title>用户管理</title>
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
                        <span class="nav-profile-name">${loggedInAdmin.name}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="../../../adminlogout">
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
                    <a class="nav-link" href="${path}pages/admin/allUser">
                        <i class="mdi mdi-account menu-icon"></i>
                        <span class="menu-title">用户管理</span>
                    </a>
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
                                    <button type="button" class="btn btn-inverse-primary btn-fw" data-toggle="modal" data-target="#updateUser">
                                        修改用户信息
                                    </button>
                                    <button type="button" class="btn btn-inverse-primary btn-fw" data-toggle="modal" data-target="#deleteUser">
                                        删除用户
                                    </button>
                                </div>
                                <div class="modal fade" id="updateUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelQuery" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" >修改用户信息</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="../../../../page/view/pages/admin/updateUser" method="post" >
                                                    <div class="form-group">
                                                        <label for="email">Email</label>
                                                        <input type="text" class="form-control" id="email" name="email" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="username">UserName</label>
                                                        <input type="text" class="form-control" id="username" name="username" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="passwd">PassWord</label>
                                                        <input type="text" class="form-control" id="passwd" name="passwd" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="phone">Phone</label>
                                                        <input type="text" class="form-control" id="phone" name="phone" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="phone">Money</label>
                                                        <input type="text" class="form-control" id="money" name="money" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="phone">OrderIds</label>
                                                        <input type="text" class="form-control" id="orderIds" name="orderIds" required>
                                                        <strong class="form-text text-muted">订单编号，用','隔开</strong>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                                        <button type="submit" class="btn btn-primary">提交修改</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="deleteUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelQuery" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" >查询订单</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="../../../../page/view/pages/admin/delete" method="post" id="modifyDeleteForm">
                                                    <div class="form-group">
                                                        <label for="delemail">邮箱号</label>
                                                        <input type="text" class="form-control" id="delemail" name="delemail" required>
                                                        <small class="form-text text-muted">输入要删除的邮箱号</small>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                                        <button type="submit" class="btn btn-primary" onclick="confirmDelete()">删除</button>
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
                                        <th>邮箱</th>
                                        <th>用户名</th>
                                        <th>密码</th>
                                        <th>电话号</th>
                                        <th>账户余额</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${currentUsers}" var="user">
                                        <tr>
                                            <td>${user.email}</td>
                                            <td>${user.name}</td>
                                            <td>${user.passwd}</td>
                                            <td>${user.phone}</td>
                                            <td>${user.money}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

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
<script>
    function confirmDelete() {
        // 弹出确认删除的提示框
        if (confirm("确定要删除吗？")) {
            // 如果用户点击确认，则提交表单
            document.getElementById("modifyDeleteForm").submit();
        }
    }
</script>


</body>

</html>

