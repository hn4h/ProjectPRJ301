<%-- Document : checkout Created on : Oct 23, 2024, 10:33:00 AM Author : 11 --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            </head>

            <body>
                <%@include file="header.jsp" %>

                    <div class="page-wrapper">
                        <div class="checkout shopping">
                            <div class="container">
                                <form class="checkout-form" action="placeorder" method="post">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="block billing-details">
                                                <h4 class="widget-title">Billing Details</h4>
                                                <div class="form-group">
                                                    <label for="full_name">Full Name</label>
                                                    <input type="text" class="form-control" id="full_name"
                                                        placeholder="" name="name"
                                                        value="${sessionScope.account.firstName} ${sessionScope.account.lastName}"
                                                        required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="Address">Address</label>
                                                    <input type="text" class="form-control" id="Address" name="address"
                                                        placeholder="" value="${sessionScope.account.address}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="user_country">PhoneNumber</label>
                                                    <input type="text" class="form-control" id="user_country"
                                                        placeholder="" name="phoneNumber"
                                                        value="${sessionScope.account.phoneNumber}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="user_country">Note</label>
                                                    <input type="text" class="form-control" id="user_country"
                                                        name="note" placeholder="">
                                                </div>
                                            </div>
                                            <div class="block">
                                                <h4 class="widget-title">Payment Method</h4>
                                                <div class="checkout-product-details">
                                                    <div class="payment">
                                                        <div class="card-details">
                                                            <div>
                                                           <select name="paymentmethod" id="">
                                                                <option value="COD">Cash on Delivery</option>
                                                                <option value="Bank Transfer">Bank Transfer</option>
                                                           </select> 
                                                            </div>
                                                            <input type="submit" class="btn btn-main mt-20" value="Place Order"></input>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="product-checkout-details">
                                                <div class="block">
                                                    <h4 class="widget-title">Order Summary</h4>
                                                    <c:forEach items="${sessionScope.orderItems}" var="i">
                                                        <div class="media product-card">
                                                            <a class="pull-left" href="product-single.html">
                                                                <img class="media-object" src="${i.image}"
                                                                    alt="Image" />
                                                            </a>
                                                            <div class="media-body">
                                                                <h4 class="media-heading"><a
                                                                        href="product-single.html">${i.name}</a>
                                                                </h4>
                                                                <p class="price">${i.quantity} x ${i.price}₫</p>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <ul class="summary-prices">
                                                        <li>
                                                            <span>Shipping:</span>
                                                            <span>Free</span>
                                                        </li>
                                                    </ul>
                                                    <input type="text" name="totalprice" value="${requestScope.totalPrice}" hidden>
                                                    <div class="summary-total">
                                                        <span>Total</span>
                                                        <span>${requestScope.totalPrice}₫</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Modal -->
                        <!-- <div class="modal fade" id="coupon-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input class="form-control" type="text" placeholder="Enter Coupon Code">
                    </div>
                    <button type="submit" class="btn btn-main">Apply Coupon</button>
                </form>
            </div>
        </div>
    </div>
    </div> -->


                        <%@include file="footer.jsp" %>
                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script
                                src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
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
                                
                            </script>
            </body>

            </html>