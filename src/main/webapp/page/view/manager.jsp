<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/page/";
    request.setAttribute("path", basePath);
%>
<%
    // 检查是否存在名为 "loggedInAdmin" 的 cookie
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("loggedInAdmin")) {
                // 执行相应的操作，表示用户已登录
                // 可以从 cookie 中获取用户名等信息，根据需要进行操作
                String username = cookie.getValue();
                // 执行相应的操作
                break;
            }
        }
    } else {
        // 用户未登录，可能需要重定向到登录页面
        response.sendRedirect("login.jsp"); // 重定向到登录页面
    }
%>
<%--<jsp:include page="register.jsp" />--%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户中心</title>
    <link rel="stylesheet" href="${path}static/css/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="${path}static/css/style.css">
</head>

<body>
    <input type="checkbox" name="" id="menu-toggle">
    <div class="overlay">
        <label for="menu-toggle" ></label>
    </div>

    <div class="sidebar">
        <div class="sidebar-container">
            <div class="brand">
                <h2>
                    <span class="lab la-staylinked"></span>
                    财大房屋租赁系统
                </h2>
            </div>

            <div class="sidebar-avartar">
                <div>
                    <img src="${path}static/img/picture.webp" alt="">
                </div>
                <div class="avartar-info">
                    <div class="avartar-text">
                        <small>当前操作员</small><%-- 此处接受用户账号 --%>
                        <h3>&nbsp${loggedInAdmin.name}</h3><%-- 此处接受用户名 --%>
                    </div>
                    <span class="las la-angle-double-down"></span>
                    <div id="logoutDropdown" style="display: none;">
                        <button onclick="logout()">注销</button>
                    </div>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="../../../view?action=manager" class="active">
                            <span class="las la-adjust"></span>
                            <span>主页</span>
                        </a>
                    </li>
                    <li>
                        <a href="../../../view?action=order">
                            <span class="las la-calendar"></span>
                            <span>订单管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="../../../view?action=user">
                            <span class="las la-user"></span>
                            <span>用户管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="../../../view?action=charts">
                            <span class="las la-calendar"></span>
                            <span>图表</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="sidebar-card">
                <div class="side-card-icon">
                    <span class="lab la-codiepie"></span>
                </div>
                <div>
                    <h4>View Tutorial</h4>
                    <p>Click to view the panel operation tutorial</p>
                </div>
                <button class="btn btn-main btn-block">Watch now</button>
            </div>
        </div>
    </div>

    <div class="main-content">
        <header>
            <div class="header-title-wrapper">
                <label for="menu-toggle">
                    <span class="las la-bars"></span>
                </label>
                <div class="header-title">
                    <h1>Analytics</h1>
                    <p>Display analytics about your Channel <span class="las la-chart-line"></span></p>
                </div>
            </div>
            <div class="header-action">
                <button class="btn btn-main" onclick="showFloatingPage()">
                    <span class="las la-video"></span>
                    添加管理账户
                </button>

            </div>
        </header>
        <main>
            <section>
                <h3 class="section-head">总览</h3>
                <div class="analytics">
                    <div class="analytic">
                        <div class="analytic-icon">
                            <span class="las la-eye"></span>
                        </div>
                        <div class="analytic-info">
                            <h4>总浏览量</h4>
                            <h1>10.3M <small class="text-danger"> 5% </small></h1>
                        </div>
                    </div>
                    <div class="analytic">
                        <div class="analytic-icon">
                            <span class="las la-users"></span>
                        </div>
                        <div class="analytic-info">
                            <h4>用户</h4>
                            <h1>1.3K <small class="text-success"> 15% </small></h1>
                        </div>
                    </div>
                    <div class="analytic">
                        <div class="analytic-icon">
                            <span class="las la-clock"></span>
                        </div>
                        <div class="analytic-info">
                            <h4>浏览次数</h4>
                            <h1>1.3K <small class="text-success"> 7% </small></h1>
                        </div>
                    </div>
                    <div class="analytic">
                        <div class="analytic-icon">
                            <span class="las la-heart"></span>
                        </div>
                        <div class="analytic-info">
                            <h4>Total likes</h4>
                            <h1>102K<small class="text-danger"> 6% </small></h1>
                        </div>
                    </div>
                </div>
            </section>

            <section>
                <div class="block-grid">
                    <div class="revenue-card">
                        <h3 class="section-head">Total Revenue</h3>
                        <div class="rev-content">
                            <img src="../static/img/picture.webp" alt="">
                            <div class="rev-info">
                                <h3>Ralph Anderson</h3>
                                <h1>3.5M <small>Subscribers</small></h1>
                            </div>
                            <div class="rev-sum">
                                <h4>Total income</h4>
                                <h2>$70,020</h2>
                            </div>
                        </div>
                    </div>
                    <div class="graph-card">
                        <h3 class="section-head">Graph</h3>
                        <div class="graph-content">
                            <div class="graph-head">
                                <div class="icons-wrapper">
                                    <div class="icon">
                                        <span class="las la-eye text-main"></span>
                                    </div>
                                    <div class="icon">
                                        <span class="las la-clock text-success"></span>
                                    </div>
                                </div>
                                <div class="graph-select">
                                    <select name="" id="">
                                        <option value="">September</option>
                                    </select>
                                </div>
                            </div>
                            <div class="graph-board">
                                <canvas id="revenueChart" width="100%" height="50px"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>
        <div id="floating-container"></div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.bundle.js"></script>
    <script>
        Chart.defaults.global.defaultFontFamily = "Kanit";
        let ctx = document.querySelector("#revenueChart");

        let revChart = new Chart(ctx,{
            type:"line",
            data:{
                labels:["Sept 1","Sept 3","Sept 6","Sept 9","Sept 12","Sept 15"
                ,"Sept 18","Sept 21","Sept 24","Sept 27","Sept 30"],
                datasets:[
                    {
                        label:"WatchTime",
                        borderColor:"green",
                        borderWidth:"3",
                        backgroundColor:"rgba(235,247,245,0.7)",
                        data:[0,30,60,25,60,25,50,10,50,90,120]
                    },
                    {
                        label:"TotalViews",
                        borderColor:"blue",
                        borderWidth:"3",
                        backgroundColor:"rgba(233,238,253,0.7)",
                        data:[0,60,25,100,20,75,30,55,20,60,20]
                    }
                ]
            },
            options:{
                responsive:true,
                tooltips:{
                    intersect:false,
                    node:"index",
                }
            }
        });
    </script>
    <script>
        function logout() {
            // 执行注销操作的代码
            // 可以使用AJAX请求向服务器发送注销请求，或者执行其他必要的操作
            // 例如，可以使用以下代码执行页面跳转到注销页面：
            window.location.href = "/logout";
        }

        const dropdown = document.querySelector(".avartar-info .las");
        const logoutDropdown = document.getElementById("logoutDropdown");

        dropdown.addEventListener("click", function() {
            logoutDropdown.style.display = logoutDropdown.style.display === "none" ? "block" : "none";
        });
    </script>

</body>
</html>