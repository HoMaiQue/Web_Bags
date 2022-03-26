<%@ page pageEncoding="utf-8"%>
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

  <title>QA shop | Trang chủ</title>
  <link rel="icon" href="<c:url value='/resources/assets/images/ShopTitleIcon.svg'/>" type="image/gif" sizes="20x20">

  <!-- Bootstrap core CSS -->
  <!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
  <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">

  <!-- Additional CSS Files -->
  <!-- <link rel="stylesheet" href="assets/css/fontawesome.css">
  <link rel="stylesheet" href="assets/css/tooplate-main.css">
  <link rel="stylesheet" href="assets/css/owl.css">
  <link rel="stylesheet" href="assets/css/new-style.css"> -->
  
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

  <!-- Pre Header -->
  

  <!-- Navigation -->
  <%@include file="/WEB-INF/views/include/header.jsp" %>

  <!-- Page Content -->
  <!-- Banner Starts Here -->
  <div class="banner">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="caption">
            <h2>DẪN ĐẦU XU HƯỚNG THỜI TRANG</h2>
            <div class="line-dec"></div>
            <p>QA shop hiện đang sở hữu hệ thống bán hơn 60 thương hiệu sang trọng và đẳng cấp cùng kênh thương mại điện tử được đầu tư bài bản.
              <br><br>Sứ mệnh của chúng tôi là "Đưa sản phẩm thời trang có chất liệu tốt, dịch vụ tốt đến tận tay khách hàng tại các vùng miền Việt Nam và trên Thế Giới".
            </p>
            <div class="main-button">
              <a href="products/index.htm">Mua ngay!</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Banner Ends Here -->

  <!-- Featured Starts Here -->
  <div class="featured-items">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
            <div class="line-dec"></div>
            <h1>Sản phẩm nổi bật</h1>
          </div>
        </div>
        <div class="col-md-12">
          <div class="owl-carousel owl-theme">
          <c:forEach var="pd" items="${getPro}">
            <a href="http://localhost:8080/Web_Bags/singleproduct.htm?id=${pd.getId_product() }">
              <div class="featured-item">
                <img src="<c:url value='/resources/assets/images/${pd.image}' />" alt="">
                <h4>${pd.getTitle() }</h4>
                <h6>$${pd.getPrice() }</h6>
              </div>
            </a>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Featred Ends Here -->


  <!-- Subscribe Form Starts Here -->
 <%@include file="/WEB-INF/views/include/email.jsp" %>
  <!-- Subscribe Form Ends Here -->



  <!-- Footer Starts Here -->
    <%@include file="/WEB-INF/views/include/footer.jsp" %>
  <!-- Sub Footer Ends Here -->


  <!-- Bootstrap core JavaScript -->
  <!-- <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
  
  <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
  <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>


  <!-- Additional Scripts -->
  <!-- <script src="assets/js/custom.js"></script>
  <script src="assets/js/owl.js"></script> -->
  
  <script src="<c:url value='/resources/assets/js/custom.js' />"></script>
  <script src="<c:url value='/resources/assets/js/owl.js' />"></script>


  <script language="text/Javascript">
    cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
    function clearField(t) {                   //declaring the array outside of the
      if (!cleared[t.id]) {                      // function makes it static and global
        cleared[t.id] = 1;  // you could use true and false, but that's more typing
        t.value = '';         // with more chance of typos
        t.style.color = '#fff';
      }
    }
  </script>


</body>

</html>