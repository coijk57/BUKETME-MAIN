<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="page" value="5" />
<%
request.setCharacterEncoding("UTF-8");
pageContext.setAttribute("currentPage", request.getParameter("currentPage"));
if(request.getParameter("currentPage")==null){
	pageContext.setAttribute("currentPage", 1);
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 최신버전============================================================================================================================= -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- ===================================================================================================================================== -->

<!-- 참조 css ============================================================================================================================= -->
<link href="../css/managerCss/layout.css" rel="stylesheet">
<link href="../css/managerCss/adminboardlist.css" rel="stylesheet">
<!-- ===================================================================================================================================== -->

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

<script type="text/javascript">
	$(function() {
		$(".video-search").on("keyup",function(key){
		    if(key.keyCode==13) {
		        //alert($(".video-search").val());
		    	$.ajax({
					type: "post",
					url: getContextPath() + "/AdminboardSearch.do",
					data: {"title": $(".video-search").val()},
					dataType: "json",
					success: function(data) {
						
					},
					complete: function(data) {
						console.log(data);
						
						var list = data.responseJSON;
						
						var check = list.search;
						
						if(check == false) {
							alert("해당 영상이 없습니다.");
						}
						else {
							$(".board_list_body").html("<div class='item'><div class='checkbox'><input type='checkbox' value=''></div><div class='contents'><a href='./AdminVideoManage.jsp'><img class='board_list_contentsimg' src='"+list.ImageFileName+"'></a><a href=javascript:;>"+list.Title+"</a></div><div class='public'>"+list.Status+"</div><div class='date'>"+list.PostDate+"</div><div class='view'>"+list.VideoHits+"</div></div>");
							$(".paging").css("visibility", "hidden");
						}
						
					}
				});
		    }
		});
		
		
	});
</script>

<title>컨텐츠 관리</title>
</head>
<body>    

	<%@ include file="../common/managerHeader.jsp" %>
	
	<div class="mainBox">
		<%@ include file="../common/managerSide.jsp" %>
		
		<div class="mainBoxInside">
			<div class="board_list_wrap">
				<div class="board_search">
					<div class="list_title">콘텐츠 업로드 리스트</div>
				</div>
				<div class="board_list">
					<div class="board_list_head">
						<div class="checkbox"><input type="checkbox" value=""></div>
						<div class="contents">제목</div>
						<div class="public">공개상태</div>
						<div class="date">날짜</div>
						<div class="view">조회수</div>
					</div>
					
					<div class="board_list_body">
						<c:forEach var="list" items="${selectVideoData.get('videoArray')}" begin="${(currentPage-1)*page}" end="${currentPage*page-1}" varStatus="status" >
							<div class="item">
								<div class="checkbox"><input type="checkbox" value=""></div>
								<div class="contents">
									<a href="./AdminVideoManage.jsp"><img class="board_list_contentsimg" src='<c:out value="${list[0]}" />'></a>
									<a href="javascript:;"><c:out value="${list[1]}" /></a>
								</div>
								<%-- <div class="public"><c:out value="${list.}" /></div> --%>
								<div class="public"><c:out value="${list[2]}" /></div>
								<div class="date"><c:out value="${list[3]}" /></div>
								<%-- <div class="view"><c:out value="${list.}" /></div> --%>
								<div class="view"><c:out value="${list[4]}" /></div>
							</div>
						</c:forEach>										
					</div>
					
					
				</div>
				<div class="paging">
					<c:forEach begin="1" end="${Math.ceil(selectVideoData.get('listSize')/page)}" var="item">
						<a href="<c:url value="../manager/adminboard.jsp" >
						<c:param name="currentPage" value="${item}"></c:param>
						</c:url>" class="num" 
							style="<c:if test = "${currentPage == item}"> font-weight:bold;</c:if>">
						<c:out value="${item}" /></a>
					</c:forEach>
				</div>
				
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary dropdown-toggle"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">제목</button>
						<div class="dropdown-menu">
							<a class="dropdown-item">제목</a>
							<!-- <a class="dropdown-item" href="#">날짜</a> -->
						</div>
					</div>
					<input type="text" class="form-control video-search"
						aria-label="Text input with dropdown button" />
				</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>
