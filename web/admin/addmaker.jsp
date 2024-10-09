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
        <%@include file="header.jsp" %>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">Add Maker</h1>
					<ol class="breadcrumb">
						<li><a href="home">Home</a></li>
						<li class="active"><a href="dashboard">Dashboard</a></li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
        <section class="page-wrapper">
            <div class="contact-section">
                <div class="container">
                    <div class="row">
                        <!-- Contact Form -->
                        <div class="contact-form col-md-6 " >
                            <form id="contact-form" method="post" action="addMaker" role="form">

                                <div class="form-group">
                                    <input type="text" placeholder="Name of Maker" class="form-control" name="name" id="name">
                                </div>
                                <div id="cf-submit">
                                    <input type="submit" id="contact-submit" class="btn btn-transparent" value="Submit">
                                </div>						

                            </form>
                        </div>
                        <!-- ./End Contact Form -->



                    </div> <!-- end row -->
                </div> <!-- end container -->
            </div>
        </section>
        <%@include file="footer.jsp" %>>
    </body>
</html>

