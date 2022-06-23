<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="../js/managerJS/selectBoxChange.js"></script>
    <link rel="stylesheet" href="../css/managerCss/style.css" />
    <title>BuketMe 관리자 Contents UpLoad</title>
</head>
<body>

<%@ include file="../common/managerHeader.jsp" %>

<div class="mainBox">
	
	<%@ include file="../common/managerSide.jsp" %>

    <div class="mainBoxInside">
        
        <div id="AdminPost">
        	<div id="UploadContentInfo">
	        	<form action="${pageContext.request.servletContext.contextPath}/VideoManage.do" method="post">
					<h1 class="info-title">컨텐츠 업로드</h1>
					<div id="UploadThumbnail">
						<div id="Upload" class="button" onclick="onclick=document.all.file.click()">
							<h4>동영상 파일</h4>
							
							<div class="file_input_div">
								<input type="button" value="파일 찾기" class="file_input_button" />
								<input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('file1').value = this.value" />
							</div>
							<input type="text" id="file1" class="file_input_textbox"  name="videoFileName" readonly="readonly">
						</div>
						
						
						<div id="Thumbnail" class="button" onclick="onclick=document.all.file.click()">
							<h4>영상 썸네일</h4>
							
							<div class="file_input_div">
								<input type="button" value="파일 찾기" class="file_input_button" />
								<input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('file2').value = this.value" />
							</div>
							<input type="text" id="file2" class="file_input_textbox"  name="imageFileName" readonly="readonly">
						</div>
						
					</div>
					
					<div id="ContentInfo">
						<div class="content-info-area">
							<div class="content-info-detail">
								<h4>제목</h4>
								<input id="MovieName" type="text" placeholder="제목" name="title">
								<h4>공개일</h4>
								<input id="ReleaseDate" type="text" placeholder="공개일" name="openDate">
								<h4>장르</h4>
								<select id="Genre" name="Category" onchange="showValue(this)">
				                    <option disabled selected>장르</option>
				                    <option value="3">한국 영화</option>
				                    <option value="4">해외 영화</option>
				                    <option value="5">해외</option>
				                    <option value="6">어워드 수상</option>
				                    <option value="7">인디</option>
				                    <option value="8">어린이&가족</option>
				                    <option value="9">애니메이션</option>
				                    <option value="10">액션</option>
				                    <option value="11">코미디</option>
				                    <option value="12">로맨스</option>
				                    <option value="13">호러</option>
				                    <option value="14">SF</option>
				                    <option value="15">판타지</option>
				                    <option value="16">드라마</option>
				                    <option value="17">범죄</option>
				                    <option value="18">다큐멘터리</option>
				                    <option value="19">음악/뮤지컬</option>
				                    <option value="20">고전</option>
				                </select>
				                <h4>취향</h4>
								<select id="Genre" name="likeCategory" onchange="showValue(this)">
				                    <option disabled selected>취향</option>
				                    <option value="1">밝은분위기</option>
				                    <option value="2">스릴넘치는</option>
				                    <option value="3">달달한</option>
				                    <option value="4">잔잔한</option>
				                    <option value="5">역사적인</option>
				                    <option value="6">감동적인</option>
				                    <option value="7">외계인</option>
				                    <option value="8">괴물</option>
				                    <option value="9">귀신</option>
				                    <option value="10">초자연적인</option>
				                    <option value="11">시간여행</option>
				                    <option value="12">실화바탕</option>
				                    <option value="13">불륜</option>
				                    <option value="14">복수혈전</option>
				                    <option value="15">리얼리티</option>
				                </select>
							</div>
							
							<div class="content-info-detail">
				                <h4>제작자</h4>
								<input id="Producer" type="text" placeholder="제작자" name="director">
								<h4>연령 제한</h4>
								<input id="Agelimit" type="text" placeholder="연령 제한" name="ageLimit">
								<h4>출연 배우</h4>
								<input id="actor" type="text" placeholder="배우 이름" name="actors">	
							</div>
						</div>
							
						<div class="content-intro">
							<h4>영화 소개</h4>
							<input id="MovieIntroduct" type="text" placeholder="영화 소개" name="contents">
						</div>
						
						<div class="content-btn-area">
							<input id="Check" class="content-btn" type="Submit" value="확인">
							<input id="Cancel" class="content-btn" type="reset" value="취소">
						</div>
						
					</div>
				</form>
			</div>
        </div>
        
    </div>
</div>
</body>
</html>