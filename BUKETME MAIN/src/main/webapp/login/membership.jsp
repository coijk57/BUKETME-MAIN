<%@page import="java.util.List"%>
<%@page import="kr.co.ezenac.membership.MembershipVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
	String[][] records = { 
		{ "1", "1", "9,500", "베이식", "SD(480p)"}, 
		{ "2", "2", "13,500", "스탠다드", "FULL HD(1080p)"},
		{ "3", "4", "17,000", "프리미엄", "UHD(4K) 및 HDR"},
	};

	response.setContentType("text/html; charset=utf8");
	
	/* List<MembershipVO> membership = request.getAttribute("membership"); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/loginCss/selectmembership.css">
<script type="text/javascript" src="../js/loginJS/membership.js"></script>
<title>멤버십 선택</title>
</head>
<body>
	
    <%@ include file="../common/loginHeader.jsp" %>

    <div class="membership-wrapper">
        <div class="membership-area">
            <div><h1 class="title">멤버십을 선택하세요</h1></div>
            <div>
                <ul>
                    <li class="listimg">취향에 꼭 맞는 컨텐츠를 추천 해 드립니다.</li>
                    <li class="listimg">멤버십은 언제든지 변경 또는 해지 가능.</li>
                </ul>
            </div>

            <ul class="membership-list">
                
                <c:forEach var="list" items="${membership}" varStatus="statusNm">
					<li>
	                    <div class="membership">
	                        <div class="profile-card">
	                            <div class="subprofile-card sub-first">
	                                <div class="profile-detail">
	                                	
	                                	<c:forEach var="record" items="${records[statusNm.index]}">
	                                		<div><span class="mem-val1"><c:out value="${record[4]}" /></span>로 좋은 화질 제공.</div>
	                                	</c:forEach>
	                                    <%-- <div><span class="mem-val1"><c:out value="${record[4]}" /></span>로 좋은 화질 제공.</div> --%>
	                                
	                                
	                                
	                                    <div><span class="mem-val1">{test}</span>로 좋은 화질 제공.</div>
	                                    <span>스마트폰, 태블릿, 컴퓨터 또는 TV로 시청.</span>
	                                </div>
	                            </div>
	                            <div class="subprofile-card">동시접속 <span class="mem-val2"><c:out value="${list.getSameWatch()}" /></span>명</div>
	                            <div class="subprofile-card sub-last">월 <span class="mem-val3"><c:out value="${list.getPrice()}" /></span>원</div>
	                        </div>
	                        <div class="selectmembership">
	                            <div class="membership-title"><c:out value="${list.getMembership()}" /></div>
	                        </div>
	                    </div>
	                </li>
				</c:forEach>
				
            </ul>

            <div class="button-area">
                <button class="member-btn next-btn" type="submit">다음</button>
                <button class="member-btn cancel-btn" type="submit">취소</button>
            </div>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>
    
</body>
</html>