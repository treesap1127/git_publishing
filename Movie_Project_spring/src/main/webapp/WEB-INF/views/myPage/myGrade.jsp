<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
<link href="../css/myPage/my_grade.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/style/style.css">
</head>
<body>
        <div class="box_case"><!--좌우크기조절-->
            <hr class="title_hr">
            <div class="title">
              <a href="../../../../../../../" class="main_back">
                <img src="../../../../../../../../img/root/메인아이콘.jpg" alt="메인아이콘"/>
                <div class="title_name">Minor Cinema</div>
              </a>
            </div>

               <div class="title_right">
                   <div class="login_link"><a href="../../../../../../../../serviceCenter/CenterService" >고객센터</a></div>
                    <c:if test="${sessionScope.member.grade==0}">   <div class="login_link"><a href="../../../../../../../../login">로그인</a></div></c:if>
                    <c:if test="${sessionScope.member.grade>0}">   <div class="login_link"><a href="../../../../../../../../logout">로그아웃</a></div></c:if>
               </div>
               <c:if test="${sessionScope.member.grade==1}">
                <div class="title_plus_text">${sessionScope.member.userName} 사용자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="../../../../../../../../myPage/myPage" class="mylink">마이페이지</a></div>
                </c:if>
                <c:if test="${sessionScope.member.grade==2}">
                <div class="title_plus_text">${sessionScope.member.userName} 영화 관리자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="../../../../../../../../myPage/myCinema" class="mylink">영화관 관리 페이지</a></div>
                </c:if>
                <c:if test="${sessionScope.member.grade>=10}">
                <div class="title_plus_text">${sessionScope.member.userName} 웹 관리자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="../../../../../../../../webadmin/admin" class="mylink">웹 관리 페이지</a></div>
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

  <div class="gray_main">
   <div class="grade_title">
    <div class="grade_title_text">나의 평점</div>
    </div>
    <div class="grade_box">

      <div class="grade_info">
       <!--빈 박스--> 
       <div class="grade_info_box">
          <div class="grade_empty_text">등록된 평점이 없습니다</div>
        </div>
<!--1번 박스 -->
          <div style="display: flex;"class="grade_info_box">
            <div class="grade_name">
              <div style="display: flex;">
              <div class="my_movie_title">영화명 : </div>
              <div class="my_movie_name">신비한 동물들과 덤블도어의 비밀</div>
            </div>
              <div class="my_grade"style="display: flex;">
              <div class="my_star">나의 평점 :&nbsp;</div><img id="grade_1"src="img/my_grade/star_check.png"><img id="grade_2"src="img/my_grade/star_check.png"><img id="grade_3"src="img/my_grade/star_check_none.png"><img id="grade_4"src="img/my_grade/star_check_none.png"><img id="grade_5"src="img/my_grade/star_check_none.png">
            </div>
           </div>
            <div class="grade_subject" style="display: flex;">
              <div style="width: 75px;">
                리뷰 내용:
              </div>
              <div class="grade_subject_info">
                진짜 너무 명작입니다. 영화의 감동이 흩날리는 벚꽃의 애환을 담은 듯이 감동 적이었습니다. 저 두 연인이 꼭 다시 만나길 기원합니다."사랑은 돌아오는거야!!"
              </div>
              </div>
          </div>
        <!--1번 박스 끝 -->
<!--1번 박스 -->
<div style="display: flex;"class="grade_info_box">
  <div class="grade_name">
    <div style="display: flex;">
    <div class="my_movie_title">영화명 : </div>
    <div class="my_movie_name">신비한 동물들과 덤블도어의 비밀</div>
  </div>
    <div class="my_grade"style="display: flex;">
    <div class="my_star">나의 평점 :&nbsp;</div><img id="grade_1"src="img/my_grade/star_check.png"><img id="grade_2"src="img/my_grade/star_check.png"><img id="grade_3"src="img/my_grade/star_check_none.png"><img id="grade_4"src="img/my_grade/star_check_none.png"><img id="grade_5"src="img/my_grade/star_check_none.png">
  </div>
 </div>
  <div class="grade_subject" style="display: flex;">
    <div style="width: 75px;">
      리뷰 내용:
    </div>
    <div class="grade_subject_info">
      진짜 너무 명작입니다. 영화의 감동이 흩날리는 벚꽃의 애환을 담은 듯이 감동 적이었습니다. 저 두 연인이 꼭 다시 만나길 기원합니다."사랑은 돌아오는거야!!"
    </div>
    </div>
</div>
<!--1번 박스 끝 -->
<!--1번 박스 -->
<div style="display: flex;"class="grade_info_box">
  <div class="grade_name">
    <div style="display: flex;">
    <div class="my_movie_title">영화명 : </div>
    <div class="my_movie_name">신비한 동물들과 덤블도어의 비밀</div>
  </div>
    <div class="my_grade"style="display: flex;">
    <div class="my_star">나의 평점 :&nbsp;</div><img id="grade_1"src="img/my_grade/star_check.png"><img id="grade_2"src="img/my_grade/star_check.png"><img id="grade_3"src="img/my_grade/star_check_none.png"><img id="grade_4"src="img/my_grade/star_check_none.png"><img id="grade_5"src="img/my_grade/star_check_none.png">
  </div>
 </div>
  <div class="grade_subject" style="display: flex;">
    <div style="width: 75px;">
      리뷰 내용:
    </div>
    <div class="grade_subject_info">
      진짜 너무 명작입니다. 영화의 감동이 흩날리는 벚꽃의 애환을 담은 듯이 감동 적이었습니다. 저 두 연인이 꼭 다시 만나길 기원합니다."사랑은 돌아오는거야!!"
    </div>
    </div>
</div>
<!--1번 박스 끝 -->
<!--1번 박스 -->
<div style="display: flex;"class="grade_info_box">
  <div class="grade_name">
    <div style="display: flex;">
    <div class="my_movie_title">영화명 : </div>
    <div class="my_movie_name">신비한 동물들과 덤블도어의 비밀</div>
  </div>
    <div class="my_grade"style="display: flex;">
    <div class="my_star">나의 평점 :&nbsp;</div><img id="grade_1"src="img/my_grade/star_check.png"><img id="grade_2"src="img/my_grade/star_check.png"><img id="grade_3"src="img/my_grade/star_check_none.png"><img id="grade_4"src="img/my_grade/star_check_none.png"><img id="grade_5"src="img/my_grade/star_check_none.png">
  </div>
 </div>
  <div class="grade_subject" style="display: flex;">
    <div style="width: 75px;">
      리뷰 내용:
    </div>
    <div class="grade_subject_info">
      진짜 너무 명작입니다. 영화의 감동이 흩날리는 벚꽃의 애환을 담은 듯이 감동 적이었습니다. 저 두 연인이 꼭 다시 만나길 기원합니다."사랑은 돌아오는거야!!"
    </div>
    </div>
</div>
<!--1번 박스 끝 -->
<!--1번 박스 -->
<div style="display: flex;"class="grade_info_box">
  <div class="grade_name">
    <div style="display: flex;">
    <div class="my_movie_title">영화명 : </div>
    <div class="my_movie_name">신비한 동물들과 덤블도어의 비밀</div>
  </div>
    <div class="my_grade"style="display: flex;">
    <div class="my_star">나의 평점 :&nbsp;</div><img id="grade_1"src="img/my_grade/star_check.png"><img id="grade_2"src="img/my_grade/star_check.png"><img id="grade_3"src="img/my_grade/star_check_none.png"><img id="grade_4"src="img/my_grade/star_check_none.png"><img id="grade_5"src="img/my_grade/star_check_none.png">
  </div>
 </div>
  <div class="grade_subject" style="display: flex;">
    <div style="width: 75px;">
      리뷰 내용:
    </div>
    <div class="grade_subject_info">
      진짜 너무 명작입니다. 영화의 감동이 흩날리는 벚꽃의 애환을 담은 듯이 감동 적이었습니다. 저 두 연인이 꼭 다시 만나길 기원합니다."사랑은 돌아오는거야!!"
    </div>
    </div>
</div>
<!--1번 박스 끝 -->
<!--1번 박스 -->
<div style="display: flex;"class="grade_info_box">
  <div class="grade_name">
    <div style="display: flex;">
    <div class="my_movie_title">영화명 : </div>
    <div class="my_movie_name">신비한 동물들과 덤블도어의 비밀</div>
  </div>
    <div class="my_grade"style="display: flex;">
    <div class="my_star">나의 평점 :&nbsp;</div><img id="grade_1"src="img/my_grade/star_check.png"><img id="grade_2"src="img/my_grade/star_check.png"><img id="grade_3"src="img/my_grade/star_check_none.png"><img id="grade_4"src="img/my_grade/star_check_none.png"><img id="grade_5"src="img/my_grade/star_check_none.png">
  </div>
 </div>
  <div class="grade_subject" style="display: flex;">
    <div style="width: 75px;">
      리뷰 내용:
    </div>
    <div class="grade_subject_info">
      진짜 너무 명작입니다. 영화의 감동이 흩날리는 벚꽃의 애환을 담은 듯이 감동 적이었습니다. 저 두 연인이 꼭 다시 만나길 기원합니다."사랑은 돌아오는거야!!"
    </div>
    </div>
</div>
<!--1번 박스 끝 -->

      </div>
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