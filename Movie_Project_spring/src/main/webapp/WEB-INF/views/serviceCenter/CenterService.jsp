<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
<link href="../css/serviceCenter/center_service.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/style/style.css">
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
	                <a href="such"><img src="../img/root/돋보기화이트.jpg" alt="돋보기아이콘" style="height: 22px; width: 25px;" /></a>
	                <div class="login_link"><a href="../../serviceCenter/CenterService" >고객센터</a></div>
	              	<c:if test="${sessionScope.member.grade==0}">	<div class="login_link"><a href="/login">로그인</a></div></c:if>
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
     <div class="center_box">
      <div class="center_seq">고객 센터</div>     
        <div class="fqa_top_area">
          <div class="fqa_top_cont">
              <p class="p_title"><a href="F&Q" class="btn_more">FAQ TOP 5(바로 가기)</a></p>
              <div class="faq_box">
                              <div class="">
                                <table class="faq_table">
                     
                                  <thead>
                                      <tr>
                                          <td><a href="#">Q 네이버 페이로 결제할수 있나용?</a></td>
                                       </tr>
                                       <tr>
                                        <td><a href="#">Q 한번에 몇 매까지 예매가 가능한가요?</a></td>
                                     </tr>
                                     <tr>
                                      <td><a href="#">Q 네이버 페이로 결제할수 있나용?</a></td>
                                   </tr>
                                   <tr>
                                    <td><a href="#">Q 예매후 극장 예매표는 어떻게 받나요?</a></td>
                                 </tr>
                                 <tr>
                                  <td><a href="#">Q 예매 취소내역은 어디서 확인하나요?</a></td>
                               </tr>
                              
                                      </thead>
                                                      
                              </table>
                              </div>
                          
                  


              </div>
          </div>
          <div class="faq_category">
              <div class="faq_menu">                 
                <div class="faq_menu_1" style="display: flex; border-bottom: 1px solid #e5e5e5;">
                  <a href="faq.html" style="border-right: 1px solid #e5e5e5;"><span class="menu_in_top">영화예매<br>문의</span></a>
                  <a href="faq.html"><span class="menu_in_top">예매권/할인권<br>문의</span></a>
                </div>
                <div class="faq_menu_1"  style="display: flex;">
                  <a href="faq.html" style="border-right: 1px solid #e5e5e5;"><span class="menu_in_top">이벤트<br>문의</span></a>
                  <a href="faq.html"><span class="menu_in_top">결제/취소<br>문의</span></a>
                </div>
              </div>
              <div class="faq_center">
                  
                  <a href="#" target="_blank" class="inquiry">질문게시판</a>
                  
              </div>
          </div>
      </div>
      <div class="faq_notice_area">
          <div class="notice_board">
            <p class="p_title2"><a href="NoticeView" class="btn_more">공지사항(바로 가기)</a></p>
            <div class="faq_box">
                            <div class="">
                              <table class="faq_table">
                   
                                <thead>
                                    <tr>
                                        <td><a href="#">[알림] 안녕하세요 관리자입니다.</a></td>
                                     </tr>
                                     <tr>
                                      <td><a href="#">[알림] 안녕하세요 관리자입니다.</a></td>
                                   </tr>
                                   <tr>
                                    <td><a href="#">[알림] 안녕하세요 관리자입니다.</a></td>
                                 </tr>
                                 <tr>
                                  <td><a href="#">[알림] 안녕하세요 관리자입니다.</a></td>
                               </tr>
                                    </thead>
                                                    
                            </table>
                            </div>
                        

     
      </div>
   
  </div>

    </div>
    <div class="sub_box_menu">
      <a href="NoticeView" class="service_img"><img alt="고객센터" src="/img/center_service/plannings.png" class="sub_box" style="display:block;">공지사항</a>
      <a href="F&Q" class="faq_img"><img alt="자주묻는질문" src="/img/center_service/faq.png" class="sub_box1" style="display:block;">자주묻는질문</a>      
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