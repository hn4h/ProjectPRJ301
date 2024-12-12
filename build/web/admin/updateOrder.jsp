<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Category" %>
<%@page import="dal.CategoryDAO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
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
                                    <li class="submenu-item ">
                                        <a href="manageproduct">Product</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="manageCategory">Category</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="manageBrand">Brand</a>
                                    </li>
                                    <li class="submenu-item active">
                                        <a href="manageOrder">Order</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="manageUser">Customer</a>
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
                                <h3>Order Detail</h3>
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
                                            Order Detail
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
                                                    <h4 class="card-title">Order #${requestScope.order.id}</h4>
                                                </div>
                                                <div class="card-content">
                                                    <div class="card-body">
                                                        <form class="form" action="updateOrder" method="post">
                                                            <input type="hidden" name="id" value="${requestScope.order.id}">
                                                            <div class="row">
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="first-name-column">Customer Name</label>
                                                                        <input type="text" id="first-name-column" class="form-control"
                                                                               placeholder="Customer Name" name="name" value="${requestScope.order.name}" disabled  required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="last-name-column">Phone Number</label>
                                                                        <input type="text" id="last-name-column" class="form-control"
                                                                               placeholder="Phone Number" name="phoneNumber" value="${requestScope.order.phoneNumber}" disabled required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="city-column">Address</label>
                                                                        <input type="text" id="city-column" class="form-control"
                                                                               placeholder="Address" name="address" value="${requestScope.order.address}" disabled required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="last-name-column">Ordered Date</label>
                                                                        <input type="text" id="last-name-column" class="form-control"
                                                                               placeholder="" name="orderedDate" value="${requestScope.order.orderedDate}" disabled required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="city-column">Payment Method</label>
                                                                        <input type="text" id="city-column" class="form-control"
                                                                               placeholder="Address" name="paymentMethod" value="${requestScope.order.paymentMethod}" disabled required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="last-name-column">Total Amount</label>
                                                                        <input type="text" id="last-name-column" class="form-control"
                                                                               placeholder="Phone Number" name="totalAmount" value="${requestScope.order.totalAmount}" disabled required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="last-name-column">Note</label>
                                                                        <input type="text" id="last-name-column" class="form-control"
                                                                               placeholder="" name="Note" value="${requestScope.order.note}" disabled required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="email-id-column">Status</label>
                                                                        <Select class="form-control" name="status">
                                                                            <option value="Pending" ${requestScope.order.status == 'Pending' ? 'selected' : ""}  >Pending</option>
                                                                            <option value="Cancelled" ${requestScope.order.status == 'Cancelled' ? 'selected' : ""}  >Cancelled</option>
                                                                            <option value="On Delivering" ${requestScope.order.status == 'On Delivering' ? 'selected' : ""}  >On Delivering</option>
                                                                            <option value="Successful" ${requestScope.order.status == 'Successful' ? 'selected' : ""}  >Successful</option>
                                                                        </Select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 d-flex justify-content-end">
                                                                    <button type="submit"
                                                                            class="btn btn-primary me-1 mb-1">Submit</button>
                                                                </div>
                                                                <div class="col-12 ">
                                                                    <div class="table-responsive">
                                                                        <table id="table1" class="table table-hover">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th></th>
                                                                                    <th>Product Name</th>
                                                                                    <th>Size</th>
                                                                                    <th>Quantity</th>
                                                                                    <th>Price</th>
                                                                                    <th>Total Price</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <c:forEach var="orderDetail" items="${requestScope.order.list}">
                                                                                    <tr>
                                                                                        <td><img src="${orderDetail.image}" alt="" style="width: 50px; height: auto;"></td>
                                                                                        <td>${orderDetail.name}</td>
                                                                                        <td>${orderDetail.size}</td>
                                                                                        <td>${orderDetail.quantity}</td>
                                                                                        <td>${orderDetail.price}</td>
                                                                                        <td>${orderDetail.totalPrice}</td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
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
