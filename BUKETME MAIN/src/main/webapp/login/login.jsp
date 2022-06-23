
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 화면</title>
    <link rel="stylesheet" href="../css/loginCss/login.css">
</head>
<body>

	<%@ include file="../common/loginHeader.jsp" %>
	
	<div class="wrap">
	    <div class="login">
	        <h1 class="title">로그인</h1>
	        <div class="login_id">
	            <h4>이메일</h4>
	            <input type="email" name="" id="" placeholder="Email">
	        </div>
	        <div class="login_pw">
	            <h4>비밀번호</h4>
	            <input type="password" name="" id="" placeholder="Password">
	        </div>
	        <div class="checkbox">
	            <input type="checkbox" name="" id=""> 자동 로그인
	        </div>
	        <div class="submit">
	            <input type="submit" value="L O G I N">
	        </div><br>
	        <div class="login_etc">
	            <div class="membership">
	                <a href="">회원가입</a>
	            </div>
	            <div class="inline-block">
	            </div>
	            <div class="forgot_id">
	                <a href="">아이디 찾기</a>
	            </div>
	            <div class="com">
	                ㅣ
	            </div>
	            <div class="forgot_pw">
	                <a href="">비밀번호 찾기</a>
	            </div>
	        </div>
	    </div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>