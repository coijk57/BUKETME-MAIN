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
	<link rel="stylesheet" href="../css/managerCss/style.css" />
	<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
	<title>유저 헤더</title>
	
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
		
		$(function() {
			$(".searchBtn").on("click", function() {
				var video = $(".searchText").val();
				//alert(video);
				
				$.ajax({
					type: "post",
					url: getContextPath() + "/SearchContents.do",
					data: {"video": video},
					dataType: "json",
					complete: function(data) {
						console.log(data);
						var list = data.responseJSON;
						var check = list.search;
						
						if(check == false) {
							alert("해당 영상이 없습니다.");
						}
						else {
							location.href = "#";
						}
					}
				});
			});
		});
		
		
	</script>
</head>
<body>

	<div class="header userheader">
	    <a href="${pageContext.request.servletContext.contextPath}/MainDataLoad.do" class="logo-area">
	        <span class="logo-icon">
	            BuketMe
	        </span>
	    </a>
	    <div class="header-menu">
	    	<a href="${pageContext.request.servletContext.contextPath}/SeriesDataLoad.do">시리즈</a>
	    	<a href="${pageContext.request.servletContext.contextPath}/MovieDataLoad.do">영화</a>
	    	<a href="${pageContext.request.servletContext.contextPath}/CsconDataLoad.do">상영 예정 컨텐츠</a>
	    	<a href="${pageContext.request.servletContext.contextPath}/MyconDataLoad.do">마이 컨텐츠</a>
	    </div>
	    
	    <div class="title-bar__column">
	        <div class="searchBox">
	            <input class="searchText" type="text" placeholder="search">
	            <a class="searchBtn" href="#">
	                <span class="userTitleIcon color">
	                    <i class="fas fa-search fa-lg">
	                    </i>
	                </span>
	            </a>
	        </div>
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