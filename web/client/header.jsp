<%-- Document : header Created on : Oct 3, 2024, 9:38:57 AM Author : 11 --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.Account" %>
<%@page import="dal.CartDAO" %>
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
                                        href="profile"
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
                        <div class="row">
                            <div class="col-md-12">
                                <!-- Cart and other menu items -->
                                <ul class="top-menu text-right list-inline" style="margin-top: 20px;">
                                    <li class=" cart-nav ">
                                        <a
                                            href="cart"
                                            style="position: relative;"
                                            >
                                            <i class="tf-ion-android-cart"></i>
                                            <span id="cart-count" style="position: absolute; top: -10px; right: -20px; background-color: black; color: white; border-radius: 50%; padding: 2px 6px; font-size: 12px;">
                                                <% if(session.getAttribute("account") != null){
                                                    Account acc = (Account) session.getAttribute("account");
                                                    CartDAO dao = new CartDAO();
                                                    
                                                    out.print(dao.getCartItems(acc.getAccountID()).size());
                                                    }
                                                    else{
                                                    out.print("0");
                                                    }
                                                %>
                                            </span>
                                            Cart
                                        </a>
                                        <div class="dropdown-menu cart-dropdown">
                                            <!--   <div class="media">
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
                                                Cart Item 
   
                                               <div class="cart-summary">
                                                   <span>Total</span>
                                                   <span class="total-price">$1799.00</span>
                                               </div> -->
                                            <!-- <ul class="text-center cart-buttons">
                                                <li>
                                                    <a href="cart" class="btn btn-small">View Cart</a>
                                                </li>
                                                <li>
                                                    <a
                                                        href="checkout"
                                                        class="btn btn-small btn-solid-border"
                                                        >Checkout</a
                                                    >
                                                </li>
                                            </ul> -->
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
                                                <form action="search" >
                                                    <input
                                                        type="search"
                                                        class="form-control"
                                                        placeholder="Search..."
                                                        name="search"
                                                        />
                                                </form>
                                            </li>
                                        </ul>
                                    </li>
                                    <!-- / Search -->

                                </ul>
                                <!-- / .nav .navbar-nav .navbar-right -->
                            </div>
                        </div>

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
                            <li class="dropdown">
                                <a href="search?search=&brand=1">Adidas</a>
                            </li>
                            <li class="dropdown">
                                <a href="search?search=&brand=2">Nike</a>
                            </li>
                            <li class="dropdown">
                                <a href="search?search=&brand=3">MLB</a>
                            </li>
                            <li class="dropdown">
                                <a href="search?search=&brand=4">Puma</a>
                            </li>
                            <li class="dropdown">
                                <a href="search?search=&brand=5">Fila</a>
                            </li>
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
