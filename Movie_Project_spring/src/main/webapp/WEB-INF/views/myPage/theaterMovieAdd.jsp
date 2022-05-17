<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../../../css/myPage/mycinema.css">
    <link rel="stylesheet" href="../../../../../css/myPage/sit.css">
    <link rel="stylesheet" href="../../../../../css/style/style.css">
    <script>
      $(function(){
        $(".check").click(function(){
          $(".ticket_check_cancle").css('display','block');
          $(".ticket_sale").css('display','none');
        });
        $(".cancle").click(function(){
          $(".ticket_check_cancle").css('display','none');
          $(".ticket_sale").css('display','block');
        });
        $(".menu_cancel").click(function(){
          $(".ticket_check_cancle").css('display','block');
          $(".ticket_sale").css('display','none');
          $(".ticket_sale_").css('display','none');
        });
        $(".menu_add").click(function(){
          $(".ticket_check_cancle").css('display','none');
          $(".ticket_sale").css('display','none');
          $(".ticket_sale_").css('display','block');
        });
        
      });
    </script>
    <script src="../../../../../../js/movie_add.js"></script>
    <style>
    	.title_plus_text{
    	color:white}
    </style>
</head>

<body>
  <div class="box_case">
    <!--좌우크기조절-->
    <div class="title">
      <a href="../../../../../" class="main_back">
        <img src="../../../../../img/root/메인아이콘.jpg" alt="메인아이콘" />
        <div class="title_name">Miner Cinema</div>
      </a>
    </div>
<div class="title_right">
	                <a href="../../../../../such"><img src="../../../../../img/root/돋보기블랙.jpg" alt="돋보기아이콘" style="height: 22px; width: 25px;" /></a>
	                <div class="login_link"><a href="../../../../serviceCenter/CenterService" >고객센터</a></div>
	              	<c:if test="${sessionScope.member.grade==0}">	<div class="login_link"><a href="../../../../../login">로그인</a></div></c:if>
	              	<c:if test="${sessionScope.member.grade>0}">	<div class="login_link"><a href="../../../../../logout">로그아웃</a></div></c:if>
	            </div>
	            <c:if test="${sessionScope.member.grade==1}">
	             <div class="title_plus_text">${sessionScope.member.userName} 사용자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="../../../myPage">마이페이지</a></div>
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
                  <li><a href="../../../../movie_info/NowPlayRank" aria-label="subemnu">현재 상영작</a></li>
                  <li><a href="../../../../movie_info/Expected" aria-label="subemnu">상영예정작</a></li>
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
    <div class="top_box">
      <div class="top_box_name">OOO님은 <span style="color: brown;">영화관 관리자 회원</span>입니다</div>
      <div class="top_box_info">회원 등급은: 웹관리자, 영화관 관리자 회원, 일반 회원으로 나뉩니다.</div>
    </div>
<div class="mypage">
  <div class="mypage_inline">

    <!-- 아래부터 입력 폼 -->
	   <div class="add_box">
	   		<input name="theaterName" value="${item.theaterName}"style="display:none;">
	   		<input name="cinemaCode" value="${item.cinemaCode}"style="display:none;">
		    <label>영화명:</label> 
			<div class="movieNm namebox"></div>
		  	<label>날짜:</label>
			<input type="date" name="movieDate">
		  	<label>시간:</label>
			<input type="time" name="movieTime">
			<input type="text" class="imagebox" name="image" style="display:none;">
			<input type="text" class="movie_rating" name="movieRating" style="display:none;">
		</div>
	  	<div style="display:flex; margin-left: 22px;">
	  		<button class="btn btn-primary btnadd buttonadd">등록하기</button>
			<a href="../${item.theaterName}/movie" class="btn btn-danger btnadd">뒤로가기</a>
		</div>

   <!-- 아래부터 테이블 -->
    <div class="theater_top">${item.theaterName} 영화 관리</div>
	<div class="theater_table">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>영화 포스터</th>
					<th>영화관 이름</th>
					<th>영화관 심의 등급</th>
					<th>영화 선택</th>
				</tr>
			</thead>
			<tbody>
					
			</tbody>
		</table>
	</div>   
		
	</div>
</div>
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
    </div>

</div>
    <jsp:include page="../include/body.jsp"></jsp:include>
</body>
</html>
