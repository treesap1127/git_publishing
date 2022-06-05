<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
    <link rel="stylesheet" href="../../css/myPage/adminTable.css">
    <link rel="stylesheet" href="../../css/style/style.css">
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
        });
        $(".menu_add").click(function(){
          $(".ticket_check_cancle").css('display','none');
          $(".ticket_sale").css('display','none');
        });
        });
    </script>
    <style>
    	.title_plus_text{
    	color:white}
    </style>
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
    <div class="top_box">
      <div class="top_box_name">${sessionScope.member.userName}님은 <span style="color: brown;">관리자 회원</span>입니다</div>
      <div class="top_box_info">회원 등급은: 웹관리자, 영화관 관리자 회원, 일반 회원으로 나뉩니다.</div>
    </div>
    <!-- 관리자 문장 끝 아래 시작 -->
	<!--승인 설정과 (승인 된 테이블 상영관 리스트 볼 수 있게->삭제까지 가능!)-->
<div class="mypage" style="height: 1300px;">
  <div class="mypage_inline">
    <div class="my_page" style="display: flex;">
      <div class="my_top">
        <div class="my_bank_name"><span class="my_bank_title">관리자 승인</span></div>
        <div class="my_back_box" style="border-right: 1px solid #dddddd">
          <a href="../../webadmin/admin"class="my_back_box_href">
	          <div class="my_back_box_">
	            <img src="../../img/admin/check.png" alt="" style="margin:25px;">
	            <div style="color: black;">영화 관리자 승인</div>
	          </div>
          </a>
        </div>
      </div>
      <div class="my_top">
        <div class="my_bank_name"><span class="my_bank_title">영화관 관리</span></div>
        <div class="my_back_box">
          <a href="../../webadmin/myCinema"class="my_back_box_href">
	          <div class="my_back_box_">
	            <img src="../../img/admin/folder.png" alt="" style="width:200px">
	            <div style="color: black;">영화 관리자 표</div>
	          </div>
          </a>
        </div>
      </div>
      
  	  </div>

 <div class="theater_top">영화관 관리 페이지<br><span style="font-size: 12px">(스크롤로 모든 목록을 확인 할 수 있습니다.)</span></div>

	<div class="theater_table drag_css">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>영화관 코드</th>
					<th>아이디</th>
					<th>영화관이름</th>
					<th>시/도</th>
					<th>전화번호</th>
					<th>관리</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${list.size() < 1}">
						<tr>
							<th colspan="7">등록 된 영화관이 없습니다</th>
						</tr>
					</c:if>
				<c:forEach items="${list}" var="item">
						<tr>
							<th>${item.cinemaCode}</th>
							<th>${item.id}</th>
							<th>${item.movieAreaName}</th>
							<th>${item.bigCity}</th>
							<th>${item.tel}</th>
							<th>
								<a href="cinemaUpdate/${item.cinemaCode}" class="btn btn-outline-primary" style="margin-right: 10px;">영화관 권한 편집</a>
								<a href="여기에 영화관 삭제 ㄱ" class="btn btn-outline-danger" style="margin-right: 10px;">영화관 관리 권한 삭제</a>
							</th>
						</tr>
				</c:forEach>
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
