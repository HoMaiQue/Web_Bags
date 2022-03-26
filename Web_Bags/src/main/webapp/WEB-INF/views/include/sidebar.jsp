<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                   <img src="<c:url value='/resources/assets/images/logoAdmin.png'/>" alt="" style="height: 140px; padding: 7px 30px 0 30px">
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class=" has-sub">
                            <a class="js-arrow" href="admin/statistics.htm">
                                <i class="far fa-clipboard"></i>Thống kê</a>
                           
                        </li>
                       <li>
                            <a href="admin/contact.htm">
                                <i class="far fa-envelope-open"></i>Liên hệ</a>
                        </li>
                        
                        <li>
                            <a href="admin/users.htm">
                                <i class="fas fa-users"></i>Tài khoản</a>
                        </li>
                        <li>
                            <a href="admin/product.htm">
                               <i class="fas fa-shopping-bag"></i>Sản phẩm</a>
                        </li>
                       
                    </ul>
                </nav>
            </div>
        </aside>