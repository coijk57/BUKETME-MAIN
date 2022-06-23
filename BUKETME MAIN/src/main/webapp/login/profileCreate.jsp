<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>프로필 추가</title>
    <link rel="stylesheet" href="../css/loginCss/profileCreate.css">
</head>
<body>

	<%@ include file="../common/loginHeader.jsp" %>
	
	<div id="profile-main">
        <section id="section">
            <div id="profileadd">
            	<form action="${pageContext.request.servletContext.contextPath}/ProfileCreate.do" method="post">
            		<p id="add">프로필을 추가</p>
	                <p>버켓미를 시청할 사용자를 등록하려면 프로필을 추가하세요.</p>
	                <hr>
	                <img id="man" src="../img/man.png" alt="프로필 사진" name="profileImageName" />
	                <input id="Write" type="text" name="profileName"><br>
	                <hr>
	                <div id="input">
	                    <input id="next" type="submit" value="다음">
	                    <input id="cancel" type="button" value="취소">
	                </div>
            	</form>
            </div>
        </section>
    </div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>