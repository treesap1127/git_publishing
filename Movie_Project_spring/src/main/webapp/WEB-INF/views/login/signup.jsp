<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Project movie studio</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/login/signup.css">
<link rel="stylesheet" href="../css/style/style.css">
<script>
	function check_id_Async() {
		const form = document.getElementById("signup_form");
		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			console.log(xhr.readyState);

			if (xhr.readyState == XMLHttpRequest.DONE) {
				if (xhr.status == 200) {
					const result = xhr.responseText;

					if (result == "OK") {
						alert(`\${form.id.value} 는 사용가능한 아이디 입니다`);
						form.checkId.value = form.id.value;
					} else
						alert(`\${form.id.value} 는 이미 사용중인 아이디 입니다`);
				}
			}
		}

		xhr.open("GET", `checkId?id=\${form.id.value}`, true);

		xhr.send(); 

	}
	function signup() {
		const form = document.getElementById("signup_form");
		const regx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=()]).*$/;

		if (form.checkId.value != form.id.value) { //여기서 값이 같은거 확인
			alert("아이디 중복검사를 해 주세요");
			return;
		}

		if (form.id.value == "") {
			alert("아이디를 입력 해 주세요");
			form.id.focus();
			return;
		}

		if (form.passwd.value == "") {
			alert("비밀번호를 입력 해 주세요");
			form.passwd.focus();
			return;
		}
		if (!regx.test(form.passwd.value)) {
			alert("특수문자,문자,숫자 포함 형태의 8~15자리 이내로 쓰시오");
			form.passwd.focus();
			return;
		}

		if (form.passwd_confirm.value == "") {
			alert("비밀번호 확인를 입력 해 주세요");
			form.passwd_confirm.focus();
			return;
		}

		if (form.passwd.value != form.passwd_confirm.value) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			form.passwd.value == "";
			form.passwd_confirm.value == "";
			form.passwd.focus();
			return;
		}
		if (form.userName.value == "") {
			alert("사용자 이름을 입력 해 주세요");
			form.userName.focus();
			return;
		}
		if (form.tel.value == "") {
			alert("전화번호를 입력 해 주세요");
			form.tel.focus();
			return;
		}
		if (form.email.value == "") {
			alert("이메일을 입력 해 주세요");
			form.email.focus();
			return;
		}
		
		form.submit();//회원가입 을 타입으로 따로 지정해줘서 결과값 전달을 해줘야함
	}
	window.onload = function() {
		//여기서 함수까진 들어가는데 답은 못받음.
		var s = '${msg}';
		var checklogin = '${checkLogin}';
		if (checklogin == 'true') {
			alert("회원가입이 완료되었습니다!\n 로그인을 해주세요");
		}
	}
</script>

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
     <div class="signup_box">
      
      <div class="center">
       <h1>회원가입</h1>
       <form id="signup_form" method="post">
         <input type="hidden" name="checkId">
         <div class="txt_field">								
           <input type="text" name="id" required>							
           <label>아이디:</label>		
           <span><button type="button" class="btn btn-light" onclick="check_id_Async()">중복확인</button></span>			
         </div>
         <div class="txt_field">
           <input type="password" name="passwd" required>
           <p>*(특수문자, 문자, 숫자 포함 형태의 8~15자리 이내)</p>
           <span></span>							
           <label>비밀번호:</label>
         </div>						
         
         <div class="txt_field">				
           <input type="password" name="passwd_confirm" required>
           <span class="fore"></span>
           <label>비밀번호 확인:</label>
         </div>
         <div class="txt_field">				
           <input type="text" name="userName" required>
           <span></span>
           <label>사용자 이름:</label>
         </div>		
         <div class="txt_field">				
           <input type="text" name="tel" required>
           <span></span>
           <label>전화번호:</label>
         </div>  
         <div class="txt_field">				
           <input type="text" name="email" required>
           <span></span>
           <label>이메일:</label>
         </div>
     
         <div class="pass"></div>
              <input type="submit" value="회원가입" onclick="signup()">			
          <div class="signup_link">
               <a href="../login">로그인 하러 가기</a>  
           </div> 
       </form>
     
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