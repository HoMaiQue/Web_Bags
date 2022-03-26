<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <!-- <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="keywords" content="au theme template"> -->

    <!-- Title Page-->
    <title>QA shop | Admin</title>
      <link rel="icon" href="<c:url value='/resources/assets/images/ShopTitleIcon.svg'/>" type="image/gif" sizes="20x20">
    <base href="${pageContext.servletContext.contextPath}/">

    <!-- Fontfaces CSS-->
    <!-- <link href="vendor1/css/font-face.css" rel="stylesheet" media="all">
    <link href="vendor1/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor1/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor1/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
     -->
    <link href="<c:url value='/resources/vendor1/css/font-face.css' />" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/font-awesome-4.7/css/font-awesome.min.css' />" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/font-awesome-5/css/fontawesome-all.min.css' />" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/mdi-font/css/material-design-iconic-font.min.css' />" rel="stylesheet" >
    

    <!-- Bootstrap CSS-->
   <!--  <link href="vendor1/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all"> -->
    <link href="<c:url value='/resources/vendor1/bootstrap-4.1/bootstrap.min.css' />" rel="stylesheet" media="all">

    <!-- vendor1 CSS-->
    <!-- <link href="vendor1/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor1/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor1/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor1/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor1/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor1/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor1/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
     -->
    <link href="<c:url value='/resources/vendor1/animsition/animsition.min.css' />" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css' />" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/wow/animate.css' />" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/css-hamburgers/hamburgers.min.css' />" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/slick/slick.css' />" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/select2/select2.min.css' />" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/perfect-scrollbar/perfect-scrollbar.css' />" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <!-- <link href="vendor1/css/theme.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="vendor1/css/style-qa.css"> -->
    
    <link href="<c:url value='/resources/vendor1/css/theme.css' />" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/css/style-qa.css' />" rel="stylesheet" media="all">

</head>

<body class="animsition">
    <div class="page-wrapper" style="background: #fff">
        <!-- HEADER MOBILE-->
       <%@include file="/WEB-INF/views/include/sidebar.jsp" %>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->

            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
            	<div class="users-top">
            		<h1>Tài khoản</h1>
                	<a href="login.htm"><i class="fas fa-sign-out-alt admin-out"></i></a>
            	</div>
                
                <div class="content-top">
                    <h4>Tất cả tài khoản</h4>
                     <p class="err-user">${errDe }</p>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="min-width:300px">Chi tiết tài khoản</th>
                                <th style="width:120px">Quyền</th>
                                <th style="min-width:110px;">Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach var="users" items="${users}">
                            <tr>
                                <td>
                                    <div class="user_avatar_list d-none d-none d-lg-block">
                                    <img src="<c:url value='/resources/vendor1/images/avatar_small.png' />" alt="">
                                        </div>
                                    <h4>${users.name }</h4>
                                    <p>${users.email }</p>
                                    <p>Địa chỉ : ${users.address_customer }</p>
                                   
                                </td>

                                <td>${users.roles.role }</td>


                                <td>
                                
                                    <a href="admin/users/${users.id_user }.htm?delete" class="btn btn-danger btn-sm btn-block mt-2"><i
                                            class="fas fa-trash"></i> Delete</a>
                                </td>
                            </tr>
                            </c:forEach>

                            
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <!-- <script src="vendor1/jquery-3.2.1.min.js"></script> -->
    
    <script src="<c:url value='/resources/vendor1/jquery-3.2.1.min.js' />"></script>
    <!-- Bootstrap JS-->
    <!-- <script src="vendor1/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor1/bootstrap-4.1/bootstrap.min.js"></script> -->
    
    <script src="<c:url value='/resources/vendor1/bootstrap-4.1/popper.min.js' />"></script>
    <script src="<c:url value='/resources/vendor1/bootstrap-4.1/bootstrap.min.js' />"></script>
    <!-- vendor1 JS       -->
    <!-- <script src="vendor1/slick/slick.min.js"></script>
    <script src="vendor1/wow/wow.min.js"></script>
    <script src="vendor1/animsition/animsition.min.js"></script>
    <script src="vendor1/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <script src="vendor1/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor1/counter-up/jquery.counterup.min.js"></script> -->
   <!--  <script src="vendor1/circle-progress/circle-progress.min.js"></script>
    <script src="vendor1/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor1/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor1/select2/select2.min.js"></script> -->
    
    <script src="<c:url value='/resources/vendor1/slick/slick.min.js' />"></script>
    <script src="<c:url value='/resources/vendor1/wow/wow.min.js' />"></script>
    <script src="<c:url value='/resources/vendor1/animsition/animsition.min.js' />"></script>
    <script src="<c:url value='/resources/vendor1/bootstrap-progressbar/bootstrap-progressbar.min.js' />"></script>
    <script src="<c:url value='/resources/vendor1/counter-up/jquery.waypoints.min.js' />"></script>
    <script src="<c:url value='/resources/vendor1/counter-up/jquery.counterup.min.js' />"></script>
    <script src="<c:url value='/resources/vendor1/circle-progress/circle-progress.min.js' />"></script>
    <script src="<c:url value='/resources/vendor1/perfect-scrollbar/perfect-scrollbar.js' />"></script>
    <script src="<c:url value='/resources/vendor1/chartjs/Chart.bundle.min.js' />"></script>
    <script src="<c:url value='/resources/vendor1/select2/select2.min.js' />"></script>

    <!-- Main JS-->
    <!-- <script src="vendor1/js/main.js"></script> -->
    <script src="<c:url value='/resources/vendor1/js/main.js' />"></script>

</body>

</html>