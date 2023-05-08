<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">MemberJoin Page</h1>
                            <p class="lead fw-normal text-muted mb-0">We'd love to hear from you</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                               
                                    <form:form id="contactForm" modelAttribute="memberVO" action="./join" method="post" >
                                    <!-- UserName input-->
                                    <div class="form-floating mb-3">
                                        <form:input path="username" id="username" cssClass="form-control"/>
                                        <form:label path="username">User name</form:label>
                                        <form:errors path="username"></form:errors>
                                    </div>
                                    <!-- Password input-->
                                    <div class="form-floating mb-3">
                                    	<form:password path="password" id="passWord" cssClass="form-control"/>
                                        <form:label path="password">passWord</form:label>
                                        <form:errors path="password"></form:errors>
                                    </div>
                                    
                                     <!-- PasswordCheck input-->
                                     <div class="form-floating mb-3">
                                        <form:password cssClass="form-control" id="passWordCheck" path="passWordCheck" />
                                        <form:label path="passWordCheck">passWordCheck</form:label>
                                        <form:errors path="passWordCheck"></form:errors>
                                    </div>
                                  
                                  	 <!-- Name input-->
                                    <div class="form-floating mb-3">
                                    <form:input path="name" id="name" cssClass="form-control"/>
                                        <form:label path="name">name</form:label>
                                        <form:errors path="name"></form:errors>
                                    </div>
                                    
                                    <!-- email input-->
                                    <div class="form-floating mb-3">
									<input name="email" id="email" type="email" class="form-control" />
									<label for="email">email</label>
									<form:errors path="email"></form:errors>
									</div>
									
									<a class="btn btn-primary" id="sendMail">인증번호</a>
									
									 <!-- emailCheck input-->
                                    <div class="form-floating mb-3">
                                     <input class="form-control" id="emailCheck" name="emailCheck" type="text" />
                                        <label for="emailCheck">emailCheck</label>
                                        <span id="emailCheckValidation"></span>
                                    </div>
								
                                    
                                     <!-- Birth input-->
                                    <div class="form-floating mb-3">
                                     <input class="form-control" id="birth" name="birth" type="date" data-sb-validations="required,email" />
                                        <label for="birth">birth</label>
                                        <form:errors path="birth"></form:errors>
                                    </div>
                                 
                                    <!-- Submit Button-->
                                    <div class="d-grid"><button class="btn btn-primary btn-lg" id="submitButton" type="submit">Submit</button></div>
                                </form:form>
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
	<script type="text/javascript">
	 const emailCheckInput = document.querySelector('#emailCheck');
	 emailCheckInput.addEventListener('input', validateEmailCheck);
	 let key = "";
	$("#sendMail").click(function() {// 메일 입력 유효성 검사 
		
			$.ajax({
				type : "Post",
				url : "./checkMail",
				data : {
					email:$('#email').val()
				},
				success:function(result){
					console.log(result)
					alert("인증번호가 발송되었습니다.");
					key = result;
				},
				error:function(){
					console.log()
					alert("인증번호 발송이 실패하였습니다.")
				}
			})
	});
	
	function validateEmailCheck() {
	    const emailCheck = this.value;

	    if (emailCheck === key) {
	        // 이메일 인증 성공
	        document.querySelector('#emailCheckValidation').textContent = '인증 성공';
	        $("#submitButton").prop("disabled", false);
	    } else {
	        // 이메일 인증 실패
	        document.querySelector('#emailCheckValidation').textContent = '인증 실패';
	        $("#submitButton").prop("disabled", true);
	    }
	}
	
	
	</script>
</body>

</html>