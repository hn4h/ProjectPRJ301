<%-- Document : header Created on : Oct 3, 2024, 9:38:57 AM Author : 11 --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link
            rel="stylesheet"
            href="plugins/bootstrap/css/bootstrap.min.css"
            type="text/css"
            />
        <title>Shoes World</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="description"
            content="Shoes World sell all shoes in the world"
            />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=5.0"
            />
        <meta name="author" content="Hnah" />
        <meta name="generator" content="Themefisher Constra HTML Template v1.0" />

        <!-- theme meta -->
        <meta name="theme-name" content="aviato" />

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="./images/favicon.png" />

        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="./plugins/themefisher-font/style.css" />
        <!-- bootstrap.min css -->
        <link rel="stylesheet" href="./plugins/bootstrap/css/bootstrap.min.css" />

        <!-- Animate css -->
        <link rel="stylesheet" href="./plugins/animate/animate.css" />
        <!-- Slick Carousel -->
        <link rel="stylesheet" href="./plugins/slick/slick.css" />
        <link rel="stylesheet" href="./plugins/slick/slick-theme.css" />

        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="./css/style.css" />
    </head>

    <body>
        <section class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <div class="contact-number">
                            <i class="tf-ion-ios-telephone"></i>
                            <span>0339-404-584</span>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <!-- Site Logo -->
                        <div class="logo text-center">
                            <a href="home">
                                <img
                                    style="height: 100px; width: auto"
                                    src="images/logo.png"
                                    alt="logo"
                                    />
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-12 col-sm-4" style="position: relative">
                        <div style="position: absolute; bottom: 0; right: 15px">
                            <!-- Login/Register -->
                            <% if(session.getAttribute("account")==null){ %>
                            <div class="login-register text-right">
                                <a href="login">Login</a> | <a href="signin">Register</a>
                            </div>
                            <% }else{ %>
                            <div class="login-register text-right dropdown dropdown-slide">
                                <div class="dropdown dropdown-slide">
                                    <a
                                        href="#"
                                        class="dropdown-toggle"
                                        data-toggle="dropdown"
                                        data-hover="dropdown"
                                        data-delay="350"
                                        role="button"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="tf-profile-male"></i> ${sessionScope.account.userName}
                                    </a>

                                    <div class="dropdown-menu">
                                        <ul>
                                            <li><a href="profile">My Profile</a></li>
                                            <li><a href="logout">Log Out</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <!-- Cart and other menu items -->
                        <ul class="top-menu text-right list-inline">
                            <li class="dropdown cart-nav dropdown-slide">
                                <a
                                    href="#!"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    data-hover="dropdown"
                                    style="position: relative;"
                                    >
                                    <i class="tf-ion-android-cart"></i>
                                    <span id="cart-count" style="position: absolute; top: -10px; right: -20px; background-color: black; color: white; border-radius: 50%; padding: 2px 6px; font-size: 12px;">0</span>
                                    Cart
                                </a>
                                <div class="dropdown-menu cart-dropdown">
                                    <!-- Cart Item -->
                                    <div class="media">
                                        <a class="pull-left" href="#!">
                                            <img
                                                class="media-object"
                                                src="images/shop/cart/cart-1.jpg"
                                                alt="image"
                                                />
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="#!">Ladies Bag</a></h4>
                                            <div class="cart-price">
                                                <span>1 x</span>
                                                <span>1250.00</span>
                                            </div>
                                            <h5><strong>$1200</strong></h5>
                                        </div>
                                        <a href="#!" class="remove"><i class="tf-ion-close"></i></a>
                                    </div>
                                    <!-- / Cart Item -->
                                    <!-- Cart Item -->
                                    <div class="media">
                                        <a class="pull-left" href="#!">
                                            <img
                                                class="media-object"
                                                src="images/shop/cart/cart-2.jpg"
                                                alt="image"
                                                />
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="#!">Ladies Bag</a></h4>
                                            <div class="cart-price">
                                                <span>1 x</span>
                                                <span>1250.00</span>
                                            </div>
                                            <h5><strong>$1200</strong></h5>
                                        </div>
                                        <a href="#!" class="remove"><i class="tf-ion-close"></i></a>
                                    </div>
                                    <!-- / Cart Item -->

                                    <div class="cart-summary">
                                        <span>Total</span>
                                        <span class="total-price">$1799.00</span>
                                    </div>
                                    <ul class="text-center cart-buttons">
                                        <li>
                                            <a href="cart.html" class="btn btn-small">View Cart</a>
                                        </li>
                                        <li>
                                            <a
                                                href="checkout.html"
                                                class="btn btn-small btn-solid-border"
                                                >Checkout</a
                                            >
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- / Cart -->

                            <!-- Search -->
                            <li class="dropdown search dropdown-slide">
                                <a
                                    href="#!"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    data-hover="dropdown"
                                    ><i class="tf-ion-ios-search-strong"></i> Search</a
                                >
                                <ul class="dropdown-menu search-dropdown">
                                    <li>
                                        <form action="post">
                                            <input
                                                type="search"
                                                class="form-control"
                                                placeholder="Search..."
                                                />
                                        </form>
                                    </li>
                                </ul>
                            </li>
                            <!-- / Search -->

                            <!-- Languages -->
                            <li class="commonSelect">
                                <select class="form-control">
                                    <option>EN</option>
                                    <option>DE</option>
                                    <option>FR</option>
                                    <option>ES</option>
                                </select>
                            </li>
                            <!-- / Languages -->
                        </ul>
                        <!-- / .nav .navbar-nav .navbar-right -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Top Header Bar -->

        <section class="menu">
            <nav class="navbar navigation">
                <div class="container">
                    <div class="navbar-header">
                        <h2 class="menu-title">Main Menu</h2>
                        <button
                            type="button"
                            class="navbar-toggle collapsed"
                            data-toggle="collapse"
                            data-target="#navbar"
                            aria-expanded="false"
                            aria-controls="navbar"
                            >
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- / .navbar-header -->

                    <!-- Navbar Links -->
                    <div id="navbar" class="navbar-collapse collapse text-center">
                        <ul class="nav navbar-nav">
                            <!-- Home -->
                            <li class="dropdown">
                                <a href="home">Home</a>
                            </li>
                            <!-- / Home -->

                            <!-- Elements -->
                            <li class="dropdown dropdown-slide">
                                <a
                                    href="#!"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    data-hover="dropdown"
                                    data-delay="350"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >Giày Nike</a
                                >
                                <div class="dropdown-menu">
                                    <div class="row">
                                        <!-- Basic -->
                                        <div class="col-lg-12 col-md-12 mb-sm-6">
                                            <ul>
                                                <li class="dropdown-header">Nike</li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="shop.html">Nike Air Force 1</a></li>
                                                <li><a href="checkout.html">Nike Air Jordan 1</a></li>
                                                <li><a href="cart.html">Nike Nữ</a></li>
                                                <li><a href="pricing.html">Nike Nam</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- / .row -->
                                </div>
                                <!-- / .dropdown-menu -->
                            </li>
                            <!-- / Elements -->

                            <!-- Pages -->
                            <li class="dropdown dropdown-slide">
                                <a
                                    href="#!"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    data-hover="dropdown"
                                    data-delay="350"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >Giày Adidas</a
                                >
                                <div class="dropdown-menu">
                                    <div class="row">
                                        <!-- Basic -->
                                        <div class="col-lg-12 col-md-12 mb-sm-6">
                                            <ul>
                                                <li class="dropdown-header">Adidas</li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="shop.html">Adidas Stansmith</a></li>
                                                <li><a href="checkout.html">Adidas Superstar</a></li>
                                                <li><a href="shop.html">Adidas Ultraboost</a></li>
                                                <li><a href="checkout.html">Adidas Forum</a></li>
                                                <li><a href="cart.html">Adidas Nu</a></li>
                                                <li><a href="pricing.html">Adidas nam</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- / .row -->
                                </div>
                                <!-- / .dropdown-menu -->
                            </li>

                            <!-- Blog -->
                            <li class="dropdown dropdown-slide">
                                <a
                                    href="#!"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    data-hover="dropdown"
                                    data-delay="350"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >Giày MLB</a
                                >
                                <div class="dropdown-menu">
                                    <div class="row">
                                        <!-- Basic -->
                                        <div class="col-lg-12 col-md-12 mb-sm-6">
                                            <ul>
                                                <li class="dropdown-header">MLB</li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="shop.html">MLB Mule</a></li>
                                                <li><a href="shop.html">MLB Chunky</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- / .row -->
                                </div>
                                <!-- / .dropdown-menu -->
                            </li>
                            <!-- / Blog -->

                            <!-- Shop -->
                            <li class="dropdown dropdown-slide">
                                <a
                                    href="#!"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    data-hover="dropdown"
                                    data-delay="350"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >Giày Khác</a
                                >
                                <div class="dropdown-menu">
                                    <div class="row">
                                        <!-- Basic -->
                                        <div class="col-lg-12 col-md-12 mb-sm-6">
                                            <ul>
                                                <li class="dropdown-header">Giày Khác</li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="shop.html">Giày Puma</a></li>
                                                <li><a href="shop.html">Giày Fila</a></li>
                                                <li><a href="shop.html">Giày New Balance</a></li>
                                                <li><a href="shop.html">Giày Chính Hãng Khác</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- / .row -->
                                </div>
                                <!-- / .dropdown-menu -->
                            </li>
                            <!-- / Blog -->
                            <!-- Home -->
                            <li class="dropdown">
                                <a href="index.html">Blog</a>
                            </li>
                            <!-- / Home -->
                        </ul>
                        <!-- / .nav .navbar-nav -->
                    </div>
                    <!--/.navbar-collapse -->
                </div>
                <!-- / .container -->
            </nav>
        </section>

        <!-- Main jQuery -->
        <script src="plugins/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.1 -->
        <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
        <!-- Bootstrap Touchpin -->
        <script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
        <!-- Instagram Feed Js -->
        <script src="plugins/instafeed/instafeed.min.js"></script>
        <!-- Video Lightbox Plugin -->
        <script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
        <!-- Count Down Js -->
        <script src="plugins/syo-timer/build/jquery.syotimer.min.js"></script>

        <!-- slick Carousel -->
        <script src="plugins/slick/slick.min.js"></script>
        <script src="plugins/slick/slick-animation.min.js"></script>

        <!-- Google Mapl -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
        <script type="text/javascript" src="plugins/google-map/gmap.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Main Js File -->
        <script src="js/script.js"></script>
    </body>
</html>
