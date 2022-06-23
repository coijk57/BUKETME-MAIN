<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/managerCss/style.css" />
	<title>매니저 헤더</title>
	
	<script type="text/javascript">
		function getContextPath() {
			var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		};
		
		$(document).ready(function() {
			$.ajax({
				type: "post",
				url: getContextPath() + "/MainProfileChoice.do",
				dataType: "json",
				success: function(data) {
					
				}
			});
			
		});
	</script>
	
</head>
<body>

	<div class="header">
	    <a href="${pageContext.request.servletContext.contextPath}/MainDataLoad.do" class="logo-area">
	        <span class="logo-icon">
	            BuketMe
	        </span>
	    </a>
	    <div class="title-bar__column">
	        <!-- <div class="searchBox">
	            <input class="searchText" type="text" placeholder="search">
	            <a class="searchBtn" href="#">
	                <span class="userTitleIcon color">
	                    <i class="fas fa-search fa-lg">
	                    </i>
	                </span>
	            </a>
	        </div> -->
	        
	        <c:forEach var="list" items="${profile}">
	        	<span class="userTitleIcon"><img src="<c:out value='${list.getProfileImageName()}' />" class="userProfileImage"></span>
		        <span class="userTitleIcon">
		        	<div class="dropDownBox">
			            <button class="dropDownbtn">
			            	<i class="fas fa-caret-down fa-lg" id="downIcon"></i>
			            </button>
			            <div class="dropDownContent">
			            	<a href="#"><img src="<c:out value='${list.getProfileImageName()}' />" class="userProfileImageSub"> <c:out value="${list.getProfileName()}" /></a>
			            	<a href="#">프로필 관리</a>
			            	<a href="#">마이페이지</a>
			            	<a href="#">로그아웃</a>
			            </div>
		            </div>
		        </span>
	        </c:forEach>
	        
	    </div>
	</div>

<script
        src="https://kit.fontawesome.com/6478f529f2.js"
        crossorigin="anonymous">
</script>
</body>
</html>