<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>QA shop | Đăng kí</title>
      <link rel="icon" href="<c:url value='/resources/assets/images/ShopTitleIcon.svg'/>" type="image/gif" sizes="20x20">
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'>
    <link rel="stylesheet"
	href="<c:url value='/resources/assets/css/rg.css'/>">

</head>

<body>
    <!-- partial:index.partial.html -->
    <div class="container">
        <div class="screen">
            <div class="screen__content">
                <form:form class="login" id="a-form" method="POST" action="register.htm" modelAttribute="register">
                    <%-- <p class="errors">${message }</p> --%>
                    <div class="login__field">
                        <i class="login__icon fas fa-user"></i>
                        <form:input path="name" type="text" class="login__input" placeholder="Name " />
                         <form:errors path="name" element="span" cssClass="errors"/>
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-user"></i>
                        <form:input path="username" type="text" class="login__input" placeholder="User name " />
                         <form:errors path="username" element="span" cssClass="errors"/>
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-lock"></i>
                         <form:input path="password" type="password" class="login__input" placeholder="Password" />
                         <form:errors path="password" element="span" cssClass="errors"/>
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-envelope"></i>
                        <form:input path="email" type="email" class="login__input" placeholder="Email" />
                        <form:errors path="email" element="span" cssClass="errors"/>
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-map-marker"></i>
                        <form:input path="address_customer" type="text" class="login__input" placeholder="Address " />
                        <form:errors path="address_customer" element="span" cssClass="errors"/>
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-phone"></i>
                        <form:input path="phone" type="text" class="login__input" placeholder="Phone " />
                        <form:errors path="phone" element="span" cssClass="errors"/>
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-genderless"></i>
                        <form:select path="sex" class="form__input-sex login__input">
                            <option class="login__input" value="true">Nam</option>
                            <option class="login__input" value="false">Nữ</option>
                        </form:select>
                    </div>
                    <button  name="register" class="button login__submit">
                        <span class="button__text">Đăng kí </span>
                        <i class="button__icon fas fa-chevron-right"></i>
                    </button>
                </form:form>

            </div>
            <div class="screen__background">
                <span class="screen__background__shape screen__background__shape4"></span>
                <span class="screen__background__shape screen__background__shape3"></span>
                <span class="screen__background__shape screen__background__shape2"></span>
                <span class="screen__background__shape screen__background__shape1"></span>
            </div>
        </div>
    </div>
    <!-- partial -->

</body>

</html>