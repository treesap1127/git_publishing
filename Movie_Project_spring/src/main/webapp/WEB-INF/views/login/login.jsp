<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/login/login.css" rel="stylesheet" type="text/css">
<jsp:include page="../include/header.jsp"></jsp:include> 
<link rel="stylesheet" href="../css/style/style.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


</head>
<body>
  <div class="box_case">
    <!--좌우크기조절-->
    <div class="title">
      <a href="../../../../" class="main_back" style="display: flex;">
        <img src="img/root/메인아이콘_흰.jpg" alt="메인아이콘" />
        <div class="title_name">Miner Cinema</div>
      </a>
    </div>
<div class="title_right">
	                <a href="such"><img src="img/root/돋보기화이트.jpg" alt="돋보기아이콘" style="height: 22px; width: 25px;" /></a>
	                <div class="login_link"><a href="serviceCenter/CenterService" >고객센터</a></div>
	              	<c:if test="${sessionScope.member.grade==0}">	<div class="login_link"><a href="login">로그인</a></div></c:if>
	              	<c:if test="${sessionScope.member.grade>0}">	<div class="login_link"><a href="logout">로그아웃</a></div></c:if>
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
<div class="login_box">
   <div class="center">       
    <h1>통합로그인</h1>	
		<form id="login_form" method="post">
		   <div class="txt_field">
          	<input type="text" name="id" required>
         	 <span></span>
         	 <label>아이디</label>
        </div>
			  <div class="txt_field">
        	  <input type="password" name="passwd" required>
        	  <span></span>
         	 <label>비밀번호</label>
        </div>

      
			 <div class="pass"></div>
        <input type="submit" value="Login" onclick="login()">
      </form>

        <div class="signup_link">
          	<a href="/signup">회원가입</a>  <a href="/findid">아이디찾기</a>  <a href="/login" onclick="findpw()">비밀번호찾기(문의)</a>
        </div>
      </div>
    
      

        <div class="center2">       
            <h1>소셜로그인</h1>	              
                <section class="Easy-sgin-in-wrap">
                    <div class="sign-a-list">
                        <div id ="kakao_id_login" class="ka"><a href="#"><img src="img/login/kakao.png" alt="카카오" style="height: 45px; width: 45px;" /><i class="fas fa-kakaocorp"></i><span>카카오톡 계정으로 로그인</span></a></div>
                        <div id ="naver_id_login" class="na">네이버 계정으로 로그인</div>                  
                    </div>   
                    <!-- //네이버 로그인 버튼 노출 영역 -->
						  <script type="text/javascript">
						  	var naver_id_login = new naver_id_login("pWs7zT5cUybuWleJFuHa", "http://localhost:9090/naver/callback");
						  	var state = naver_id_login.getUniqState();
						  	naver_id_login.setButton("white", 2,40);
						  	naver_id_login.setDomain("http://localhost:9090/naverLogin");
						  	naver_id_login.setState(state);
						  	naver_id_login.setPopup();
						  	naver_id_login.init_naver_id_login();
						  </script>					  
                </section>             
              </div>
		  
    </div>
<!-- 제일 최하단 -->
<div class="bottom">
    <!--고객센터-->
    <hr class="lhr5"/>
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