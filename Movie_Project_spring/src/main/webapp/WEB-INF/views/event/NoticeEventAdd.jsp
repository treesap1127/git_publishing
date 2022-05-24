<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
<link href="../css/serviceCenter/notice_update.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/style/style.css">

<!-- 서머노트를 위해 추가해야할 부분 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() {
   //여기 아래 부분
   $('#summernote').summernote({
        height: 500,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",               // 한글 설정
        placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
        
   });
});
</script>


<script>
 $(function(){
  $("#mform").submit(function(){
         var startDate = $('#startDate').val();
         var endDate = $('#endDate').val();
         //-을 구분자로 연,월,일로 잘라내어 배열로 반환
         var startArray = startDate.split('-');
         var endArray = endDate.split('-');   
         //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
         var start_date = new Date(startArray[0], startArray[1], startArray[2]);
         var end_date = new Date(endArray[0], endArray[1], endArray[2]);
              //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
         if(start_date.getTime() > end_date.getTime()) {
             alert("종료날짜보다 시작날짜가 작아야합니다.");
             return false;
         }
      });
 });
</script>

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
     <div class="center_box">
      <div class="update_box">이벤트 등록</div>
      <form method="post" class="mt-4" id="mform">
        <div class="form-floating mt-2">
          <label>제목</label>	
          <div >				
          <input type="text" name="eventName" class="form-control" placeholder="제목">
          </div>        		
          <div style="display: none;">					
          <input type="text" name="id" class="form-control" value="${sessionScope.member.id}" placeholder="작성자" >		
       		</div>
          <br>   
          <div class="file-upload" style="text-align: right;">
            <label for="ex_file">업로드</label>
            <input type="file" id="ex_file">
            이벤트 시작일<input type="date" name="startDate">
			이벤트 종료일<input type="date" name="endDate">
       	 </div>        
        </div>	
        	
        <label>내용</label>			
        <div class="mt-2">
          <textarea id="summernote" name="eventInfo" rows="25" cols="123"></textarea>    
        </div>
        
        <div>        	
          <div class="update_setbutton">
          <input type="submit" class="btn btn-outline-primary" value="등록하기" style="margin-right:40px;">
          <a href="continue_Event" class="btn btn-outline-primary">목록가기</a></div>						
        </div>
        
        
      
      </form>
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
    </div></div>
    <jsp:include page="../include/body.jsp"></jsp:include>
    
</body>
</html>