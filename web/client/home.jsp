<%-- 
    Document   : home
    Created on : Oct 4, 2024, 8:16:04 PM
    Author     : 11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Shoes World</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="Construction Html5 Template" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=5.0"
            />
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
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="banner.jsp" %>

        <section class="product-category section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title text-center">
                            <h2>Feature Products</h2>
                        </div>
                    </div>
                    <c:forEach items="${requestScope.topCardBestSeller}" var="c">
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
        <section class="product-category section">

        <section class="product-category section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title text-center">
                            <h2>Best Seller</h2>
                        </div>
                    </div>
                    <c:forEach items="${requestScope.topCardBestSeller}" var="c">
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
        <section class="product-category section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title text-center">
                            <h2>New Products</h2>
                        </div>
                    </div>
                    <c:forEach items="${requestScope.topCardNewFeatures}" var="c">
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
        <!-- Best Seller Section -->
        <%@include file="footer.jsp" %>
        <!-- Make sure to include Bootstrap's JavaScript and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>