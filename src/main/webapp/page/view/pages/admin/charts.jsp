<%@ page import="com.renter.data.Admin" %>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.2/echarts.min.js"></script>
    <script src="https://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
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
                    <a class="nav-link" href="${path}pages/admin/userManager.jsp">
                        <i class="mdi mdi-account menu-icon"></i>
                        <span class="menu-title">用户管理</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div style="height: 1000px;width: 1400px;" id = "show1"></div>
    </div>
</div>
<script type="text/javascript">
    var show1 = echarts.init(document.getElementById("show1"));
    var option = null ;
    option = {
        title: {
            text: '123'
        },
        xAxis: {
            data: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49']
        },
        yAxis: {},
        series: [{
            type: 'bar',
            data: [],
        }]
    };
    show1.setOption(option);
    $.ajax({
        url: "../../../../user/show",
        type: "post",
        dataType:"json",
        success:function (list) {
            show1.setOption(option={
                series:[{
                    data : list,
                }]
            });
        }
    })


    window.addEventListener('resize', function (){
        show1.resize();
    })
</script>
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

