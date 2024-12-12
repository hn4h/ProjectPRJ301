<%-- Document : changepassword Created on : Oct 10, 2024, 5:09:57 PM Author : 11 --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
        <style>
            body {
                background-color: #f8f9fa;
            }

            .profile-nav {
                background-color: white;
                border-right: 1px solid #ddd;
                height: 100vh;
            }

            .profile-nav .nav-link {
                font-size: 16px;
                color: #333;
            }

            .profile-nav .nav-link.active {
                color: #ff4500;
            }

            .profile-nav img {
                border-radius: 50%;
                width: 80px;
                height: 80px;
            }

            .profile-content {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .profile-content input,
            .profile-content select {
                max-width: 300px;
            }

            .profile-picture {
                text-align: center;
            }

            .profile-picture img {
                border-radius: 50%;
                width: 100px;
                height: 100px;
            }

            .profile-picture button {
                margin-top: 10px;
            }

            .modal {
                background-color: rgba(0, 0, 0, 0.5);
            }

            .modal-dialog {
                margin: 1.75rem auto;
            }

            .modal.show {
                display: block;
                padding-right: 17px;
            }

            .modal-backdrop {
                z-index: 1040;
            }

            .modal {
                z-index: 1050;
            }
        </style>
    </head>

    <body>
        <%@include file="header.jsp" %>

        <div class="container">
            <div class="row container">
                <!-- Left Navbar -->
                <nav class="col-md-3 col-lg-2 d-md-block profile-nav p-3">
                    <div class="text-center mb-3">
                        <img src="${sessionScope.account.profileImage}" alt="Profile Picture" />
                        <h5>${sessionScope.account.userName}</h5>
                        <a href="profile" class="text-muted">Edit Profile</a>
                    </div>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="profile">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="changepassword">Change Password</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="purchase">My Purchase</a>
                        </li>
                    </ul>
                </nav>

                <!-- Main Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 p-4">
                    <div class="profile-content">
                        <h3>My Purchase</h3>
                        <hr />

                        <div class="dashboard-wrapper user-dashboard">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Total Price</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.orders}" var="o">
                                            <tr>
                                                <td>${o.orderedDate}</td>
                                                <td>${o.totalAmount}₫</td>
                                                <td>
                                                    <c:if test="${o.status == 'Pending'}">
                                                        <span class="label label-primary">Pending</span>
                                                    </c:if>
                                                    <c:if test="${o.status == 'Cancelled'}">
                                                        <span class="label label-danger">Cancelled</span>
                                                    </c:if>
                                                    <c:if test="${o.status == 'On Delivering'}">
                                                        <span class="label label-info">On Delivering</span>
                                                    </c:if>
                                                    <c:if test="${o.status == 'Successful'}">
                                                        <span class="label label-success">Successful</span>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <a href="#" type="button" class="btn btn-default">View</a>
                                                    <c:if test="${o.status == 'Pending'}">
                                                        <button type="button" class="btn btn-danger" onclick="myFunction('${o.orderID}')">Cancel</button>
                                                    </c:if>
                                                    <c:if test="${o.status == 'On Delivering'}">
                                                        <button type="button" class="btn btn-danger" onclick="myFunction('${o.orderID}')">Cancel</button>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>


        <%@include file="footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

        <!-- Add this before closing body tag -->
        <script>
                                                            // Debug modal behavior
                                                            $(document).ready(function () {
                                                                $('.modal').on('show.bs.modal', function (e) {
                                                                    console.log('Modal is showing');
                                                                });

                                                                $('.modal').on('shown.bs.modal', function (e) {
                                                                    console.log('Modal is shown');
                                                                });

                                                                // Test if button click is working
                                                                $('[data-bs-toggle="modal"]').click(function () {
                                                                    console.log('Modal button clicked');
                                                                });
                                                            });
                                                            function myFunction(id) {
                                                                if (confirm("Are you sure you want to cancel this order?")) {
                                                                    window.location.href = "cancelOrder?id=" + id;
                                                                }

                                                            }
        </script>

    </body>

</html>