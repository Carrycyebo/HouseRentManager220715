<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/page/view/";
    request.setAttribute("path", basePath);
%>
<%
    String path2 = request.getContextPath();
    String basePath2 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path2+"/page/user/";
    request.setAttribute("path2", basePath2);
%>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Register</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${path}vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${path}vendors/base/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${path}css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="${path}images/favicon.png" />
</head>

<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth px-0">
            <div class="row w-100 mx-0">
                <div class="col-lg-4 mx-auto">
                    <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                        <h4>New here?</h4>
                        <h6 class="font-weight-light">Signing up is easy. It only takes a few steps</h6>
                        <form action="../../user/register" method="post" class="pt-3" onsubmit="return validateR()">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Email" name="userEmail">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-lg" id="exampleInputUsername1" placeholder="Username" name="userName">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password" name="userPasswd">
                            </div>
                                 <h5 id="tipMessage" style="color: red">${tipUserR}</h5>
                            <div class="mt-3">
                                <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit">SIGN UP</button>
                            </div>
                            <div class="text-center mt-4 font-weight-light">
                                Already have an account? <a href="${path2}login.jsp" class="text-primary">Login</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="${path}vendors/base/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script src="${path}js/off-canvas.js"></script>
<script src="${path}js/hoverable-collapse.js"></script>
<script src="${path}js/template.js"></script>
<script src="${path}js/noNull.js"></script>
<!-- endinject -->
</body>

</html>
