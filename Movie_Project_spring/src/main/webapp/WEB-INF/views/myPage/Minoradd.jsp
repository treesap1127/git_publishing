<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../../../css/myPage/Minoradd.css">
    <link rel="stylesheet" href="../../../../../css/style/style.css">
    <script>
      function readURL(input) {
    	  if (input.files && input.files[0]) {
    	    var reader = new FileReader();
    	    reader.onload = function(e) {
    	      document.getElementById('preview').src = e.target.result;
    	    };
    	    reader.readAsDataURL(input.files[0]);
    	  } else {
    	    document.getElementById('preview').src = "";
    	  }
    	}

      $(function(){
    	  const msg = '${msg}';
     	   if(msg) alert("모든 항목을 입력하여 주세요.");
      })
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
                <div class="title_plus_text" id="${sessionScope.member.userName}">${sessionScope.member.userName} 사용자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="../../../../../../../../myPage/myPage" class="mylink">마이페이지</a></div>
                </c:if>
                <c:if test="${sessionScope.member.grade==2}">
                <div class="title_plus_text" id="${sessionScope.member.userName}">${sessionScope.member.userName} 영화 관리자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="../../../../../../../../myPage/myCinema" class="mylink">영화관 관리 페이지</a></div>
                </c:if>
                <c:if test="${sessionScope.member.grade>=10}">
                <div class="title_plus_text" id="${sessionScope.member.userName}">${sessionScope.member.userName} 웹 관리자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="../../../../../../../../webadmin/admin" class="mylink">웹 관리 페이지</a></div>
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
      <div class="top_box_name"style="width: 100%">${sessionScope.member.userName}님은 <span style="color: brown;width: 100%;">영화관 관리자 회원</span>입니다</div>
      <div class="top_box_info">회원 등급은: 웹관리자, 영화관 관리자 회원, 일반 회원으로 나뉩니다.</div>
    </div>
<div class="mypage">
  <div class="mypage_inline">

    <!-- 아래부터 입력 폼 -->
    <form method="post" enctype="multipart/form-data">
	   <div class="add_box">
 	   		<input name="theaterName" value="${item.theaterName}"style="display:none;">
	   		<input name="cinemaCode" value="${item.cinemaCode}"style="position: relative;top: 30px;display:none;">
	   		
		    	<label style="position: relative;top:30px;">영화명:</label> 
			<input type="text" name="movieName" class="form-control" style="position: relative;left: 55px;">
		  		<label style="position: relative;top: 30px;">날짜:</label>
			<input type="date" name="movieDate"class="form-control" style="width:13%;position: relative;left: 55px;">
		  		<label style="position: relative;top: 30px;">시간:</label>
			<input type="time" name="movieTime"class="form-control" style="width:13%;position: relative;left: 55px;">
				<label style="position: relative;top: 25px;">연령 선택:</label>
			 <select name="movieRating" id="selectBox" class="form-control" style="padding-top:0;padding-bottom:0; width:13%;position: relative;left: 80px;">
       			<option value="전체">전체 이용가</option>
       			<option value="12">12세 이용가</option>
       			<option value="15">15세 이용가</option>
       			<option value="19">19세 이용가</option>
       		</select>
            <div class="image-container">
            	<label class="poster_name" style="position: relative;top: 30px;">영화포스터 (1:1.3의 비율로 된 이미지를 삽입하시길 권고 합니다.)</label> 
			    <input type="file" name="movieImag" class="file_input form-control" onchange="readURL(this);"> 
				<img id="preview" />
			</div>
		</div>
	  	<div style="display:flex; margin-left: 22px;">
	  		<button class="btn btn-primary btnadd buttonadd" style="margin-right:20px;">등록하기</button>
			<a href="../${item.theaterName}/movie" class="btn btn-danger btnadd">뒤로가기</a>
		</div>
	</form>
   <!-- 아래 어찌 나오는지 확인 시켜줌 -->
   
		
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
