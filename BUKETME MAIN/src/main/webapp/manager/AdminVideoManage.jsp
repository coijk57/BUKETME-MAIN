<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘텐츠 관리 - 수정, 삭제</title>
<link rel="stylesheet" href="../css/managerCss/AdminVideoManage.css">
</head>
<body>

<%@ include file="../common/managerHeader.jsp" %>

<div class="mainBox">
    
    <%@ include file="../common/managerSide.jsp" %>
    
    <div class="mainBoxInside">

		<div id="AdminPost">
			<div id="UpdateContentInfo">
				<h1 class="info-title">컨텐츠 정보</h1>
				<div id="UpdateThumbnail">
					<div id="Update">
						<h4>동영상 파일</h4>
						<!-- <input id="Movie" type="file" /> -->
						<div class="filebox">
						    <label for="file">파일찾기</label> 
						    <input type="file" id="file" class="movie_file">
						</div>
					</div>
					<div id="Thumbnail">
						<h4>영상 썸네일</h4>
						<!-- <input id="Thumbnailfile" type="file" /> -->
						<div class="filebox">
						    <label for="file">파일찾기</label> 
						    <input type="file" id="file" class="thumbnail_file">
						</div>
					</div>
				</div>
				<div id="ContentInfo">
					<div class="content-info-area">
						<div class="content-info-detail">
							<h4>제목</h4>
							<input id="MovieName" type="text" placeholder="제목">
							<h4>공개일</h4>
							<input id="ReleaseDate" type="text" placeholder="공개일">
							<h4>장르</h4>
							<select id="Genre">
			                    <option disabled selected>장르</option>
			                    <option>한국 드라마</option>
			                    <option>미국 시리즈</option>
			                    <option>영국 드라마</option>
			                    <option>아시아 드라마</option>
			                    <option>유럽 시리즈</option>
			                    <option>애니</option>
			                    <option>코미디</option>
			                    <option>로맨스</option>
			                    <option>액션&어드벤처</option>
			                    <option>스릴러</option>
			                    <option>스포츠</option>
			                    <option>SF&판타지</option>
			                    <option>호러</option>
			                    <option>범죄</option>
			                    <option>버라이어티/예능</option>
			                    <option>다큐시리즈</option>
			                    <option>키즈</option>
			                </select>
			                <h4>취향</h4>
							<select id="Genre">
			                    <option disabled selected>취향</option>
			                    <option>밝은분위기</option>
			                    <option>스릴넘치는</option>
			                    <option>달달한</option>
			                    <option>잔잔한</option>
			                    <option>역사적인</option>
			                    <option>감동적인</option>
			                    <option>외계인</option>
			                    <option>괴물</option>
			                    <option>귀신</option>
			                    <option>초자연적인</option>
			                    <option>시간여행</option>
			                    <option>실화바탕</option>
			                </select>
						</div>
						
						<div class="content-info-detail">
							<h4>제작자</h4>
							<input id="Producer" type="text" placeholder="제작자">
							<h4>연령 제한</h4>
							<input id="Agelimit" type="text" placeholder="연령 제한">
							<h4>출연 배우</h4>
							<input id="actor" type="text" placeholder="배우 이름">	
						</div>
					</div>
						
					<div class="content-intro">
						<h4>영화 소개</h4>
						<input id="MovieIntroduct" type="text" placeholder="영화 소개">
					</div>
					
					<div class="content-btn-area">
						<input id="Check" class="content-btn" type="Submit" value="확인">
						<input id="Cancel" class="content-btn" type="reset" value="취소">
					</div>
					
				</div>
			</div>
			<div id="ViewCountRatings">
				<div id="ViewCount">
					<h1 class="info-title">조회수</h1>
				    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
				    <script type="text/javascript">
				      google.charts.load('current', {'packages':['corechart']});
				      google.charts.setOnLoadCallback(drawChart1);
				
				      function drawChart1() {
				        var data = google.visualization.arrayToDataTable([
				          ['Month', '모가디슈'],
				          ['11월',  1000],
				          ['12월',  1170],
				          ['1월',  660],
				          ['2월',  1030]
				        ]);
				
				        var options = {
				          title: '월별 조회수',
				          curveType: 'function',
				          legend: { position: 'bottom' }
				        };
				
				        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
				
				        chart.draw(data, options);
				      }
				    </script>
				    <div id="curve_chart" style="width: 350px; height: 250px"></div>
					
				</div>
				
				<div id="Ratings">
					<h1 class="info-title">평점</h1>	
					<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
				    <script type="text/javascript">
				      google.charts.load('current', {'packages':['bar']});
				      google.charts.setOnLoadCallback(drawChart2);
				
				      function drawChart2() {
				        var data = google.visualization.arrayToDataTable([
				          ['Score', '평점 분포'],
				          ['5점', 1000],
				          ['4점', 1170],
				          ['3점', 660],
				          ['2점', 1030],
				          ['1점', 360]
				        ]);
				
				        var options = {
				          chart: {
				            title: '평점 Test',
				            subtitle: '점수별 평점 분포',
				          },
				          bars: 'horizontal' // Required for Material Bar Charts.
				        };
				
				        var chart = new google.charts.Bar(document.getElementById('barchart_material'));
				
				        chart.draw(data, google.charts.Bar.convertOptions(options));
				      }
				    </script>
				        <div id="barchart_material" style="width: 350px; height: 250px;"></div>
				</div>
				
			</div>
		</div>

	</div>
</div>

</body>
</html>