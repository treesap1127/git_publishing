<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <jsp:include page="../include/header.jsp"></jsp:include>
    <link rel="stylesheet" href="../../resources/css/style/style.css">
    <link rel="stylesheet" href="../../resources/css/event/end_event.css">
    <link rel="javascript" href="js/mainpage.js">

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</head>
<body>
  <div class="box_case">
    <!--좌우크기조절-->
    <div class="title">
      <a href="../../../../" class="main_back">
        <img src="../../resources/img/root/메인아이콘_흰.jpg" alt="메인아이콘" />
        <div class="title_name">Miner Cinema</div>
      </a>
    </div>
<div class="title_right">
	                <a href="such"><img src="../../resources/img/root/돋보기화이트.jpg" alt="돋보기아이콘" style="height: 22px; width: 25px;" /></a>
	                <div class="login_link"><a href="serviceCenter/CenterService" >고객센터</a></div>
	              	<c:if test="${sessionScope.member.grade==0}">	<div class="login_link"><a href="../login">로그인</a></div></c:if>
	              	<c:if test="${sessionScope.member.grade>0}">	<div class="login_link"><a href="../logout">로그아웃</a></div></c:if>
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
     <!--여기까지 기본 위 배너 입니다!-->
     <div class="whitebox">
      <div class="eventbox">
        <div class="eventboxtext">종료된 이벤트</div>        
      </div>
      <div>* 총 ${pager.total} 건 날짜가 지난이벤트 입니다.</div>
     

      <!-- 아래가 슬라이드 부분입니다 건들지마세요 -->
   
    </div>
      <!-- 슬라이드 아래부분 목록입니다 -->
      
 <!-- 관리자일시 -->
  <c:if test="${sessionScope.member.grade >= 2}">
<div class="whitebox2">
      <div class="scriptbox">     
      <div class="event_list_box">
      
      	 <table class="table table-striped table-bordered table-hover">         
              <colgroup>
                <col width="130">
                <col>
                <col width="170">
            </colgroup>              
              <thead>
                  <tr class="event_list">
                      <th>이벤트번호</th>
                      <th>이벤트제목</th>                                         
                      <th>작성자</th>
                      <th>관리</th>
                      
                  </tr>
              </thead>
              <tbody class="event_tbody_list">
            	 <c:if test="${list.size() < 1}">
						<tr>
							<td colspan="5">등록 된 게시물이 없습니다</td>
						</tr>
					</c:if>
					
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.eventId}</td>
							<td><a href="EventInfo/${item.eventId}">${item.eventName}</a></td>														
							<td>${item.id}</td>							
							<td> <a href="delete/${item.eventId}"><button class="btn btn-outline-danger">삭제</button></a></td>
						</tr>										 
					</c:forEach> 					    					
              </tbody>                                                   
          </table>                     
      </div>
      
       <div class="pager ">       	    
        <div class="page_wrap">
          <div class="page_nation">
             <a class="arrow pprev" href="?page=1"></a>
             <a class="arrow prev" href="?page=${pager.prev} "></a>
             	<c:forEach var="page" items="${pager.list}">
					<div><a href="?page=${page}">${page}</a></div>
				</c:forEach>             
             <a class="arrow next" href="?page=${pager.next} "></a>
             <a class="arrow nnext" href="?page=${pager.last} "></a>
          </div>
        </div>
       </div>
      </div>
     </div>
     </c:if>
     
     
     <!-- 유저 일시 -->
     <c:if test="${sessionScope.member.grade == 1}">
     <div class="whitebox2">
      <div class="scriptbox">     
      <div class="event_list_box">      
      	 <table class="table table-striped table-bordered table-hover">         
              <colgroup>
                <col width="130">
                <col>
                <col width="170">
            </colgroup>              
              <thead>
                  <tr class="event_list">
                      <th>이벤트번호</th>
                      <th>이벤트제목</th>                                         
                      <th>작성자</th> 
                      <th>조회수</th>                     
                  </tr>
              </thead>
              <tbody class="event_tbody_list">
            	 <c:if test="${list.size() < 1}">
						<tr>
							<td colspan="4">등록 된 게시물이 없습니다</td>
						</tr>
					</c:if>					
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.eventId}</td>
							<td><a href="EventInfo/${item.eventId}">${item.eventName}</a></td>														
							<td>${item.id}</td>	
							<td>${item.eventViewcnt}</td>					
						</tr>									 
					</c:forEach> 					    					
              </tbody>                                                   
          </table>                     
      </div>
      
     <div class="pager ">       	    
        <div class="page_wrap">
          <div class="page_nation">
             <a class="arrow pprev" href="?page=1"></a>
             <a class="arrow prev" href="?page=${pager.prev} "></a>
             	<c:forEach var="page" items="${pager.list}">
					<div><a href="?page=${page}">${page}</a></div>
				</c:forEach>             
             <a class="arrow next" href="?page=${pager.next} "></a>
             <a class="arrow nnext" href="?page=${pager.last} "></a>
          </div>
        </div>
       </div>
      </div>
     </div>
     </c:if>
     
     
     <!-- 비회원일시 -->
    <c:if test="${sessionScope.member.id == null}">
	  <div class="whitebox2">
      <div class="scriptbox">     
      <div class="event_list_box">
      
      	 <table class="table table-striped table-bordered table-hover">         
              <colgroup>
                <col width="130">
                <col>
                <col width="170">
            </colgroup>              
              <thead>
                  <tr class="event_list">
                      <th>이벤트번호</th>
                      <th>이벤트제목</th>                                         
                      <th>작성자</th>
                      <th>조회수</th>
                      
                  </tr>
              </thead>
              <tbody class="event_tbody_list">
            	 <c:if test="${list.size() < 1}">
						<tr>
							<td colspan="4">등록 된 게시물이 없습니다</td>
						</tr>
					</c:if>
					
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.eventId}</td>
							<td><a href="EventInfo/${item.eventId}">${item.eventName}</a></td>														
							<td>${item.id}</td>	
							<td>${item.eventViewcnt}</td>						
						</tr>										 
					</c:forEach> 					    					
              </tbody>                                                   
          </table>                     
      </div>
      
       <div class="pager ">       	    
        <div class="page_wrap">
          <div class="page_nation">
             <a class="arrow pprev" href="?page=1"></a>
             <a class="arrow prev" href="?page=${pager.prev} "></a>
             	<c:forEach var="page" items="${pager.list}">
					<div><a href="?page=${page}">${page}</a></div>
				</c:forEach>             
             <a class="arrow next" href="?page=${pager.next} "></a>
             <a class="arrow nnext" href="?page=${pager.last} "></a>
          </div>
        </div>
       </div>
      </div>
     </div>
     </c:if>
     
     



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