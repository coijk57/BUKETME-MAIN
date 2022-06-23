<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content Play</title>

<link href="../css/UserMainCss/contentPlay.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>



</head>
<body>
	<div class="video-area">
	
	<c:choose>
		<c:when test="${empty recordList}">
			
			<c:forEach var="list" items="${play}">
				<video id="video" class="video" muted="muted" controls="controls" autoplay="autoplay" loop="loop">
					<source id="modal-trailers-src" src="<c:out value='${list.getVideoFileName()}' />" type="video/mp4">
				</video>
			</c:forEach>

		</c:when>
		<c:otherwise>
		
			<c:forEach var="list1" items="${play}">
				<c:forEach var="list2" items="${recordList}">
					<video id="video" class="video" muted="muted" controls="controls" autoplay="autoplay" loop="loop">
						<source id="modal-trailers-src" src="<c:out value='${list1.getVideoFileName()}' />#t=<c:out value='${list2.getVideoSection()}' />" type="video/mp4">
					</video>
				</c:forEach>
			</c:forEach>
			
		</c:otherwise>
	</c:choose>
	
	
		
	</div>
	
	<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	
	/* window.onpageshow = function(event) {
		alert("뒤로가기");
	} */
	
	var video = document.getElementById('video');
	
	video.addEventListener('pause', (event) => {
		//alert("전체시간 : " + $("#video").get(0).duration + "초\n재생시간 : " + $("#video").get(0).currentTime + "초");
		
		var playTime = $("#video").get(0).currentTime;
		
		$.ajax({
			type: "POST",
			data: {"playTime": playTime},
			url :  getContextPath() + "/PlayRecord.do",
			async:false,
			dataType: "json",
			success : function(data) {
			},
			complete : function(data) {
			}
		});
		
	});
	
</script>
</body>
</html>