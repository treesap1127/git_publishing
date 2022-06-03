<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
<link href="../../../css/serviceCenter/notice_add.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../../css/style/style.css">

<!-- 서머노트를 위해 추가해야할 부분 -->
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
   rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
$('#summernote').summernote();</script>
<!--  -->
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
     <div class="center_box">
      <div class="add_box">자주묻는질문 등록</div>
      <form method="post" class="mt-4">
        <div class="form-floating mt-2">
          <label>제목</label>	
          <div>
          <input type="text" name="subject" class="form-control" placeholder="제목">
          </div>      
          <div style="display: none">					
          <input type="text" name="id" class="form-control" value="${sessionScope.member.id}" placeholder="작성자">		
       		</div>
       		<br>
       		<label>카테고리</label>
       		<select name="category" class="form-control" style="padding-top:0;padding-bottom:0;">
       			<option value="영화예매">영화예매</option>
       			<option value="이벤트">이벤트</option>
       			<option value="결제취소">결제취소</option>
       		</select>
          <br>    
         </div>       	
        <label>내용</label>			
        <div class="mt-2">
          <textarea id="summernote" name="contents" rows="25" cols="123"></textarea>            
        </div> 
   
          <div class="add_setbutton">
          <input type="submit" class="btn btn-outline-primary" value="등록하기" style="margin-right:40px;">
          <a href="../serviceCenter/Faq" class="btn btn-outline-primary">목록가기</a></div>         
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
    </div>
    </div>
    <jsp:include page="../include/body.jsp"></jsp:include>
</body>
</html>