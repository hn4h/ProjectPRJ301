<%-- 
    Document   : search
    Created on : Oct 28, 2024, 4:01:56 PM
    Author     : 11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.lang.Math" %>
<%@page import="model.Brand" %>
<%@page import="dal.BrandDAO" %>
<%@page import="model.Category" %>
<%@page import="dal.CategoryDAO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%
// Assuming page, totalPages, and items have been set by the servlet
int currentPage = (request.getAttribute("currentPage") != null) ? (int) request.getAttribute("currentPage") : 1;
int totalPages = (request.getAttribute("totalPages") != null) ? (int) request.getAttribute("totalPages") : 1;
%>
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
            .filter-section {
                margin-top: 15px;
            }

            .filter-section h5 {
                font-size: 14px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .filter-section ul {
                list-style: none;
                padding: 0;
            }

            .filter-section li {
                margin-bottom: 5px;
            }

            input[type="range"] {
                width: 100%;
            }
            .filter-section {
                margin-top: 15px;
            }

            .filter-section h5 {
                font-size: 14px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .filter-section ul {
                list-style: none;
                padding: 0;
            }

            .filter-section li {
                margin-bottom: 5px;
            }

            input[type="range"] {
                width: 100%;
            }
            .filter-section {
                margin-top: 15px;
            }

            #search-box {
                border-radius: 4px 0 0 4px;
            }

            #search-button {
                border-radius: 0 4px 4px 0;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <section class="products section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3"> 
                        <form action="search" method="get">
                            <!-- New Filter Sidebar Section -->
                            <div class="widget">
                                <div class="filter-section">
                                    <h5>Search</h5>
                                    <div class="input-group">
                                        <input type="text" id="search-box" class="form-control" placeholder="Search..." name="search" value="${requestScope.searchQuery}">
                                        <div class="input-group-append">
                                            <!-- <button type="submit" id="search-button" class="btn btn-primary">
                                                <i class="tf-ion-ios-search-strong"></i>
                                            </button> -->
                                        </div>
                                    </div>
                                </div>
                                <h4 class="widget-title">Filter By</h4>
                                <!-- Search Box -->

                                <!-- Brand Filter -->
                                <div class="filter-section">
                                    <h5>Brand</h5>
                                    <ul>
                                        <% BrandDAO brandDAO = new BrandDAO(); 
                                        List<Brand> brands = brandDAO.getAllBrands();
                                                  request.setAttribute("brands", brands);

                                        %>
                                        <c:forEach var="brand" items="${requestScope.brands}">
                                            <li>
                                                <input type="checkbox" name="brand" value="${brand.id}" onchange="this.form.submit()" 
                                                       <c:forEach var="selectedBrand" items="${selectedBrands}">
                                                           <c:if test="${selectedBrand == brand.id}">checked</c:if>
                                                       </c:forEach>> 
                                                ${brand.brandName}
                                            </li>
                                        </c:forEach>


                                    </ul>
                                </div>

                                <!-- Price Filter -->

                                <!-- Category Filter -->
                                <div class="filter-section">
                                    <h5>Category</h5>
                                    <ul>

                                        <% CategoryDAO d = new CategoryDAO(); 
                                    List<Category> c = d.getAllCategory();
                                              request.setAttribute("categories", c);

                                        %>
                                        <c:forEach var="c" items="${requestScope.categories}">
                                            <li><input type="checkbox" name="category" value="${c.id}" onchange="this.form.submit()"
                                                       <c:forEach var="selected" items="${selectedCategories}">
                                                           <c:if test="${selected == c.id}">checked</c:if>
                                                       </c:forEach>> 
                                                ${c.categoryName}</li>
                                            </c:forEach>

                                    </ul>
                                </div>
                                <div class="filter-section">
                                    <h5>Price</h5>
                                    <ul>
                                        <li><input type="checkbox" name="price-range" value="0-1000000" onchange="this.form.submit()"
                                                   <c:forEach var="selected" items="${priceRange}">
                                                       <c:if test="${selected == '0-1000000'}">checked</c:if>
                                                   </c:forEach>> Under 1,000,000₫</li>
                                        <li><input type="checkbox" name="price-range" value="1000000-2000000"onchange="this.form.submit()"
                                                   <c:forEach var="selected" items="${priceRange}">
                                                       <c:if test="${selected == '1000000-2000000'}">checked</c:if>
                                                   </c:forEach>> 1,000,000₫ - 2,000,000₫</li>
                                        <li><input type="checkbox" name="price-range" value="2000000-3000000"onchange="this.form.submit()"
                                                   <c:forEach var="selected" items="${priceRange}">
                                                       <c:if test="${selected == '2000000-3000000'}">checked</c:if>
                                                   </c:forEach>> 2,000,000₫ - 3,000,000₫</li>
                                        <li><input type="checkbox" name="price-range" value="3000000-4000000"onchange="this.form.submit()"
                                                   <c:forEach var="selected" items="${priceRange}">
                                                       <c:if test="${selected == '3000000-4000000'}">checked</c:if>
                                                   </c:forEach>> 3,000,000₫ - 4,000,000₫</li>
                                        <li><input type="checkbox" name="price-range" value="4000000-99000000"onchange="this.form.submit()"
                                                   <c:forEach var="selected" items="${priceRange}">
                                                       <c:if test="${selected == '4000000-99000000'}">checked</c:if>
                                                   </c:forEach>> Above 4,000,000₫</li>
                                    </ul>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="section-title">
                                    <h2>Search Results</h2>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <form method="get" action="search">
                                    <div class="form-group">
                                        <label for="sort">Sort by:</label>
                                        <select name="sort" id="sort" class="form-control" onchange="this.form.submit()">
                                            <option value="relevance" ${requestScope.sortOption == 'relevance' ? 'selected' : ''}>Relevance</option>
                                            <option value="price-asc" ${requestScope.sortOption == 'price-asc' ? 'selected' : ''}>Price: Low to High</option>
                                            <option value="price-desc" ${requestScope.sortOption == 'price-desc' ? 'selected' : ''}>Price: High to Low</option>
                                            <option value="name-asc" ${requestScope.sortOption == 'name-asc' ? 'selected' : ''}>Name: A to Z</option>
                                            <option value="name-desc" ${requestScope.sortOption == 'name-desc' ? 'selected' : ''}>Name: Z to A</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <p>${requestScope.message}</p>
                            <c:forEach var="c" items="${requestScope.cards}">
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

                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
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
        <script>
                                            const priceRange = document.getElementById("price-range");
                                            const priceValue = document.getElementById("price-value");

                                            priceRange.addEventListener("input", function () {
                                                priceValue.textContent = priceRange.value;
                                            });

        </script>
    </body>
</html>