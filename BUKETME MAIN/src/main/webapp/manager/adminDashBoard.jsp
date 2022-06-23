<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="../css/managerCss/style.css" />
    <title>BuketMe 관리자 Dash Board</title>
    
    <script type="text/javascript">
	    function getContextPath() {
			var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		}
	
		$(function() {
			$(".userComponentColumn").on("click", function() {
				location.href = getContextPath() + "/Usermanage.do";
			});
		});
    </script>
    
</head>
<body>

<%@ include file="../common/managerHeader.jsp" %>

<div class="mainBox">
    
    <%@ include file="../common/managerSide.jsp" %>
    
    <div class="mainBoxInside">
        <div class="contentsUpLoadSpace">
            <div class="contentsUpLoadBox">
                <div class="contentsUpLoadBoxIcon">
                    <i class="fas fa-film fa-9x"></i>
                </div>
                <form action="contentsUpLoad.jsp">
                    <button class="contentsUpLoadBoxBtn">콘텐츠 업로드 하기</button>
                </form>
            </div>
        </div>
        <div class="loginStatusBox">
            <h2>Subscription Info</h2>
            <div>
                <div class="userComponent">
                
                    <c:forEach var="list" items="${userArray}">
	                    <div class="userComponentColumn">
	                        <img src="../img/man.png" class="userComponentImage" />
	                        <div class="userComponentText">
	                            <h4 class="userComponentName"><c:out value="${list[0]}" /></h4>
	                            <h6 class="userComponentStatus">
	                                <c:out value="${list[1]}" />
	                            </h6>
	                            <h6 class="userComponentStatus">
	                                <c:out value="${list[2]}" />
	                            </h6>
	                        </div>
	                    </div>
                    </c:forEach>
                    
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>