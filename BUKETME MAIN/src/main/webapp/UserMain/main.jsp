<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/UserMainCss/Main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="../js/MainJS/MainButtenJS.js"></script>
<title>Main</title>
</head>
<body>
<header id="header">
	<div class="Bucketme-Logo-Menu">
		<div class="Bucketme-Logo">
	        <a href="../UserMain/Main.jsp" class="Buketmelogo">
	        	<img class="Logo" src="../img/Logo.png" alt="버켓미 로고"/>
	        </a>
	    </div>
		<a href="#" class="Bucketme-Login">
			<span class="Login">
	        	로그인
	        </span>
	    </a>
	</div>
</header>
<section id="section">
	<div class="MainSection">
		<div class="MainSection-First">
			<div class="MainSection-First-Img">
				<img class="MainImg" src="../img/Main/spiderman.jpg" alt="메인 이미지">
			</div>
			<div class="MainSection-First-content">
				<div class="MainSection-First-Letters">
					<h1>영화 시리즈를 무제한으로!
					</h1>
					<p>다양한 디바이스에서 시청하세요.언제든 구독기간을 원하는대로 설정 할 수 있습니다.
					</p>
					<p>시청할 준비 되셨나요? 멤버쉽을 등록하거나 재시작하려면 이메일 주소를 입력해주세요.
					</p>
				</div>
				<div class="MainSection-First-input">
					<form name="form-user-Email" action="#" method="post">
			       		<input class='user-Email' type='email' placeholder="Example@Email.com"/>
			    	    <input class='staer-Butten' type='submit' value='시작하기' />
		    	    </form>
		   	    </div>
			</div>
		</div>
	</div>
	<div class="MainSection-Explain">
		<div class="MainSection-Second">
			<div class="MainSection-Second-content">
				<div class="MainSection-Second-Letters">
					<h1>다양한 디바이스에서 시청하세요.
					</h1>
					<p>각종 영화와 시리즈를 스마트폰, 태블릿, 노트북, TV에서 무제한으로 스트리밍하세요. 추가 요금이 전혀 없습니다.
					</p>
				</div>
				<div class="MainSection-Second-Img">
					<img class="MainSecondImg" src="../img/Main/many.png" alt="메인 이미지">
				</div>
			</div>
		</div>
		<div class="MainSection-Third">
			<div class="MainSection-Third-content">
				<div class="MainSection-Third-Letters">
					<h1>구독 기간을 자유롭게 설정하세요.
					</h1>
					<p>구독기간중에 구독기간을 중지 하였다가 추가 요금 없이 다시 시작할 수 있습니다.
					</p>
				</div>
				<div class="MainSection-Third-Img">
					<img class="MainThirdImg" src="../img/Main/sub.png" alt="구독 이미지">
				</div>
			</div>
		</div>
		<div class="MainSection-Fourth">
			<div class="MainSection-Fourth-content">
				<div class="MainSection-Fourth-Letters">
					<h1>어린이 전용 프로필을 만들어 보세요.
					</h1>
					<p>자기만의 공간에서 좋아하는 캐릭터와 즐기는 신나는 모험. 자녀에게 이 특별한 경험을 선물하세요. 버켓미 회원이라면 무료입니다.
					</p>
				</div>
				<div class="MainSection-Fourth-Img">
					<img class="MainFourthImg" src="../img/Main/kids.png" alt="키즈 이미지">
				</div>
			</div>
		</div>
	</div>
<div class="Often-Question">
	<div class="Often-Question-content">
		<div class="Often-Question-title">
			<h1>자주하는 질문</h1>
		</div>
			<div class="Question">
				<ul>
					<li>
						<button id='show1' onclick="dis()">버켓미는 무엇인가요?</button>
						<div id='dis1'><p>버켓미는 각종 수상 경력에 빛나는 시리즈, 영화, 애니메이션, 다큐멘터리 등 다양한 콘텐츠를 인터넷 연결이 가능한 수천 종의 디바이스에서 시청할 수 있는 스트리밍 서비스입니다.
										저렴한 월 요금으로 일체의 광고 없이 원하는 시간에 원하는 만큼 즐길 수 있습니다. 무궁무진한 콘텐츠가 준비되어 있으며 매주 새로운 시리즈와 영화가 제공됩니다.</p></div>
					</li>
					<li>
						<button id='show2' onclick="dis()">버켓미 요금은 얼마인가요?</button>
						<div id='dis2'><p>스마트폰, 태블릿, 스마트 TV, 노트북, 스트리밍 디바이스 등 다양한 디바이스에서 월정액 요금 하나로 버켓미를 시청하세요. 멤버십 요금은 월 9,500원부터 17,000원까지 다양합니다. 추가 비용이나 약정이 없습니다.</p></div>
					</li>
					<li>
						<button id='show3' onclick="dis()">어디서 시청할 수 있나요?</button>
						<div id='dis3'><p>언제 어디서나 시청할 수 있습니다. 버켓미 계정으로 로그인하면 PC에서 Buketme.com을 통해 바로 시청할 수 있으며, 인터넷이 연결되어 있고 버켓미 앱을 지원하는 디바이스(스마트 TV, 스마트폰, 태블릿, 스트리밍 미디어 플레이어, 게임 콘솔 등)에서도 언제든지 시청할 수 있습니다.
										iOS, Android, Windows 10용 앱에서는 좋아하는 시리즈를 저장할 수도 있습니다. 저장 기능을 이용해 이동 중이나 인터넷에 연결할 수 없는 곳에서도 시청하세요. 넷플릭스는 어디서든 함께니까요.</p></div>
					</li>
					<li>
						<button id='show4' onclick="dis()">구독기간을 어떻게 마음대로 설정할 수 있나요?</button>
						<div id='dis4'><p>버켓미는 부담 없이 간편합니다. 성가신 계약도, 약정도 없으니까요. 구독기간 킵버튼을 마이페이지에서 클릭 한번이면 완료할 수 있습니다. 원할 때 언제든 구독기간을 시작하거나 종료하세요.</p></div>
					</li>
					<li>
						<button id='show5' onclick="dis()">버켓미에서 어떤 컨텐츠를 시청할 수 있나요?</button>
						<div id='dis5'><p>넷플릭스는 장편 영화, 다큐멘터리, 시리즈, 애니메이션, 각종 상을 수상한 버켓미 오리지널 등 수많은 콘텐츠를 확보하고 있습니다. 마음에 드는 콘텐츠를 원하는 시간에 원하는 만큼 시청하세요.</p></div>
					</li>
					<li>
						<button id='show6' onclick="dis()">아이들이 버켓미를 좋아할까요?</button>
						<div id='dis6'><p>멤버십에 넷플릭스 키즈 환경이 포함되어 있어 자녀가 자기만의 공간에서 가족용 시리즈와 영화를 즐기는 동안 부모가 이를 관리할 수 있습니다.
										키즈 프로필과 더불어 PIN 번호를 이용한 자녀 보호 기능도 있어, 자녀가 시청할 수 있는 콘텐츠의 관람등급을 제한하고 자녀의 시청을 원치 않는 특정 작품을 차단할 수도 있습니다.</p></div>
					</li>
				</ul>
			</div>
	</div>
</div>
	





</section>

<footer id="footer">
</footer>
</body>
</html>