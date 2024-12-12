<%-- 
    Document   : cart
    Created on : Oct 19, 2024, 10:13:56 AM
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
        <style>
            .truncate {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .product-info {
                display: flex;
                align-items: center;
            }
            .product-info img {
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="page-wrapper">
            <div class="cart shopping">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10" style="margin: 0 auto;" >
                            <div class="block">
                                <div class="product-list">
                                    <form method="post" action="checkout">
                                        <div id="success-popup" class="modal" tabindex="-1" role="dialog">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Success</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p style="color: green;">${requestScope.successful}</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            $(document).ready(function () {
                                                if ("${requestScope.successful}" !== "") {
                                                    $('#success-popup').modal('show');
                                                }
                                            });
                                        </script>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class=""><input type="checkbox" id="select-all" /></th>
                                                    <th class="">Product</th>
                                                    <th class="">Size</th>
                                                    <th class="">Price</th>
                                                    <th class="">Quantity</th>
                                                    <th class="">Total Price</th>
                                                    <th class="">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.carts}" var="i">
                                                    <tr class="">
                                                        <td class=""><input type="checkbox" name="selectedProducts" value="${i.id}" class="product-checkbox" /></td>
                                                        <td class="">
                                                            <div class="product-info">
                                                                <img width="80" src="${i.image}" alt="" />
                                                                <a href="product?id=${i.productID}" class="truncate">${i.name}</a>
                                                            </div>
                                                        </td>
                                                        <td class="">${i.size}</td>
                                                        <td class="">
                                                            <div>
                                                                <p class="price">${i.price}₫</p>
                                                            </div>
                                                        </td>
                                                        <td class="">
                                                            <div class="product-quantity-slider">
                                                                <input id="product-quantity" type="text" value="${i.quantity}" style="height: 34px; width: 50px;"
                                                                       name="product-quantity" />
                                                            </div>
                                                        </td>
                                                        <td class="">${i.totalPrice}</td>
                                                        <td class="">
                                                            <a class="product-remove" href="removecart?id=${i.id}">Remove</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <button type="submit" formaction="checkout" class="btn btn-main pull-right">Checkout</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                                            document.getElementById('select-all').onclick = function () {
                                                var checkboxes = document.getElementsByName('selectedProducts');
                                                for (var checkbox of checkboxes) {
                                                    checkbox.checked = this.checked;
                                                }
                                            }

                                            var productCheckboxes = document.getElementsByClassName('product-checkbox');
                                            for (var checkbox of productCheckboxes) {
                                                checkbox.onclick = function () {
                                                    if (!this.checked) {
                                                        document.getElementById('select-all').checked = false;
                                                    } else {
                                                        var allChecked = true;
                                                        for (var cb of productCheckboxes) {
                                                            if (!cb.checked) {
                                                                allChecked = false;
                                                                break;
                                                            }
                                                        }
                                                        document.getElementById('select-all').checked = allChecked;
                                                    }
                                                }
                                            }
        </script>
    </body>
</html>
