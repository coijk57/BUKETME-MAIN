<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="page" value="5" />
<%!String[][] records = { 
		{ "1", "관리1", "2022.01.08", "team1", "3"}, 
		{ "2", "관리2", "2022.01.08", "team2", "3"},
		{ "3", "관리3", "2022.01.08", "team3", "3"}, 
		{ "4", "관리4", "2022.01.08", "team4", "3"},
		{ "5", "관리5", "2022.01.08", "team5", "3"}, 
		{ "6", "관리6", "2022.01.08", "team6", "3"},
		{ "7", "관리7", "2022.01.08", "team7", "3"}
	};
	int size = 0;
	int currentPage = 1;
	%>
<%
request.setCharacterEncoding("UTF-8");
pageContext.setAttribute("records", records);
size = records.length;
pageContext.setAttribute("size", size);
pageContext.setAttribute("currentPage", request.getParameter("currentPage"));
 if(request.getParameter("currentPage")==null){
	pageContext.setAttribute("currentPage", 1);
} 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리기록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/managerCss/manager.css">
<!-- <link rel="stylesheet" href="../css/managerCss/membership.css">
 --><!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
	
<script type="text/javascript" src="../js/managerJS/searchFilterSelect.js"></script>

</head>
<body>
	<body>
	
	<%@ include file="../common/managerHeader.jsp" %>
	
	<div class="mainBox">
    
    	<%@ include file="../common/managerSide.jsp" %>
    	
		<div class="mainBoxInside">
			<div id="mainWrapper">

				<ul>
		
					<li>
						
						<div class="board_search">
							<!-- <div class="filter">필터</div> -->
							<div class="list_title">관리기록</div>
							<!-- <div class="search_area">
								<div class="board_searchBox">
						            <input class="board_searchText" type="text" placeholder="search">
						            <a class="board_searchBtn" href="#">
						                <span class="board_list_userTitleIcon color">
						                    <i class="fas fa-search fa-lg">
						                    </i>
						                </span>
						            </a>
						        </div>
							</div> -->
						</div>
						
					</li>
		
					<li>
						<ul id="ulTable">
							<li>
								<ul>
									<li>No</li>
									<li>관리사항</li>
									<li>작성일</li>
									<li>작성자</li>
									<li>조회수</li>
								</ul>
							</li>
		
							<c:forEach var="record" items="${records}"
								begin="${(currentPage-1)*page}" end="${currentPage*page-1}">
								<li>
									<ul id="notice">
										<c:forEach var="item" items="${record}">
											<li><c:out value="${item}" /></li>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</li>
		
					<li>
						<div id="divPaging">
		
							<c:forEach begin="1" end="${Math.ceil(size/page)}" var="item">
								<a href="<c:url value="../manager/manager2.jsp" >            
							  <c:param name="currentPage" value="${item}"></c:param>
							  </c:url>"style="<c:if test = "${currentPage == item}"> font-weight:bold;</c:if>"><c:out value="${item}" /></a>
							</c:forEach>
						</div>
					</li>
		
				</ul>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary dropdown-toggle"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">작성자</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">작성자</a>
							<a class="dropdown-item" href="#">제목</a>
						</div>
					</div>
					<input type="text" class="form-control"
						aria-label="Text input with dropdown button">
				</div>
			</div>
		</div>
	</div>

</body>
</html>