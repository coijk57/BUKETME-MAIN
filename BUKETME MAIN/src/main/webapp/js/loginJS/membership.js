////////////////////////////////////////////////////////////
// 1. 전역변수  //////////////////////////////////////////////
////////////////////////////////////////////////////////////
var isClicked1 = 0;// 0은 클릭하지 않은 상태, 1은 클릭한 상태
var isClicked2 = 0;// 0은 클릭하지 않은 상태, 1은 클릭한 상태
var isClicked3 = 0;// 0은 클릭하지 않은 상태, 1은 클릭한 상태

var ishoverd = 0;//   0은 mouseout 1은 마우스 mouseover 때,

var memCode = 0;
var membership = "";

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

////////////////////////////////////////////////////////////
// 2. 초기 이벤트  //////////////////////////////////////////////
////////////////////////////////////////////////////////////
$(document).ready(function() {

    $(".membership").on("click", function() {

        $(".membership").css("border","1px solid #fff");
        
        /*alert("해상도 : " + $(this).find('.mem-val1').text() + "\n동시 접속 : " + $(this).find('.mem-val2').text() + "\n가격 : " + $(this).find('.mem-val3').text() + "\n등급 : " + $(this).find('.membership-title').text());*/
		/*alert(membership = $(this).find('.membership-title').text());*/
		membership = $(this).find('.membership-title').text();

        var index = $(".membership").index(this);

        if( index == 0 ) {
            isClicked2 = 0;
            isClicked3 = 0;

            if( isClicked1 == 0 ) {// 클릭된 상태인지 확인
                $(this).css("border","1px solid #f1592a");
                isClicked1 = 1;
            } else { // isClicked 값이 1인 상태
                $(this).css("border","1px solid #fff");
                isClicked1 = 0;
            }
        } else if( index == 1 ) {
            isClicked1 = 0;
            isClicked3 = 0;

            if( isClicked2 == 0 ) {// 클릭된 상태인지 확인
                $(this).css("border","1px solid #f1592a");
                isClicked2 = 1;
            } else { // isClicked 값이 1인 상태
                $(this).css("border","1px solid #fff");
                isClicked2 = 0;
            }
        } else if( index == 2 ) {
            isClicked1 = 0;
            isClicked2 = 0;

            if( isClicked3 == 0 ) {// 클릭된 상태인지 확인
                $(this).css("border","1px solid #f1592a");
                isClicked3 = 1;
            } else { // isClicked 값이 1인 상태
                $(this).css("border","1px solid #fff");
                isClicked3 = 0;
            }
        }
    });

    $(".membership").hover(
        function() {//마우스오버 영역
            $(this).css("border", "1px solid #f1592a");// 테두리 표시

        },
        function(){//마우스아웃 영역
            var index = $(".membership").index(this);

            if( index == 0 && isClicked1 == 0 ) {// 첫번째 div영역이면서 클릭이 되지 않았을때
                $(this).css("border", "1px solid #fff");// 테두리를 초기화 해라
            }

            if( index == 1 && isClicked2 == 0 ) {// 클릭된 상태인지
                $(this).css("border", "1px solid #fff");// 테두리 초기화
            }

            if( index == 2 && isClicked3 == 0 ) {
                $(this).css("border", "1px solid #fff");// 테두리 초기화
            }
        }
    );
    
    $(".next-btn").on("click", function() {
		if(isClicked1 == 0 && isClicked2 == 0 && isClicked3 == 0) {
			alert("멤버십을 선택해주세요.");
		}
		else {
			if(membership == "베이직")
				memCode = 1;
			else if(membership == "스탠다드") {
				memCode = 2;
			}
			else if(membership == "프리미엄") {
				memCode = 3;
			}
			
			var data = {
				"memCode" : memCode,
			}
			
			$.ajax({
				type: "post",
				url: getContextPath() + "/signup2.do",
				data: data,
				dataType: "json",
				success : function(data) {
					if(data == "success") {
						alert(data);
						/*location.href(getContextPath() + "/login/payInfo.jsp");*/
					}
					
				}
			});	
		}
	});
});

