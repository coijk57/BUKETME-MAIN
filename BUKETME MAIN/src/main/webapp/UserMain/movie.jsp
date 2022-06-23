<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 참조 slick(슬라이드)파일 경로================================================================ -->
	<link rel="stylesheet" type="text/css" href="../css/MovieCss/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="../css/MovieCss/slick/slick-theme.css"/>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="../css/MovieCss/slick/slick.min.js"></script>
	<script type="text/javascript" src="../js/MovieJS/maincontentslist.js"></script>
<!-- 참조 장르, 추천순 버튼 자바스크립트 경로============================================================ -->	
	<script type="text/javascript" src="../js/MovieJS/MovieJS.js"></script>
<!-- ======================================================================================== -->

<!-- 참조 css파일 경로============================================= -->
<link rel="stylesheet"  href="../css/MovieCss/Movie.css"/>
<link rel="stylesheet" href="../css/MovieCss/moviemodal.css">
<!-- ========================================================== -->

<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
	
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
	    
	    $(".category").on("click", function() {
			//alert($(".dropbtn").text());
			$(".dropbtn").html($(this).text() + "▼");
			
			var dropdowns = document.getElementsByClassName("dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		    
		    var dropdowns = document.getElementsByClassName("dropdown-content2");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show2')) {
		        openDropdown.classList.remove('show2');
		      }
		    }
		    
		    var category = $(this).text();
		    var rating = $(".dropbtn2").text();
		    
		    $.ajax({
				type: "post",
				url: getContextPath() + "/MovieSelect.do",
				data: {
						"category": category,
						"rating": rating
						},
				dataType: "json",
				success: function(data) {
					
				},
				complete: function(data) {
					console.log(data);
					
					$(".movie_contents_list").empty();
					
					var list = data.responseJSON;
					
					$(".select1").empty();
					$(".select2").empty();
					
					$(".title2").text(category);
					 
					for(var i=0;i<list.ArraySize;i++) {
						$(".movie_contents_list").append("<div><a href='#moviedetail' id='moviedetail'><img class='imgsize imageFile' src='"+list.imgArray[i]+"'></a></div>").trigger("create");
					}
					
					
				}
			});
	    });
	    
	    $(".rating").on("click", function() {
			//alert($(".dropbtn").text());
			$(".dropbtn2").html($(this).text() + "▼");
			
			var dropdowns = document.getElementsByClassName("dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		    
		    var dropdowns = document.getElementsByClassName("dropdown-content2");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show2')) {
		        openDropdown.classList.remove('show2');
		      }
		    }
	    });
	    
	    $(".dropbtn").on("click", function() {
		    var dropdowns = document.getElementsByClassName("dropdown-content2");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show2')) {
		        openDropdown.classList.remove('show2');
		      }
		    }
	    });
	    
	    $(".dropbtn2").on("click", function() {
			var dropdowns = document.getElementsByClassName("dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
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


<title>Movie</title>
</head>
<body id="body">

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
					<p class="modal-actors">test</p>
					<p class="modal-category">test</p>
					<p class="modal-likeCategory">test</p>
					<div class="button_wrapper">
						<button onclick="" type="button" class="modalbtn">
							<i class="fas fa-exclamation-circle"></i> 상세 정보
						</button>
						<div class="videoNum" style="display:none;"></div>
					</div>
				</div>
			</div>
			<a class="close" href="#close"></a>
	</div>
<!--==============모달창 폼======================================================================================  -->

<header id="header">
<div class="MovieNavArea">
			<div class="Movie">
				<h1>영화</h1>
			</div>
			<div class="MovieNav">
				<div class="dropdown">
				  <button onclick="myFunction()" class="dropbtn">장르▼</button>
					  <div id="myDropdown" class="dropdown-content">
						<div>
							<a class="category" href="#">한국 영화</a>
							<a class="category" href="#">해외 영화</a>
							<a class="category" href="#">해외</a>
							<a class="category" href="#">어워드 수상</a>
							<a class="category" href="#">인디</a>
							<a class="category" href="#">어린이&가족</a>
							<a class="category" href="#">애니메이션</a>
						</div>
						<div>
							<a class="category" href="#">액션</a>
							<a class="category" href="#">코미디</a>
							<a class="category" href="#">로맨스</a>
							<a class="category" href="#">호러</a>
							<a class="category" href="#">SF</a>
							<a class="category" href="#">판타지</a>
						</div>
						<div>
							<a class="category" href="#">드라마 장르</a>
							<a class="category" href="#">범죄</a>
							<a class="category" href="#">다큐멘터리</a>
							<a class="category" href="#">음악/뮤지컬</a>
							<a class="category" href="#">고전</a>
						</div>
					  </div>
				</div>
				<div class="dropdown2">
				  <button onclick="myFunction2()" class="dropbtn2">추천순▼</button>
					  <div id="myDropdown2" class="dropdown-content2">
						<div>
							<a class="rating" href="#">추천순</a>
							<a class="rating" href="#">평균평점 순</a>
						</div>
					  </div>
				</div>
			</div>
		</div>
</header>

<section id="section">
	<div class="main_wrapper">
	
		<c:forEach var="list" items="${recentMovieList}">
			<div class="movie_ad">
				<video class="trailers" muted="muted" controls="controls" autoplay="autoplay" loop="loop">
					<source src="<c:url value='${list.getVideoFileName()}' />#t=0" type="video/mp4">
				</video>
			</div>
			<div class="movie_explain_wrapper">
				<div class="movie_title">
					<h1 class="title"><c:out value="${list.getTitle()}" /></h1>
				</div>
				<div class="movie_summary">
					<p><c:out value="${list.getContents()}" /></p>
				</div>
				<div class="movie_play">		
					<button type="button" class="modalbtn"><i class="fas fa-exclamation-circle"></i> 상세 정보</button>
				</div>
			</div>
		</c:forEach>
		
		<div class="movie_list_wrapper">
			<div class="usermovie_list select1">
				<div class="movie_list_title">
					<c:forEach var="list" items="${profile}">
						<div>
							<a class="title1" href="javascript:;"><c:out value='${list.getProfileName()}' />님이 시청 중인 콘텐츠</a>
						</div>
					</c:forEach>
					<div>
						<a class="more" href="javascript:;"> 모두 보기</a>
					</div>
				</div>
				
				<c:choose>
					<c:when test="${empty movieWatchingList}">
						<div class="empty-comment1">시청중인 영화가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<div class="movie_contents_list">
							<c:forEach var="list" items="${movieWatchingList}">
								<div>
									<a href="#moviedetail" id="moviedetail">
										<img class="imgsize imageFile" src="<c:out value='${list.getImageFileName()}' />">
									</a>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
				
			</div>
			
			<div class="usermovie_list select2">
				<c:forEach var="list1" items="${movieCategoryList.get('category')}" varStatus="status">
				
					<c:choose>
						<c:when test="${empty movieCategoryList.get('movieCategoryList').get(status.index)}">
							
						</c:when>
						<c:otherwise>
							<div class="movie_list_title">
								<div>
									<a class="title1" href="javascript:;"><c:out value='${list1.getCategoryName()}' /></a>
								</div>
								<div>
									<a class="more" href="javascript:;"> 모두 보기</a>
								</div>
							</div>
							<div class="movie_contents_list">
							
								<c:forEach var="list2" items="${movieCategoryList.get('movieCategoryList').get(status.index)}">
									<div>
										<a href="#moviedetail" id="moviedetail">
											<img class="imgsize imageFile" src="<c:out value='${list2.getImageFileName()}' />">
										</a>
									</div>
								</c:forEach>
											
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			
			<div class="usermovie_list select3">
				<div class="movie_list_title">
					<div>
						<a class="title2" href="javascript:;"></a>
					</div>
					<div>
						<a class="more" href="javascript:;"> 모두 보기</a>
					</div>
				</div>
				<div class="movie_contents_list">
					<div>
						
					</div>
				</div>
			</div>
		</div>
		
			
	</div>

</section>

<%@ include file="../common/footer.jsp"%>

</body>
</html>