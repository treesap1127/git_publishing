<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="include/header.jsp"></jsp:include> 
    <link rel="stylesheet" href="css/style/style.css">
    <link rel="stylesheet" href="css/mainpage.css">
    <script src="js/index.js"></script>
    <script>
    	$(function(){
    		if(${sessionScope.member.grade}==1){
    		$(".mypage").click(function(){
    			location.href="myPage/myPage";
    		})
    		$(".mypage").attr("onclick","");
    		}
    	});
    
    	function user(){
    		alert("유저로 로그인하여 접속 해주세요.")
    	}
    	window.onload = function(){
    		   const msg = '${msg}';
    		   if(msg) alert('회원가입이 완료 되었습니다!');
    		};
    </script>
    <style>
       .title_plus_text{
       right: 14.9%;
    color: white;
    top: 14.5%;
    line-height: 23px;
   }
   
    </style>
</head>

<body>
        <div class="box_case"><!--좌우크기조절-->
            <hr class="title_hr">
            <div class="title">
              <a href="." class="main_back">
                <img src="img/root/메인아이콘.jpg" alt="메인아이콘"/>
                <div class="title_name">Minor Cinema</div>
              </a>
            </div>

               <div class="title_right">
                   <div class="login_link"><a href="serviceCenter/CenterService" >고객센터</a></div>
                    <c:if test="${sessionScope.member.grade==0}">   <div class="login_link"><a href="login">로그인</a></div></c:if>
                    <c:if test="${sessionScope.member.grade>0}">   <div class="login_link"><a href="logout">로그아웃</a></div></c:if>
               </div>
	            <c:if test="${sessionScope.member.grade==1}">
	             <div class="title_plus_text">${sessionScope.member.userName} 사용자님 안녕하세요<br> <a href="../../../../../../../../myPage/myPage">마이페이지</a></div>
	             </c:if>
	             <c:if test="${sessionScope.member.grade==2}">
	             <div class="title_plus_text">${sessionScope.member.userName} 영화 관리자님 안녕하세요<br><a href="../../../../../../../../myPage/myCinema">영화관 관리 페이지</a></div>
	             </c:if>
	             <c:if test="${sessionScope.member.grade>=10}">
	             <div class="title_plus_text">${sessionScope.member.userName} 웹 관리자님 안녕하세요<br><a href="../../../../../../../../webadmin/admin">웹 관리 페이지</a></div>
	             </c:if>
        </div>
        
            <div class="black_box">
            <ul id="main-menu">
            <li><a href="ticket/Ticketing">예매</a>
                <ul id="sub-menu">
                  <li><a href="ticket/Ticketing" aria-label="subemnu">예매하기</a></li>
                  <li><a href="ticket/TicketInformation" aria-label="subemnu">예매안내</a></li>
                </ul>
              </li>
              <li><a href="movie_info/NowPlayRank">영화 정보</a>
              </li>
              <li><a href="event/continue_Event">이벤트</a>
                <ul id="sub-menu">
                  <li><a href="event/continue_Event" aria-label="subemnu">진행중인 이벤트</a></li>
                  <li><a href="event/end_Event" aria-label="subemnu">종료된 이벤트</a></li>
                </ul>
              </li>
            </ul>
    </div>
     <!--여기까지 기본 위 배너 입니다!-->
    <div class="top_box">
      <div class="top_photo"></div>
      <div class="top_movie_name">Minor Cinema</div>
      <div class="top_movie_grade">편리하게 사용할 수 있는 통합 예매사이트</div>
    </div>
    <div class="rank_view">
      <ul class="rank_list clear" style="list-style: none;">
            <li>
              <div class="flip-card" id="movie_data_1">
                <div class="flip-card-inner">
                  <div class="flip-card-front">
                    <img src=""alt="">
                    <div class="rl_info_box">
                      <p class="rank_num"></p>
                    </div>
                  </div>
                  <div class="flip-card-back">
                    <img src="" alt="">
                    <div class="rl_info_box">
                      <p class="rank_num"></p>
                      <div class="rl_btn_box">
                        <a href="ticket/Ticketing" class="btn_rank_st">예매</a>
                        <a href="/MovieInfo/Index?mId=M000126106" class="btn_rank_st movie_datalink_1 movie_info">정보</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </li>

            <li>
              <div class="flip-card" id="movie_data_2">
                  <div class="flip-card-inner">
                      <div class="flip-card-front">
                          <img src="" alt="">
                          <div class="rl_info_box">
                              <p class="rank_num"></p>
                          </div>
                      </div>
                      <div class="flip-card-back">
                         <img src="" alt="">
                          <div class="rl_info_box">
                              <p class="rank_num"></p>
                              <div class="rl_btn_box">
                                      <a href="ticket/Ticketing" class="btn_rank_st">예매</a>
                                  <a href="/MovieInfo/Index?mId=M000077286" class="btn_rank_st movie_datalink_2 movie_info">정보</a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </li>
          <li>
              <div class="flip-card" id="movie_data_3">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="" alt="">
                        <div class="rl_info_box">
                            <p class="rank_num"></p>
                        </div>
                    </div>
                    <div class="flip-card-back">
                        <img src="" alt="">
                        <div class="rl_info_box">
                            <p class="rank_num"></p>
                            <div class="rl_btn_box">
                                    <a href="ticket/Ticketing" class="btn_rank_st">예매</a>
                                <a href="/MovieInfo/Index?mId=M000126050" class="btn_rank_st movie_datalink_3 movie_info">정보</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        <li>
              <div class="flip-card" id="movie_data_4">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="" alt="">
                        <div class="rl_info_box">
                            <p class="rank_num"></p>
                        </div>
                    </div>
                    <div class="flip-card-back">
                        <img src="" alt="">
                        <div class="rl_info_box">
                            <p class="rank_num"></p>
                            <div class="rl_btn_box">
                                    <a href="ticket/Ticketing" class="btn_rank_st">예매</a>
                                <a href="/MovieInfo/Index?mId=M000126151" class="btn_rank_st movie_datalink_4 movie_info">정보</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        <li>
              <div class="flip-card" id="movie_data_5">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="" alt="">
                        <div class="rl_info_box">
                            <p class="rank_num"></p>
                        </div>
                    </div>
                    <div class="flip-card-back">
                        <img src="" alt="">
                        <div class="rl_info_box">
                            <p class="rank_num"></p>
                            <div class="rl_btn_box">
                                    <a href="ticket/Ticketing" class="btn_rank_st">예매</a>
                                <a href="/MovieInfo/Index?mId=M000125360" class="btn_rank_st movie_datalink_5 movie_info">정보</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
      </ul>
  </div>

   <div class="event_box">
    <!-- 박스 모양 ↑ -->
   
 
        <div class="event_event">이벤트</div>   <!-- 18px맞춤 -->
   
   <!-- <a href=""> <div class="event_most">더보기-></div></a> -->
    <hr class="event_border" style="border: solid 1px #666666;" width="450px">
    <hr class="event_border3" style="border: solid 1px #666666;" width="450px"  style="position: relative;" >
    <div class="event_event2">상영중인영화</div>
    
    <div class="highbox">
    <a href="event/continue_Event"> <div class="event_ticket">
       <div class="event_ticket_letter">진행중인 이벤트</div>
    </div></a>
    <a href="movie_info/NowPlayRank"> <div class="event_ing">
        <div class="event_ticket_letter2">현재 상영중인 영화</div>
    </div></a>
  </div>
    <!-- 공지사항(announcement),자주묻는질문 -->
    <div class="midlebox">
    <div class="announcement">
        <div class="announcement_letter">공지사항</div>
        <hr class="event_border2" style="border: solid 1px #666666;" width="430px">
        <div class="announcement_letter2">
            <ul style="line-height:290%">
            <c:forEach items="${item}" var="item">
            	<li><a href="serviceCenter/BoardList" style="color:black;">[공지] ${item.subject}</a></li>
            </c:forEach>
            <c:if test="${item.size() eq 0}">
            	<li><a href="serviceCenter/BoardList" style="color:black;">[공지가 아직 등록 되지 않았습니다.]</a></li>
            </c:if>
        </ul>
        </div>
    </div>
    <div class="qna">
        <div class="qna_letter">자주 묻는 질문</div>
        <hr class="event_border2" style="border: solid 1px #666666;" width="460px">
        <div class="qna_letter2">
            <ul style="line-height:290%">
            <c:forEach items="${list}" var="list">
            	<li><a href="serviceCenter/Faq" style="color:black;">Q. ${list.subject}</a></li>
            </c:forEach>
             <c:if test="${list.size() eq 0}">
            	<li><a href="serviceCenter/Faq" style="color:black;">[FAQ가 아직 등록 되지 않았습니다.]</a></li>
            </c:if>
            </ul>
        </div>
    </div>
  </div>
    <!-- 영화순위,예매,고객센터,마이페이지 -->
    <div class="Box_tool">
       <a href="movie_info/NowPlayRank">  <div class="movie_ranking"></div> </a>
       <a href="ticket/Ticketing">  <div class="ticketing"></div> </a> 
       <a href="serviceCenter/CenterService">  <div class="service_center"></div> </a> 
       <div class="mypage" onclick="user()"></div>

    </div>
</div>
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
<jsp:include page="include/body.jsp"></jsp:include>
</body>
</html>