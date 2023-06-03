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
	<style>
        
        .c1 {
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!--     <script src="/vendor/jquery-easing/jquery.easing.min.js"></script> -->

    <script src="/js/sb-admin-2.min.js"></script>
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
                            <h3 class="fw-bolder">모집만들기</h3>
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
                                    <input type="hidden" id="selectedValuesInput" name="selectedValuesInput">
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
                                        <form:input  path="writer" id="writer" cssClass="form-control"/>
                                        <label for="writer">Writer</label>
                                        <form:errors path="writer"></form:errors>
                                    </div>
                                                                                   
                                    <!-- Contents input-->
                                    <div class="form-floating mb-3">
                                        <textarea class="form-control" id="contents" name="contents" placeholder="Enter your contents here..." style="height: 10rem"></textarea>
                                       	
                                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                                    </div>
                                    
                                    <!DOCTYPE html>

<%-- 				    <div class="container c1">
				    	<c:forEach items="${list}" var="dto">
				            <div class="custom-control custom-checkbox">
				                <input class="custom-control-input checkboxes" type="checkbox" value="${dto.stackNum}" id="${dto.stackNum}">
				                <label class="custom-control-label" for="${dto.stackNum}">${dto.stack}</label>
				            </div>
						</c:forEach>
				     </div>    --%>
				     <div class="container c1">
				    	
				            <div class="custom-control custom-checkbox">
				                <input class="custom-control-input checkboxes" type="checkbox" value="1" id="1">
				                <label class="custom-control-label" for="1">Java</label>
				            </div>
						
				            <div class="custom-control custom-checkbox">
				                <input class="custom-control-input checkboxes" type="checkbox" value="2" id="2">
				                <label class="custom-control-label" for="2">Javascript</label>
				            </div>
						
				            <div class="custom-control custom-checkbox">
				                <input class="custom-control-input checkboxes" type="checkbox" value="3" id="3">
				                <label class="custom-control-label" for="3">Node.js</label>
				            </div>
						
				            <div class="custom-control custom-checkbox">
				                <input class="custom-control-input checkboxes" type="checkbox" value="4" id="4">
				                <label class="custom-control-label" for="4">Spring</label>
				            </div>
						
				            <div class="custom-control custom-checkbox">
				                <input class="custom-control-input checkboxes" type="checkbox" value="5" id="5">
				                <label class="custom-control-label" for="5">Python</label>
				            </div>
						
				     </div>       
                                    <!-- Submit Button-->
                                    <div class="d-grid my-5"><button class="btn btn-primary btn-lg" id="submitButton" type="button">Submit</button></div>
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

	<script>
		$('#contents').summernote();


	</script>
	
	<script>
	
	$(document).ready(function() {
	  // Submit 버튼 클릭 시
	  $('#submitButton').click(function(e) {
	    e.preventDefault(); // 폼의 기본 동작을 막음

	    let selectedValues = [];
	    $('.checkboxes:checked').each(function() {
	      selectedValues.push($(this).val());
	      console.log(selectedValues.push($(this).val()))
	    });
	    
	    let selectedValuesString = selectedValues.join(',');

	    // selectedValues 값을 숨겨진 input 요소에 설정
	    $('#selectedValuesInput').val(selectedValuesString);
	    
	    if ($('.checkboxes:checked').length > 0) {
	        $('#contactForm').submit();
	    }
	  });
	});
	</script>
	<%-- <c:import url="../temp/js.jsp"></c:import> --%>
</body>
</html>