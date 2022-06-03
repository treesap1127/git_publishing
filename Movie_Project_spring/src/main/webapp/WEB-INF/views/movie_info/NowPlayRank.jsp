<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../include/header.jsp"></jsp:include> 
    <link rel="stylesheet" href="../../resources/css/style/style.css">
    <link rel="stylesheet" href="../../resources/css/movie_info/nowplayrank.css">
    <script src="../../js/NowPlayRank.js"></script>
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
     <div class="midbox">
       <div class="moviechartbox">
            <div class="moviechart">오늘의 박스오피스 순위</div>
          </div>
      <div class="moviebox">
      
		      
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
                        <a href="../../ticket/Ticketing" class="btn_rank_st">예매</a>
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
                                      <a href="../../ticket/Ticketing" class="btn_rank_st">예매</a>
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
                                    <a href="../../ticket/Ticketing" class="btn_rank_st">예매</a>
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
                                    <a href="../../ticket/Ticketing" class="btn_rank_st">예매</a>
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
                                    <a href="../../ticket/Ticketing" class="btn_rank_st">예매</a>
                                <a href="/MovieInfo/Index?mId=M000125360" class="btn_rank_st movie_datalink_5 movie_info">정보</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        <li>
              <div class="flip-card" id="movie_data_6">
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
                                    <a href="../../ticket/Ticketing" class="btn_rank_st">예매</a>
                                <a href="/MovieInfo/Index?mId=M000125360" class="btn_rank_st movie_datalink_6 movie_info">정보</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        <li>
              <div class="flip-card" id="movie_data_7">
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
                                    <a href="../../ticket/Ticketing" class="btn_rank_st">예매</a>
                                <a href="/MovieInfo/Index?mId=M000125360" class="btn_rank_st movie_datalink_7 movie_info">정보</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        <li>
              <div class="flip-card" id="movie_data_8">
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
                                    <a href="../../ticket/Ticketing" class="btn_rank_st">예매</a>
                                <a href="/MovieInfo/Index?mId=M000125360" class="btn_rank_st movie_datalink_8 movie_info">정보</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        <li>
              <div class="flip-card" id="movie_data_9">
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
                                    <a href="../../ticket/Ticketing" class="btn_rank_st">예매</a>
                                <a href="/MovieInfo/Index?mId=M000125360" class="btn_rank_st movie_datalink_9 movie_info">정보</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        <li>
              <div class="flip-card" id="movie_data_10">
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
                                    <a href="../../ticket/Ticketing" class="btn_rank_st">예매</a>
                                <a href="/MovieInfo/Index?mId=M000125360" class="btn_rank_st movie_datalink_10 movie_info">정보</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
      </ul>
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