<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- ==================================================================================================================================================================================================================================================================================== -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://stephenpontes.com/misc/permanent/jquery.flexslider-min.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/maincontentslist.js"></script>
<!-- ==================================================================================================================================================================================================================================================================================== -->

<!-- 참조 slick(슬라이드)파일 경로======================================================================================================================================================================================================================================================================= -->
	<link rel="stylesheet" type="text/css" href="../css/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="../css/slick/slick-theme.css"/>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="../css/slick/slick.min.js"></script>
<!-- 참조 slick(슬라이드)파일 경로======================================================================================================================================================================================================================================================================= -->
	
<!-- 참조 css파일 경로======================================================================================================================================================================================================================================================================= -->
	<link href="../css/UserMainCss/usermain.css" rel="stylesheet">
	<link href="../css/UserMainCss/moviemodal.css" rel="stylesheet">
<!-- ==================================================================================================================================================================================================================================================================================== -->

<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
	
	
	var videoReload = <%=session.getAttribute("videoReload") %>;
	
	if(videoReload == null || videoReload == false) {
		$(document).ready(function() {
			location.href = getContextPath() + "/MainDataLoad.do";
		});
	}
	
	/* $(document).ready(function() {
		alert("세션 : " + videoReload);
	}); */
	
	var video = document.getElementById("test-video");
	
	$(function() {
	    $(".test-btn").on("click", function() {
	    	alert("전체시간 : " + $("#test-video").get(0).duration + "초\n재생시간 : " + $("#test-video").get(0).currentTime + "초");
	    });
	    
	    
	    $(".imageFile").on("click", function() {
			var src = $(this).attr("src");
			/* alert("이미지 파일 : " + src); */
			
			$.ajax({
				type: "post",
				url: getContextPath() + "/MainModal.do",
				data: {"imageFileName": src},
				dataType: "json",
				success: function(data) {
					
				},
				complete: function(data) {
					console.log(data);
					
					var list = data.responseJSON;
					$(".videoNum").html(list.videoNum);
					$(".modal-contents").html(list.CONTENTS);
					$(".modal-actors").html("출연: " + list.ACTORS);
					$(".modal-category").html("장르: " + list.categoryName.join(', '));
					$(".modal-likeCategory").html("시리즈 특징: " + list.likeCategoryName.join(', '));
					
					var videosrc = document.getElementById('modal-trailers-src');
					var video = document.getElementById('modal-trailers');
					videosrc.setAttribute('src', list.VIDEOFILENAME);
					video.load();
					video.play();
				}
			});
	    });
	    
	    $(".modalbtn").on("click", function() {
	    	//alert($(".videoNum").text());
	    	
			var videoNum = $(".videoNum").text();
	    	
	    	$.ajax({
				type: "POST",
				data: {"videoNum": videoNum},
				url :  getContextPath() + "/SelectRecommend.do",
				async:false,
				dataType: "json",
				success : function(data) {
				},
				complete : function(data) {
					location.href = getContextPath() + "/RecommedData.do";
				}
			});
	    });
	});
	
	
</script>

<title>메인페이지</title>
</head>
<body>
	
	<%@ include file="../common/userHeader.jsp"%>
<!--==============모달창 폼======================================================================================  -->
	<a href="#x" class="overlay" id="moviedetail"></a>
	<div class="popup">
			<div class="modalvideo">
				<video id="modal-trailers" class="trailers" muted="muted" controls="controls" autoplay="autoplay" loop="loop">
					<source id="modal-trailers-src" src="../video/mainpagebackground/spider.mov" type="video/mp4">
				</video>
			</div>
			<div class="explain_wrapper">
				<div class="modalvideo_explain">
					<p class="modal-contents">
						test
					</p>
				</div>
				<div class="modalvideo_explain2">
					<p class="modal-actors">test.</p>
					<p class="modal-category">test</p>
					<p class="modal-likeCategory">test</p>
					<div class="button_wrapper">
						<button onclick="#" type="button" class="modalbtn">
							<i class="fas fa-exclamation-circle"></i> 상세 정보
						</button>
						<div class="videoNum" style="display:none;"></div>
					</div>
				</div>
			</div>
			<a class="close" href="#close"></a>
	</div>
	
<!--==============모달창 폼======================================================================================  -->

	<div class="main_wrapper">
<!-- 	<div class="main_wrapper"> -->
		<div class="movie_ad">
			<c:forEach var="list" items="${recentVideo}">
				<video id="test-video" class="trailers" muted="muted" controls="controls" autoplay="autoplay" loop="loop">
					<source src="<c:url value='${list.getVideoFileName()}' />#t=0" type="video/mp4">
				</video>
				<div class="movie_explain_wrapper">
					<div class="movie_title">
						<h1 class="title"><c:out value="${list.getTitle()}" /></h1>
					</div>
					<div class="movie_summary">
						<p><c:out value="${list.getContents()}" /></p>
					</div>
					<div class="movie_play">
						<button type="button" class="modalbtn test-btn"><i class="fas fa-exclamation-circle"></i> 상세 정보</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="movie_list_wrapper">
			<div class="usermovie_list">
				<div class="movie_list_title">
					<c:forEach var="list" items="${profile}">
						<a href="#"><c:out value='${list.getProfileName()}' />님이 시청 중인 컨텐츠</a>
					</c:forEach>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
				</div>
				<div class="movie_contents_list">
				
					<c:forEach var="list" items="${watchingList}">
						<div>
							<a href="#moviedetail" class="zoomin" id="moviedetail">
								<img class="imgsize2 imageFile" src="<c:out value='${list.getImageFileName()}' />">
							</a>
						</div>
					</c:forEach>
										
				</div>

			</div>
			<div class="usermovie_list">
				<div class="movie_list_title">
					<c:forEach var="list" items="${profile}">
						<a href="#"><c:out value='${list.getProfileName()}' />님이 설정한 취향 추천</a>
					</c:forEach>
					<a class="more" href="#" target="_black"> 모두 보기</a>
				</div>
				<div class="movie_contents_list">
				
					<c:forEach var="list" items="${likeVideoList}">
						<div>
							<a href="#moviedetail" class="zoomin" id="moviedetail">
								<img class="imgsize2 imageFile" src="<c:out value='${list.getImageFileName()}' />">
							</a>
						</div>
					</c:forEach>
					
				</div>
			</div>
			<div class="usermovie_list">
				<div class="movie_list_title">
					<a href="#">
						현재 BucketMe TOP 10 시리즈
					</a>
				</div>
				<div class="movie_contents_list2">
					
					<c:forEach var="list" items="${seriesTop10List}" varStatus="status">
						<div>
							<div class="numbering">
								<img class="imgsize" src="../img/numbering/numbering<c:url value='${status.count}' />.png">
							</div>
							<div>
								<a href="#moviedetail" class="zoomin" id="moviedetail">			
									<img class="imgsize imageFile" src="<c:out value='${list.getImageFileName()}' />">									
								</a>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
			<div class="usermovie_list">
				<div class="movie_list_title">
					<a href="#">
						현재 BucketMe TOP 10 영화
					</a>
				</div>
				<div class="movie_contents_list2">
					
					<c:forEach var="list" items="${movieTop10List}" varStatus="status">
						<div>
							<div class="numbering">
								<img class="imgsize" src="../img/numbering/numbering<c:url value='${status.count}' />.png">
							</div>
							<div>
								<a href="#moviedetail" class="zoomin" id="moviedetail">			
									<img class="imgsize imageFile" src="<c:out value='${list.getImageFileName()}' />">									
								</a>
							</div>
						</div>
					</c:forEach>
																							
				</div>
			</div>
			<div class="usermovie_list">
				<div class="movie_list_title">
					<a href="#">신규 컨텐츠</a>
					<a class="more" href="#" target="_black"> 모두 보기</a>
				</div>
				<div class="movie_contents_list">
				
					<c:forEach var="list" items="${newContentsList}">
						<div>
							<a href="#moviedetail" class="zoomin" id="moviedetail">
								<img class="imgsize2 imageFile" src="<c:out value='${list.getImageFileName()}' />">
							</a>
						</div>
					</c:forEach>
																																							
				</div>
			</div>
			
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>