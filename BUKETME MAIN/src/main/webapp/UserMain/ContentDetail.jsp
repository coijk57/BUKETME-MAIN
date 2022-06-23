<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%

response.setContentType("text/html; charset=utf8");


//session.setAttribute("profileregisternum", 1);
//session.setAttribute("videonum", 1);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="../js/ContentDetail/ContentDetail.js"></script>
<link rel="stylesheet" type="text/css" href="../css/ContentDetailCss/ContentDetail.css"/>
<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	
	$(document).ready(function(){
		$.ajax({
			type: "POST",
			data: {"select":1},
			url :  getContextPath() + "/ContentDetail.do",
			async:false,
			dataType: "json",
			success : function(data) {
			},
			complete : function(data) {
				console.log(data);
				var data = data.responseJSON;
				$('.play-videoNum').html(data.VIDEONUM);
				$('#con_title').html(data.TITLE);
				$('#con_title2').html(data.TITLE);
				$('#con_title3').html(data.TITLE);
				$('#con_contents').html(data.CONTENTS);
				$('#con_contents2').html(data.CONTENTS);
				$('#con_contents3').html(data.CONTENTS);
				$('#con_openDate').html("개봉일 : " + data.OPENDATE);
				$('#con_openDate2').html(data.OPENDATE);
				$('#con_agelimit').html("관람등급 : " + data.AGELIMIT);
				$('#con_agelimit2').html("관람등급 : " + data.AGELIMIT);
				$('#con_director').html(data.DIRECTOR);
				$('#con_videohits').html(data.VIDEOHITS);
				$('#con_actors').html(data.ACTORS);
				$('#con_category').html("장르 : " + data.categoryName.join(', '));
				$('#con_category2').html(data.categoryName.join(', '));
				//$('#con_likecategory').html(data.likeCategoryno.join(', '));
				
				var imgsrc = document.getElementById('con_imagefilenameS');
				imgsrc.setAttribute('src', data.IMAGEFILENAME);
			}
		});
	});
	
	function button2_click(like) {
		
		$.ajax({
			type: "POST",
			data: {"like":like},
			url :  getContextPath() + "/userRating.do",
			async:false,
			dataType: "json",
			success : function(data) {
			},
			complete : function(data) {
	
			}
		});	
	};
 	
	function button3_click(bad) {
		
		$.ajax({
			type: "POST",
			data: {"bad":bad},
			url :  getContextPath() + "/userRating2.do",
			async:false,
			dataType: "json",
			success : function(data) {
			},
			complete : function(data) {
	
			}
		});	
	};
	
	$(function() {
	    $("#myform input[type=radio]").on("click", function() {
	    	var rating = $(this).val();
	    	console.log(rating);
	        alert("평점 : " + rating + "등록 되었습니다.");
	        
	        $.ajax({
				type: "POST",
				data: {"rating":rating},
				url :  getContextPath() + "/userRating3.do",
				async:false,
				dataType: "json",
				success : function(data) {
				},
				complete : function(data) {
		
				}
			});	
	    });
	});	
	
	$(function() {
	    $(".ContentDetail_Content_Recom").on("click", function() {
	    	//alert($(this).find(".videoNum").val());
	    	var videoNum = $(this).find(".videoNum").val();
	    	
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
	    
	    $(".Movie_Explain").on("click", function() {
	    	//alert($(this).find(".play-videoNum").text());
	    	var videoNum = $(this).find(".play-videoNum").text();
	    	
	    	$.ajax({
				type: "POST",
				data: {"videoNum": videoNum},
				url :  getContextPath() + "/PlayContent.do",
				async: false,
				dataType: "json",
				success : function(data) {
				},
				complete : function(data) {
					location.href = getContextPath() + "/UserMain/contentPlay.jsp";
				}
			});
	    });
	    
	    $(".ContentDetail_Play_Button").on("click", function() {
	    	var videoNum = <%=session.getAttribute("videoNum") %>
	    	//alert(videoNum);
	    	
	    	$.ajax({
				type: "POST",
				data: {"videoNum": videoNum},
				url :  getContextPath() + "/PlayContent.do",
				async: false,
				dataType: "json",
				success : function(data) {
				},
				complete : function(data) {
					location.href = getContextPath() + "/UserMain/contentPlay.jsp";
				}
			});
	    });
	});
	
	function toggleImg() {
	    document.getElementById("Like_o").src = "../img/ContentDetail/like_on.png";
	    alert('추천을 클릭 하였습니다.');
	  }
	  
	function toggleImg2() {
	    document.getElementById("Hate_o").src = "../img/ContentDetail/hate_on.png";
	    alert('싫어요를 클릭 하였습니다.');
	  }
	  	
</script>
<title>ContentDetail</title>
</head>
<body id="body">

<header id="header">
<%@ include file="../common/userHeader.jsp"%>

</header>

<section id="section">
<div class="ContentDetail_Top">
<button type="submit" id="tmpBtn" class="ContentDetail_Play_Button_1" onClick="button1_click(1)">
	<p class="play_o"></p>
</button>
	<div class="ContentDetail_Top_Content">
		<div class="ContentDetail_Top_Img">
			<img class="ContentDetail_MainImg" src="../img/ContentDetail/상세페이지.jpg" alt="메인 이미지">
		</div>
		<div class="ContentDetail_Top_Nav">
			<div class="ContentDetail_Top_Title">
				<h1 id="con_title" class="ContentDetail_Top_Title_H1">
				</h1>
			</div>
		</div>
	</div>
</div>

<div class="ContentDetail_Content">
		<div class="ContentDetail_Top_Nav_Button">
			<div class="ContentDetail_Play">
				    <button type="submit" id="modal_videosource" class="ContentDetail_Play_Button" onClick="">
				      <p class="play_o">재생</p>
				    </button>
			</div>
			<div class="ContentDetail_Like_Hate">
			      <button type="button" class="ContentDetail_Like" id="img_btn" onclick="button2_click(1);toggleImg();">
			      	<img  id="Like_o" class="Like_o" src="../img/ContentDetail/like.png">
			      </button>
			      <button type="button" class="ContentDetail_Hate" id="img_btn" onclick="button3_click(1);toggleImg2();">
			      	<img   id="Hate_o" class="Hate_o" src="../img/ContentDetail/hate.png">
			      </button>
		  	</div>
		  	<div class="ContentDetail_Star">
				<form name="myform" id="myform" method="post" action="">
				    <fieldset>
				        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
				        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
				        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
				        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
				        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
				    </fieldset>
				</form>
			</div>
		</div>
		<div class="ContentDetail_Content_List">
			<ul class="ContentDetail_List">
				<li class="list_veido" data-tab="tab-1">에피소드</li>
				<li class="List-Recom" data-tab="tab-2">상세보기</li>
				<li class="List-Detail" data-tab="tab-3">추천 콘텐츠</li>
			</ul>
			<div id="tab-1" class="tab-content current">
				<div class="ContentDetail_Content_Explain">
					<div class="Explain_List">
						<span id="con_openDate"></span><span id="con_agelimit"></span><span>시즌 1개</span>
					</div>
					<div class="Explain_List_Etc">
						<p id="con_category"></p>
						<p id="con_contents"></p>
					</div>
				</div>
				<div class="ContentDetail_Content_Movie_list">
					<div class="ContentDetail_Content_Movie">
						<span class="Movie_Num">1</span>
						<a href="" class="Movie_Img" onClick="">
							<img class="imgsize" id="con_imagefilenameS">
						</a>
					</div>
					<div class="Movie_Explain">
						<div class="play-videoNum" style="display:none;"></div>
						<p class="Movie_Explain_Title" id="con_title2"></p>
						<p id="con_contents2">
						</p>
					</div>
				</div>
				
				</div>
			<div id="tab-2" class="tab-content">
				<div class="ContentDetail_Content_Detail1">
					<h1 id="con_title3"></h1>
					<p id="con_contents3">
					</p>
				</div>
				<div class="ContentDetail_Content_Detail2_3">
					<div class="ContentDetail_Content_Detail2">
						<h1>개봉일</h1>
						<span id="con_openDate2"></span>
						<h1>제작</h1>
						<span id="con_director"></span>
					</div>
					<div class="ContentDetail_Content_Detail3">				
						<h1>장르</h1>
						<span id="con_category2"></span>
						<h1>출연</h1>
						<span id="con_actors"></span>
						<h1>관람등급</h1>
						<span id="con_agelimit2"></span>
					</div>
				</div>
				<div id="ViewCountRatings">
				<div id="ViewCount">
					<h1 class="info-title">조회수</h1>
				    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
				    <script type="text/javascript">
				      google.charts.load('current', {'packages':['corechart']});
				      google.charts.setOnLoadCallback(drawChart1);
				       	data.addcolumn();
				
				      function drawChart1() {
				        var data = google.visualization.arrayToDataTable([
				          ['Month', '모가디슈'],
				          ['11월',  1000],
				          ['12월',  1170],
				          ['1월',  660],
				          ['2월',  1000]
				        ]);
				
				        var options = {
				          title: '월별 조회수',
				          curveType: 'function',
				          legend: { position: 'bottom' },
				       		width: '100%'
				        };
				
				        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
				
				        chart.draw(data, options);
				      }
				    </script>
				    <div id="curve_chart" style="width: 400px; height: 300px"></div>
					
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
				            title: '평점',
				            subtitle: '점수별 평점 분포',
				            width: '100%'
				          },
				          bars: 'horizontal' // Required for Material Bar Charts.
				        };
				
				        var chart = new google.charts.Bar(document.getElementById('barchart_material'));
				
				        chart.draw(data, google.charts.Bar.convertOptions(options));
				      }
				    </script>
				        <div id="barchart_material" style="width: 400px; height: 300px;"></div>
				</div>
			</div>
		</div>
			<div id="tab-3" class="tab-content">
			
				<c:forEach var="list" items="${recommendList}">
			
					<div class="ContentDetail_Content_Recom">
						<div class="ContentDetail_Content_Recom_Img">
							<a href="#" id="" onClick="">
								<img class="Recom_imgsize" src="<c:out value='${list.getImageFileName()}' />">
							</a>
							<p class="Recom_Title"><c:out value='${list.getTitle()}' /></p>
						</div>
						<div class="ContentDetail_Content_Recom_Detail">
							<div class="ContentDetail_Content_Recom_Detail">
								<span class="Recom_age15"><c:out value='${list.getAgeLimit()}' /></span>
								<span class="Open_Day">2020</span>
								<a><img class="Recom_Detail_plus" src="../img/ContentDetail/plus.png"></a>
							</div>
							<div class="ContentDetail_Content_Recom_Detail">
									<p class="contents"><c:out value='${list.getContents()}' /></p>
							</div>
							<input class="videoNum" type="hidden" value="<c:out value='${list.getVideoNum()}' />"/>
						</div>
					</div>
				
				</c:forEach>
				
		</div>
</div>
</div>

</section>

<footer id="footer">
<%@ include file="../common/footer.jsp" %>
</footer>

</body>
</html>