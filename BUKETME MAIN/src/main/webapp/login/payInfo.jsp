<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/loginCss/style.css" />
    <title>결제정보</title>
</head>
<body>

	<%@ include file="../common/loginHeader.jsp" %>
	
	<div class="middleContainer">
	    <div class="centerContainer">
	        <div class="payInfoContainer">
	            <div class="titleContainer">
	                <h1 class="titleName">신용카드나 체크카드 등록</h1>
	            </div>
	            <form class="payFormInfo">
	                <div class="writeInfoContainer">
	                    <h4>카드번호</h4>
	                    <input class="writeInfo" type="text" placeholder="카드 번호">
	                    <h4>만료일</h4>
	                    <input class="writeInfo" type="text" placeholder="만료일(월/연도:12/21)">
	                    <h4>이름</h4>
	                    <input class="writeInfo" type="text" placeholder="이름">
	                    <h4>생년월일</h4>
	                    <input class="writeInfo" type="text" placeholder="생년월일">
	                </div>
	            </form>
	            <div class="membershipContainer">
	                <div class="membershipContent">
	                    <div class="membershipInfoPrice">월 17,000원</div>
	                    <div class="membershipInfoName">
	                        프리미엄 멤버십
	                    </div>
	                </div>
	                <button class="membershipContentMod">변경</button>
	            </div>
	            <h4 class="allAgreeCheckbox">
	                <input type="checkbox">
	                <span>19세 이상이며, 아래의 약관에 모두 동의합니다.</span>
	                </input>
	            </h4>
	            <ul class="agreeList">
	                <div class="agreeListContent">
	                    <input type="checkbox">
	                    <span>플랫폼명 이용 약관 및 개인정보 처리방침에 동의합니다.</span>
	                    </input>
	                </div>
	                <div class="agreeListContent">
	                    <input type="checkbox">
	                    <span>본인의 개인정보를 제 3자에 제공하는 데에 동의합니다.</span>
	                    </input>
	                </div>
	                <div class="agreeListContent">
	                    <input type="checkbox">
	                    <span>본인의 개인 정보를 결제 서비스 업체에 제공하는 데에 <br>동의합니다.</span>
	                    </input>
	                </div>
	            </ul>
	            <button class="membershipStartBtn">유료 멤버십 시작</button>
	        </div>
	    </div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>
