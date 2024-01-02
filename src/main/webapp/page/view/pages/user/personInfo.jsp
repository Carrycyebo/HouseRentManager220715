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
                        <a class="dropdown-item" href="../../logout">
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
                    <a class="nav-link" href="${path}index.jsp">
                        <i class="mdi mdi-home menu-icon"></i>
                        <span class="menu-title">主页</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${path}pages/user/rentManager.jsp">
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
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Horizontal Form</h4>
                            <p class="card-description">
                                我的个人信息
                            </p>
                            <form action="../../../../page/view/pages/user/updateUser" method="post" class="forms-sample">
                                <div class="form-group row">
                                    <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Email</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Email" name="email" value="${loggedInUser.email}" readonly="true">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">UserName</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username" name="uname" value="${loggedInUser.name}" readonly="true">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Mobile</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="exampleInputMobile" placeholder="Mobile number" name="phone" value="${loggedInUser.phone}" readonly="true">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Password</label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password" name="passwd" value="${loggedInUser.passwd}" readonly="true">
                                    </div>
                                </div>
                                <button type="button" class="btn btn-primary me-2" onclick="enableForm()">修改个人信息</button>
                                <button type="submit" class="btn btn-primary me-2" hidden="hidden">提交</button>
                                <button type="button" class="btn btn-light" hidden="hidden" onclick="cancelForm()">取消</button>
                            </form>
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
<script>
    function enableForm() {
        var formFields = document.getElementsByTagName("input");
        for (var i = 2; i < formFields.length; i++) {
            formFields[i].removeAttribute("readonly");
        }
        var passwordInput = document.getElementById("exampleInputPassword2");
        passwordInput.type = "text";

        document.querySelector("[type='submit']").removeAttribute("hidden");
        document.querySelector("button.btn-light").removeAttribute("hidden");
    }

    function cancelForm() {
        // 获取表单中的输入框元素
        let emailInput = document.getElementById('exampleInputEmail2');
        let usernameInput = document.getElementById('exampleInputUsername2');
        let mobileInput = document.getElementById('exampleInputMobile');
        let passwordInput = document.getElementById('exampleInputPassword2');

        // 将输入框禁用，并将其值设置为之前从服务器获取的用户信息
        emailInput.setAttribute("readonly","true");
        emailInput.value = "${loggedInUser.email}";
        usernameInput.setAttribute("readonly","true");
        usernameInput.value = "${loggedInUser.name}";
        mobileInput.setAttribute("readonly","true");
        mobileInput.value = "${loggedInUser.phone}";
        passwordInput.setAttribute("readonly","true");
        passwordInput.value = "${loggedInUser.passwd}";

        // 获取提交和取消按钮元素，并将其隐藏
        let submitButton = document.querySelector('[type="submit"]');
        let cancelButton = document.querySelector('[onclick="cancelForm()"]');
        submitButton.hidden = true;
        cancelButton.hidden = true;
    }
</script>
</body>

</html>

