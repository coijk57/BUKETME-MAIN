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
	<link href="../css/UserMainCss/cscon.css" rel="stylesheet">
	<link href="../css/UserMainCss/moviemodal.css" rel="stylesheet">
<!-- ==================================================================================================================================================================================================================================================================================== -->

<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
	
	$(function() {
	    $(".imageFile").on("click", function() {
	    	//alert($(this).attr("src"));
	    	
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

<title>상영 예정 콘텐츠</title>
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
		<h1>상영 예정 콘텐츠</h1>
		<div class="movie_list_wrapper">
			<div class="comingsoon_list">
				<div class="movie_list_title">
					<a href="javascript:;" target="_blank">
						<c:out value='${oneMonth}' /> >			
					</a>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
				</div>
				
				<c:choose>
					<c:when test="${empty oneMonthList}">
						<div class="empty-comment1">상영예정인 컨텐츠가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<div class="movie_contents_list">
							<c:forEach var="list" items="${oneMonthList}">
								<a href="#moviedetail" id="moviedetail">
									<img class="imgsize imageFile" src="<c:out value='${list.getImageFileName()}' />">
								</a>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		
		<div class="movie_list_wrapper">
			<div class="comingsoon_list">
				<div class="movie_list_title">
					<a href="javascript:;" target="_blank">
						<c:out value='${twoMonth}' /> >			
					</a>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
				</div>
				
				<c:choose>
					<c:when test="${empty twoMonthList}">
						<div class="empty-comment1">상영예정인 컨텐츠가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<div class="movie_contents_list">
							<c:forEach var="list" items="${twoMonthList}">
								<a href="#moviedetail" id="moviedetail">
									<img class="imgsize imageFile" src="<c:out value='${list.getImageFileName()}' />">
								</a>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		
		<div class="movie_list_wrapper">
			<div class="comingsoon_list">
				<div class="movie_list_title">
					<a href="javascript:;" target="_blank">
						<c:out value='${threeMonth}' /> >
					</a>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
				</div>
				
				
				<c:choose>
					<c:when test="${empty threeMonthList}">
						<div class="empty-comment1">상영예정인 컨텐츠가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<div class="movie_contents_list">
							<c:forEach var="list" items="${threeMonthList}">
								<a href="#moviedetail" id="moviedetail">
									<img class="imgsize imageFile" src="<c:out value='${list.getImageFileName()}' />">
								</a>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		
	</div>
	
	<%@ include file="../common/footer.jsp"%>

</body>
</html>