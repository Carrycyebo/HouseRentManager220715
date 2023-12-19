<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signin Admin Dashboard</title>
    <link rel="stylesheet" href="static/css/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="static/css/style.css">
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
                    Vase
                </h2>
            </div>

            <div class="sidebar-avartar">
                <div>
                    <img src="./source/avatar.png" alt="">
                </div>
                <div class="avartar-info">
                    <div class="avartar-text">
                        <h4>Typh AdminSir</h4>
                        <small>135-6841-6239</small>
                    </div>
                    <span class="las la-angle-double-down"></span>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="https://carrycyebo.top" class="active">
                            <span class="las la-adjust"></span>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="las la-video"></span>
                            <span>Videos</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="las la-chart-bar"></span>
                            <span>Analytics</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="las la-calendar"></span>
                            <span>Schedule</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="las la-user"></span>
                            <span>Account</span>
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
                <button class="btn btn-main">
                    <span class="las la-video"></span>
                    Upload
                </button>
            </div>
        </header>
        <main>
            <section>
                <h3 class="section-head">Overview</h3>
                <div class="analytics">
                    <div class="analytic">
                        <div class="analytic-icon">
                            <span class="las la-eye"></span>
                        </div>
                        <div class="analytic-info">
                            <h4>Total views</h4>
                            <h1>10.3M <small class="text-danger"> 5% </small></h1>
                        </div>
                    </div>
                    <div class="analytic">
                        <div class="analytic-icon">
                            <span class="las la-users"></span>
                        </div>
                        <div class="analytic-info">
                            <h4>Subscribers</h4>
                            <h1>1.3K <small class="text-success"> 15% </small></h1>
                        </div>
                    </div>
                    <div class="analytic">
                        <div class="analytic-icon">
                            <span class="las la-clock"></span>
                        </div>
                        <div class="analytic-info">
                            <h4>Watch Time(hrs)</h4>
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
                            <img src="./source/avatar.png" alt="">
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
</body>
</html>