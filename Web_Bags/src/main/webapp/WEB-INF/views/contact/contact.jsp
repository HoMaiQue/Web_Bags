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
    <title>QA shop | Liên hệ</title>
      <link rel="icon" href="<c:url value='/resources/assets/images/ShopTitleIcon.svg'/>" type="image/gif" sizes="20x20">
    <base href="${pageContext.servletContext.contextPath}/">

    <!-- Bootstrap core CSS -->
    <!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
	<link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
	

    <!-- Additional CSS Files -->
    <!-- <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/tooplate-main.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/flex-slider.css">
    <link rel="stylesheet" href="assets/css/new-style.css"> -->
    
    <link href="<c:url value='/resources/assets/css/fontawesome.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/tooplate-main.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/owl.css' />" rel="stylesheet">
  	<link href="<c:url value='/resources/assets/css/new-style.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/assets/css/flex-slider.css' />" rel="stylesheet">
<!--
Tooplate 2114 Pixie
https://www.tooplate.com/view/2114-pixie
-->
  </head>

  <body>
    
    <!-- Pre Header -->
      <%@include file="/WEB-INF/views/include/header.jsp" %>

    <!-- Page Content -->
    <!-- About Page Starts Here -->
    <div class="contact-page">
      <div class="container">
        <div class="row fade-in-side">
          <div class="col-md-12">
            <div class="section-heading">
              <div class="line-dec"></div>
              <h1>Liên hệ</h1>
            </div>
          </div>
          <div class="col-md-6">
            <div id="shop-detail">
            		<!-- How to change your own map point
                           1. Go to Google Maps
                           2. Click on your location point
                           3. Click "Share" and choose "Embed map" tab
                           4. Copy only URL and paste it within the src="" field below
                    -->

              <ul class="shop-detail-list">
              <c:forEach var="ct" items="${shop}"> 
                <li class="shop-detail-item">
                  <i class="fas fa-building"></i>
                  <span class="shop-detail-company">${ct.shop_name }</span>
                </li>
                <li class="shop-detail-item">
                  <i class="fas fa-map-marker-alt"></i>
                  <span class="shop-detail-company">${ct.address }</span>
                </li>
                <li class="shop-detail-item">
                  <i class="fas fa-phone"></i>
                  <a class="shop-detail-company" href="tel://${ct.phone }">+ ${ct.phone }</a>
                </li>
                <li class="shop-detail-item">
                  <i class="fas fa-envelope"></i>
                  <a class="shop-detail-company" href="mailto:${ct.email }">${ct.email }</a>
                </li>
                </c:forEach>
              </ul>
            </div>
          </div>
          <div class="col-md-6">
            <div class="right-content">
              <div class="container">
              	${message }
                <form:form action="contact.htm" modelAttribute="contact" id="contact" method="POST">
                  <div class="row">
                    <div class="col-md-6">
                      <fieldset>
                        <form:input path="name" type="text" class="form-control" placeholder="Your name..."/>
                        <form:errors path="name" element="span" cssClass="errors"/>
                      </fieldset>
                    </div>
                    <div class="col-md-6">
                      <fieldset>
                        <form:input path="email" type="text" class="form-control" placeholder="Your email..."/>
                        <form:errors path="email" element="span" cssClass="errors"/>
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <form:input path="topic" type="text" class="form-control" placeholder="Subject..."/>
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <form:textarea path="content" rows="6" class="form-control" placeholder="Your message..."/>
                        <form:errors path="content" element="span" cssClass="errors"/>
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <button type="submit" id="form-submit" class="button">Send Message</button>
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <div class="share">
                        <h6>You can also keep in touch on: <span><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-linkedin"></i></a><a href="#"><i class="fa fa-twitter"></i></a></span></h6>
                      </div>
                    </div>
                  </div>
                </form:form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- About Page Ends Here -->

    <!-- Subscribe Form Starts Here -->
    <%@include file="/WEB-INF/views/include/email.jsp" %>
    <!-- Subscribe Form Ends Here -->


    
    <!-- Footer Starts Here -->
    <%@include file="/WEB-INF/views/include/footer.jsp" %>
    <!-- Footer Ends Here -->


    <!-- Sub Footer Starts Here -->
   
    <!-- Sub Footer Ends Here -->


    <!-- Bootstrap core JavaScript --><!-- 
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	
	<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
  	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

	

    <!-- Additional Scripts -->
    <!-- <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/flex-slider.js"></script> -->
    
    <script src="<c:url value='/resources/assets/js/custom.js' />"></script>
  	<script src="<c:url value='/resources/assets/js/owl.js' />"></script>
  	<script src="<c:url value='/resources/assets/js/isotope.js' />"></script>
  	<script src="<c:url value='/resources/assets/js/flex-slider.js' />"></script>


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
