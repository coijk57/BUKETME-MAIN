<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../css/loginCss/find_main.css">
  <title>비밀번호 찾기</title>
</head>
<body>

	<%@ include file="../common/loginHeader.jsp" %>

    <div class="content">
        <div class="main">
            <h1 class="find_Id">비밀번호 찾기</h1>
            <form class="find-form">
                <h4>아이디</h4>
                <input class="input-field" type="text" placeholder="Email을 입력하세요.">
                <h4>이름</h4>
                <input class="input-field" type="text" placeholder="이름을 입력하세요.">
                <h4>전화번호</h4>
                <input class="input-field" type="tel" placeholder="휴대폰 번호를 입력하세요.">
                <div class="submit">
                    <input type="submit" value="확인">
                    <input type="button" value="취소">
                </div>
            </form>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>