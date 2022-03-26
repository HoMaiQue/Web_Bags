<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
  <title>QA shop | Chi tiết sản phẩm</title>
    <link rel="icon" href="<c:url value='/resources/assets/images/ShopTitleIcon.svg'/>" type="image/gif" sizes="20x20">
  <base href="${pageContext.servletContext.contextPath}/">

  <!-- Bootstrap core CSS -->
<link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">


  <!-- Additional CSS Files -->
  <link href="<c:url value='/resources/assets/css/fontawesome.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/tooplate-main.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/owl.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/flex-slider.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/new-style.css' />" rel="stylesheet">
 
 

</head>

<body>

  <!-- Pre Header -->
    <%@include file="/WEB-INF/views/include/header.jsp" %>

  <!-- Page Content -->
  <!-- Single Starts Here -->
  <div class="single-product">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
            <div class="line-dec"></div>
            <h1>Chi tiết sản phẩm</h1>
          </div>
        </div>
     
        
       
        <div class="col-md-6">
          <div class="product-slider">
            <div id="slider" class="flexslider">
              <ul class="slides">
                <li>
                  <img src="<c:url value='/resources/assets/images/${pro.image}'/>" />
                </li>
          
              </ul>
            </div>
             
            <div id="carousel" class="flexslider">
           
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="right-content">
            <h4>${pro.title }</h4>
            <h6>${pro.price }</h6>
            <p>${pro.descr}</span>
            <form:form action="" method="post" modelAttribute="addCart">
              <label for="quantity">Số lượng:</label>
              <input path="quantity" name="quantity" type="quantity" class="quantity-text" id="quantity"
                onfocus="if(this.value == '1') { this.value = ''; }" onBlur="if(this.value == '') { this.value = '1';}"
                value="1" pattern="[0-9_.]*" title="Vui lòng chỉ nhập số"></input>
              <button onclick="tb_cart()" type="submit" class="button">Order Now!</button>
              <form:errors path="quantity" element="span" cssClass="errors"/>
                <div class="errors">${messCart}</div>
            </form:form>
            <div class="form-quantity">
                <p>Còn lại: <b>${pro.quantity } </b> sản phẩm trong kho</p>
              </div>
            <div class="down-content">
              
              <div class="categories">
                <h6>Thương hiệu: <span>${pro.brands.name_brand }</span></h6>
              </div>
              <div class="color">
                <h6>Màu sắc: <span>${pro.colors.name_color }</span></h6>
              </div>
              <div class="share">
                <h6>Chia sẽ: <span><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
                        class="fa fa-linkedin"></i></a><a href="#"><i class="fa fa-twitter"></i></a></span></h6>
              </div>
             
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Single Page Ends Here -->


  <!-- Similar Starts Here -->
   <%@include file="/WEB-INF/views/include/email.jsp" %>
  <!-- Similar Ends Here -->


  <!-- Subscribe Form Starts Here -->
  
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
  	<script src="<c:url value='/resources/assets/js/flex-slider.js' />"></script>
 


  <script>
    /* cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
    function clearField(t) {                   //declaring the array outside of the
      if (!cleared[t.id]) {                      // function makes it static and global
        cleared[t.id] = 1;  // you could use true and false, but that's more typing
        t.value = '';         // with more chance of typos
        t.style.color = '#fff';
      }
    } */
    
    /* function tb_cart()
    {
    	alert( "Ok !");
    } */
  </script>


</body>

</html>