<%-- Document : dashboard Created on : Oct 5, 2024, 9:42:16 PM Author : 11 --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Construction Html5 Template" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, maximum-scale=5.0"
    />
    <meta name="author" content="Themefisher" />
    <meta name="generator" content="Themefisher Constra HTML Template v1.0" />

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />

    <!-- Themefisher Icon font -->
    <link rel="stylesheet" href="plugins/themefisher-font/style.css" />
    <!-- bootstrap.min css -->
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css" />

    <!-- Animate css -->
    <link rel="stylesheet" href="plugins/animate/animate.css" />
    <!-- Slick Carousel -->
    <link rel="stylesheet" href="plugins/slick/slick.css" />
    <link rel="stylesheet" href="plugins/slick/slick-theme.css" />

    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="css/style.css" />
  </head>

  <body id="body">
    <%@include file="header.jsp" %>

    <section class="page-header">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="content">
              <h1 class="page-name">Dashboard</h1>
              <ol class="breadcrumb">
                <li><a href="home">Home</a></li>
                <li class="active"><a href="dashboard">Dashboard</a></li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="user-dashboard page-wrapper">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="dashboard-wrapper user-dashboard">
              <!-- Add Button -->
              <div class="btn-group" role="group">
                <button
                  type="button"
                  class="btn btn-default"
                  onclick="addMaker()"
                >
                  <i class="tf-ion-plus-circled" aria-hidden="true"></i>
                </button>
              </div>
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${requestScope.makers}" var="m">
                      <tr>
                        <td>${m.name}</td>
                        <td>
                          <div class="btn-group" role="group">
                            <button
                              type="button"
                              class="btn btn-default"
                              onclick="updateMaker(${m.id})"
                            >
                              <i class="tf-pencil2" aria-hidden="true"></i>
                            </button>
                            <button
                              type="button"
                              class="btn btn-default"
                              onclick="deleteMaker(${m.id})"
                            >
                              <i class="tf-ion-close" aria-hidden="true"></i>
                            </button>
                          </div>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <%@include file="footer.jsp" %>
    <!-- 
          Essential Scripts
          =====================================-->

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

    <!-- Main Js File -->
    <script src="js/script.js"></script>
    <script>
      function updateMaker(id) {
        window.location.href = "updateMaker?id=" + id;
      }
      function deleteMaker(id) {
        window.location.href = "deleteMaker?id=" + id;
      }
      function addMaker() {
        window.location.href = "addMaker";
      }
    </script>
  </body>
</html>
