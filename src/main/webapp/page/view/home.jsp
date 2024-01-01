<%@ page import="com.renter.data.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/page/view/";
    request.setAttribute("path", basePath);
%>
<%--<%--%>
<%--    Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");--%>
<%--    if (loggedInAdmin == null) {--%>
<%--        response.sendRedirect("/page/admin/login.jsp");--%>
<%--    }--%>
<%--%>--%>
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
                        <a class="dropdown-item" href="../../logout">
                            <i class="mdi mdi-logout text-primary"></i>
                            Logout
                        </a>
                        <a class="dropdown-item" href="${path}pages/admin/register.jsp">
                            <i class=" mdi mdi-account-multiple-plus text-primary"></i>
                            Add New Admin
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
                    <a class="nav-link" href="${path}pages/admin/userList">
                        <i class="mdi mdi-account menu-icon"></i>
                        <span class="menu-title">用户管理</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="h-75 col-lg-6 grid-margin stretch-card custom-parent">
            <div class="shadow p-3 mb-5 bg-white rounded">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">成员信息</h4>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>成员</th>
                                <th>中文名</th>
                                <th>英文名</th>
                                <th>负责模块</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="py-1">
                                    <img src="../view/images/ZYB.jpg" alt="...">
                                </td>
                                <td>赵艺博</td>
                                <td>Hunter</td>
                                <td>123465</td>
                                <td><label class="badge badge-danger">Pending</label></td>
                            </tr>
                            <tr>
                                <td class="py-1">
                                    <img src="../view/images/me.jpg" alt="...">
                                </td>
                                <td>陈子豪</td>
                                <td>Luka</td>
                                <td>123123</td>
                                <td><label class="badge badge-warning">In progress</label></td>
                            </tr>
                            <tr>
                                <td class="py-1">
                                    <img src="../view/images/WJY.jpg" alt="...">
                                </td>
                                <td>王俊尧</td>
                                <td>123456</td>
                                <td>132456</td>
                                <td><label class="badge badge-info">Fixed</label></td>
                            </tr>
                            <tr>
                                <td class="py-1">
                                    <img src="../view/images/LXM.jpg" alt="...">
                                </td>
                                <td>李晓明</td>
                                <td>5213214</td>
                                <td>2131</td>
                                <td><label class="badge badge-success">Completed</label></td>
                            </tr>
                            <tr>
                                <td class="py-1">
                                    <img src="../view/images/LZX.jpg" alt="...">
                                </td>
                                <td>陆智翔</td>
                                <td>53275535</td>
                                <td>20 May 2017</td>
                                <td><label class="badge badge-warning">In progress</label></td>
                            </tr>
                            <tr>
                                <td class="py-1">
                                    <img src="../view/images/WCY.jpg" alt="...">
                                </td>
                                <td>王晨伊</td>
                                <td>53275535</td>
                                <td>20 May 2017</td>
                                <td><label class="badge badge-warning">In progress</label></td>
                            </tr>
                            </tbody>
                        </table>
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

