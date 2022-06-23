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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원관리</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/managerCss/membership.css">

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
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}

	$(function() {
		$(".sub-cancel").on("click", function() {
			if($(".userCheck").is(":checked")) {
				var ul = $("input[class=userCheck]:checked").parent().parent();
				var li = ul.children();
				var email = li.eq(2);
				
				var result = confirm(email.text() + "계정의 구독을 해지 하시겠습니까?");
				
				if(result) {
					var subStatus = li.eq(6);
					var sub = subStatus.text();
					
					if(sub == "구독해지") {
						alert("이미 구독해지 상태입니다");
						$("input:checkbox[class=userCheck]").prop("checked", false);
					}
					else{
						$.ajax({
							type: "post",
							url: getContextPath() + "/SubCancel.do",
							data: {"email": email.text()},
							dataType: "json",
							success: function(data) {
								
							},
							complete: function(data) {
								alert("구독해지 되었습니다.");
								location.href = getContextPath() + "/Usermanage.do";
							}
						});
					}
				}
				else {
					$("input:checkbox[class=userCheck]").prop("checked", false);
				}
			}
			else {
				alert("구독해지할 계정을 선택해주세요.");
			}
			
		});
	});
</script>

</head>
<body>
	
	<%@ include file="../common/managerHeader.jsp" %>
	
	<div class="mainBox">
    
    	<%@ include file="../common/managerSide.jsp" %>
    	
		<div class="mainBoxInside">
			<div id="mainWrapper">
				<ul>
					<li>
						<div class="board_search">
							<div class="list_title">회원관리</div>
						</div>
					</li>
					<li>
						<ul id="ulTable">
							<li>
								<ul>
									<li><input type="checkbox" /></li>
									<li>성별</li>
									<li>이메일</li>
									<li>멤버쉽</li>
									<li>구독일</li>
									<li>구독기간</li>
									<li>구독상태</li>
								</ul>
							</li>
		
							<c:forEach var="list" items="${selectUserData.get('userArray')}"
								begin="${(currentPage-1)*page}" end="${currentPage*page-1}">
								<li>
									<ul id="notice">
										<li><input class="userCheck" type="checkbox" /></li>
										<li><c:out value="${list[0]}" /></li>
										<li class="email"><c:out value="${list[1]}" /></li>
										<li><c:out value="${list[2]}" /></li>
										<li><c:out value="${list[3]}" /></li>
										<li><c:out value="${list[4]}" /></li>
										<li><c:out value="${list[5]}" /></li>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</li>
					<li>
						<div class="sub-btn-area">
							<input class="sub-cancel" type="button" value="구독해지" />
						</div>
					</li>
		
					<li>
						<div id="divPaging">
		
							<c:forEach begin="1" end="${Math.ceil(selectUserData.get('listSize')/page)}" var="item">
								<a href="<c:url value="../manager/membership.jsp" >            
							  <c:param name="currentPage" value="${item}"></c:param>
							  </c:url>"
									style="<c:if test = "${currentPage == item}"> font-weight:bold;</c:if>">
									<c:out value="${item}" /></a>
							</c:forEach>
						</div>
					</li>
		
				</ul>
				
				<!-- <div class="input-group mb-3">
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
				</div> -->
				
			</div>
		</div>
	</div>

</body>
</html>