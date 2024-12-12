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
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="./admin/assets/vendors/quill/quill.bubble.css">
        <link rel="stylesheet" href="./admin/assets/vendors/quill/quill.snow.css">

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
                                                    <h4 class="card-title">${requestScope.product.productName}</h4>
                                                </div>
                                                <div class="card-content">
                                                    <div class="card-body">
                                                        <form class="form" id="updateForm" action="updateProduct" method="post">
                                                            <input type="hidden" name="id" value="${requestScope.product.id}">
                                                            <div class="row">
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="first-name-column">Product Name</label>
                                                                        <input type="text" id="first-name-column" class="form-control"
                                                                               placeholder="Product Name" name="productName" value="${requestScope.product.productName}" required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="last-name-column">Price</label>
                                                                        <input type="text" id="last-name-column" class="form-control"
                                                                               placeholder="Price" name="price" value="${requestScope.product.price}" required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="city-column">Product Code</label>
                                                                        <input type="text" id="city-column" class="form-control"
                                                                               placeholder="Product Code" name="productCode" value="${requestScope.product.productCode}" required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="country-floating">Brand</label>
                                                                        <Select class="form-control" name="brand">
                                                                            <c:forEach var="brand" items="${requestScope.brands}">
                                                                                <option value="${brand.id}" ${brand.id == requestScope.product.brand.id ? 'selected' : ''}>${brand.brandName}</option>
                                                                            </c:forEach>
                                                                        </Select>

                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="company-column">Category</label>
                                                                        <ul class="list-group">
                                                                            <% CategoryDAO d = new CategoryDAO(); 
                                                                        List<Category> c = d.getAllCategory();
                                                                                  request.setAttribute("categories", c);

                                                                            %>
                                                                            <c:forEach var="c" items="${requestScope.categories}">
                                                                                <li class="list-group-item">
                                                                                    <input class="form-check-input me-1" type="checkbox" name="category" value="${c.id}" 
                                                                                           <c:forEach var="selected" items="${requestScope.product.categories}">
                                                                                               <c:if test="${selected.id == c.id}">checked</c:if>
                                                                                           </c:forEach>>
                                                                                    ${c.categoryName}</li>
                                                                                </c:forEach>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 col-12">
                                                                    <div class="form-group">
                                                                        <label for="email-id-column">Status</label>
                                                                        <Select class="form-control" name="isStorage">
                                                                            <option value="false" <c:if test="${!p.isStorage}">selected </c:if> >Active</option>
                                                                            <option value="true" <c:if test="${p.isStorage}">selected </c:if> >Inactive</option>
                                                                        </Select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 col-12">
                                                                    <section class="section">
                                                                        <div class="card">
                                                                            <div class="card-header">
                                                                                <h4 class="card-title">Description</h4>
                                                                            </div>
                                                                            <div class="card-body">
                                                                                <div id="editor">
                                                                                    ${requestScope.product.description}
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <input type="hidden" name="description" id="descriptionContent">
                                                                    </section>
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
        <script src="./admin/assets/vendors/quill/quill.min.js"></script>
        <script src="./admin/assets/js/pages/form-editor.js"></script>
        <script>
            var myToolbar= [
    ['bold', 'italic', 'underline', 'strike'],       
    ['blockquote', 'code-block'],

    [{ 'color': [] }, { 'background': [] }],         
    [{ 'font': [] }],
    [{ 'align': [] }],

    ['clean'],                                        
    ['image'] //add image here
];
    var quill = new Quill('#editor', {
        theme: 'snow',
        modules: {
        toolbar: {
            container: myToolbar,
            handlers: {
                image: imageHandler
            }
        }
    },
    });
function imageHandler() {
    var range = this.quill.getSelection();
    var value = prompt('please copy paste the image url here.');
    if(value){
        this.quill.insertEmbed(range.index, 'image', value, Quill.sources.USER);
    }
}

            document.getElementById('updateForm').onsubmit = function () {
                // Capture the HTML content
                var html = quill.root.innerHTML;

                // Set it to the hidden input
                document.getElementById('descriptionContent').value = html;
            };

        </script>
    </body>
</html>