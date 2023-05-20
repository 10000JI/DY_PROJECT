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
  	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<style>
        
        .container {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        
        h2 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 30px;
        }
        
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        
        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }
    </style>
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
			<!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">Get in touch</h1>
                            <p class="lead fw-normal text-muted mb-0">We'd love to hear from you</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- * * SB Forms Contact Form * *-->
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- This form is pre-integrated with SB Forms.-->
                                <!-- To make this form functional, sign up at-->
                                <!-- https://startbootstrap.com/solution/contact-forms-->
                                <!-- to get an API token!-->
                                   <form:form id="contactForm" data-sb-form-api-token="API_TOKEN" modelAttribute="boardVO" cssClass="" action="./add" method="post" enctype="multipart/form-data">                                    <!-- Title input-->
                                    <div class="form-floating mb-3">
                                        <form:input path="title" id="title" cssClass="form-control"/>
                                        <label for="title">title</label>
                                        <form:errors path="title"></form:errors>
                                        <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                                    </div>
                                    <!-- 첨부 파일 -->
                                    <div class="form-floating mb-3">
                                    	<input type="file" name="boardFiles" class="check">
                                    </div>
                                    
                                    <!-- Writer address input-->
                                    <div class="form-floating mb-3">
                                        <form:input path="writer" id="writer" cssClass="form-control"/>
                                        <label for="writer">Writer</label>
                                        <form:errors path="writer"></form:errors>
                                    </div>
                                                                                   
                                    <!-- Contents input-->
                                    <div class="form-floating mb-3">
                                        <textarea class="form-control check" id="contents" name="contents" placeholder="Enter your contents here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                       	
                                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                                    </div>
                                    
                                    <!DOCTYPE html>

				    <div class="container">
				    	<c:forEach items="${list}" var="dto">
				            <div class="custom-control custom-checkbox">
				                <input class="custom-control-input" type="checkbox" name="${dto.stackNum}" value="${dto.stackNum}" id="${dto.stackNum}">
				                <label class="custom-control-label" for="${dto.stackNum}">${dto.stack}</label>
				            </div>
						</c:forEach>
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
	<script>
		$('#contents').summernote();
	</script>
</body>
</html>