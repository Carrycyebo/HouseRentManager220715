<%@ page import="com.renter.data.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/page/view/";
    request.setAttribute("path", basePath);
%>
<%
    User loggedInAdmin = (User) session.getAttribute("loggedInUser");
    if (loggedInAdmin == null) {
        response.sendRedirect("/page/user/login.jsp");
    }
%>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>首页</title>
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
                        <span class="nav-profile-name">${loggedInUser.name}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="../../../logout">
                            <i class="mdi mdi-logout text-primary"></i>
                            Logout
                        </a>
                        <button type="button" class="dropdown-item" disabled="true">
                            <i class="mdi mdi-logout text-primary"></i>
                            账户余额：${loggedInUser.money}
                        </button>
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
                            <li class="nav-item"> <a class="nav-link" href="${path}pages/user/myOrder">我的订单</a></li>
                            <li class="nav-item"> <a class="nav-link" href="${path}pages/user/personInfo.jsp">个人信息</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-12 grid-margin">
                    <div class="d-flex justify-content-between flex-wrap">
                        <div class="d-flex align-items-end flex-wrap">
                            <div class="mr-md-3 mr-xl-5">
                                <h1>欢迎回来！</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="alert alert-success" role="alert">
                最新公告：当前房屋房源较少，抓紧机会先到先得！！！
            </div>
            <div class="row">
            <div class="col-md-12 stretch-card">
                <div class="card">
                    <div class="card-body">
                        <p class="card-title">推荐房屋</p>
                        <div class="table-responsive">
                            <div id="recent-purchases-listing_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer"><div class="row"><div class="col-sm-12 col-md-6"></div><div class="col-sm-12 col-md-6"></div></div><div class="row"><div class="col-sm-12"><table id="recent-purchases-listing" class="table dataTable no-footer" role="grid">
                                <thead>
                                <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="recent-purchases-listing" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 197.5px;">房屋编号</th><th class="sorting" tabindex="0" aria-controls="recent-purchases-listing" rowspan="1" colspan="1" aria-label="Status report: activate to sort column ascending" style="width: 253.104px;">所在小区</th><th class="sorting" tabindex="0" aria-controls="recent-purchases-listing" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 181.177px;">租赁状态</th><th class="sorting" tabindex="0" aria-controls="recent-purchases-listing" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending" style="width: 92.125px;">租金</th></tr>
                                </thead>
                                <tbody>
                                    <tr role="row" class="odd">
                                    <td class="sorting_1">9372-45-0938</td>
                                    <td>5</td>
                                    <td>N</td>
                                    <td>￥882/月</td>
                                </tr><tr role="row" class="even">
                                    <td class="sorting_1">7128-22-0216</td>
                                    <td>3</td>
                                    <td>N</td>
                                    <td>￥2152/月</td>
                                </tr><tr role="row" class="odd">
                                    <td class="sorting_1">7090-01-0923</td>
                                    <td>1</td>
                                    <td>N</td>
                                    <td>￥2331/月</td>
                                </tr><tr role="row" class="even">
                                    <td class="sorting_1">3869-02-2918</td>
                                    <td>1</td>
                                    <td>N</td>
                                    <td>￥2452/月</td>
                                </tr><tr role="row" class="odd">
                                    <td class="sorting_1">7995-26-4342</td>
                                    <td>3</td>
                                    <td>N</td>
                                    <td>￥2098/月</td>
                                </tr><tr role="row" class="even">
                                    <td class="sorting_1">5033-11-0777</td>
                                    <td>2</td>
                                    <td>N</td>
                                    <td>￥2375/月</td>
                                </tr><tr role="row" class="odd">
                                    <td class="sorting_1">2877-36-1727</td>
                                    <td>4</td>
                                    <td>N</td>
                                    <td>￥1980/月</td>
                                </tr><tr role="row" class="even">
                                    <td class="sorting_1">2697-23-2180</td>
                                    <td>3</td>
                                    <td>N</td>
                                    <td>￥746/月</td>
                                </tr></tbody>
                            </table></div></div><div class="row"><div class="col-sm-12 col-md-5"></div><div class="col-sm-12 col-md-7"></div></div></div>
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

