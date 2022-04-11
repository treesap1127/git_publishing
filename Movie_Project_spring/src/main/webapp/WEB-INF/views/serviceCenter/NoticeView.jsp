<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <jsp:include page="../include/header.jsp"></jsp:include>
<link href="../css/notice.css" rel="stylesheet" type="text/css">
</head>
<body>
  <div class="box_case">
    <!--좌우크기조절-->
    <div class="title">
      <a href="../../../../" class="main_back">
        <img src="img/root/메인아이콘_흰.jpg" alt="메인아이콘" />
        <div class="title_name">Miner Cinema</div>
      </a>
    </div>
    <div class="title_right">
      <a href="such"><img src="img/root/돋보기화이트.jpg" alt="돋보기아이콘" style="height: 22px; width: 25px;" /></a>
      <div class="login_link"><a href="../../../../center" style="color: black;">고객센터</a></div>
      <div class="login_link"><a href="../../../../login" style="color: black;">로그인</a></div>
    </div>
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
                  <li><a href="../../../../movie_info/NowPlayRank" aria-label="subemnu">현재 상영작</li></a>
                  <li><a href="../../../../movie_info/Expected" aria-label="subemnu">상영예정작</li></a>
                  <li><a href="../../../../movie_info/MovieGuide" aria-label="subemnu">영화안내</li></a>
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

     <div class="notice_box">

        <div class="notice_seq">공지사항</div>          
          <div class="notice_area">
          
             <table class="tb">
              <colgroup>
                <col width="130">
                <col>
                <col width="170">
            </colgroup>              
              <thead>
                  <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>등록일</th>
                  </tr>
              </thead>
              <tbody id="notice_midle">
                <tr>
                    <td>111111</td>
                    <td><a href="notice_list.html">영화예매 취소좀</a></td>
                    <td>2022-03-29</td>
                </tr>
              </tbody>                          
          </table>
         </div>
         <!-- 페이징디자인 -->
         <div class="pager ">
          <div class="page_wrap">
            <div class="page_nation">
               <a class="arrow pprev" href="#"></a>
               <a class="arrow prev" href="#"></a>
               <a href="#" class="active">1</a>
               <a href="#">2</a>
               <a href="#">3</a>
               <a href="#">4</a>
               <a href="#">5</a>
               <a href="#">6</a>
               <a href="#">7</a>
               <a href="#">8</a>
               <a href="#">9</a>
               <a href="#">10</a>
               <a class="arrow next" href="#"></a>
               <a class="arrow nnext" href="#"></a>
            </div>
         </div>
        </div>
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