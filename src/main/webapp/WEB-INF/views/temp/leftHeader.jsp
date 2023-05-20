<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-heart"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Communitiy</div>
            </a>

           <li class="nav-item">
                <a class="nav-link" href="/">
                    <i class="fab fa-fw fa-firefox"></i>
                    <span>홈</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="/board/add">
                    <i class="fab fa-fw fa-chromecast"></i>
                    <span>모집 만들기</span></a>
            </li>
            
             <li class="nav-item">
                <a class="nav-link" href="/">
                    <i class="fab fa-fw fa-digital-ocean"></i>
                    <span>프로젝트/스터디 찾기</span></a>
            </li>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>마이페이지</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <sec:authorize access="isAuthenticated()">
                        <a class="collapse-item" href="/member/logout">Logout</a>
                        <a class="collapse-item" href="/member/myPage">MyPage</a>
                     	</sec:authorize>
                     	 <sec:authorize access="!isAuthenticated()">
                        <a class="collapse-item" href="/member/login">Login</a>
                        <a class="collapse-item" href="/member/join">Join</a>
                        <a class="collapse-item" href="/member/findPassword">Forgot Password</a>
                     	</sec:authorize>
                    </div>
                </div>
            </li>

          
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
<!-- End of Sidebar -->