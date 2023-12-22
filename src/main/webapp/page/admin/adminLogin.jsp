<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/page/";
    request.setAttribute("path", basePath);
%>
<%--<!DOCTYPE html>--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="${path}static/pkg/bootstrap-4.6.2-dist/css/bootstrap.min.css">
    <script src="${path}static/pkg/jquery -3.6.1/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" href="${path}static/css/common/common.css">
</head>
<body>
<div class="container">
    <div class="card" style="width: 18rem;">
<%--        <img src="../static/images/1.jpg" class="card-img-top" alt="...">--%>
        <div class="card-body">
            <form action="../../admin/login" method="post" onclick="return checkLogin()">
                <h3>管理员登录页</h3>
                <div class="form-group">
                    <label for="InputUsername">管理员账号</label>
                    <input type="text" class="form-control" id="InputUsername" name="adminName">
                </div>
                <div class="form-group">
                    <label for="InputPassword">密码</label>
                    <input type="password" class="form-control" id="InputPassword" name="adminPasswd">
                </div>
                <div>
                    <span style="color: red" id="tip">${tip}</span>
                </div>
                <button type="submit" class="btn btn-primary">登录</button>
            </form>
        </div>
    </div>
</div>
<script src="${path}static/pkg/bootstrap-4.6.2-dist/js/bootstrap.min.js"></script>
</body>
</html>

<script src="${path}static/js/login.js"></script>
