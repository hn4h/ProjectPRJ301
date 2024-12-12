<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Shoes World</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="Construction Html5 Template" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0" />
        <meta name="author" content="Themefisher" />
        <meta name="generator" content="Themefisher Constra HTML Template v1.0" />

        <!-- theme meta -->
        <meta name="theme-name" content="aviato" />

        <!-- Favicon -->
        <link rel="shortcut icon" type="images/logo.png" href="./images/logo.png" />

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
        <style>
            .size-option {
                display: inline-block;
                margin: 5px;
            }

            .size-option input[type="radio"] {
                display: none;
            }

            .size-option label {
                display: inline-block;
                padding: 10px 20px;
                border: 1px solid #dee2e6;
                cursor: pointer;
                text-align: center;
                width: 60px;
            }

            .size-option input[type="radio"]:checked+label {
                border: 2px solid red;
                color: red;
            }

            .size-option input[type="radio"]:disabled+label {
                opacity: 0.5;
                cursor: not-allowed;
            }
        </style>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <section class="single-product">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li><a href="home">Home</a></li>
                            <li><a href="#">${requestScope.product.brand.brandName}</a></li>
                            <li class="active">${requestScope.product.productName}</li>
                        </ol>
                    </div>
                    <!-- <div class="col-md-6">V
            <ol class="product-pagination text-right">
                <li><a href="blog-left-sidebar.html"><i class="tf-ion-ios-arrow-left"></i> Next </a></li>
                <li><a href="blog-left-sidebar.html">Preview <i class="tf-ion-ios-arrow-right"></i></a></li>
            </ol>
        </div> -->
                </div>
                <div class="row mt-20">
                    <div class="col-md-5">
                        <div class="single-product-slider">
                            <div id="carousel-custom" class="carousel slide" data-ride="carousel">
                                <div class="carousel-outer">
                                    <!-- me art lab slider -->
                                    <div class="carousel-inner">

                                        <c:forEach items="${requestScope.product.images}" var="i" varStatus="status">
                                            <c:if test="${status.index == 0}">
                                                <div class="item active">
                                                    <img src="${i}" alt=""
                                                         data-zoom-image="${i}" />
                                                </div>
                                            </c:if>
                                            <c:if test="${status.index != 0}">
                                                <div class="item">
                                                    <img src="${i}" alt="" data-zoom-image="${i}" />
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>

                                    <!-- sag sol -->
                                    <a class="left carousel-control" href="#carousel-custom"
                                       data-slide="prev">
                                        <i class="tf-ion-ios-arrow-left"></i>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-custom"
                                       data-slide="next">
                                        <i class="tf-ion-ios-arrow-right"></i>
                                    </a>
                                </div>

                                <!-- thumb -->
                                <ol class="carousel-indicators mCustomScrollbar meartlab">
                                    <!-- <li data-target="#carousel-custom" data-slide-to="0" class="active">
                                       <img src="" alt="" />
                                   </li>  -->
                                    <c:forEach var="i" items="${requestScope.product.images}"
                                               varStatus="status">
                                        <c:if test="${status.index == 0}">
                                            <li data-target='#carousel-custom' class="active"
                                                data-slide-to='${status.index }'>
                                                <img src='${i}' alt='' />
                                            </li>
                                        </c:if>
                                        <c:if test="${status.index != 0}">
                                            <li data-target='#carousel-custom'
                                                data-slide-to='${status.index}'>
                                                <img src='${i}' alt='' />
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="single-product-details">
                            <form action="addcart?id=${requestScope.product.id}" method="post" name="f">
                                <h2>${requestScope.product.productName}</h2>
                                <h4 class="price">${requestScope.product.price}₫</h4>
                                <div class="product-category">
                                    <span>Categories:</span>
                                    <ul>
                                        <c:forEach var="i" items="${requestScope.product.categories}">
                                            <li><a href="product-single.html">${i.categoryName}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                                <div class="product-size">
                                    <span>Size:</span>
                                    <div class="d-flex justify-content-center">
                                        <c:forEach items="${requestScope.product.productCatalogs}" var="i">
                                            <div class="size-option">
                                                <input type="radio" id="size${i.size}" name="shoe-size" value="${i.id}" required>
                                                <label for="size${i.size}">${i.size}</label>
                                            </div>
                                        </c:forEach>                             
                                    </div>
                                </div>
                                <div class="product-quantity">
                                    <span>Quantity:</span>
                                    <div class="product-quantity-slider">
                                        <input id="product-quantity" type="text" value="1"
                                               name="product-quantity" />
                                    </div>
                                </div>
                                <input type="submit" class="btn btn-main mt-20" value="Add to Cart">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="tabCommon mt-20">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a data-toggle="tab" href="#details" aria-expanded="true">Details</a>
                                </li>
                                <!--                                <li class="">
                                                                    <a data-toggle="tab" href="#reviews" aria-expanded="false">Reviews
                                                                        (3)</a>
                                                                </li>-->
                            </ul>
                            <div class="tab-content patternbg">
                                <div id="details" class="tab-pane fade active in">
                                        ${requestScope.product.description}
                                </div>
                                <!--                                <div id="reviews" class="tab-pane fade">
                                                                    <div class="post-comments">
                                                                        <ul class="media-list comments-list m-bot-50 clearlist">
                                                                             Comment Item start
                                                                            <li class="media">
                                                                                <a class="pull-left" href="#!">
                                                                                    <img class="media-object comment-avatar"
                                                                                         src="images/blog/avater-1.jpg" alt="" width="50"
                                                                                         height="50" />
                                                                                </a>
                                
                                                                                <div class="media-body">
                                                                                    <div class="comment-info">
                                                                                        <h4 class="comment-author">
                                                                                            <a href="#!">Jonathon Andrew</a>
                                                                                        </h4>
                                                                                        <time datetime="2013-04-06T13:53">July 02, 2015, at
                                                                                            11:34</time>
                                                                                        <a class="comment-button" href="#!"><i
                                                                                                class="tf-ion-chatbubbles"></i>Reply</a>
                                                                                    </div>
                                
                                                                                    <p>
                                                                                        Lorem ipsum dolor sit amet, consectetur adipiscing
                                                                                        elit. Quisque at magna ut ante eleifend
                                                                                        eleifend.Lorem ipsum dolor sit amet, consectetur
                                                                                        adipisicing elit. Quod laborum minima, reprehenderit
                                                                                        laboriosam officiis praesentium? Impedit minus
                                                                                        provident assumenda quae.
                                                                                    </p>
                                                                                </div>
                                                                            </li>
                                                                             End Comment Item 
                                
                                                                             Comment Item start
                                                                            <li class="media">
                                                                                <a class="pull-left" href="#!">
                                                                                    <img class="media-object comment-avatar"
                                                                                         src="images/blog/avater-4.jpg" alt="" width="50"
                                                                                         height="50" />
                                                                                </a>
                                
                                                                                <div class="media-body">
                                                                                    <div class="comment-info">
                                                                                        <div class="comment-author">
                                                                                            <a href="#!">Jonathon Andrew</a>
                                                                                        </div>
                                                                                        <time datetime="2013-04-06T13:53">July 02, 2015, at
                                                                                            11:34</time>
                                                                                        <a class="comment-button" href="#!"><i
                                                                                                class="tf-ion-chatbubbles"></i>Reply</a>
                                                                                    </div>
                                
                                                                                    <p>
                                                                                        Lorem ipsum dolor sit amet, consectetur adipiscing
                                                                                        elit. Quisque at magna ut ante eleifend eleifend.
                                                                                        Lorem ipsum dolor sit amet, consectetur adipisicing
                                                                                        elit. Magni natus, nostrum iste non delectus atque
                                                                                        ab a accusantium optio, dolor!
                                                                                    </p>
                                                                                </div>
                                                                            </li>
                                                                             End Comment Item 
                                
                                                                             Comment Item start
                                                                            <li class="media">
                                                                                <a class="pull-left" href="#!">
                                                                                    <img class="media-object comment-avatar"
                                                                                         src="images/blog/avater-1.jpg" alt="" width="50"
                                                                                         height="50" />
                                                                                </a>
                                
                                                                                <div class="media-body">
                                                                                    <div class="comment-info">
                                                                                        <div class="comment-author">
                                                                                            <a href="#!">Jonathon Andrew</a>
                                                                                        </div>
                                                                                        <time datetime="2013-04-06T13:53">July 02, 2015, at
                                                                                            11:34</time>
                                                                                        <a class="comment-button" href="#!"><i
                                                                                                class="tf-ion-chatbubbles"></i>Reply</a>
                                                                                    </div>
                                
                                                                                    <p>
                                                                                        Lorem ipsum dolor sit amet, consectetur adipiscing
                                                                                        elit. Quisque at magna ut ante eleifend eleifend.
                                                                                    </p>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="products related-products section">
            <div class="container">
                <div class="row">
                    <div class="title text-center">
                        <h2>Related Products</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${requestScope.relatedProducts}" var="c">
                        <div class="col-md-3">
                            <div class="product-item">
                                <div class="product-thumb">
                                    <img class="img-responsive" src="${c.image}" alt="${c.productName}" />
                                    <div class="preview-meta">
                                        <ul>
                                            <li>
                                                <a href="product?id=${c.id}"><i class="tf-ion-ios-search-strong"></i></a> 
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h4><a href="product-single.html">${c.productName}</a></h4>
                                    <p class="price">${c.price}₫</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
        <!-- Main jQuery -->
        <script src="plugins/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.1 -->
        <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
        <!-- Bootstrap Touchpins -->
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
        <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
        <script type="text/javascript" src="plugins/google-map/gmap.js"></script>

        <!-- Main Js File -->
        <script src="js/script.js"></script>
    </body>

</html>
