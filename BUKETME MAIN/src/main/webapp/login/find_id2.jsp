<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="../css/loginCss/find_main.css">
	<title>ID 확인</title>
</head>
<body>
	
	<%@ include file="../common/loginHeader.jsp" %>

	<div class="content">
		<div class="main">
	    	<h1 class="find_Id">아이디 찾기</h1>
		    <div class="find-form">
		    	<h4>아이디</h4>
		        <input class="input-field" type="text" placeholder="확인된 ID 출력" disabled>
		        <div class="submit">
		        	<input type="button" value="로그인">
		        	<input type="button" value="비밀번호 찾기">
		        </div>
			</div>
	    </div>    
	</div>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>