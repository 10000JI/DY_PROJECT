<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

	<!-- css -->
    <c:import url="../temp/style.jsp"></c:import>
    <!-- css -->

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

    	<!-- leftHeader -->
    	<c:import url="../temp/leftHeader.jsp"></c:import>
    	<!-- leftHeader -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- topHeader -->
    			<c:import url="../temp/topHeader.jsp"></c:import>
    			<!-- topHeader -->	
				<div class="row">
                            <div class="col p-2 d-none d-lg-block bg-login-image"></div>
                            <div class="col p-2">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                     <form class="user" action="./login" method="post">
                                        <div class="form-group">
                                            <input class="form-control form-control-user" id="username" value="${cookie.remember.value}" name="username" type="text" placeholder="Enter your userName..." data-sb-validations="required" />
                                        </div>
                                        <div class="form-group">
                                         	<input class="form-control form-control-user" id="password" name="password" type="password" placeholder="Password"/>  
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input id="remember" name="remember" value="remember" type="checkbox" data-sb-validations="required,email" />
                                        		<label for="remember">ID 기억하기</label>
                                            </div>
                                        </div>
                                        <div class="d-grid"><button class="btn btn-primary btn-user btn-block" id="submitButton" type="submit">Login</button></div>
                                        <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="/oauth2/authorization/kakao" class="btn btn-warning btn-user btn-block">
                                            <i class="fab fa-facebook-messenger fa-fw"></i> Login with Kakao
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/member/findPassword">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
            <!-- End of Main Content -->
			 
            <!-- Footer 적용 -->
       		 <c:import url="../temp/footer.jsp"></c:import>
        	<!-- Footer 끝 -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	<c:import url="../temp/js.jsp"></c:import>

</body>

</html>