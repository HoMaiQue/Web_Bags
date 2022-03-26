<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div id="pre-header">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <span>Fasshion is armor to survive the reality of everyday life</span>
        </div>
      </div>
    </div>
  </div>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top" style="padding: 5px 0 ">
    <div class="container">
      <!-- logo -->
      <a class="navbar-brand" href="index.htm" style="padding: 0"><img src="<c:url value='/resources/assets/images/Shop.png'/>" alt="" style="height: 87px;"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <div class="wrap-all">
          <div class="nav-wrap__nav">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item ">
                <a class="nav-link" href="index.htm">Trang chủ
                  <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="products/index.htm">Sản phẩm</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.htm">Giới thiệu</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.htm">Liên hệ</a>
              </li>
            </ul>
          </div>
          <div class="cart-search-wrap">
            <div class="nav-search">
              <form action="http://localhost:8080/Web_Bags/products/index.htm">
                <input name ="searchInput" type="text" class="nav-search-input" placeholder="Tìm kiếm trong shop" style="padding-left: 10px">
                <button name="btnsearch" class="nav-search-btn">
                  <i class="fas fa-search nav-search-btn-icon"></i>
                </button>
                </form>
            </div>

            <div class="nav-cart">
              <i class="nav-cart-icon fas fa-shopping-cart"></i>
              <!-- no cart : nav-cart-no-cart -->
              <div class="nav-cart-has-cart">

                <img src="https://uchimart.com/assets/images/no-cart.png" alt="no cart" class="nav-cart-no-cart-img">
                <span class="nav-cart-no-cart-title">Chưa có sản phẩm nào </span>
                <h3 class="nav-cart-title">Sản phẩm đã thêm</h3>
                <ul class="nav-cart-list-item">
                  <c:forEach var="ca" items="${getCart}">
                  <li class="nav-cart-item">
                    <img src="<c:url value='/resources/assets/images/${ca.getPk().getProductEntity().getImage() }'/>" alt=""class="nav-cart-item-img">
                    <div class="nav-cart-item-detail">
                      <div class="nav-cart-item-head">
                        <h4 class="nav-cart-item-name">${ca.getPk().getProductEntity().getTitle() }</h4>
                        <div class="nav-cart-item-wrap">
                          <span class="nav-cart-item-price">${ca.getPk().getProductEntity().getPrice() }</span>
                          <span class="nav-cart-item-multiple">x</span>
                          <span class="nav-cart-item-quantity">${ca.getQuantity() }</span>


                        </div>
                      </div>
                      <div class="nav-cart-item-body">
                        <span class="nav-cart-item-stock">Màu sắc: ${ca.getPk().getProductEntity().getColors().getName_color() }</span>
                        <a href="singleproduct/${ca.getPk().getProductEntity().getId_product()}.htm?delete" class="nav-cart-item-delete">Xóa</a>
                      </div>
</div>
                    </li>
                 </c:forEach>
                  </ul>
                  <div class="nav-cart-wrap-btn-delete">
                    <a href="bill/index.htm" class="nav-cart-item-view-cart">Xem giỏ hàng</a>
                  </div>
                   
                  
                
                </div>
             
              </div>

            <!-- nav-login-no-login -->

            <div class="nav-login ${loginStatus} }">
                <i class="fas fa-user nav-login-icon"></i>
                <ul class="nav-login-list" style="width: 110px; border-radius: 5px;">
                  <li class="nav-login-item">
                    
                    <a href="login.htm" class="nav-login-link-login">Đăng nhập</a>
                  </li>
                  <li class="nav-login-item">
                    
                    <a href="register.htm" class="nav-login-link-register">Đăng kí</a>
                  </li>
                  
                </ul>
                
                <div class="nav-show-pur">
                	<span class="nav-login-name"> ${currentUser}</span>
                	<ul class="nav-show-pur-list">
                  <li class="nav-show-pur-item">
  
                    <a href="changeUser.htm" class="nav-show-pur-link">Sửa tài khoản</a>
                  </li>
                  <li class="nav-show-pur-item">
  
                    <a href="purchase.htm" class="nav-show-pur-link">Đơn đã mua</a>
                  </li>
                </ul>
                </div>
                <a href="login.htm" class="fas fa-sign-out-alt nav-login-icon"></a>
              </div>


          </div>
        </div>

      </div>
    </div>
  </nav>