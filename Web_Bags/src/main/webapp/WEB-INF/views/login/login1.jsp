<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>QA shop | Đăng nhập</title>
    <link rel="icon" href="<c:url value='/resources/assets/images/ShopTitleIcon.svg'/>" type="image/gif" sizes="20x20">
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'>
	<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/lg.css'/>">
<style>
.errors {
	color: red;
	font-style: italic;
}

.capcha-css {
	display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 9px;
    margin-bottom: 5px;

}

.capcha-input {
	margin-left: 10px;
	height: 40px;
	font-size: 14px;
	padding-left: 10px;
}
</style>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="container">
	<div class="screen">
		<div class="screen__content">
			<form:form class="login" id="b-form" action="login.htm" method="POST"
				modelAttribute="register">
				<span class="form__span errors">${mess }</span>
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<form:input path="username" type="text" class="login__input" placeholder="User name " />
					<form:errors path="username" element="span" cssClass="errors" />
				</div>
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<form:input path="password" type="password" class="login__input" placeholder="Password" />
					<form:errors path="password" element="span" cssClass="errors" />
				</div>
				<div class="row col-6 px-3 mb-1 capcha-css recap-login" >
					<img src="${pageContext.request.contextPath}/captcha/index.htm" style="width: 120px;">
					<s:message code="login.Captcha.placeholder" var="placeHolderCaptcha" />
					<input name="capcha" type="text"placeholder="${placeHolderCaptcha}"  class="capcha-input" /> 
					
				</div>
				<label class="mb-1">
						<div class="mb-0 text-sm errors">${reCapcha}</div>
					</label>
				<button name="btnLogin" class="button login__submit">
					<span class="button__text">Đăng nhập </span>
					<i class="button__icon fas fa-chevron-right"></i>
				</button>				
			</form:form>
			<div class="social-login">
				<h3>Đăng nhập với</h3>
				<div class="social-icons">
					<a href="#" class="social-login__icon fab fa-instagram"></a>
					<a href="#" class="social-login__icon fab fa-facebook"></a>
					<a href="#" class="social-login__icon fab fa-twitter"></a>
				</div>
			</div>
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
