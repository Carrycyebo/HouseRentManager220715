<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>登录系统</title>
  <link rel="stylesheet" href="static/css/login.css">
</head>

<body>
<div class="shell">


  <div class="container a-container" id="a-container">
    <form action="../user" method="post" class="form" id="a-form">
      <h2 class="form_title title">财大房屋租赁系统</h2>
      <input type="text" class="form_input" name="name" placeholder="账号">
      <input type="password" class="form_input" name="password" placeholder="密码">
      <a class="form_link">忘记密码？</a>
      <input type="submit" value="登录" class="switch_button button switch-btn">
    </form>
  </div>

  <div class="container b-container" id="b-container">
    <form action="../register" method="post" class="form" id="b-form">
      <h2 class="form_title title">注册账号</h2>
      <input type="text" class="form_input" name="name" placeholder="姓名">
      <input type="text" class="form_input" name="uname" placeholder="账号">
      <input type="password" class="form_input" name="password" placeholder="密码">
      <input type="submit" value="注册" class="switch_button button switch-btn">
    </form>
  </div>



  <div class="switch" id="switch-cnt">
    <div class="switch_circle"></div>
    <div class="switch_circle switch_circle-t"></div>
    <div class="switch_container" id="switch-c1">
      <h2 class="switch_title title" style="letter-spacing: 0;">欢迎回来！</h2>
      <p class="switch_description description">还没有账号？去注册账号</p>
      <button class="switch_button button switch-btn">去注册</button>
    </div>

    <div class="switch_container is-hidden" id="switch-c2">
      <h2 class="switch_title title" style="letter-spacing: 0;">您好！</h2>
      <p class="switch_description description">已经有账号了？去登录账号</p>
      <button class="switch_button button switch-btn">去登录</button>

    </div>
  </div>
</div>
</body>
<script src="static/js/login.js"></script>
</html>