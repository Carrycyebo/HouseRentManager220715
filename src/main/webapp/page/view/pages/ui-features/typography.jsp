<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/page/view/";
  request.setAttribute("path", basePath);
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
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${path}css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${path}images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <!-- partial:${path}partials/_navbar.jsp -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="navbar-brand-wrapper d-flex justify-content-center">
        <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">  
          <a class="navbar-brand brand-logo" href="${path}index.jsp"><img src="${path}images/logo.svg" alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini" href="${path}index.jsp"><img src="${path}images/logo-mini.svg" alt="logo"/></a>
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
          <li class="nav-item dropdown me-1">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-bs-toggle="dropdown">
              <i class="mdi mdi-message-text mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="messageDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="${path}images/faces/face4.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">David Grey
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    The meeting is cancelled
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="${path}images/faces/face2.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">Tim Cook
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    New product launch
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="${path}images/faces/face3.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal"> Johnson
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    Upcoming board meeting
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item dropdown me-4">
            <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center notification-dropdown" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
              <i class="mdi mdi-bell mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-success">
                    <i class="mdi mdi-information mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">Application Error</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Just now
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-warning">
                    <i class="mdi mdi-settings mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">Settings</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Private message
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-info">
                    <i class="mdi mdi-account-box mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">New user registration</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    2 days ago
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" id="profileDropdown">
              <img src="${path}images/faces/face5.jpg" alt="profile"/>
              <span class="nav-profile-name">Louis Barnett</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item">
                <i class="mdi mdi-settings text-primary"></i>
                Settings
              </a>
              <a class="dropdown-item">
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
      <!-- partial:${path}partials/_sidebar.jsp -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="${path}index.jsp">
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="mdi mdi-circle-outline menu-icon"></i>
              <span class="menu-title">UI Elements</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="buttons.jsp">Buttons</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}pages/ui-features/typography.jsp">Typography</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../forms/basic_elements.jsp">
              <i class="mdi mdi-view-headline menu-icon"></i>
              <span class="menu-title">Form elements</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../charts/chartjs.jsp">
              <i class="mdi mdi-chart-pie menu-icon"></i>
              <span class="menu-title">Charts</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../tables/basic-table.jsp">
              <i class="mdi mdi-grid-large menu-icon"></i>
              <span class="menu-title">Tables</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../icons/mdi.jsp">
              <i class="mdi mdi-emoticon menu-icon"></i>
              <span class="menu-title">Icons</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="mdi mdi-account menu-icon"></i>
              <span class="menu-title">User Pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../samples/login.jsp"> Login </a></li>
                <li class="nav-item"> <a class="nav-link" href="../samples/login-2.jsp"> Login 2 </a></li>
                <li class="nav-item"> <a class="nav-link" href="../samples/register.jsp"> Register </a></li>
                <li class="nav-item"> <a class="nav-link" href="../samples/register-2.jsp"> Register 2 </a></li>
                <li class="nav-item"> <a class="nav-link" href="../samples/lock-screen.jsp"> Lockscreen </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${path}documentation/documentation.jsp">
              <i class="mdi mdi-file-document-box-outline menu-icon"></i>
              <span class="menu-title">Documentation</span>
            </a>
          </li>
        </ul>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Headings</h4>
                  <p class="card-description">
                    Add tags <code>&lt;h1&gt;</code> to <code>&lt;h6&gt;</code> or class <code>.h1</code> to <code>.h6</code>
                  </p>
                  <div class="template-demo">
                    <h1>h1. Heading</h1>
                    <h2>h2. Heading</h2>
                    <h3>h3. Heading</h3>
                    <h4>h4. Heading</h4>
                    <h5>h5. Heading</h5>
                    <h6>h6. Heading</h6>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Headings with secondary text</h4>
                  <p class="card-description">
                    Add faded secondary text to headings
                  </p>
                  <div class="template-demo">
                    <h1>
                      h1. Heading
                      <small class="text-muted">
                        Secondary text
                      </small>
                    </h1>
                    <h2>
                      h2. Heading
                      <small class="text-muted">
                        Secondary text
                      </small>
                    </h2>
                    <h3>
                      h3. Heading
                      <small class="text-muted">
                        Secondary text
                      </small>
                    </h3>
                    <h4>
                      h4. Heading
                      <small class="text-muted">
                        Secondary text
                      </small>
                    </h4>
                    <h5>
                      h5. Heading
                      <small class="text-muted">
                        Secondary text
                      </small>
                    </h5>
                    <h6>
                      h6. Heading
                      <small class="text-muted">
                        Secondary text
                      </small>
                    </h6>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Display headings</h4>
                  <p class="card-description">
                    Add class <code>.display1</code> to <code>.display-4</code>
                  </p>
                  <div class="template-demo">
                    <h1 class="display-1">Display 1</h1>
                    <h1 class="display-2">Display 2</h1>
                    <h1 class="display-3">Display 3</h1>
                    <h1 class="display-4">Display 4</h1>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 d-flex align-items-stretch">
              <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <h4 class="card-title">Paragraph</h4>
                      <p class="card-description">
                        Write text in <code>&lt;p&gt;</code> tag
                      </p>
                      <p>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
                        when an unknown printer took a galley not only five centuries,
                      </p>
                    </div>
                  </div>
                </div>
                <div class="col-md-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <h4 class="card-title">Icon size</h4>
                      <p class="card-description">
                        Add class <code>.icon-lg</code>, <code>.icon-md</code>, <code>.icon-sm</code>
                      </p>
                      <div class="row">
                        <div class="col-md-4 d-flex align-items-center">
                          <div class="d-flex flex-row align-items-center">
                            <i class="mdi mdi-compass-outline icon-lg text-warning"></i>
                            <p class="mb-0 ms-1">
                              Icon-lg
                            </p>
                          </div>
                        </div>
                        <div class="col-md-4 d-flex align-items-center">
                          <div class="d-flex flex-row align-items-center">
                            <i class="mdi mdi-compass-outline icon-md text-success"></i>
                            <p class="mb-0 ms-1">
                              Icon-md
                            </p>
                          </div>
                        </div>
                        <div class="col-md-4 d-flex align-items-center">
                          <div class="d-flex flex-row align-items-center">
                            <i class="mdi mdi-compass-outline icon-sm text-danger"></i>
                            <p class="mb-0 ms-1">
                              Icon-sm
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Blockquotes</h4>
                  <p class="card-description">
                    Wrap content inside<code>&lt;blockquote class="blockquote"&gt;</code>
                  </p>
                  <blockquote class="blockquote">
                    <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                  </blockquote>
                </div>
                <div class="card-body">
                  <blockquote class="blockquote blockquote-primary">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                    <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
                  </blockquote>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Address</h4>
                  <p class="card-description">
                    Use <code>&lt;address&gt;</code> tag
                  </p>
                  <div class="row">
                    <div class="col-md-6">
                      <address>
                        <p class="font-weight-bold">Majestic inc.</p>
                        <p>
                          695 lsom Ave,
                        </p>
                        <p>
                           Suite 00
                        </p>
                        <p>
                          San Francisco, CA 94107
                        </p>
                      </address>
                    </div>
                    <div class="col-md-6">
                      <address class="text-primary">
                        <p class="font-weight-bold">
                          E-mail
                        </p>
                        <p class="mb-2">
                          johndoe@examplemeail.com
                        </p>
                        <p class="font-weight-bold">
                          Web Address
                        </p>
                        <p>
                          www.Majestic.com
                        </p>
                      </address>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <h4 class="card-title">Lead</h4>
                  <p class="card-description">
                    Use class <code>.lead</code>
                  </p>
                  <p class="lead">
                      Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.
                  </p>
                </div>
              </div>
            </div>
            <div class="col-md-12 grid-margin">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Text colors</h4>
                  <p class="card-description">
                    Use class <code>.text-primary</code>, <code>.text-secondary</code> etc. for text in theme colors
                  </p>
                  <div class="row">
                    <div class="col-md-6">
                      <p class="text-primary">.text-primary</p>
                      <p class="text-success">.text-success</p>
                      <p class="text-danger">.text-danger</p>
                      <p class="text-warning">.text-warning</p>
                      <p class="text-info">.text-info</p>
                    </div>
                    <div class="col-md-6">
                      <p class="text-light bg-dark ps-1">.text-light</p>
                      <p class="text-secondary">.text-secondary</p>
                      <p class="text-dark">.text-dark</p>
                      <p class="text-muted">.text-muted</p>
                      <p class="text-white bg-dark ps-1">.text-white</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Top aligned media</h4>
                  <div class="media">
                    <i class="mdi mdi-earth icon-md text-info d-flex align-self-start me-3"></i>
                    <div class="media-body">
                      <p class="card-text">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Center aligned media</h4>
                  <div class="media">
                    <i class="mdi mdi-earth icon-md text-info d-flex align-self-center me-3"></i>
                    <div class="media-body">
                      <p class="card-text">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Bottom aligned media</h4>
                  <div class="media">
                    <i class="mdi mdi-earth icon-md text-info d-flex align-self-end me-3"></i>
                    <div class="media-body">
                      <p class="card-text">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Highlighted Text</h4>
                  <p class="card-description">
                    Wrap the text in <code>&lt;mark&gt;</code> to highlight text
                  </p>
                  <p>
                    It is a long <mark class="bg-warning text-white">established</mark> fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution
                  </p>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">List Unordered</h4>
                  <ul>
                    <li>Lorem ipsum dolor sit amet</li>
                    <li>Consectetur adipiscing elit</li>
                    <li>Integer molestie lorem at massa</li>
                    <li>Facilisis in pretium nisl aliquet</li>
                    <li>Nulla volutpat aliquam velit</li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Bold text</h4>
                  <p class="card-description">
                    Use class<code>.font-weight-bold</code>
                  </p>
                  <p>
                    It is a long <span class="font-weight-bold">established fact</span> that a reader will be distracted by the readable content
                    of a page when looking at its layout. The point of using Lorem Ipsum is that it has a
                    more-or-less normal distribution
                  </p>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">List Ordered</h4>
                  <ol>
                    <li>Lorem ipsum dolor sit amet</li>
                    <li>Consectetur adipiscing elit</li>
                    <li>Integer molestie lorem at massa</li>
                    <li>Facilisis in pretium nisl aliquet</li>
                    <li>Nulla volutpat aliquam velit></li>
                  </ol>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title text-primary">Underline</h4>
                  <p class="card-description">
                    Wrap in <code>&lt;u&gt;</code> tag for underline
                  </p>
                  <p>
                    <u>lorem ipsum dolor sit amet, consectetur
                      mod tempor incididunt ut labore et dolore
                      magna aliqua.</u>
                  </p>
                </div>
                <div class="card-body">
                  <h4 class="card-title text-danger">Lowercase</h4>
                  <p class="card-description">
                    Use class <code>.text-lowercase</code>
                  </p>
                  <p class="text-lowercase">
                    lorem ipsum dolor sit amet, consectetur
                      mod tempor incididunt ut labore et dolore
                      magna aliqua.
                  </p>
                </div>
                <div class="card-body">
                  <h4 class="card-title text-warning">Uppercase</h4>
                  <p class="card-description">
                    Use class <code>.text-uppercase</code>
                  </p>
                  <p class="text-uppercase">
                    lorem ipsum dolor sit amet, consectetur
                      mod tempor incididunt ut labore et dolore
                      magna aliqua.
                  </p>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Mute</h4>
                  <p class="card-description">
                    Use class <code>.text-muted</code>
                  </p>
                  <p class="text-muted">
                    lorem ipsum dolor sit amet, consectetur
                      mod tempor incididunt ut labore et dolore
                      magna aliqua.
                  </p>
                </div>
                <div class="card-body">
                  <h4 class="card-title text-success">Strike</h4>
                  <p class="card-description">
                    Wrap content in <code>&lt;del&gt;</code> tag
                  </p>
                  <p>
                    <del>
                      lorem ipsum dolor sit amet, consectetur
                      mod tempor incididunt ut labore et dolore
                      magna aliqua.
                    </del>
                  </p>
                </div>
                <div class="card-body">
                  <h4 class="card-title text-info">Capitalized</h4>
                  <p class="card-description">
                    Use class <code>.text-capitalize</code>
                  </p>
                  <p class="text-capitalize">
                    lorem ipsum dolor sit amet, consectetur
                      mod tempor incididunt ut labore et dolore
                      magna aliqua.
                  </p>
                </div>
              </div>
            </div>
            <div class="col-md-4 grid-margin grid-margin-md-0 stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">List with icon</h4>
                  <p class="card-description">Add class <code>.list-ticked</code> to <code>&lt;ul&gt;</code></p>
                  <ul class="list-ticked">
                    <li>Lorem ipsum dolor sit amet</li>
                    <li>Consectetur adipiscing elit</li>
                    <li>Integer molestie lorem at massa</li>
                    <li>Facilisis in pretium nisl aliquet</li>
                    <li>Nulla volutpat aliquam velit></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-4 grid-margin grid-margin-md-0 stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">List with icon</h4>
                  <p class="card-description">Add class <code>.list-arrow</code> to <code>&lt;ul&gt;</code></p>
                  <ul class="list-arrow">
                    <li>Lorem ipsum dolor sit amet</li>
                    <li>Consectetur adipiscing elit</li>
                    <li>Integer molestie lorem at massa</li>
                    <li>Facilisis in pretium nisl aliquet</li>
                    <li>Nulla volutpat aliquam velit></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-4 grid-margin grid-margin-md-0 stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">List with icon</h4>
                  <p class="card-description">Add class <code>.list-star</code> to <code>&lt;ul&gt;</code></p>
                  <ul class="list-star">
                    <li>Lorem ipsum dolor sit amet</li>
                    <li>Consectetur adipiscing elit</li>
                    <li>Integer molestie lorem at massa</li>
                    <li>Facilisis in pretium nisl aliquet</li>
                    <li>Nulla volutpat aliquam velit></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:${path}partials/_footer.jsp -->
        <footer class="footer">
        <div class="d-sm-flex justify-content-center justify-content-sm-between">
          <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © <a href="https://www.bootstrapdash.com/" target="_blank">bootstrapdash.com </a>2021</span>
          <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Only the best <a href="https://www.bootstrapdash.com/" target="_blank"> Bootstrap dashboard  </a> templates</span>
        </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="${path}vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="${path}js/off-canvas.js"></script>
  <script src="${path}js/hoverable-collapse.js"></script>
  <script src="${path}js/template.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>

</html>
