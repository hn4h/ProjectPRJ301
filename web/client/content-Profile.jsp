<%-- Document : content-Profile Created on : Oct 9, 2024, 4:34:51 PM Author : 11 --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Profile Page UI</title>
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
                            <a class="nav-link active" href="profile">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="changepassword">Change Password</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="purchase">My Purchase</a>
                        </li>
                    </ul>
                </nav>

                <!-- Main Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 p-4">
                    <div class="profile-content row">
                        <h3>My Profile</h3>
                        <hr />
                        <div class="col-md-8">
                            <form method="post" action="updateprofile?id=${sessionScope.accountID}">
                                <div class="row mb-3">
                                    <label for="username" class="col-sm-2 col-form-label">User Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="username" value="${sessionScope.account.userName}"
                                               disabled name="username" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="name" class="col-sm-2 col-form-label">First Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" value="${sessionScope.account.firstName}"
                                               name="firstname" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="name" class="col-sm-2 col-form-label">Last Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" value="${sessionScope.account.lastName}"
                                               name="lastname" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="email" class="col-sm-2 col-form-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email" value="${sessionScope.account.email}" disabled
                                               name="email" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="phone" class="col-sm-2 col-form-label">Phone Number</label>
                                    <div class="col-sm-10">
                                        <input type="tel" class="form-control" id="phone" value="${sessionScope.account.phoneNumber}"
                                               name="phonenumber" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="Address" class="col-sm-2 col-form-label">Address</label>
                                    <div class="col-sm-10">
                                        <input type="tel" class="form-control" id="phone" value="${sessionScope.account.address}"
                                               name="address" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="phone" class="col-sm-2 col-form-label">Created Date</label>
                                    <div class="col-sm-10">
                                        <input type="tel" class="form-control" id="phone" value="${sessionScope.account.createdDate}"
                                               disabled />
                                    </div>
                                </div>
                                <div class="text-center ">
                                    <button type="submit" class="btn btn-main btn-small btn-round-full">Save</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-4">
                            <div class="row mb-3 profile-picture">
                                <div class="col-sm-12">
                                    <form action="uploadProfileImage" method="post" enctype="multipart/form-data">
                                        <p>${sessionScope.successful}</p>
                                        <p>${sessionScope.error}</p>
                                        <img src="${sessionScope.account.profileImage}" alt="Profile Image">
                                        <br>
                                        <input type="file" name="profileImage" accept="image/*" required>
                                        <button type="submit" class="btn btn-main btn-small btn-round">Upload Image</button>
                                    </form>
                                </div>
                            </div>
                        </div>                
                    </div>
                </main>
            </div>
        </div>

        <!-- Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>