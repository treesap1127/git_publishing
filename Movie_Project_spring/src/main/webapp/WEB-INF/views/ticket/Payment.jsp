<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
  <link href="../css/ticket/payment.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="../css/style/style.css">
  <script>
$(function(){
      $(".credit").click(function(){
    	$(".payTool_post").attr("value","");
        $(".credit_").css('display','block');
        $(".phone_").css('display','none');
        $(".bank_").css('display','none');
      });
      $(".Phone").click(function(){
        $(".credit_").css('display','none');
        $(".phone_").css('display','block');
        $(".bank_").css('display','none');
      });
      $(".Bank").click(function(){
        $(".credit_").css('display','none');
        $(".phone_").css('display','none');
        $(".bank_").css('display','block');
      });
      $(".credit_box_top>button").click(function(){
        $(".credit_box_top>button").css('color','black');
        $(this).css('color','red');
      });

    });
  </script>
   <script src="../../../../../js/payment.js"></script>
</head>

<body>
  <div class="box_case">
    <!--좌우크기조절-->
    <div class="title">
      <a href="../../../../" class="main_back">
        <img src="../img/root/메인아이콘_흰.jpg" alt="메인아이콘" />
        <div class="title_name">Miner Cinema</div>
      </a>
    </div>
<div class="title_right">
	                <a href="../../such"><img src="../img/root/돋보기화이트.jpg" alt="돋보기아이콘" style="height: 22px; width: 25px;" /></a>
	                <div class="login_link"><a href="../../serviceCenter/CenterService" >고객센터</a></div>
	              	<c:if test="${sessionScope.member.grade==0}">	<div class="login_link"><a href="../../login">로그인</a></div></c:if>
	              	<c:if test="${sessionScope.member.grade>0}">	<div class="login_link"><a href="../../logout">로그아웃</a></div></c:if>
	            </div>
	            <c:if test="${sessionScope.member.grade==1}">
	             <div class="title_plus_text"><span class="user_id">${sessionScope.member.userName}</span> 사용자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="myPage">마이페이지</a></div>
	             </c:if>
	             <c:if test="${sessionScope.member.grade==2}">
	             <div class="title_plus_text">${sessionScope.member.userName} 영화 관리자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="">영화관 관리</a></div>
	             </c:if>
	             <c:if test="${sessionScope.member.grade>=10}">
	             <div class="title_plus_text">${sessionScope.member.userName} 웹 관리자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="">웹 관리</a></div>
	             </c:if>
        </div>
  <div class="black_box">
            <ul id="main-menu">
            <li><a href="../../../../ticket/Ticketing">예매</a>
                <ul id="sub-menu">
                  <li><a href="../../../../ticket/Ticketing" aria-label="subemnu">예매하기</a></li>
                  <li><a href="../../../../ticket/TicketInformation" aria-label="subemnu">예매안내</a></li>
                </ul>
              </li>
              <li><a href="../../../../movie_info/NowPlayRank">영화</a>
                <ul id="sub-menu">
                  <li><a href="../../movie_info/NowPlayRank" aria-label="subemnu">현재 상영작</a></li>
                  <li><a href="../../movie_info/Expected" aria-label="subemnu">상영예정작</a></li>
                </ul>
              </li>
              <li><a href="../../../../event/continue_Event">이벤트</a>
                <ul id="sub-menu">
                  <li><a href="../../../../event/continue_Event" aria-label="subemnu">진행중인 이벤트</a></li>
                  <li><a href="../../../../event/end_Event" aria-label="subemnu">종료된 이벤트</a></li>
                </ul>
              </li>
            </ul>
  </div>
  <!--여기까지 기본 위 배너 입니다!-->
  <!--아래는 페이방법-->
  <div class="pay_home credit_">
    <div class="pay_select_box">
      <div class="pay_select_name">결제선택</div>
      <div class="pay_select">
        <div class="pay_top_menu">
          <div class="pay_top_menu_button credit ared">신용카드</div>
          <div class="pay_top_menu_button Phone" id="Phone">휴대폰</div>
          <div class="pay_top_menu_button Bank" id="Bank">실시간 계좌이체</div>
        </div>
        
        <div class="pay_bottom credit_bottom">
          <div class="credit_box_top">
            <button value="KEB하나카드">KEB하나카드</button><button value="NH카드">NH카드</button><button value="국민카드">국민카드</button><button value="롯데카드">롯데카드</button><button value="비씨카드">비씨카드</button>
            <button value="삼성카드">삼성카드</button><button value="수협카드">수협카드</button><button value="시티카드">시티카드</button><button value="신한카드">신한카드</button><button value="우리카드">우리카드</button>
            <button value="현대카드">현대카드</button>
          </div>
          <div class="credit_box_bottom">영화예매의 신용카드 결제서비스는 (주)케이지이니시스에서 제공합니다.</div>
        </div>
      </div>
    </div>
        <!--아래는 영화 선택 목록-->
        <div class="ticket_check_box">
        <div class="movie_poster">
          <img src="../../img/ticketing/영화.png" alt="">
        </div>
        <div class="check_com">
        <div class="check_com_box">
          <div class="movieName"style="font-size: 18px; font-weight: 500;">영화를 선택해주세요.</div>
          <div class="theaterName">상영관 :${list.theaterName}</div>
          <div class="movieDate">상영 일자: ${list.movieDate}</div>
          <div class="movieTime">상영 시간:${list.movieTime}</div>
          <div class="movieCode" style="display: none"></div>
          </div>
        </div>
        <div class="sit_price_total">
        	<div class="sit_price">
	          	<div class="sit_price_adult">
	                <div class="adult_num">성인(<span class="adultnum">0</span>)</div>
	                <div class="adult_money"><span class="adultmoney">0</span>원</div>
	            </div>
	            <div class="sit_price_teenager">
	                <div class="teenager_num">청소년(<span class="teenagernum">0</span>)</div>
	                <div class="teenager_money"><span class="teenagermoney">0</span>원</div>
	            </div>
	           	<div class="sit_price_fees">
	            	<div class="pay_num">예매수수료(<span class="paynum">0</span>)</div>
	            	<div class="pay_money"><span class="paymoney">0</span>원</div>
	            </div>
            </div>
            <div class="sit_total">
            	<div>최종결제 금액</div>
            	<div class="sit_total_num"> <span class="paytotal">0</span>원
            </div>
          </div>
          </div>

          
        <div class="sitting">

          <a class="sitting_check"><button class="btn btn-outline-danger sit_che_btn" onclick="warning()">결제창으로 넘어가기</button></a>
          <!-- href="payment" -->
        </div>
          
        </div>
      </div>
    <!-- 좌석선택끝 -->

    <!--credit-->
    <div class="pay_home phone_">
      <div class="pay_select_box">
        <div class="pay_select_name">결제선택</div>
        <div class="pay_select">
          <div class="pay_top_menu">
            <div class="pay_top_menu_button credit">신용카드</div>
            <div class="pay_top_menu_button Phone ared">휴대폰</div>
            <div class="pay_top_menu_button Bank">실시간 계좌이체</div>
          </div>
          
          <div class="pay_bottom credit_bottom">
            <div class="phone_box_top">
              휴대폰 결제는 <span style="color:red">이달 상영하는 영화만 결제</span>할 수 있습니다. 다음달 관람할 영화를 예매하실 경우 다른 결제 수단을 이용해 주세요.
            </div>
            <div class="phone_box_mid">
              <label>휴대폰 결제를 사용할수 없는 경우 안내</label>
              <ol>
                <li>-미성년자 명의의 휴대폰 (단, KT와 LGU+는 가입자가 성인인 경우 가능)</li>
                <li>-사업자 폰, 미납상태인 폰, 정액요금제 가입폰, 외국인 폰</li>
                <li>-LGU+의 경우 번호이동 및 신규 가입한 경우 가입일로부터 60일 간 월 한도 5만원</li>
              </ol>
            </div>
            <div class="phone_box_bottom">
              <label>휴대폰 결제시 현금영수증 발급 안내</label>
              <ol>
                <li>-휴대폰 요금을 현금으로 납부하는 경우에만 해당 이동통신사에서 발급 가능</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
          <!--아래는 영화 선택 목록-->
    <div class="ticket_check_box">
        <div class="movie_poster">
          <img src="../../img/ticketing/영화.png" alt="">
        </div>
        <div class="check_com">
        <div class="check_com_box">
          <div class="movieName"style="font-size: 18px; font-weight: 500;">영화를 선택해주세요.</div>
          <div class="theaterName">상영관 :${list.theaterName}</div>
          <div class="movieDate">상영 일자: ${list.movieDate}</div>
          <div class="movieTime">상영 시간:${list.movieTime}</div>
          <div class="movieCode" style="display: none"></div>
          </div>
        </div>
        <div class="sit_price_total">
        	<div class="sit_price">
	          	<div class="sit_price_adult">
	                <div class="adult_num">성인(<span class="adultnum">0</span>)</div>
	                <div class="adult_money"><span class="adultmoney">0</span>원</div>
	            </div>
	            <div class="sit_price_teenager">
	                <div class="teenager_num">청소년(<span class="teenagernum">0</span>)</div>
	                <div class="teenager_money"><span class="teenagermoney">0</span>원</div>
	            </div>
	           	<div class="sit_price_fees">
	            	<div class="pay_num">예매수수료(<span class="paynum">0</span>)</div>
	            	<div class="pay_money"><span class="paymoney">0</span>원</div>
	            </div>
            </div>
            <div class="sit_total">
            	<div>최종결제 금액</div>
            	<div class="sit_total_num"> <span class="paytotal">0</span>원
            </div>
          </div>
          </div>

          
        <div class="sitting">

          <a class="sitting_check"><button class="btn btn-outline-danger sit_che_btn" onclick="warning()">결제창으로 넘어가기</button></a>
          <!-- href="payment" -->
        </div>
          
        </div>
  </div>
<!-- 좌석선택끝 -->

<!--phone-->
<div class="pay_home bank_">
  <div class="pay_select_box">
    <div class="pay_select_name">결제선택</div>
    <div class="pay_select">
      <div class="pay_top_menu">
        <div class="pay_top_menu_button credit">신용카드</div>
        <div class="pay_top_menu_button Phone" id="phone">휴대폰</div>
        <div class="pay_top_menu_button Bank ared"id="bank">실시간 계좌이체</div>
      </div>
      
      <div class="pay_bottom credit_bottom">
        <div class="bank_box_top">
          계좌이체 서비스는 "(주)케이지이니시스"에서 제공합니다.<br>
          국민은행을 비롯하여 20여개 은행의 실시간 계좌이체가 가능합니다.<br>
          계좌이체 이용은 은행별 이용시간 내에만 가능합니다.<br>
          신용카드가 없는 학생이나 미성년자도 이용 가능합니다.<br>
          PC뱅킹, 인터넷뱅킹 이용자는 지금 바로 이용하실 수 있습니다.<br>
        </div>
        <div class="bank_box_bottom">
          환불안내<br>
          <span>
          예매일로부터~일요일 내에 취소 : 결제금액을 취소한 시점의 은행의 영업일로 부터 이틀내로 고객님 계좌로 자동 환불해드립니다.<br>
          그 이후(예매일로부터 다음주~) 취소 : 고객님의 계좌를 확인한 후 환불해드립니다.<br>
          예) 금요일 예매 후 토요일에 취소했을 경우, 다음주 화요일 자동환불. 금요일 예매 후 다음 월요일에 취소했을 경우, 환불할 계좌 확인 후 환불<br>
        </span>
        </div>
      </div>
    </div>
  </div>
    <!--아래는 영화 선택 목록-->
<div class="ticket_check_box">
        <div class="movie_poster">
          <img src="../../img/ticketing/영화.png" alt="">
        </div>
        <div class="check_com">
        <div class="check_com_box">
          <div class="movieName"style="font-size: 18px; font-weight: 500;">영화를 선택해주세요.</div>
          <div class="theaterName">상영관 :${list.theaterName}</div>
          <div class="movieDate">상영 일자: ${list.movieDate}</div>
          <div class="movieTime">상영 시간:${list.movieTime}</div>
          <div class="movieCode" style="display: none"></div>
          </div>
        </div>
        <div class="sit_price_total">
        	<div class="sit_price">
	          	<div class="sit_price_adult">
	                <div class="adult_num">성인(<span class="adultnum">0</span>)</div>
	                <div class="adult_money"><span class="adultmoney">0</span>원</div>
	            </div>
	            <div class="sit_price_teenager">
	                <div class="teenager_num">청소년(<span class="teenagernum">0</span>)</div>
	                <div class="teenager_money"><span class="teenagermoney">0</span>원</div>
	            </div>
	           	<div class="sit_price_fees">
	            	<div class="pay_num">예매수수료(<span class="paynum">0</span>)</div>
	            	<div class="pay_money"><span class="paymoney">0</span>원</div>
	            </div>
            </div>
            <div class="sit_total">
            	<div>최종결제 금액</div>
            	<div class="sit_total_num"> <span class="paytotal">0</span>원
            </div>
          </div>
          </div>

          
        <div class="sitting">
				<form method="post">
		<div style="display: none">
			<input type="text" value="" name="ticketCode" class="ticketCode_post">
			<input type="text" value="${sessionScope.member.id}" name="id" class="id_post">
			<input type="text" value="1" name="cinemaCode" class="cinemaCode_post">
			<input type="text" value="1" name="theaterName" class="theaterName_post">
			<input type="text" value="1" name="sitCode" class="sitCode_post">
			<input type="number" value="1" name="movieCode" class="movieCode_post">
			<input type="number" value="1" name="teenager" class="teenager_post">
			<input type="number" value="1" name="adult" class="adult_post">
			<input type="text" value="" name="payTool" class="payTool_post">
		</div>
		<button class="btn btn-outline-danger sit_che_btn" onclick="warning()">결제창으로 넘어가기</button>
	</form>
         
          <!-- href="payment" -->
        </div>
          
        </div>
  </div>
<!-- 좌석선택끝 -->
  
<!--bank-->



  <!-- 제일 최하단 -->
 
  <div class="bottom">
    <!--고객센터--> 
    <hr class="lhr5">
    <div class="inner_case_bottom">
      <div class="bottom_text_1">고객센터</div>
      <div class="bottom_text_2">평일 08:00 ~ 19:30, 토요일,공휴일
        휴무&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;02-1234-5678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;customer@projectCinema.co.kr</div>
      <div class="bottom_text_3">상호 : (주)프로젝트영화 &nbsp;&nbsp;&nbsp; 대표자 : 2조<br>
        주소 : 대전광역시 동구 우암로 352-21 (주)프로젝트영화

        <br><br>사업자 등록번호 : 123-45-6789<br>TEL : 02-1234-5678 Email : customer@projectCinema.co.kr
      </div>
      <div class="bottom_text_4">© ProjectCinema Co., Ltd All rights reservedv.</div>
    </div></div>
<jsp:include page="../include/body.jsp"></jsp:include>

</body>

</html>