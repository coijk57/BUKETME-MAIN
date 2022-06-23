<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="page" value="5" />
<%!String[][] records = { 
			{ "1", "결제 오류", "고객1", "결제", "2022.01.08", "답변완료"},
			{ "2", "영상 재생", "고객3", "오류", "2022.01.08", "답변완료"}, 
			{ "3", "카드 변경", "고객5", "결제", "2022.01.08", "답변완료"},
			{ "4", "구독 취소", "고객10", "결제", "2022.01.08", "답변완료"}, 
			{ "5", "로그인 오류", "고객2", "로그인", "2022.01.08", "미답변"},
			{ "6", "구독 킵", "고객7", "통합", "2022.01.08", "미답변"}, 
			{ "7", "관심 카테고리", "고객9", "통합", "2022.01.08", "미답변"}
	};
	int size = 0;
	
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
<!-- <html lang="ko" xmlns:th="http://www.thymeleaf.org"> -->
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Q&A 게시판</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="../css/managerCss/boardList.css"/>
	
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
	

	<%@ include file="../common/managerHeader.jsp" %>
	
	<div class="mainBox">
    
    	<%@ include file="../common/managerSide.jsp" %>
    	
    	<div class="mainBoxInside">
    
		    <div class="container">
		        
		        <div class="board_search">
					<!-- <div class="filter">필터</div> -->
					<div class="list_title">Q&A</div>
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
		        
		        
		        
		        <table class="board_list">
		            <colgroup>
		                <col width="5%"/>
		                <col width="*"/>
		                <col width="10%"/>
		                <col width="5%"/>
		                <col width="15%"/>
		                <col width="10%"/>
		            </colgroup>
		            <thead>
		                <tr>
		                    <th scope="col">번호</th>
		                    <th scope="col">제목</th>
		                    <th scope="col">
		                    	<div class="Q&A-searchBox">작성자</div>
		                    </th>
		                    <th scope="col">
		                    <select id="browsers" name="browsers">
		    					<option value="분류" disabled selected>분류</option>
		    					<option value="통합">통합</option>
		    					<option value="결제">결제</option>
		    					<option value="오류">오류</option>
		    					<option value="로그인">로그인</option>
							</select>
		                    </th>
		                    <th scope="col">문의날짜</th>
		                    <th scope="col">상태</th>
		                </tr>
		            </thead>
		            
		            <%-- <tbody>
		                <tr th:if="${#lists.size(list)} > 0" th:each="list : ${list}">
		                    <td th:text="${list.boardIdx}"></td>
		                    <td class="title" th:text="${list.title}"></td>
		                    <td th:text="${#temporals.format(list.createdDatetime, 
		                        'yyyy-MM-dd HH:mm::ss')}"></td>
		                </tr> 
		                <tr th:unless="${#lists.size(list)} > 0">
		                    <td colspan="4">조회된 결과가 없습니다.</td>
		                </tr>
		            </tbody> --%>
		            
		            <tbody>
		                <c:forEach var="record" items="${records}"
								begin="${(currentPage-1)*page}" end="${currentPage*page-1}">
							<tr>
								<c:forEach var="item" items="${record}">
										<td><c:out value="${item}" /></td>
								</c:forEach>
							</tr>	
						</c:forEach>
		            </tbody>
		            
		        </table>
		        
		        <div id="paging">
					<c:forEach begin="1" end="${Math.ceil(size/page)}" var="item">
						<a href="<c:url value="../manager/boardList.jsp" >
						<c:param name="currentPage" value="${item}"></c:param>
						</c:url>"style="<c:if test = "${currentPage == item}"> font-weight:bold;</c:if>">
						<c:out value="${item}" /></a>
					</c:forEach>
				</div>
				
				
				
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary dropdown-toggle"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">제목</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">제목</a>
							<a class="dropdown-item" href="#">내용</a>
						</div>
					</div>
					<input type="text" class="form-control" aria-label="Text input with dropdown button">
				</div>
		        
		        
		        
		    </div>

		    
			<!-- <div id="paging">
				<br/>
				<a [##_prev_page_##] class="prev" title="이전페이지">◀ 이전 </a>
				<s_paging_rep><a [##_paging_rep_link_##] class="num">[##_paging_rep_link_num_##]</a></s_paging_rep>
				<a [##_next_page_##] class="prev" title="다음페이지">다음 ▶</a>
				<br/>&nbsp;
			</div> -->
			
			
		</div>
	</div>

</body>
</html>