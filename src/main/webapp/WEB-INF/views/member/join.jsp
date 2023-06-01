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
				<div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form:form id="contactForm" modelAttribute="memberVO" action="./join" method="post" cssClass="user" >
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <form:input path="username" id="username" cssClass="form-control form-control-user"/>
                                        <form:label path="username">User name</form:label>
                                        <form:errors path="username"></form:errors>
                                    </div>
                                    <div class="col-sm-6">
                                        <form:input path="name" id="name" cssClass="form-control form-control-user" />
                                        <form:label path="name">name</form:label>
                                        <form:errors path="name"></form:errors>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <form:password path="password" id="passWord" cssClass="form-control form-control-user"/>
                                        <form:label path="password">passWord</form:label>
                                        <form:errors path="password"></form:errors>
                                    </div>
                                    <div class="col-sm-6">
                                        <form:password cssClass="form-control form-control-user" id="passWordCheck" path="passWordCheck" />
                                        <form:label path="passWordCheck">passWordCheck</form:label>
                                        <form:errors path="passWordCheck"></form:errors>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <input name="email" id="email" type="email" class="form-control form-control-user" />
									<label for="email">email</label>
									<form:errors path="email"></form:errors>
                                </div>
                                
                                <a class="btn btn-info btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text" id="sendMail">인증번호</span>
                                 </a>
                                 
                                <div class="form-group">
                                     <input class="form-control form-control-user" id="emailCheck" name="emailCheck" type="text" />
                                        <label for="emailCheck">emailCheck</label>
                                        <span id="emailCheckValidation"></span>
                                </div>
                                
                                <div class="form-group">
                                     <input class="form-control form-control-user" id="birth" name="birth" type="date" data-sb-validations="required,email" />
                                        <label for="birth">birth</label>
                                        <form:errors path="birth"></form:errors>
                                </div>
                                
    
                                <div class="d-grid"><button class="btn btn-primary btn-user btn-block" id="submitButton" type="submit">Submit</button></div>
                               <br>
                                <!-- <a href="#" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a> -->
                                 <a href="/oauth2/authorization/kakao" class="btn btn-warning btn-user btn-block">
                                 	<i class="fab fa-facebook-messenger fa-fw"></i> Register with Kakao
                                 </a>
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