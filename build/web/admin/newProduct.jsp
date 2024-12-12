<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
                                                                 uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Dashboard - Shoes World</title>

        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link rel="stylesheet" href="./admin/assets/css/bootstrap.css" />

        <link rel="stylesheet" href="./admin/assets/vendors/iconly/bold.css" />

        <link
            rel="stylesheet"
            href="./admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css"
            />
        <link
            rel="stylesheet"
            href="./admin/assets/vendors/bootstrap-icons/bootstrap-icons.css"
            />
        <link rel="stylesheet" href="./admin/assets/css/app.css" />
        <link
            rel="shortcut icon"
            href="./admin/assets/images/logo/logo.png"
            type="image/x-icon"
            /> 
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./admin/assets/vendors/simple-datatables/style.css">
    </head>
    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header">
                        <div class="d-flex justify-content-between">
                            <div class="logo">
                                <a href="dashboard"
                                   ><img
                                        style="width: 100%; height: auto"
                                        src="./admin/assets/images/logo/logo.png"
                                        alt="Logo"
                                        srcset=""
                                        /></a>
                            </div>
                            <div class="toggler">
                                <a href="#" class="sidebar-hide d-xl-none d-block"
                                   ><i class="bi bi-x bi-middle"></i
                                    ></a>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar-menu">
                        <ul class="menu">
                            <li class="sidebar-title">Menu</li>

                            <li class="sidebar-item">
                                <a href="dashboard" class="sidebar-link">
                                    <i class="bi bi-grid-fill"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>

                            <li class="sidebar-item has-sub active">
                                <a href="#" class="sidebar-link">
                                    <i class="bi bi-stack"></i>
                                    <span>Mange</span>
                                </a>
                                <ul class="submenu active">
                                    <li class="submenu-item active">
                                        <a href="manageproduct">Product</a>
                                    </li>
                                <li class="submenu-item ">
                                    <a href="manageCategory">Category</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="manageBrand">Brand</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="manageOrder">Order</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="manageUser">Customer</a>
                                </li>
                                </ul>
                            </li>

                            <li class="sidebar-item has-sub">
                                <a href="#" class="sidebar-link">
                                    <i class="bi bi-collection-fill"></i>
                                    <span>Statistic</span>
                                </a>
                                <ul class="submenu">
                                    <li class="submenu-item">
                                        <a href="extra-component-avatar.html">Avatar</a>
                                    </li>
                                    <li class="submenu-item">
                                        <a href="extra-component-sweetalert.html">Sweet Alert</a>
                                    </li>
                                    <li class="submenu-item">
                                        <a href="extra-component-toastify.html">Toastify</a>
                                    </li>
                                    <li class="submenu-item">
                                        <a href="extra-component-rating.html">Rating</a>
                                    </li>
                                    <li class="submenu-item">
                                        <a href="extra-component-divider.html">Divider</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <button class="sidebar-toggler btn x">
                        <i data-feather="x"></i>
                    </button>
                </div>
            </div>
            <div id="main">
                <header class="mb-3">
                    <a href="#" class="burger-btn d-block d-xl-none">
                        <i class="bi bi-justify fs-3"></i>
                    </a>
                </header>

                <div class="page-heading">
                    <div class="page-title">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Update Product</h3>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav
                                    aria-label="breadcrumb"
                                    class="breadcrumb-header float-start float-lg-end"
                                    >
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item">
                                            <a href="dashboard">Dashboard</a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            Update Product
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <!-- Edit here -->

                        <div class="card">
                            <div class="card-body">
                                <section id="multiple-column-form">
                                    <div class="row match-height">
                                        <div class="col-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h4 class="card-title">Multiple Column</h4>
                                                </div>
                                                <div class="card-content">
                                                    <div class="card-body">
                                                        <form class="form">
                                                            <div class="row">
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="first-name-column">First Name</label>
                                                                        <input type="text" id="first-name-column" class="form-control"
                                                                               placeholder="First Name" name="fname-column">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="last-name-column">Last Name</label>
                                                                        <input type="text" id="last-name-column" class="form-control"
                                                                               placeholder="Last Name" name="lname-column">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="city-column">City</label>
                                                                        <input type="text" id="city-column" class="form-control"
                                                                               placeholder="City" name="city-column">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="country-floating">Country</label>
                                                                        <input type="text" id="country-floating" class="form-control"
                                                                               name="country-floating" placeholder="Country">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="company-column">Company</label>
                                                                        <input type="text" id="company-column" class="form-control"
                                                                               name="company-column" placeholder="Company">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="email-id-column">Email</label>
                                                                        <input type="email" id="email-id-column" class="form-control"
                                                                               name="email-id-column" placeholder="Email">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-12">
                                                                    <div class='form-check'>
                                                                        <div class="checkbox">
                                                                            <input type="checkbox" id="checkbox5"
                                                                                   class='form-check-input' checked>
                                                                            <label for="checkbox5">Remember Me</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 d-flex justify-content-end">
                                                                    <button type="submit"
                                                                            class="btn btn-primary me-1 mb-1">Submit</button>
                                                                    <button type="reset"
                                                                            class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>

                        <!--ENd main Content -->
                    </section>
                </div>
            </div>
        </div>

        <script src="./admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="./admin/assets/js/bootstrap.bundle.min.js"></script>

        <script src="./admin/assets/vendors/simple-datatables/simple-datatables.js"></script>
        <script>
            // Simple Datatable
            let table1 = document.querySelector("#table1");
            let dataTable = new simpleDatatables.DataTable(table1);
        </script>
        <script src="./admin/assets/js/main.js"></script>
    </body>
</html>
