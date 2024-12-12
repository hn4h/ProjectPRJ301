<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard - Shoes World</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="./admin/assets/css/bootstrap.css">

        <link rel="stylesheet" href="./admin/assets/vendors/iconly/bold.css">

        <link rel="stylesheet" href="./admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="./admin/assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="./admin/assets/css/app.css">
        <link rel="shortcut icon" href="./admin/assets/images/logo/logo.png" type="image/x-icon">
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header">
                        <div class="d-flex justify-content-between">
                            <div class="logo">
                                <a href="dashboard"><img style="width: 100%; height: auto;"
                                                         src="./admin/assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                            </div>
                            <div class="toggler">
                                <a href="#" class="sidebar-hide d-xl-none d-block"><i
                                        class="bi bi-x bi-middle"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar-menu">
                        <ul class="menu">
                            <li class="sidebar-title">Menu</li>

                            <li class="sidebar-item active ">
                                <a href="dashboard" class='sidebar-link'>
                                    <i class="bi bi-grid-fill"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>

                            <li class="sidebar-item  has-sub">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-stack"></i>
                                    <span>Mange</span>
                                </a>
                                <ul class="submenu ">
                                    <li class="submenu-item ">
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

                        </ul>
                    </div>
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <header class="mb-3">
                    <a href="#" class="burger-btn d-block d-xl-none">
                        <i class="bi bi-justify fs-3"></i>
                    </a>
                </header>

                <div class="page-heading">
                    <h3>Profile Statistics</h3>
                </div>
                <div class="page-content">
                    <section class="row">
                        <div class="col-12 col-lg-12 row">
                            <div class="row">
                                <div class="col-6 col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body px-3 py-4-5">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="stats-icon purple">
                                                        <i class="iconly-boldShow"></i>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <h6 class="text-muted font-semibold">Total Products</h6>
                                                    <h6 class="font-extrabold mb-0">${requestScope.numOfProduct}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6 col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body px-3 py-4-5">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="stats-icon blue">
                                                        <i class="iconly-boldProfile"></i>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <h6 class="text-muted font-semibold">Total Customer</h6>
                                                    <h6 class="font-extrabold mb-0">${requestScope.numOfCustomer}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6 col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body px-3 py-4-5">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="stats-icon green">
                                                        <i class="iconly-boldAdd-User"></i>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <h6 class="text-muted font-semibold">Revenue this month</h6>
                                                    <h6 class="font-extrabold mb-0"><fmt:formatNumber type="number" value="${requestScope.totalRevenue}" maxFractionDigits="2" />₫</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6 col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body px-3 py-4-5">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="stats-icon red">
                                                        <i class="iconly-boldBookmark"></i>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <h6 class="text-muted font-semibold">Order This Month</h6>
                                                    <h6 class="font-extrabold mb-0">${requestScope.numOfOrder}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row col-12 col-lg-12">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Revenue Chart</h4>
                                        </div>
                                        <div class="card-body">
                                            <form action="dashboard" method="get" >
                                                <select name="chartOption" class="form-select" onchange="this.form.submit()">
                                                    <option value="1" ${requestScope.chartOption == '1' ? 'selected' : ''}>Last 7 days</option>
                                                    <option value="2" ${requestScope.chartOption == '2' ? 'selected' : ''} >Last 30 days</option>
                                                    <option value="3"${requestScope.chartOption == '3' ? 'selected' : ''}>Last 90 days</option>
                                                    <option value="4"${requestScope.chartOption == '4' ? 'selected' : ''}>This Year</option>
                                                </select>
                                            </form>
                                            <div id="revenue-chart">
                                                <!-- <script>
                                                    document.addEventListener("DOMContentLoaded", function () {
                                                        var optionsProfileVisit = {
                                                            annotations: {
                                                                position: 'back'
                                                            },
                                                            dataLabels: {
                                                                enabled: false
                                                            },
                                                            chart: {
                                                                type: 'bar',
                                                                height: 300
                                                            },
                                                            fill: {
                                                                opacity: 1
                                                            },
                                                            plotOptions: {
                                                            },
                                                            series: [{
                                                                    name: 'sales',
                                                                    data: [9, 20, 30, 20, 10, 20, 30, 20, 10, 20, 30, 20]
                                                                }],
                                                            colors: '#435ebe',
                                                            xaxis: {
                                                                categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                                                            },
                                                        }
                                                        var chart = new ApexCharts(document.querySelector("#product-sole"), optionsProfileVisit);
                                                        chart.render();
                                                    });
                                                </script> -->

                                                <script>
                                                    document.addEventListener("DOMContentLoaded", function () {
                                                    var options = {
                                                    series: [{
                                                    name: 'Revenue',
                                                            data: [<c:forEach items="${requestScope.chart}" var="c" varStatus="status">
                                                        ${c.value}<c:if test="${!status.last}">,</c:if>
                                                    </c:forEach>
                                                            ]
                                                    }],
                                                            chart: {
                                                            height: 350,
                                                                    type: 'line',
                                                                    zoom: {
                                                                    enabled: true
                                                                    }
                                                            },
                                                            dataLabels: {
                                                            enabled: false
                                                            },
                                                            stroke: {
                                                            curve: 'smooth'
                                                            },
                                                            grid: {
                                                            row: {
                                                            colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                                                                    opacity: 0.5
                                                            },
                                                            },
                                                            xaxis: {
                                                            categories: [<c:forEach items="${requestScope.chart}" var="c" varStatus="status">
                                                            '${c.columnName}'<c:if test="${!status.last}">,</c:if>
                                                    </c:forEach>],
                                                            }
                                                    };
                                                    var chart = new ApexCharts(document.querySelector("#revenue-chart"), options);
                                                    chart.render();
                                                    });
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>Potential Customers</h4>
                                    </div>
                                    <div class="card-content pb-4">
                                        <c:forEach items="${requestScope.potentialCustomer}" var="c">
                                            <div class="recent-message d-flex px-4 py-3">
                                                <div class="avatar avatar-lg">
                                                    <img src="${c.profileImage}">
                                                </div>
                                                <div class="name ms-4">
                                                    <h5 class="mb-1">${c.firstName} ${c.lastName}</h5>
                                                    <h6 class="text-muted mb-0">@${c.userName}</h6>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                    </section>
                </div>

            </div>
        </div>
        <script src="./admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="./admin/assets/js/bootstrap.bundle.min.js"></script>

        <script src="./admin/assets/vendors/apexcharts/apexcharts.js"></script>
        <script src="./admin/assets/js/pages/dashboard.js"></script>

        <script src="./admin/assets/js/main.js"></script>
    </body>

</html>