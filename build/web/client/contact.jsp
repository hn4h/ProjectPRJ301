<%-- 
    Document   : contact
    Created on : Oct 4, 2024, 8:26:16 PM
    Author     : 11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Shoes World</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Construction Html5 Template">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
        <meta name="author" content="Themefisher">
        <meta name="generator" content="Themefisher Constra HTML Template v1.0">

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />

        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="plugins/themefisher-font/style.css">
        <!-- bootstrap.min css -->
        <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">

        <!-- Animate css -->
        <link rel="stylesheet" href="plugins/animate/animate.css">
        <!-- Slick Carousel -->
        <link rel="stylesheet" href="plugins/slick/slick.css">
        <link rel="stylesheet" href="plugins/slick/slick-theme.css">

        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="header.jsp" %>>
        <section class="page-wrapper">
            <div class="contact-section">
                <div class="container">
                    <div class="row">
                        <!-- Contact Form -->
                        <div class="contact-form col-md-6 " >
                            <form id="contact-form" method="post" action="" role="form">

                                <div class="form-group">
                                    <input type="text" placeholder="Your Name" class="form-control" name="name" id="name">
                                </div>

                                <div class="form-group">
                                    <input type="email" placeholder="Your Email" class="form-control" name="email" id="email">
                                </div>

                                <div class="form-group">
                                    <input type="text" placeholder="Subject" class="form-control" name="subject" id="subject">
                                </div>

                                <div class="form-group">
                                    <textarea rows="6" placeholder="Message" class="form-control" name="message" id="message"></textarea>	
                                </div>

                                <div id="mail-success" class="success">
                                    Thank you. The Mailman is on His Way :)
                                </div>

                                <div id="mail-fail" class="error">
                                    Sorry, don't know what happened. Try later :(
                                </div>

                                <div id="cf-submit">
                                    <input type="submit" id="contact-submit" class="btn btn-transparent" value="Submit">
                                </div>						

                            </form>
                        </div>
                        <!-- ./End Contact Form -->

                        <!-- Contact Details -->
                        <div class="contact-details col-md-6 " >
                            <div class="google-map">
                                <div id="map"></div>
                            </div>
                            <ul class="contact-short-info" >
                                <li>
                                    <i class="tf-ion-ios-home"></i>
                                    <span>Khaja Road, Bayzid, Chittagong, Bangladesh</span>
                                </li>
                                <li>
                                    <i class="tf-ion-android-phone-portrait"></i>
                                    <span>Phone: +880-31-000-000</span>
                                </li>
                                <li>
                                    <i class="tf-ion-android-globe"></i>
                                    <span>Fax: +880-31-000-000</span>
                                </li>
                                <li>
                                    <i class="tf-ion-android-mail"></i>
                                    <span>Email: hello@example.com</span>
                                </li>
                            </ul>
                            <!-- Footer Social Links -->
                            <div class="social-icon">
                                <ul>
                                    <li><a class="fb-icon" href="https://www.facebook.com/themefisher"><i class="tf-ion-social-facebook"></i></a></li>
                                    <li><a href="https://www.twitter.com/themefisher"><i class="tf-ion-social-twitter"></i></a></li>
                                    <li><a href="https://themefisher.com/"><i class="tf-ion-social-dribbble-outline"></i></a></li>
                                    <li><a href="https://themefisher.com/"><i class="tf-ion-social-googleplus-outline"></i></a></li>
                                    <li><a href="https://themefisher.com/"><i class="tf-ion-social-pinterest-outline"></i></a></li>
                                </ul>
                            </div>
                            <!--/. End Footer Social Links -->
                        </div>
                        <!-- / End Contact Details -->



                    </div> <!-- end row -->
                </div> <!-- end container -->
            </div>
        </section>
        <%@include file="footer.jsp" %>>
    </body>
</html>
