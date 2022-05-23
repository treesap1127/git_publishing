<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<link href="../../../../../css/serviceCenter/BoardTableList.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/style/style.css">
</head>
<body>
	<div class="box_case">
		<!--좌우크기조절-->
		<div class="title">
			<a href="../../../../" class="main_back"> <img
				src="../../img/root/메인아이콘_흰.jpg" alt="메인아이콘" />
				<div class="title_name">Miner Cinema</div>
			</a>
		</div>
		<div class="title_right">
			<a href="such"><img src="../../img/root/돋보기화이트.jpg" alt="돋보기아이콘"
				style="height: 22px; width: 25px;" /></a>
			<div class="login_link">
				<a href="serviceCenter/CenterService">고객센터</a>
			</div>
			<c:if test="${sessionScope.member.grade==0}">
				<div class="login_link">
					<a href="login">로그인</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.member.grade>0}">
				<div class="login_link">
					<a href="logout">로그아웃</a>
				</div>
			</c:if>
		</div>
		<c:if test="${sessionScope.member.grade==1}">
			<div class="title_plus_text">${sessionScope.member.userName}
				사용자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="myPage">마이페이지</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.member.grade==2}">
			<div class="title_plus_text">${sessionScope.member.userName}
				영화 관리자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="">영화관 관리</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.member.grade>=10}">
			<div class="title_plus_text">${sessionScope.member.userName}
				웹 관리자님 안녕하세요&nbsp;&nbsp;&nbsp; <a href="">웹 관리</a>
			</div>
		</c:if>
	</div>
	<div class="black_box">
		<ul id="main-menu">
			<li><a href="../../../../ticket/Ticketing">예매</a>
				<ul id="sub-menu">
					<li><a href="../../../../ticket/Ticketing"
						aria-label="subemnu">예매하기</a></li>
					<li><a href="../../../../ticket/TicketInformation"
						aria-label="subemnu">예매안내</a></li>
				</ul></li>
			<li><a href="../../../../movie_info/NowPlayRank">영화</a>
				<ul id="sub-menu">
					<li><a href="../../movie_info/NowPlayRank"
						aria-label="subemnu">현재 상영작</a></li>
					<li><a href="../../movie_info/Expected" aria-label="subemnu">상영예정작</a></li>
				</ul></li>
			<li><a href="../../../../event/continue_Event">이벤트</a>
				<ul id="sub-menu">
					<li><a href="../../../../event/continue_Event"
						aria-label="subemnu">진행중인 이벤트</a></li>
					<li><a href="../../../../event/end_Event" aria-label="subemnu">종료된
							이벤트</a></li>
				</ul></li>
		</ul>
	</div>
	<!--여기까지 기본 위 배너 입니다!-->
	<div class="notice_box">
	<div>
		<div>
			<h3 class="tablename">게시판 목록</h3>
		</div>
		<div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>게시판 번호</th>
						<th>게시판명</th>
						<th>댓글</th>
						<th>첨부파일</th>
						<th>공개</th>
						<th>권한</th>	
						<th>관리</th>					
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<th colspan="7">등록 된 게시판이 없습니다</th>
						</tr>
					</c:if>
					
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.boardId}</td>
							<td>${item.subject}</td>
							<td>${item.reply}</td>
							<td>${item.attach}</td>
							<td>${item.secret}</td>
							<td>${item.permission}</td>					
							<td><a href="BoardTableUpdate/${item.boardId}">변경</a> <a href="delete/${item.boardId}">삭제</a>
							 <a href="${item.boardId}/BoardList">게시글</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<a href="BoardTableAdd" class="btn btn-outline-success">추가</a>
		</div>
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
			<div class="bottom_text_3">
				상호 : (주)프로젝트영화 &nbsp;&nbsp;&nbsp; 대표자 : 2조<br> 주소 : 대전광역시 동구
				우암로 352-21 (주)프로젝트영화 <br>
				<br>사업자 등록번호 : 123-45-6789<br>TEL : 02-1234-5678 Email :
				customer@projectCinema.co.kr
			</div>
			<div class="bottom_text_4">© ProjectCinema Co., Ltd All rights
				reservedv.</div>
		</div>
	</div>
	<jsp:include page="../include/body.jsp"></jsp:include>
</body>
</html>