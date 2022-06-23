<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<!-- ==================================================================================================================================================================================================================================================================================== -->


<!-- 참조 css파일 경로======================================================================================================================================================================================================================================================================= -->
	<link href="../css/UserMainCss/usermain.css" rel="stylesheet">
<!-- ==================================================================================================================================================================================================================================================================================== -->
<title>Insert title here</title>
</head>
<body>

<%@ include file="../common/managerHeader.jsp" %>

<div class="mainContents">
    
    
    <div class="main_wrapper">
<!-- 	<div class="main_wrapper"> -->
		<div class="movie_ad">
			<video class="trailers" muted="muted" controls="controls" autoplay="autoplay" loop="loop">
				<source src="../video/mainpagebackground/matrix.mov" type="video/mp4">
			</video>
			<div class="movie_explain_wrapper">
				<div class="movie_title">
					<h1>제목</h1>
				</div>
				<div class="movie_summary">
					<p>눈을 떠보니 세상은 좀비가 점령한 전쟁터. 어디로 갈 것인가, 어떻게 생존 할 것 인가. 현실이 지옥일 때 희망은 의미가 있는가. 살아남은 자들의 사투가 펼쳐진다.</p>
				</div>
				<div class="movie_play">
					<button type="button">
						<i class="fas fa-play">재생</i>
					</button>					
					<button type="button"  onclick="location.href='#'">
						<i class="fas fa-exclamation">상세정보</i>
					</button>	
				</div>
			</div>
		</div>
		<div class="movie_list_wrapper">
			<div class="usermovie_list">
				<div class="movie_list_title">
					<a href="javascript:;" target="_blank">
						ㅇㅇㅇ님이 시청 중인 콘텐츠				
					</a>
				</div>
				<div class="movie_contents_list">
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="imgsize" src="../img/Logo.png">
					</a>					
				</div>
				<div class="loading_bar">
						로딩바
				</div>
			</div>
			<div class="usermovie_list">
				<div class="movie_list_title">
					<a href="#" target="_blank">
						ㅇㅇㅇ님이 설정한 장르 추천(괴물,외계인 등)
					</a>
				</div>
				<div class="movie_contents_list">
					<a href="#" target="_blank">
						<img class="" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="" src="../img/Logo.png">
					</a>
					<a href="#" target="_blank">
						<img class="" src="../img/Logo.png">
					</a>					
				</div>
			</div>
			<div class="usermovie_list">
				<div class="movie_list_title">
					<a href="#" target="_blank">
						현재 BucketMe TOP 10 시리즈
					</a>
				</div>
				<div class="movie_contents_list">
					<a href="#" target="_blank">
						<img class="" src="../img/Logo.png">
					</a>					
				</div>

			</div>
			<div class="usermovie_list">
				<div class="movie_list_title">
					<a href="#" target="_blank">
						현재 BucketMe TOP 10 영화
					</a>
				</div>
				<div class="movie_contents_list">
					<a href="#" target="_blank">
						<img class="" src="../img/Logo.png">
					</a>					
				</div>

			</div>
			<div class="usermovie_list">
				<div class="movie_list_title">
					<a href="#" target="_blank">
						신규 콘텐츠
					</a>
				</div>
				<div class="movie_contents_list">
					<a href="#" target="_blank">
						<img class="" src="../img/Logo.png">
					</a>					
				</div>
			</div>
			<div class="usermovie_list">
				<div class="movie_list_title">
					<a href="#" target="_blank">
						신규 콘텐츠
					</a>
				</div>
				<div class="movie_contents_list">
					<a href="#" target="_blank">
						<img class="" src="../img/Logo.png">
					</a>					
				</div>
			</div>
		</div>
	</div>
    
    
    
    
    
    
</div>

<%@ include file="../common/footer.jsp" %>

</body>
</html>