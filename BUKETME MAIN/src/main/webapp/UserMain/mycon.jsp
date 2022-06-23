<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 폰트 어썸 CDN=========================================================================================================================================================================================================================================== -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- ===================================================================================================================================================================================================================================================== -->

<!-- ==================================================================================================================================================================================================================================================================================== -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
	<script type="text/javascript" src="../js/maincontentslist.js"></script>
<!-- 참조 slick(슬라이드)파일 경로======================================================================================================================================================================================================================================================================= -->

<!-- 참조 css파일 경로======================================================================================================================================================================================================================================================================= -->
	<link href="../css/UserMainCss/mycon.css" rel="stylesheet">
	<link href="../css/UserMainCss/moviemodal.css" rel="stylesheet">
<!-- ==================================================================================================================================================================================================================================================================================== -->

<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
	
	$(function() {
	    $(".imageFile").on("click", function() {
			var src = $(this).attr("src");
			
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

<title>마이 콘텐츠</title>
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


	<div class="main_wrapper">
<!-- 	<div class="main_wrapper"> -->
		<h1>마이 콘텐츠</h1>
		<div class="movie_list_wrapper">
			<div class="usermovie_list">
				<div class="movie_list_title">
					<c:forEach var="list" items="${profile}">
						<a href="#"><c:out value='${list.getProfileName()}' />님이 시청 중인 콘텐츠 ></a>
					</c:forEach>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
				</div>
				<div class="movie_contents_list">
					
					<c:forEach var="list" items="${watchingList}">
						<a href="#moviedetail" id="moviedetail">
							<img class="imgsize imageFile" src="<c:out value='${list.getImageFileName()}' />">
						</a>
					</c:forEach>
					
					<!-- <a href="#moviedetail" id="moviedetail">
						<img class="imgsize" src="../img/movie/dp.jpg">
					</a> -->
					
				</div>
			</div>
		</div>
		
		<!-- <div class="movie_list_wrapper">
			<div class="put_list">
				<div class="movie_list_title">
					<a href="javascript:;" target="_blank">
						아직 찜한 콘텐츠가 없습니다.			
					</a>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
					<br><br><br><br><br><br>
					
					<div>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
					</div>
					
				</div>
				<div class="movie_contents_list">
					<a href="#" target="_blank">
						<img class="" src="">
					</a>	
				</div>
			</div>
		</div> -->
		
				<div class="movie_list_wrapper">
			<div class="finish_list">
				<div class="movie_list_title">
					<a href="javascript:;" target="_blank">
						내가 시청 완료한 콘텐츠 >		
					</a>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
				</div>
				<div class="movie_contents_list">
				
					<c:forEach var="list" items="${finWatchingList}">
						<a href="#moviedetail" id="moviedetail">
							<img class="imgsize imageFile" src="<c:out value='${list.getImageFileName()}' />">
						</a>
					</c:forEach>
					
				</div>
			</div>
		</div>
		
		
	</div>
	
	<%@ include file="../common/footer.jsp"%>

</body>
</html>