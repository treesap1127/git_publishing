<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
  <link href="../css/ticket/ticket_sit.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="../css/style/style.css">

  <script src="../../../../../js/sit_list.js"></script>
</head>

<body>
  <div class="box_case">
    <!--좌우크기조절-->
    <div class="title">
      <a href="../../" class="main_back">
        <img src="../../img/root/메인아이콘_흰.jpg" alt="메인아이콘" />
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
	             <div class="title_plus_text">${sessionScope.member.userName} 사용자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="myPage">마이페이지</a></div>
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
            <li><a href="#">예매</a>
                <ul id="sub-menu">
                  <li><a href="../../ticket/Ticketing" aria-label="subemnu">예매하기</a></li>
                  <li><a href="../../ticket/TicketInformation" aria-label="subemnu">예매안내</a></li>
                </ul>
              </li>
              <li><a href="#">영화</a>
                <ul id="sub-menu">
                  <li><a href="../../movie_info/NowPlayRank" aria-label="subemnu">현재 상영작</a></li>
                  <li><a href="../../movie_info/Expected" aria-label="subemnu">상영예정작</a></li>
                </ul>
              </li>
              <li><a href="#">이벤트</a>
                <ul id="sub-menu">
                  <li><a href="../../event/continue_Event" aria-label="subemnu">진행중인 이벤트</a></li>
                  <li><a href="../../event/end_Event" aria-label="subemnu">종료된 이벤트</a></li>
                </ul>
              </li>
            </ul>
  </div>
  <!--여기까지 기본 위 배너 입니다!-->
  <!-- 좌석선택 -->
  <div class="gray_box">
    <div class="ticketing_name">좌석 선택</div>
    <div class="ticketing_box">
      <div class="tic_top">
        <div class="person_check">
          <div class="adult">
            <div class="adult_text">성인</div>
            <div class="adult_button">
              <button class="aud_but a0">0</button><button class="aud_but a1">1</button><button class="aud_but a2">2</button><button class="aud_but a3">3</button><button class="aud_but a4">4</button><button class="aud_but a5">5</button><button class="aud_but a6">6</button><button class="aud_but a7">7</button><button class="aud_but a8">8</button>
            </div>
          </div>
          <div class="teenager">
            <div class="teenager_text">청소년</div>
            <div class="teenager_button">
              <button class="ten_but t0">0</button><button class="ten_but t1">1</button><button class="ten_but t2">2</button><button class="ten_but t3">3</button><button class="ten_but t4">4</button><button class="ten_but t5">5</button><button class="ten_but t6">6</button><button class="ten_but t7">7</button><button class="ten_but t8">8</button>
            </div>
          </div>
        </div>

        <div class="movie_checking">
          <div class="movie_info">선택한 상영관 및 시간</div>
          <div class="movie_name">영화관: ${list.theaterName}</div>
          <div class="movie_time">영화시간: ${list.movieTime}</div>
        </div>

        <div class="sit_check">
          <div class="sit_text">선택한 좌석</div>
          <div class="sit_inf">선택 된 좌석</div>
          <div class="sit_info"></div>
        </div>
      </div>
      <div class="absol_center">인원을 먼저 선택 해주세요!</div>
      <div class="mod_center">
        
        <div class="sit_img">
          <div class="sit_screen"></div>
        </div>
        
        
		        <div class="sit_aph">        </div>
        <!-- 위에서 알파벳 정렬로 스크린이 나옴 -->
        
        <div class="sit_checkbox">
         </div>
         <!-- 체크박스 생성 -->
          <div style="display:flex; width:100%;height:17%">
			
		<div class="sit_aph_num"></div>
        <!-- 숫자 생성 -->
          </div>
          
          
		<c:forEach items="${sit}" var="item">
		
		
       <input type="text" value="${item.cinemaCode}" class="cinemaCode" style="display:none">
       <input type="text" value="${item.theaterName}" class="theaterName" style="display:none">
       <input type="text" value="${item.row}" class="row" style="display:none">
       <input type="text" value="${item.line}" class="line" style="display:none">
       <input type="text" value="${item.sit}" class="sit" style="display:none">
       </c:forEach>
</div>
<div class="sitbottom">
        <div class="sit_bottom">
          <div class="category">
            <div class="sit_b">00</div><div class="sit_bottom_category">선택가능</div>
            <div class="sit_c">00</div><div class="sit_bottom_category">선택불가</div>
            <div class="sit_a">00</div><div class="sit_bottom_category">선택완료</div>
          </div>
          <div class="sit_infomation">
            -좌석선택 후, 5분 이내 결제하지 않으면 좌석이 해제 될 수 있습니다.<br>-한 번 선택한 좌석은 예매 성공 유무에 상관없이 약 5분간 홀딩 됩니다.
          </div>
        </div>
      </div>


      <div class="ticket_check_box">
        <div class="movie_poster">
          <img src="../../img/ticketing/영화.png" alt="">
        </div>
        <div class="check_com">
        <div class="check_com_box">
          <div style="font-size: 18px; font-weight: 500;">${list.movieName}</div>
          <div>상영관 :${list.theaterName}</div>
          <div>상영 일자: ${list.movieDate}</div>
          <div>상영 시간:${list.movieTime}</div>
          <div style="display: none">${list.movieCode}</div>
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

          <a class="sitting_check"><button class="btn btn-outline-danger">결제창으로 넘어가기</button></a>
          <!-- href="payment" -->
        </div>
          
        </div>
      </div>
    </div>
  </div>
  <!-- 좌석선택끝 -->

  <!-- 제일 최하단 -->

  <div class="bottom">
    <!--고객센터-->
    <hr class="lhr5" />
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