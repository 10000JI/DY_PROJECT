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
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid rounded-circle" src="/img/user.png" alt="..." />
                                <div class="ms-3">
                                    <div class="fw-bold">${boardVO.writer}</div>
									<div class="text-muted">사용 기술:
										<c:forEach items="${boardStackVOs}" var="boardStackVO">
											<c:forEach items="${boardStackVO.stackVOs}" var="stackVO">${stackVO.stack} /</c:forEach>
										</c:forEach>
									</div>
								</div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1">${boardVO.title}</h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2">${boardVO.regDate}</div>
                                </header>
                                <!-- Preview image figure-->
                               <!--  <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure> -->
                                <!-- Post content-->
                                <section class="mb-5">
                                  ${boardVO.contents}
                                  
                                  <c:forEach items="${boardVO.boardFileVOs}" var="boardFileVO">
                                  	<input type="hidden" name="pageName" value="${boardFileVO.fileNum}">
                                  	<img alt="" src="/file/${board}/${boardFileVO.fileName}">
                                  	<a href="./fileDown?fileNum=${boardFileVO.fileNum}">${boardFileVO.oriName }</a>
                                  </c:forEach>
                                </section>
                                <form action="./delete" method="post">
                                	<input type="hidden" id="num" name="num" value="${boardVO.num}">
                                	 <c:forEach items="${boardVO.boardFileVOs}" var="boardFileVO">
                                  	<input type="hidden" id="fileNum" name="fileNum" value="${boardFileVO.fileNum}">
                                  	</c:forEach>
                                	<button class="btn btn-primary">삭제</button>
                                </form>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
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