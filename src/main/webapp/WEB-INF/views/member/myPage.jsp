<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				<div class="container" style="margin-top: 100px;">
					<div class="main-body">
						<div class="row">
							<div class="col-lg-4">
								<div class="card">
									<div class="card-body">
										<div class="d-flex flex-column align-items-center text-center">
											<img src="https://cdn-icons-png.flaticon.com/512/847/847969.png?w=826&t=st=1685410931~exp=1685411531~hmac=aba334bfa86956cf27ba3e0af2fab07921b71a199210d274bef4d91c7be12a95"
												alt="Admin" class="rounded-circle p-1 bg-secondary"
												width="110">
											<div class="mt-3">
												<h4>${memberVO.username}</h4>
												<p class="text-secondary mb-1">Developer</p>
												<div class="custom-padding" style="background-color: white; padding: 58px;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-8">
								<div class="card">
									<form:form action="./update" modelAttribute="memberVO" method="post" cssClass="member" >
									<div class="card-body">
										<div class="row mb-3">
											<div class="col-sm-3">
												<h6 class="mb-0">Name</h6>
											</div>
											<div class="col-sm-9 text-secondary">
												<form:input type="text" cssClass="form-control" path="name" />
												<form:errors path="name"></form:errors>
											</div>
										</div>
										<%-- <div class="row mb-3">
											<div class="col-sm-3">
												<h6 class="mb-0">Name</h6>
											</div>
											<div class="col-sm-9 text-secondary">
												<input type="text" class="form-control" name="name" value="<sec:authentication property="Principal.name"/>">
											</div>
										</div> --%>
										<div class="row mb-3">
											<div class="col-sm-3">
												<h6 class="mb-0">Email</h6>
											</div>
											<div class="col-sm-9 text-secondary">
												<form:input type="text" cssClass="form-control" path="email"/>
												<form:errors path="email"></form:errors>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-sm-3">
												<h6 class="mb-0">Birth</h6>
											</div>
											<div class="col-sm-9 text-secondary">
												<input class="form-control" id="birth" name="birth" type="date" value="${memberVO.birth}"/>
												<form:errors path="birth"></form:errors>
											</div>
										</div>
										
										<div class="row">
											<div class="col-sm-3"></div>
											<div class="col-sm-9 text-secondary">
												<button type="submit" class="btn btn-primary px-4"
													>수정하기</button>
											</div>
										</div>
									</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%-- <div class="container-fluid">
    			<div class="row">
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">개인 정보</h4>
							</div>
							<div class="card-body">
									<sec:authentication property="Principal" var="user" />
									<c:if test="${not empty user}">
										<p class="card-text">이름: ${user.username}</p>
										<p class="card-text">이메일: ${user.email}</p>
										<p class="card-text">생일: ${user.birth}</p>
									</c:if>
									
								</div>
						</div>
					</div>
				</div>	
				</div> --%>
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