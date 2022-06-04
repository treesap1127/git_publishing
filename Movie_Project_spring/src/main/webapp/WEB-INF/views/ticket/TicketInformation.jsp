<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
<link href="../css/login/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/ticket/ticket_information.css">
  <link rel="stylesheet" href="../css/style/style.css">
  <script>
    $(function(){
      const con = ".white_box";
      const con2 =".white_box2";
      const info =".information_cancel";
      const info4 =".information2_copy";
      const info2 =".information2";



      $(".information_cancel").click(function() { 
      $(con).css('display', 'none');
      $(con2).css('display', 'block');
      });

      $(info2).click(function() { 
      $(con).css('display', 'block');
      $(con2).css('display', 'none');
      });
      
      $(".information_cancel_copy").click(function() { 
      $(con).css('display', 'none');
      $(con2).css('display', 'block');
      });

      $(info4).click(function() { 
      $(con).css('display', 'block');
      $(con2).css('display', 'none');
      });
    });

    $(function(){
      const con = ".stepbox";
      const con2 =".stepbox2";
      const con3 =".stepbox3";
      const con4 =".stepbox4";


      $(".step2").click(function() { 
      $(con).css('display', 'none');
      $(con3).css('display', 'none');
      $(con4).css('display', 'none');
      $(con2).css('display', 'block');
      });

      $(".step3").click(function() { 
      $(con).css('display', 'none');
      $(con2).css('display', 'none');
      $(con4).css('display', 'none');
      $(con3).css('display', 'block');
      });
      
      $(".step4").click(function() { 
      $(con).css('display', 'none');
      $(con2).css('display', 'none');
      $(con3).css('display', 'none');
      $(con4).css('display', 'block');
      });

      $(".step1").click(function() { 
      $(con4).css('display', 'none');
      $(con2).css('display', 'none');
      $(con3).css('display', 'none');
      $(con).css('display', 'block');
      });
      
      $(".step1").click(function() { 
      $(con4).css('display', 'none');
      $(con2).css('display', 'none');
      $(con3).css('display', 'none');
      $(con).css('display', 'block');
      });
    });
</script>

<style>
.title_plus_text{
	position: relative;
    right: 21.36%;
    top: 16%;
    width: 400px;
    font-size: 13px;
    font-weight: 600;
    text-align: right;
    float: right;
        line-height: 22px;
}
.title_right{
	top: 65%;
    right: 18%;
    left: auto;
}
</style>
</head>

<body>
  <div class="box_case">
    <!--좌우크기조절-->
    <div class="title">
      <a href="../../../../../../../../" class="main_back">
        <img src="../../../../../../../../img/root/메인아이콘_흰.jpg" alt="메인아이콘" />
        <div class="title_name">Minor Cinema</div>
      </a>
    </div>
<div class="title_right">
	                <div class="login_link"><a href="../../../../../../../../../../serviceCenter/CenterService" >고객센터</a></div>
	              	<c:if test="${sessionScope.member.grade==0}">	<div class="login_link"><a href="../../../../../../../../login">로그인</a></div></c:if>
	              	<c:if test="${sessionScope.member.grade>0}">	<div class="login_link"><a href="../../../../../../../../logout">로그아웃</a></div></c:if>
	            </div>
	            <c:if test="${sessionScope.member.grade==1}">
	             <div class="title_plus_text" id="${sessionScope.member.id}">${sessionScope.member.userName} 사용자님 안녕하세요<br> <a href="../../../../../../../../myPage/myPage">마이페이지</a></div>
	             </c:if>
	             <c:if test="${sessionScope.member.grade==2}">
	             <div class="title_plus_text" id="${sessionScope.member.id}">${sessionScope.member.userName} 영화 관리자님 안녕하세요<br><a href="../../../../../../../../myPage/myCinema">영화관 관리 페이지</a></div>
	             </c:if>
	             <c:if test="${sessionScope.member.grade>=10}">
	             <div class="title_plus_text" id="${sessionScope.member.id}">${sessionScope.member.userName} 웹 관리자님 안녕하세요<br><a href="../../../../../../../../webadmin/admin">웹 관리 페이지</a></div>
	             </c:if>
        </div>
  <div class="black_box">
            <ul id="main-menu">
            <li><a href="../../../../../../../../ticket/Ticketing">예매</a>
                <ul id="sub-menu">
                  <li><a href="../../../../../../../../ticket/Ticketing" aria-label="subemnu">예매하기</a></li>
                  <li><a href="../../../../../../../../ticket/TicketInformation" aria-label="subemnu">예매안내</a></li>
                </ul>
              </li>
              <li><a href="../../../../../../../../movie_info/NowPlayRank">영화 정보</a>
              </li>
              <li><a href="../../../../../../../../event/continue_Event">이벤트</a>
                <ul id="sub-menu">
                  <li><a href="../../../../../../../../event/continue_Event" aria-label="subemnu">진행중인 이벤트</a></li>
                  <li><a href="../../../../../../../../event/end_Event" aria-label="subemnu">종료된 이벤트</a></li>
                </ul>
              </li>
            </ul>
  </div>
  <!--여기까지 기본 위 배너 입니다!-->
     <div class="white_box">

      <div class="information">예매 안내 </div>


      <div class="information2">
        <div class="information3">예매 방법</div>
      </div>
      <div class="information_cancel">
        <div class="information_cancel2">취소 환불</div>
      </div>
      <div class="information_sub">- 아래 가이드를 보시고 순서에 맞추어 진행하시면 어렵지 않게 예매하실 수 있습니다.<br>
        - 회원가입 및 로그인을 먼저 해주세요. 비회원 및 본인인증이 안된 ID, 소셜 로그인 으로는 영화예매를 진행할 수 없습니다.<br>
        - 신규 회원가입을 할 경우에는 반드시 휴대폰인증 혹은 I-Pin 인증으로 가입 하셔야 합니다.
      </div>




      <div class="stepbox">
      <div class="step">
        <div class="step1">
          <div class="step1_sub">STEP1</div>
        </div>

        <div class="step2">
          <div class="step2_sub">STEP2</div>
        </div>

        <div class="step3">
          <div class="step3_sub">STEP3</div>
        </div>

        <div class="step4">
          <div class="step4_sub">STEP4</div>
        </div>
        <hr class="event_border2" style="border: solid 1px #666666;" width="1000px">
      </div>
      <div class="step1_sub1">
        영화 홈에서 예매 > 빠른 예매를 클릭 후, 아래 화면으로 들어옵니다.<br/>
영화/극장/시간을 순서에 상관없이 선택 해주세요. 3가지 모두를 선택하시면 아래쪽에 상영시간표가 나타납니다.<br/>
극장의 취소마감 시간을 잘 확인 하신 후, 원하시는 상영시간을 클릭한 후, 다음단계를 눌러주세요. 
        <div class="step1_photo">사진 쳐넣으세요~</div>
      </div>
    </div>


<!-- step2 박스 -->
    <div class="stepbox2">
      <div class="step">
        <div class="step1">
          <div class="step1_sub2">STEP1</div>
        </div>

        <div class="step2">
          <div class="step2_sub2">STEP2</div>
        </div>

        <div class="step3">
          <div class="step3_sub">STEP3</div>
        </div>

        <div class="step4">
          <div class="step4_sub">STEP4</div>
        </div>
        <hr class="event_border2" style="border: solid 1px #666666;" width="1000px">
      </div>
      <div class="step1_sub1">
        개인정보 수집 · 이용 동의 및 제3자 제공에 동의 해주세요. 해당 동의는 티켓발권, 포인트 적립 등의 목적으로 사용됩니다.<br>

        예매자의 이름, 휴대폰 번호, 이메일을 확인 해주세요. 예매내역을 알림톡 혹은 문자로 전송해드립니다.<br>
        
        동의 및 확인 하셨으면 다음 단계를 눌러주세요.<br>
        <div class="step2_photo">사진 쳐넣으세요~</div>
      </div>
    </div>
<!-- 스텝 2박스 -->


<!-- 스텝3박스 -->
<div class="stepbox3">
  <div class="step">
    <div class="step1">
      <div class="step1_sub2">STEP1</div>
    </div>

    <div class="step2">
      <div class="step2_sub_low">STEP2</div>
    </div>

    <div class="step3">
      <div class="step3_sub3">STEP3</div>
    </div>

    <div class="step4">
      <div class="step4_sub">STEP4</div>
    </div>
    <hr class="event_border2" style="border: solid 1px #666666;" width="1000px">
  </div>
  <div class="step1_sub1">
    관람할 인원을 선택 해주세요. 선택 후, 좌석도를 클릭 하시면 예매 가능한 좌석을 보실 수 있습니다.<br>

    원하시는 좌석을 선택해주세요. 예매 가능한 좌석은 붉은색으로 표시 됩니다.<br>

    인원과 좌석을 모두 선택하셨으면 다음 단계를 눌러 주세요.<br>
    <div class="step3_photo">사진 쳐넣으세요~</div>
  </div>
</div>
<!-- 스텝3 박스 -->

<div class="stepbox4">
  <div class="step">
    <div class="step1">
      <div class="step1_sub2">STEP1</div>
    </div>

    <div class="step2">
      <div class="step2_sub_low">STEP2</div>
    </div>

    <div class="step3">
      <div class="step3_sub3_low">STEP3</div>
    </div>

    <div class="step4">
      <div class="step4_sub4">STEP4</div>
    </div>
    <hr class="event_border2" style="border: solid 1px #666666;" width="1000px">
  </div>

  <div class="step1_sub1">
    사용하고 싶은 할인/기타 결제 수단이 있으시면 선택하여 적용해 주세요. 할인된 내역은 선택정보에 바로 차감되어 표시 됩니다.<br>

할인을 모두 적용하셨다면 최종 결제 수단을 선택해주세요. 최종 결제 금액이 ‘0’원 일 경우에는 바로 결제하기를 눌러주시면 됩니다
    <div class="step4_photo1">사진 쳐넣으세요~</div>
  </div>

  <div class="step4_sub2">
    결제가 정상적으로 이루어지면 회원님의 휴대폰으로 알림톡 혹은 문자로 예매번호가 전송 됩니다.<br>

    나의 예매내역 > 예매확인/취소에서 반드시 예매내역을 확인 하세요.<br>

    예매내역 아래의 티켓 찾는 방법을 꼭 확인 하시고 극장에 방문하시기 바랍니다.
    <div class="step4_photo1">사진 쳐넣으세요~</div>
  </div>
</div>





















     </div>
     <!-- 위에부분 -->
  <div class="white_box2">
    <div class="information">예매 안내</div>
    <div class="information2_copy">
      <div class="information3_copy">예매 방법</div>
    </div>
    <div class="information_cancel_copy">
      <div class="information_cancel2_copy">취소 환불</div>
    </div>
    <div class="information_sub_copy">- 예매내역 하단에 있는 취소 버튼을 클릭하면 예매를 취소 할 수 있습니다.<br>
      - 내역은 ‘나의 예매내역 > 나의 예매/취소 >취소내역’ 에서 확인 할 수 있습니다.<br>
      - 예매취소는 각 극장별 취소가능시간까지만 가능하며, 가능시간 이후에는 취소가 불가능하오니 반드시 취소가능시간을 확인하시기 바랍니다.<br>
      - 영화 고객센터 및 각 극장에 전화상으로 취소는 불가능하며 인터넷상에서 취소가 불가능한 경우 관람시간 전에 극장에 방문하시어 현장 취소하셔야 합니다.<br>
      - 단, 극장에서 발권한 후에는 시간에 관계없이 온라인 취소는 불가하며 현장취소만 가능 합니다.<br>
      - 예매완료 후에는 부분취소나 시간 변동을 할 수 없습니다. 예매내역 전체를 취소한 후 재예매를 하셔야 합니다.<br>
    </div>
    <div class="information_photo_copy"></div>
    <div class="information_sub_copy1">극장 현장에서 취소했을때</div>
    <div class="information_sub_copy2">- 극장 현장에서 취소하신 경우 취소 내역은 관람일 다음날 오전 중에 반영 됩니다.<br>
      - 이 때 결제도 함께 취소되니 현장 취소시에 유의하시기 바랍니다.</div>
    <div class="information_sub_copy3">환불 규정</div>
    <div class="information_sub_copy4">- 영화 예매 후, 취소 가능시간 내에 인터넷에서 취소를 하면 예매 수수료 포함 전액이 환불됩니다.<br>
      - 신용카드 : 결제일과 취소일이 다를 경우 영업일 기준 3~5일 정도 소요<br>
      - 체크카드 : 결제일과 취소일이 다를 경우 영업일 기준 3~5일 정도 소요<br>
      - 계좌이체 : 취소한 시점의 은행 영업일로 부터 1~2일내 고객님 계좌로 자동 환불.<br>
      - 휴대폰 결제 : 결제 당월 취소 시 취소 당일 환불 (익월 취소 시 결제 익월 28일 이후 예치금으로 환불)</div>











  </div>





























     <!-- 제일 최하단 -->
<hr class="lhr5"/>
<div class="bottom">
    <!--고객센터-->

    <div class="inner_case_bottom">
        <div class="bottom_text_1">고객센터</div>
        <div class="bottom_text_2">평일 08:00 ~ 19:30, 토요일,공휴일
            휴무&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;02-1234-5678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;customer@projectCinema.co.kr</div>
        <div class="bottom_text_3">상호 : (주)프로젝트영화 &nbsp;&nbsp;&nbsp; 대표자 : 2조<br>
            주소 : 대전광역시 동구 우암로 352-21 (주)프로젝트영화

            <br><br>사업자 등록번호 : 123-45-6789<br>TEL : 02-1234-5678 Email : customer@projectCinema.co.kr
        </div>
        <div class="bottom_text_4">© ProjectCinema Co., Ltd All rights reservedv.</div>
    </div>
    </div>
    <jsp:include page="../include/body.jsp"></jsp:include>

</body>
</html>