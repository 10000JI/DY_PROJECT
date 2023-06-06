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
				<div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">프로젝트/스터디 찾기</h1>
                    <p class="mb-4">기술 스택 별 원하시는 프로젝트 및 스터디를 찾으세요!</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">프로젝트/스터디 게시판</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
								<div id="dataTable_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="datatable-dropdown">
                                <div class="mb-0">
                                    <label class="small mb-2"></label>
                                    <table class="table table-bordered">
                                        <tbody>
                                        <tr>
                                            <th scope="row">
                                                <label>기술스택</label>
                                            </th>
                                            <td>
                                                <div class="form-check form-check-inline">
                                                    <label class="form-check-label">Java</label>
                                                    <div class="badge rounded-pill" style="background-color: #1a1f71; color: white;">Java</div>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <label class="form-check-label">JAVASCRIPT</label>
                                                    <div class="badge bg-warning text-white rounded-pill">JAVASCRIPT</div>
                                                </div>

                                                 <div class="form-check form-check-inline">
                                                    <label class="form-check-label">Node.js</label>
                                                    <div class="badge text-white rounded-pill" style="background-color: #00673f;">Node.js</div>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <label class="form-check-label">Spring</label>
                                                    <div class="badge bg-info text-white rounded-pill">Spring</div>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <label class="form-check-label">Python</label>
                                                    <div class="badge rounded-pill" style="background-color: #8B4513; color: white;">Python</div>
                                                </div>
                                            </td>

                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
									<div class="row">
										<div class="col-sm-12">
											<table class="table table-bordered dataTable" id="dataTable"
												width="100%" cellspacing="0" role="grid"
												aria-describedby="dataTable_info" style="width: 100%;">
												<thead>
													<tr role="row">
														<th class="sorting sorting_asc" tabindex="0"
															aria-controls="dataTable" rowspan="1" colspan="1">NUM</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1">TITLE</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1">STACK</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1">WRITER</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1">REGDATE</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1">HIT</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${list}" var="dto">
														<tr>
															<td>${dto.num}</td>
															<td>${dto.title}</td>
															<td><c:forEach items="${stackList}" var="stackDto">
																	<c:if test="${dto.num eq stackDto.num}">
																		<c:forEach items="${stackDto.stackVOs}" var="stackVO">
    															        ${stackVO.stack}  <c:if test="${not loop.last}">&nbsp;</c:if>
      																	  </c:forEach>
																	</c:if>
																</c:forEach></td>
															<td>${dto.writer}</td>
															<td>${dto.regDate}</td>
															<td>${dto.hit}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
										<div class="row">
										<div class="col-sm-6">
											<form class="row g-3" action="./list" method="get"
												id="searchForm">
												<input type="hidden" name="page" value="1" id="page">
												<div class="col-auto">
												<label for="kind" class="visually-hidden">Kind </label><select name="kind" id="kind"
													aria-controls="dataTable"
													class="custom-select custom-select-sm form-control form-control-sm">
														<option value="title"
															${pager.kind eq 'title'?'selected':''}>Title</option>
														<option value="contents"
															${pager.kind eq 'contents'?'selected':''}>Contents</option>
														<option value="writer"
															${pager.kind eq 'writer'?'selected':''}>Writer</option>
														</select>
												</div>
												<div class="col-auto">
													<label for="search" class="visually-hidden">Search</label>
													<input type="text" class="form-control"
														value="${pager.search}" name="search" id="search"
														placeholder="검색어를 입력하세요.">
												</div>
												<div class="col-auto">
													<button type="submit" class="btn btn-primary mb-3">검색</button>
												</div>
											</form>
											</div>
										<div class="col-sm-6">
											<nav aria-label="Page navigation example">
												<ul class="pagination ">
													<li class="page-item "><a class="page-link"
														href="./list?page=1" aria-label="Previous"
														data-board-page="1"> <span aria-hidden="true">&laquo;</span>
													</a></li>
													<li class="page-item ${pager.pre?'disabled':''}"><a
														class="page-link"
														href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"
														aria-label="Previous"
														data-board-page="${pager.startNum-1}"> <span
															aria-hidden="true">&lsaquo;</span>
													</a></li>

													<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
														var="i">
														<li class="page-item"><a class="page-link"
															href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}"
															data-board-page="${i}">${i}</a></li>
													</c:forEach>

													<li
														class="page-item ${pager.next eq false ? 'disabled' : ''}">
														<%--${pager.after eq false ? 'disabled' : ''} --%> <a
														class="page-link"
														href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"
														aria-label="Next" data-board-page="${pager.lastNum+1}">
															<span aria-hidden="true">&rsaquo;</span>
													</a>
													</li>
													<li class="page-item ">
														<%--${pager.after eq false ? 'disabled' : ''} --%> <a
														class="page-link"
														href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}"
														aria-label="Next" data-board-page="${pager.totalPage}">
															<span aria-hidden="true">&raquo;</span>
													</a>
													</li>
												</ul>
											</nav>
										</div>

										
										</div>
									</div>
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
		<script>
   	setData('${pager.search}')
   	const pl = document.getElementsByClassName('page-link');
   	const searchForm = document.getElementById('searchForm');
   	const page = document.getElementById('page');

   	//for
   	//for of --for(꺼낸타입명 변수명: Collection)

   	for(let p of pl){
   	    p.addEventListener('click',function(e){
   	        let v = p.getAttribute('data-board-page');
   	        page.value=v;
   	        searchForm.submit();
   	    })
   	}

   	let data='';
   	function setData(d){
   	    data=d;
   	}
   	</script>
</body>

</html>