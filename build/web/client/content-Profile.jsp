<%-- Document : content-Profile Created on : Oct 9, 2024, 4:34:51 PM Author : 11
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile Page UI</title>
    <!-- Bootstrap 5 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
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
        <nav class="col-md-3 col-lg-2 d-md-block bg-light profile-nav p-3">
          <div class="text-center mb-3">
            <img
              src="${sessionScope.account.profileImage}"
              alt="Profile Picture"
            />
            <h5>${sessionScope.account.userName}</h5>
            <a href="#" class="text-muted">Sửa Hồ Sơ</a>
          </div>
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link active" href="#">Hồ Sơ</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Đổi Mật Khẩu</a>
            </li>
          </ul>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 p-4">
          <div class="profile-content">
            <h3>Hồ Sơ Của Tôi</h3>
            <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
            <hr />
            <form>
              <div class="row mb-3">
                <label for="username" class="col-sm-2 col-form-label"
                  >User Name</label
                >
                <div class="col-sm-10">
                  <input
                    type="text"
                    class="form-control"
                    id="username"
                    value="${sessionScope.account.userName}"
                    disabled
                  />
                </div>
              </div>
              <div class="row mb-3">
                <label for="name" class="col-sm-2 col-form-label">First Name</label>
                <div class="col-sm-10">
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    value="${sessionScope.account.firstName}"
                  />
                </div>
              </div>
              <div class="row mb-3">
                <label for="name" class="col-sm-2 col-form-label">Last Name</label>
                <div class="col-sm-10">
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    value="${sessionScope.account.lastName}"
                  />
                </div>
              </div>
              <div class="row mb-3">
                <label for="email" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    value="${sessionScope.account.email}"
                  />
                  <a href="#" class="text-primary">Thay Đổi</a>
                </div>
              </div>
              <div class="row mb-3">
                <label for="phone" class="col-sm-2 col-form-label"
                  >Số điện thoại</label
                >
                <div class="col-sm-10">
                  <input
                    type="tel"
                    class="form-control"
                    id="phone"
                    value="********84"
                  />
                  <a href="#" class="text-primary">Thay Đổi</a>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Giới tính</label>
                <div class="col-sm-10">
                  <div class="form-check form-check-inline">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="gender"
                      id="male"
                      value="male"
                      checked
                    />
                    <label class="form-check-label" for="male">Nam</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="gender"
                      id="female"
                      value="female"
                    />
                    <label class="form-check-label" for="female">Nữ</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="gender"
                      id="other"
                      value="other"
                    />
                    <label class="form-check-label" for="other">Khác</label>
                  </div>
                </div>
              </div>
              <div class="row mb-3">
                <label for="birthdate" class="col-sm-2 col-form-label"
                  >Ngày sinh</label
                >
                <div class="col-sm-10">
                  <input
                    type="text"
                    class="form-control"
                    id="birthdate"
                    value="**/11/20**"
                  />
                  <a href="#" class="text-primary">Thay Đổi</a>
                </div>
              </div>
              <button type="submit" class="btn btn-primary">Lưu</button>
            </form>
          </div>
        </main>
      </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
