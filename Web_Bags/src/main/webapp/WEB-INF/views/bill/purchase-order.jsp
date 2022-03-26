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
    <title>QA shop | Đơn hàng</title>
      <link rel="icon" href="<c:url value='/resources/assets/images/ShopTitleIcon.svg'/>" type="image/gif" sizes="20x20">
	<base href="${pageContext.servletContext.contextPath}/">
    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link href="<c:url value='/resources/assets/css/fontawesome.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/tooplate-main.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/owl.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/new-style.css' />" rel="stylesheet">
  	<style>
    .bought {
      width: 100%;

      display: flex;
      flex-direction: column;
      padding: 0 25px;
      border: 1px solid #e8e8e7;


    }

    .product {
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 15px 0;
      border-top: 1px solid #e8e8e7;
      border-bottom: 1px solid #e8e8e7;
    }

    .product-info {
      display: flex;
      align-items: center;

    }

    .product-info img {
      width: 80px;
      height: 80px;
      object-fit: cover;
    }

    .product-info-detail {
      margin-left: 20px;
    }

    .product-info-detail h3 {
      font-size: 18px;
    }

    .product-info-detail p {
      font-size: 14px;
    }

    .product-info-detail span {
      font-size: 14px;
    }

    .money span {
      margin-top: 20px;
      margin-right: 30px;
      float: right;
      font-weight: 700;
      font-size: 20px;
      color: #2cccff;
      margin-bottom: 30px;
    }
  </style>
  </head>

  <body>
  
     <%@include file="/WEB-INF/views/include/header.jsp" %>

    <!-- Page Content -->
    <!-- Items Starts Here -->
    
  
	 <div class="featured-page" style="margin-top: 70px">
    <div class="container">
  <c:forEach var="p" items="${purchase }">
      <div class="row">
        <div class="bought">
          <div class="product">
            <div class="product-info">
              <img src="<c:url value='/resources/assets/images/${p.pk.productEntity.image}' />" alt="">
              <div class="product-info-detail">
                <h3>${p.pk.productEntity.title}</h3>
                <p>Phân loại hàng: ${p.pk.productEntity.colors.name_color}, ${p.pk.productEntity.brands.name_brand}</p>
                <span>&times; ${p.quantity }</span>
              </div>
            </div>

            <div class="product-price">

              <span>&dollar;${ p.price }</span>

            </div>
          </div>
          <div class="money">
            <span>Tổng số tiền : ${p.total} </span>
          </div>

        </div>
      </div>
     
       </c:forEach>

    </div>
  </div>

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


    


  </body>

</html>