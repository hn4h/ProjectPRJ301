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
                            <a class="nav-link active" href="changepassword">Change Password</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="purchase">My Purchase</a>
                        </li>
                    </ul>
                </nav>

                <!-- Main Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 p-4">
                    <div class="profile-content">
                        <h3>Change Password</h3>
                        <hr />
                        <p class="success-msg">${requestScope.message}</p>
                        <form id="changepasswordform" method="post" action="changepassword?id=${sessionScope.accountID}">
                            <div class="row mb-3">
                                <label for="oldpassword" class="col-sm-2 col-form-label">Old Password:</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="oldpassword" name="oldpassword" required />
                                </div>
                                <div class="invalid-feedback" id="incorrectpassword" style="display: none;">
                                    Passwords do not match. Please try again.
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="newpassword" class="col-sm-2 col-form-label">New Password:</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="newpassword" name="newpassword" required />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="confirmnewpassword" class="col-sm-2 col-form-label">Confirm New Password:</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="confirmnewpassword" name="confirmnewpassword" required />
                                    <div class="invalid-feedback" id="passwordError" style="display: none;">
                                        Passwords do not match. Please try again.
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="button" class="btn btn-main btn-small btn-round-full" onclick="validatePassword()">
                                    Change Password
                                </button>
                            </div>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <!-- Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <%@include file="footer.jsp" %>

        <script>
                                    function validatePassword() {
                                        const newPassword = document.getElementById('newpassword').value;
                                        const confirmNewPassword = document.getElementById('confirmnewpassword').value;
                                        const passwordError = document.getElementById('passwordError');
                                        const form = document.getElementById('changepasswordform');

                                        if (newPassword !== confirmNewPassword) {
                                            document.getElementById('confirmnewpassword').classList.add('is-invalid');
                                            passwordError.style.display = 'block';
                                        } else {
                                            document.getElementById('confirmnewpassword').classList.remove('is-invalid');
                                            passwordError.style.display = 'none';
                                            form.submit();
                                        }
                                    }
        </script>
    </body>

</html>