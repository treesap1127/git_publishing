<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
  <link href="../../css/ticket/Ticketing.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="../../css/style/style.css">
  <script src="../../js/ticket.js"></script>
<script>

       window.onload = function(){
    	   const msg = '${msg}';
    	   if(msg) alert('5분이 지났습니다. 재선택 해주세요.');
   		};
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
  <!-- 예매 -->

  <div class="gray_box">
    <div class="ticketing_name">영화/극장/관람일 선택</div>
    <div class="ticketing_box">
      <div class="ticket_list">
        <div class="tic_list" style="background-color: red;color: white; border: 0; "><br><br><br>01<br>상영시간</div>
        <div class="tic_list"><br><br><br>02<br>인원/좌석</div>
        <div class="tic_list"><br><br><br>03<br>결제</div>
        <div class="tic_list"><br><br><br>04<br>결제완료</div>
      </div>

      <div class="movie_place">
        <div class="movie_place_title">
          <div class="title_center">영화관</div>
        </div>
        <div class="place">
          <div class="place_box" style="text-align: center"><br>시/도</div>
          <div class="place_box" style="text-align: center"><br>영화관명</div>
        </div>
        <div class="movie_place_sub">
          <div class="movie_place_sub1">
			<button id="서울" class="movie_place_">서울</button>
            <button id="경기" class="movie_place_">경기/인천</button>
            <button id="대전" class="movie_place_">충청/대전</button>
            <button id="전라" class="movie_place_">전라/광주</button>
            <button id="경상" class="movie_place_">경상/대구</button>
            <button id="강원" class="movie_place_">강원</button>
            <button id="제주" class="movie_place_">제주</button>
          </div>
          <div class="movie_place_sub2">
 <!--      	<c:forEach var="item" items="${theater}">
        		<button id="${item.movieAreaName}" class="movieAreaName">${item.movieAreaName}</button>
        	</c:forEach>
-->          </div>
        </div>
      </div>

      <div class="movie_check">
        <div class="movie_place_title">
          <div class="title_center">영화 선택</div>
        </div>
        <div class="movie_audits">
			<!-- 영화명 쭈르륵 -->         
        </div>
         
      </div>

      <div class="movie_date">
        <div class="movie_place_title">
          <div class="title_center">예매 일자</div>
        </div>
          <div class="calender">
		  <div class='rap'>
    <div class="header">
       <div class="btnc prevDay"></div>
      <h2 class='dateTitle'></h2>
      <div class="btnc nextDay"></div>
    </div>
    
    <div class="grid dateHead">
      <div>일</div>
      <div>월</div>
      <div>화</div>
      <div>수</div>
      <div>목</div>
      <div>금</div>
      <div>토</div>
    </div>

    <div class="grid dateBoard"></div>
  </div>	
</div>
        <!-- 달력api -->
        <div class="contact">
			<!-- 영상 시간 정보 js로 구현 -->
        </div>
      </div>
    </div>
    <div class="ticket_check_box">
      <div class="movie_poster">
        <img src="../img/ticketing/영화.png" alt="">
      </div>
      <div class="check_com">
        <div class="movie_check_" style="font-size: 18px; font-weight: 500;">영화를 선택하세요.<br><br></div>
        <div class="cinema_check">영화관을 선택하세요.</div>
        <div class="cinema_date">영화일자를 선택하세요.</div>
        <div class="cinemaCode"style="display:none"></div>
        <div class="theaterName" style="display:none"></div>
      </div>
      <div class="sitting">
        <a ><button class="sitting_check btn btn-outline-danger">좌석 선택으로 넘어가기</button></a>
      </div>
    </div>
  </div>
 
  <div class="white_box"></div>
  <!-- 예매끝 -->
  <!-- 제일 최하단 -->
  <hr class="lhr5" />
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