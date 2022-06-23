<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/loginCss/signup.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/loginJS/signup.js"></script>
</head>
<body>
	<div id="wrapper">
		<div class="signup-wrapper">

			<%@ include file="../common/loginHeader.jsp"%>

			<div class="content">
				<div class="signup-body">
					<div class="signup-content">
						<form
							action="${pageContext.request.servletContext.contextPath}/signup.do" method="post">
							<div class="signup-form-main">
								<section>
									<h1 class="title">회원가입</h1>
								</section>

								<section>
									<h4>이메일</h4>
									<input type="text" class="input-field" name="email"
										placeholder="이메일을 입력하세요." required>
									<h4>비밀번호</h4>
									<input type="password" class="input-field" name="password"
										placeholder="●●●●●●●●" required>
									<h4>비밀번호 확인</h4>
									<input type="password" class="input-field"
										placeholder="●●●●●●●●" required>
									<h4>이름</h4>
									<input type="text" class="input-field" placeholder="이름을 입력하세요." name="name"
										required>
									<h4>전화번호</h4>
									<input type="text" class="input-field btn-field" name="phoneNumber"
										placeholder="010-****-****" required> <input
										type="button" class="button" value="인증번호 받기"> <input
										type="text" class="input-field btn-field"
										placeholder="인증번호를 입력하세요" required> <input
										type="button" class="button" value="확인">
									<div class="gen">
										<h4>성별</h4>
										<h2 class="gender male">남자</h2>
										<h2 class="gender female">여자</h2>
									</div>
									<br>
									<br>
									<br>

									<div class="bir">
										<h4>생년월일</h4>
										<span class="birth-area" style="display: flex;"> <span
											class="signup-input-birth"> <input
												id="signup-birth-yy" type="text" placeholder="년(4자)" name="year"></input>
										</span> <span class="signup-input-birth" style="margin-left: 10px;">
												<select id="signup-birth-mm" class="selectbox" name="month"
												onchange="">
													<option value="month">월</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
											</select>
										</span> <span class="signup-input-birth" style="margin-left: 10px;">
												<input id="signup-birth-dd" type="text" placeholder="일" name="day"></input>
										</span>
										</span>
									</div>
								</section>
							</div>

							<div class="signup-form-detail device-area">
								<div class="signup-button-area">
									<input class="button first-button" type="submit" value="다음" />
									<input class="button" type="button" value="취소" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<%@ include file="../common/footer.jsp"%>

		</div>
	</div>
</body>
</html>