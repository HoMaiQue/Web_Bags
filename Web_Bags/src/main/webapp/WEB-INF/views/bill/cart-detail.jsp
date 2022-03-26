<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <title>QA shop | Chi tiết đơn hàng</title>
      <link rel="icon" href="<c:url value='/resources/assets/images/ShopTitleIcon.svg'/>" type="image/gif" sizes="20x20">
	<base href="${pageContext.servletContext.contextPath}/">
    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link href="<c:url value='/resources/assets/css/fontawesome.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/tooplate-main.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/owl.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/new-style.css' />" rel="stylesheet">
<!--
Tooplate 2114 Pixie
https://www.tooplate.com/view/2114-pixie
-->
  </head>

  <body>
    
     <%@include file="/WEB-INF/views/include/header.jsp" %>

    <!-- Page Content -->
    <!-- Items Starts Here -->
    <div class="featured-page">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-sm-12">
            <div class="section-heading">
              <div class="line-dec"></div>
              <h1>Thông tin người mua</h1>
              <div class="user-info-left">
                  <span class="user-info-left-detail"><b class="info-title">Họ tên </b>: ${carts.get(0).pk.customerEntity.name}</span>
                  <span class="user-info-left-detail"><b class="info-title">Số điện thoại </b>: ${carts.get(0).pk.customerEntity.phone}</span>
                  <span class="user-info-left-detail"><b class="info-title">Email </b>: ${carts.get(0).pk.customerEntity.email}</span>
                  <span class="user-info-left-detail"><b class="info-title">Địa chỉ nhận hàng </b>: ${carts.get(0).pk.customerEntity.address_customer}</span>

              </div>
            </div>
          </div>
          <div class="col-md-6 col-sm-12">
            <div class="cart-right">
                <a href="products/index.htm" class="cart-right-home-link">  Tiếp tục mua hàng</a>
                <span class="cart-right-title">Giỏ hàng</span>
            </div>
            <div class="cart-detail">
            <c:forEach var="cart" items="${carts}">
              <div class="cart-detail-product">
                <img src="<c:url value='/resources/assets/images/${cart.pk.productEntity.image}' />" alt="" class="cart-detail-img">
                <div class="cart-detail-info">
                    <div class="cart-detail-top">
                        <a href="singleproduct.htm?id=${cart.pk.productEntity.id_product}" class="cart-detail-top-name">${cart.pk.productEntity.title}
                        </a>
                        <span class="cart-detail-top-price">${cart.pk.productEntity.price} x ${cart.quantity}</span>
                    </div>
                    <div class="cart-detail-bottom">
                        <span class="cart-detail-bottom-color">Màu sắc: ${cart.pk.productEntity.colors.name_color}</span>
                        <a href="bill/index/${cart.pk.productEntity.id_product}.htm?deleteCart" class="cart-detail-bottom-delete">Xóa</a>
                    </div>
                </div>
              </div>

             </c:forEach>

              <div class="cart-detail-bill">
                <div class="cart-detail-bill-current">
                  <span class="left-style">Tộng tiền hàng:</span>
                  <span class="right-style">${totalBefore}</span>
                </div>
                <div class="cart-detail-bill-current">
                  <span class="left-style">Thuế VAT:</span>
                  <span class="right-style">10%</span>
                </div>
                <div class="cart-detail-bill-current">
                  <span class="left-style">Tổng thanh toán:</span>
                  <span class="right-style">${totalAfter}</span>
                </div>
              </div>
              <div class="btn-cart">
             	<form action="bill/index.htm">
                <button data-toggle="modal" data-target="#exampleModal" name="confirm"  type="submit"  class="btn btn-primary btn-lg" style="color: #fff !important;">Đặt hàng</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  
    <!-- Featred Page Ends Here -->
	

    <!-- Subscribe Form Starts Here -->
    <%@include file="/WEB-INF/views/include/email.jsp" %>
    <!-- Subscribe Form Ends Here -->


    
    <!-- Footer Starts Here -->
     <%@include file="/WEB-INF/views/include/footer.jsp" %>
    <!-- Sub Footer Ends Here -->


    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>


    <!-- Additional Scripts -->
    <script src="<c:url value='/resources/assets/js/custom.js' />"></script>
  	<script src="<c:url value='/resources/assets/js/owl.js' />"></script>
  	<script src="<c:url value='/resources/assets/js/isotope.js' />"></script>


    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>


  </body>

</html>