<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	response.setContentType("text/html; charset=utf8");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>프로필 선택</title>
    <link rel="stylesheet" href="../css/loginCss/profile.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
	    $(function() {
			$(".create").on("click", function() {
				location.href="./profileCreate.jsp";
		    });
		});
    </script>
</head>
<body>

	<%@ include file="../common/loginHeader.jsp" %>
	
	<div id="profile-main">
        <section id="section">
            <p id="ProfileChoice">
                프로필을 선택 하세요
            </p>
            <ul class="profile-list">
            	<c:choose>
            		<c:when test="${empty profile}">
	                	<div class="profile-area">
		                    <img id="plus" src="../img/plus.png" alt="프로필 생성"/>
		                    <p>프로필 추가</p>
		                </div>
	                </c:when>
	                <c:when test="${!empty profile}">
	                	<c:forEach var="list" items="${profile}">
		                	<div class="profile-area">
			                    <img class="man" src="<c:out value='${list.getProfileImageName()}' />" alt="프로필 사진"/>
			                	<div class="profile-name"><c:out value="${list.getProfileName()}" /></div>
			                </div>
		                </c:forEach>
						<c:if test="${createCheck == true}">
							<div class="profile-area create">
			                    <img id="plus" src="../img/plus.png" alt="프로필 생성"/>
			                    <p>프로필 추가</p>
			                </div>
						</c:if>
	                </c:when>
            	</c:choose>
            </ul>

            <button>완료</button>
        </section>
    </div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>