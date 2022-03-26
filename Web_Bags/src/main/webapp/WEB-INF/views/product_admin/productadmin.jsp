<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">
	<base href="${pageContext.servletContext.contextPath}/">
    <!-- Title Page-->
    <title>QA shop | Admin</title>
      <link rel="icon" href="<c:url value='/resources/assets/images/ShopTitleIcon.svg'/>" type="image/gif" sizes="20x20">
    <link href="<c:url value='/resources/vendor1/font-awesome-5/css/fontawesome-all.min.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/bootstrap-4.1/bootstrap.min.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor1/css/theme.css'/>" rel="stylesheet" media="all">
    <link rel="stylesheet" href="<c:url value='/resources/vendor1/css/style.css'/>">
<style>
.errors {
	color: red;
	font-style: italic;
}
</style>
</head>

<body class="animsition">
    <div class="page-wrapper" style="background: lightblue">
      <%@include file="/WEB-INF/views/include/sidebar.jsp" %>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <div class="header users-top">
                <h2 class="header-heading">${title }</h2>
                 <a href="login.htm"><i class="fas fa-sign-out-alt admin-out"></i></a>
            </div>
            <div class="main-content">

                <div class="content">
                    <form:form action="admin/product.htm"  method="POST" modelAttribute="product" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="">Tên sản phẩm</label>
                            <form:input type="text" class="" path="title"/>
                            <form:errors path="title" element="span" cssClass="errors" />
                        </div>
                        <div class="form-group">
                            <label for="">Giá</label>
                            <form:input type="text" class="" path="price" pattern="[0-9_.]*" title="Vui lòng chỉ nhập số"/>
                           <form:errors path="price" element="span" cssClass="errors" />
                        </div>
                        <div class="form-group">
                            <label for="">Số lượng</label>
                            <form:input type="text" class="" path="quantity" pattern="[0-9_.]*" title="Vui lòng chỉ nhập số"/>
                             <form:errors path="quantity" element="span" cssClass="errors" />
                        </div>

                        <div class="form-group">
                            <label for="">Hình ảnh</label>
                            <form:input type="file"  path="image" />
                            <span class="errors">${msgImage}</span>
                           
                        </div>
                        <div class="form-group">
                            <label for="">Màu sắc</label>
                            <form:select path="colors.id_color" 
                            items="${colorlist}" 
                            itemLabel="name_color"
                            itemValue="id_color" >
                               </form:select>
                               
                       
                        </div> 
                         <div class="form-group">
                            <label for="">Thương hiệu</label>
                           <form:select path="brands.id_brand" items="${brandlist}"
						itemLabel="name_brand" itemValue="id_brand">

					</form:select>
                        </div>
                        
                        <div class="form-group">
                            <label for="">Mô tả</label>
                            <form:textarea path="descr" type="text" class=""/>
                            <form:errors path="descr" element="span" cssClass="errors" />
                        </div> 
                        <div class="button" name="button">
                            <button type="submit" name="${btnStatus}" >Lưu sản phẩm</button>
                           <span class="errors">${ message123 }</span>
                        </div>
                    </form:form>
                </div>
                <p class="errors">${errDe}</p>
                <div class="product">
                    <table>
                        <thead>
                            <tr>
                                <th>
                                   Hình ảnh
                                </th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Màu sắc</th>
                                <th>Thương hiệu</th>
                                <th>Số lượng</th>
                                <th></th>

                            </tr>
                        </thead>

                        <tbody>
                        <c:forEach  var="pd2" items="${products}">
                            <tr>
                                <td>
                                    <div class="picture">
                                        <img src="<c:url value='/resources/assets/images/${pd2.image}'/>" alt="">
                                    </div>
                                </td>
                                <td>${pd2.title }</td>
                                <td>${pd2.price }</td>
                                <td>${pd2.colors.name_color }</td>
                                <td>${pd2.brands.name_brand }</td>
                                <td>${pd2.quantity }</td>
                                <td><a href="admin/product/${pd2.id_product }.htm?update" class="button1"><i class="fas fa-edit"></i></a> <a  href="admin/product/${pd2.id_product }.htm?delete" class="button1"><i class="fas fa-trash-alt"></i></a></td>
                            </tr>
                               </c:forEach>
                        </tbody>
                    </table>
                </div>
                
            </div>


        </div>
    </div>



    <!-- Jquery JS-->
    <script src="<c:url value='resources/vendor1/jquery-3.2.1.min.js'/>/"></script>
    <script src="<c:url value='/resources/vendor1/bootstrap-4.1/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor1/animsition/animsition.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor1/js/main.js'/>"></script>
</body>

</html>
<!-- end document-->