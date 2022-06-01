<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
    <link rel="stylesheet" href="../css/myPage/mypage.css">
    <link rel="stylesheet" href="../css/style/style.css">
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
        $(".cancel").click(function(){
        	ticket_code=$(this).attr("id");
        	ticketCode={ticketCode:ticket_code}
        	  if(confirm("예매를 취소하시겠습니까?. \n 환불은 3~5일내로 될 예정입니다.")){
            		$.ajax({
            		  url:"/myPage/cancel",
           		      method: "POST",
           		      contentType: "application/json",
           		      dataType: "text",
           		      data: JSON.stringify(ticketCode),
           		      success: code => {
           		    	  		if(code="true"){
           		    	  			alert("예매 취소가 완료 되었습니다.");
           		    	  		location.reload();
           		    	  		}
           		    	  		else{
           		    	  			alert("취소가 되지 않는 경우 관리자에게 문의 하세요.");
           		    	  		}
	           		      },
	       		       error: (xhr, result2) => console.log(`[실패] print`)
	        			});
            		}
        		 	
            	  })
        });
    </script>
    <style>
    	.title_plus_text{
    	color:white}
    </style>
</head>

<body>
  <div class="box_case">
    <!--좌우크기조절-->
    <div class="title">
      <a href="../../../../" class="main_back">
        <img src="../img/root/메인아이콘.jpg" alt="메인아이콘" />
        <div class="title_name">Miner Cinema</div>
      </a>
    </div>
<div class="title_right">
	                <a href="../../such"><img src="../img/root/돋보기블랙.jpg" alt="돋보기아이콘" style="height: 22px; width: 25px;" /></a>
	                <div class="login_link"><a href="../../serviceCenter/CenterService" >고객센터</a></div>
	              	<c:if test="${sessionScope.member.grade==0}">	<div class="login_link"><a href="../../login">로그인</a></div></c:if>
	              	<c:if test="${sessionScope.member.grade>0}">	<div class="login_link"><a href="../../logout">로그아웃</a></div></c:if>
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
    <div class="top_box">
      <div class="top_box_name">${sessionScope.member.userName}님은 <span style="color: brown;">일반 회원</span>입니다</div>
      <div class="top_box_info">회원 등급은: 웹관리자, 영화관 관리자 회원, 일반 회원으로 나뉩니다.</div>
    </div>
<div class="mypage" style="height: 2300px;">
  <div class="mypage_inline">
    <div class="my_page" style="display: flex;">
      <div class="my_top">
        <div class="my_bank_name"><span class="my_bank_title">MY영화</span></div>
        <div class="my_back_box">
          <a href="mymovie"class="my_back_box_href"><div class="my_back_box_">
            <img src="../img/mypage/본 영화.png" alt="">
            <div style="color: black;">내가 본 영화</div>
          </div></a>
        </div>
      </div>
      
    </div>




      <div class="ticket_check_cancle">

        <div class="Cbutton" style="display: flex;">
          <button class="check" id="check_menu">예매내역</button><button class="cancle cb">취소내역</button>
        </div>

        <div class="com_ticket_info drag_css">
          <div class="com_tic_name">관람 가능 예매내역 (단, 취소가능 시간이 지나면 예매취소 버튼은 보이지 않습니다.)</div>
		
		<c:forEach var="TicketItem" items="${TicketItem}">
		<c:if test="${TicketItem.cancel==0}">
          <div class="fail_info">
            <img src="${TicketItem.image}" alt="영화 사진"class="complete_img">
            <div class="complete_text">
              <div>예매번호: <span style="color: red;">${TicketItem.ticketCode}</span></div>
              <div>※ 위 예매번호로 해당극장의 무인발권기/매표소에서 티켓을 찾으세요</div>
              <div>영화: <img src="../img/ticketing/${TicketItem.movieRating}.png" alt="연령제한" />${TicketItem.movieName}</div>
              <div>극장: ${TicketItem.theaterName}</div>
              <div>일시: ${TicketItem.movieDate} ${TicketItem.movieTime}</div>
              <div>인원: <c:if test="${TicketItem.teenager ne 0}">청소년 ${TicketItem.teenager}&nbsp;</c:if> <c:if test="${TicketItem.adult ne 0}">성인 ${TicketItem.adult}&nbsp;</c:if></div>
              <div style="display: flex;justify-content: space-between;">
	              <div>좌석: ${TicketItem.sitCode}</div>
	              <button id="${TicketItem.ticketCode}"class="btn btn-danger cancel">예매 취소</button>
              </div>
            </div>
          </div>
          </c:if>
		</c:forEach>

          <hr class="lhr6">
        </div>
        
        <div class="c_info_box">
          <div class="c_info">
            <div class="c_info_name">예매하고 티켓 찾기</div>
            <div class="c_info_text">-예매완료 시 생성되는 예매번호로 매표소 및 무인 발권기에서 티켓을 수령할 수 있습니다.<br>-예고편 상영 등 극장 사정에 의해 영화시작이 10여분 차이 날 수 있습니다.</div>
            <div class="c_info_text2">※ 영화 상영시작 이후에는 티켓발권 및 예매취소가 불가능할 수 있습니다. 일부 극장은 상영시작 이후 입장이 제한될 수 있으니, 반드시 상영시작 시간 내에 발권 후 입장해 주세요.<br>※ 청소년 관람불가 영화는 보호자를 동반해도 만 18세 미만 고객은 관람이 불가합니다. 상영관 입장 시, 신분증을 지참하시기 바랍니다.</div>
          </div>

          <div class="c_info">
            <div class="c_info_name">예매를 취소하고 싶을 때</div>
            <div class="c_info_text">-예매취소는 각 극장별 취소가능시간까지만 가능하며, 가능시간 이후에는 취소가 불가능하오니 반드시 취소가능시간을 확인하시기 바랍니다.<br>-고객센터 및 각 극장에 전화상으로 취소는 불가능하며 인터넷상에서 취소가 불가능한 경우 관람시간 전에 극장에 방문하시어 현장 취소하셔야 합니다.<br>-단, 극장에서 발권한 후에는 시간에 관계없이 온라인 취소는 불가하며 현장취소만 가능 합니다.<br>-예매완료 후에는 부분취소나 시간 변동을 할 수 없습니다. 예매내역 전체를 취소한 후 재예매를 하셔야 합니다.</div>
          </div>

          <div class="c_info" style="height: 200px;">
            <div class="c_info_name">극장 현장에서 취소 했을 때</div>
            <div class="c_info_text">-극장 현장에서 취소하신 경우 취소 내역은 관람일 다음날 오전 중에 반영 됩니다.<br>-이 때 결제도 함께 취소되니 현장 취소시에 유의하시기 바랍니다.</div>
          </div>

          <div class="c_info">
            <div class="c_info_name">환불규정</div>
            <div class="c_info_text">영화 예매 후, 취소 가능시간 내에 인터넷에서 취소를 하면 예매 수수료 포함 전액이 환불됩니다<br><br><span class="c_info_b">-예매권, 할인권</span>: 결제 취소시 자동 환불. 단 예매권, 할인권의 경우 사용기간이 지난 시점이라면 환불 불가<br><span class="c_info_b">-신용카드</span> : 결제일과 취소일이 다를 경우 영업일 기준 3~5일 정도 소요<br><span class="c_info_b">-체크카드</span> : 결제일과 취소일이 다를 경우 영업일 기준 3~5일 정도 소요<br><span class="c_info_b">-계좌이체</span>: 취소한 시점의 은행 영업일로 부터 1~2일내 고객님 계좌로 자동 환불<br><span class="c_info_b">-휴대폰결제</span>: 결제 당월 취소 시 취소 당일 환불 (익월 취소 시 결제 익월 28일 이후 예치금으로 환불)</div>
          </div>
        </div>

      </div>





      <div class="ticket_sale" style="display: none;">

        <div class="Cbutton" style="display: flex;">
          <button class="check" >예매내역</button><button class="cancle cb" id="check_menu">취소내역</button>
        </div>

        <div class="com_ticket_info drag_css">
          <div class="com_tic_name">취소한 예매</div>

		<c:forEach var="TicketItem" items="${TicketItem}">
		<c:if test="${TicketItem.cancel eq '1'}">
          <div class="fail_info">
            <img src="${TicketItem.image}" alt="영화 사진"class="complete_img">
            <div class="complete_text">
              <div>예매번호: <span style="text-decoration: line-through;">${TicketItem.ticketCode}</span></div>
              <div>※ 위 예매번호로 해당극장의 무인발권기/매표소에서 티켓을 찾으세요</div>
              <div>영화: <img src="../img/ticketing/${TicketItem.movieRating}.png" alt="연령제한" />${TicketItem.movieName}</div>
              <div>극장: ${TicketItem.theaterName}</div>
              <div>일시: ${TicketItem.movieDate} ${TicketItem.movieTime}</div>
              <div>인원: <c:if test="${TicketItem.teenager ne 0}">청소년 ${TicketItem.teenager}&nbsp;</c:if> <c:if test="${TicketItem.adult ne 0}">성인 ${TicketItem.adult}&nbsp;</c:if></div>
              <div>좌석: ${TicketItem.sitCode}</div>
            </div>
          </div>
 			</c:if>
		</c:forEach>

          <hr class="lhr6">
        </div>
        
        <div class="c_info_box">
          <div class="c_info">
            <div class="c_info_name">예매하고 티켓 찾기</div>
            <div class="c_info_text">-예매완료 시 생성되는 예매번호로 매표소 및 무인 발권기에서 티켓을 수령할 수 있습니다.<br>-예고편 상영 등 극장 사정에 의해 영화시작이 10여분 차이 날 수 있습니다.</div>
            <div class="c_info_text2">※ 영화 상영시작 이후에는 티켓발권 및 예매취소가 불가능할 수 있습니다. 일부 극장은 상영시작 이후 입장이 제한될 수 있으니, 반드시 상영시작 시간 내에 발권 후 입장해 주세요.<br>※ 청소년 관람불가 영화는 보호자를 동반해도 만 18세 미만 고객은 관람이 불가합니다. 상영관 입장 시, 신분증을 지참하시기 바랍니다.</div>
          </div>

          <div class="c_info">
            <div class="c_info_name">예매를 취소하고 싶을 때</div>
            <div class="c_info_text">-예매취소는 각 극장별 취소가능시간까지만 가능하며, 가능시간 이후에는 취소가 불가능하오니 반드시 취소가능시간을 확인하시기 바랍니다.<br>-고객센터 및 각 극장에 전화상으로 취소는 불가능하며 인터넷상에서 취소가 불가능한 경우 관람시간 전에 극장에 방문하시어 현장 취소하셔야 합니다.<br>-단, 극장에서 발권한 후에는 시간에 관계없이 온라인 취소는 불가하며 현장취소만 가능 합니다.<br>-예매완료 후에는 부분취소나 시간 변동을 할 수 없습니다. 예매내역 전체를 취소한 후 재예매를 하셔야 합니다.</div>
          </div>

          <div class="c_info" style="height: 200px;">
            <div class="c_info_name">극장 현장에서 취소 했을 때</div>
            <div class="c_info_text">-극장 현장에서 취소하신 경우 취소 내역은 관람일 다음날 오전 중에 반영 됩니다.<br>-이 때 결제도 함께 취소되니 현장 취소시에 유의하시기 바랍니다.</div>
          </div>

          <div class="c_info">
            <div class="c_info_name">환불규정</div>
            <div class="c_info_text">영화 예매 후, 취소 가능시간 내에 인터넷에서 취소를 하면 예매 수수료 포함 전액이 환불됩니다<br><br><span class="c_info_b">-예매권, 할인권</span>: 결제 취소시 자동 환불. 단 예매권, 할인권의 경우 사용기간이 지난 시점이라면 환불 불가<br><span class="c_info_b">-신용카드</span> : 결제일과 취소일이 다를 경우 영업일 기준 3~5일 정도 소요<br><span class="c_info_b">-체크카드</span> : 결제일과 취소일이 다를 경우 영업일 기준 3~5일 정도 소요<br><span class="c_info_b">-계좌이체</span>: 취소한 시점의 은행 영업일로 부터 1~2일내 고객님 계좌로 자동 환불<br><span class="c_info_b">-휴대폰결제</span>: 결제 당월 취소 시 취소 당일 환불 (익월 취소 시 결제 익월 28일 이후 예치금으로 환불)</div>
          </div>
        </div>

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
