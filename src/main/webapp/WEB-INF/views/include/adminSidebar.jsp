<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>

        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin/index">
                <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
                <div class="sidebar-brand-text mx-2">ATELIER ADMIN </div>
            </a>
			<div class="p-3" style="color:white;">
			<s:authorize access="hasRole('ADMIN')"><s:authentication property="name"/> 님 환영합니다.</s:authorize>
			</div>
            <hr class="sidebar-divider my-0">
            <li class="nav-item"><a class="nav-link" href="/admin"><i class="fas fa-fw fa-tachometer-alt"></i><span>Dashboard</span></a></li>

            <hr class="sidebar-divider">

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i> <span>Components</span></a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item" href="admin/buttons">Buttons</a></div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i> <span>Utilities</span></a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <hr class="sidebar-divider">

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i> <span>Pages</span></a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <a class="collapse-item" href="404.html">404 Page</a>
                    </div>
                </div>
            </li>
            <li class="nav-item"> <a class="nav-link" href="charts.html"><i class="fas fa-fw fa-chart-area"></i> <span>Charts</span></a></li>
            <li class="nav-item"><a class="nav-link" href="./admin/member"><i class="fas fa-fw fa-table"></i> <span>회원관리</span><span class="badge badge-danger">3+</span></a></li>
            <hr class="sidebar-divider d-none d-md-block">
            
            <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="margin:100px 10px 0 0 !important">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-dark border" type="button"> <i class="fas fa-search fa-sm"></i> </button>
                            </div>
                        </div>
                    </form>
        </ul> <!-- End of Sidebar -->

