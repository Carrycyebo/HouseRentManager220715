<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/page/view/";
    request.setAttribute("path", basePath);
%>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Success</title>
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

<div class="alert alert-success" role="alert">
    <h4 class="alert-heading">Well done!</h4>
    <p>Aww yeah, when you read this message. You hava successfully Deleted the User.</p>
    <hr>
    <p class="mb-0"></p>
    <a href="<c:url value="/page/view/pages/admin/allUser"/>" class="alert-link">点击这里返回</a>

</div>



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