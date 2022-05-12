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
          $(".ticket_sale_").css('display','none');
        });
        $(".menu_add").click(function(){
          $(".ticket_check_cancle").css('display','none');
          $(".ticket_sale").css('display','none');
          $(".ticket_sale_").css('display','block');
        });
        
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
      <div class="top_box_name">OOO님은 <span style="color: brown;">일반 회원</span>입니다</div>
      <div class="top_box_info">회원 등급은: 웹관리자, 영화관 관리자 회원, 일반 회원으로 나뉩니다.</div>
    </div>
<div class="mypage">
  <div class="mypage_inline">
    <div class="my_page" style="display: flex;">
      <div class="my_top">
        <div class="my_bank_name"><span class="my_bank_title">MY계좌</span></div>
        <div class="my_back_box">
          <div class="my_back_box_"style="border-right:1px solid lightgray">
            <div>예매권</div>
            <div style="font-weight: 600;">0매</div>
          </div>
          <div class="my_back_box_">
            <div>할인권</div>
            <div style="font-weight: 600;">0매</div>
          </div>
        </div>
      </div>

      <div class="my_top">
        <div class="my_bank_name"><span class="my_bank_title">MY영화</span></div>
        <div class="my_back_box">
         <div class="my_back_box_"style="border-right:1px solid lightgray">
          <a href="mygrade"><img src="../img/mypage/평점.png" alt="">
            <div style="color: black;">나의 평점 모아보기</div></a>
          </div>
          <div class="my_back_box_">
            <a href="mymovie"><img src="../img/mypage/본 영화.png" alt="">
            <div style="color: black;">내가 본 영화</div></a>
          </div>
        </div>
      </div>
      
    </div>




      <div class="ticket_check_cancle">
        <div class="menu" style="display: flex;">
          <div class="menu1 menu_cancel">예매확인/취소</div>
          <div class="menu2 menu_add">예매권/할인권 등록</div>
        </div>

        <div class="Cbutton" style="display: flex;">
          <button class="check" id="check_menu">예매내역</button><button class="cancle cb">취소내역</button>
        </div>

        <div class="com_ticket_info">
          <div class="com_tic_name">관람 가능 예매내역 1건 (단, 취소가능 시간이 지나면 예매취소 버튼은 보이지 않습니다.)</div>
       
          <div class="fail_info">
            <img src="https://movie-simg.yes24.com/NYes24//MOVIE//M61/M06/M000126106_094624.jpg/dims/thumbnail/170x245/optimize" alt="영화 사진"class="complete_img">
            <div class="complete_text">
              <div>예매번호: <span style="color: red;">00A00000000000</span></div>
              <div>※ 위 예매번호로 해당극장의 무인발권기/매표소에서 티켓을 찾으세요</div>
              <div>영화: <img src="../img/ticketing/19세.png" alt="연령제한" />영화명</div>
              <div>극장: 극장명</div>
              <div>일시: 2022-03-29 (목) 17:20~19:27</div>
              <div>인원: 어린이1명</div>
              <div>좌석: A열 13번</div>
            </div>
          </div>

          <div class="fail_info">
            <img src="https://movie-simg.yes24.com/NYes24//MOVIE//M61/M06/M000126106_094624.jpg/dims/thumbnail/170x245/optimize" alt="영화 사진"class="complete_img">
            <div class="complete_text">
              <div>예매번호: <span style="color: red;">00A00000000000</span></div>
              <div>※ 위 예매번호로 해당극장의 무인발권기/매표소에서 티켓을 찾으세요</div>
              <div>영화: <img src="../img/ticketing/19세.png" alt="연령제한" />영화명</div>
              <div>극장: 극장명</div>
              <div>일시: 2022-03-29 (목) 17:20~19:27</div>
              <div>인원: 어린이1명</div>
              <div>좌석: A열 13번</div>
            </div>
          </div>


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
        <div class="menu" style="display: flex;">
          <div class="menu1 menu_cancel">예매확인/취소</div>
          <div class="menu2 menu_add">예매권/할인권 등록</div>
        </div>

        <div class="Cbutton" style="display: flex;">
          <button class="check" >예매내역</button><button class="cancle cb" id="check_menu">취소내역</button>
        </div>

        <div class="com_ticket_info">
          <div class="com_tic_name">취소한 예매 1건</div>
       
          <div class="fail_info">
            <img src="https://movie-simg.yes24.com/NYes24//MOVIE//M61/M06/M000126106_094624.jpg/dims/thumbnail/170x245/optimize" alt="영화 사진"class="complete_img">
            <div class="complete_text">
              <div>예매번호: <span id="not_check" style="text-decoration: line-through;">00A00000000000</span></div>
              <div>※ 위 예매번호로 해당극장의 무인발권기/매표소에서 티켓을 찾으세요</div>
              <div>영화: <img src="../img/ticketing/19세.png" alt="연령제한"/>영화명</div>
              <div>극장: 극장명</div>
              <div>일시: 2022-03-29 (목) 17:20~19:27</div>
              <div>인원: 어린이1명</div>
              <div>좌석: A열 13번</div>
            </div>
          </div>

          <div class="fail_info">
            <img src="https://movie-simg.yes24.com/NYes24//MOVIE//M61/M06/M000126106_094624.jpg/dims/thumbnail/170x245/optimize" alt="영화 사진"class="complete_img">
            <div class="complete_text">
              <div>예매번호: <span style="text-decoration: line-through;">00A00000000000</span></div>
              <div>※ 위 예매번호로 해당극장의 무인발권기/매표소에서 티켓을 찾으세요</div>
              <div>영화: <img src="../img/ticketing/19세.png" alt="연령제한"/>영화명</div>
              <div>극장: 극장명</div>
              <div>일시: 2022-03-29 (목) 17:20~19:27</div>
              <div>인원: 어린이1명</div>
              <div>좌석: A열 13번</div>
            </div>
          </div>


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




      <div class="ticket_sale_" style="display: none;">
        <div class="menu" style="display: flex;">
          <div class="menu2 menu_cancel">예매확인/취소</div>
          <div class="menu1 menu_add">예매권/할인권 등록</div>
        </div>

        <div class="com_ticket_info">
          <div class="com_tic_name">사용가능 예매권 <span style="color: red;">0</span> 매, 할인권 <span style="color: red;">0</span> 매 <span style="opacity: 0.4;">(2022 년 등록한 예매권 0 매)</span></div>
          <div class="red_txt_box">
            <form class="flex">
              <input type="text" class="red_txt">
              <button class="red_button">등록</button>
            </form>
          </div>

          <div class="c_info_text such_text">- 예매권/할인권은 반드시 로그인을 하셔야만 등록 가능합니다.</div>
          <div class="c_info_text such_text">- 예매권/할인권 등록 후 반드시 영화예매를 완료해야만 영화 관람이 가능합니다.</div>
          <div class="c_info_text such_text">- 입력번호 중 한자라도 틀리거나 공란이 있을 시 등록이 되지 않으니 정확히 확인하시고 입력해주세요.</div>

          <div class="sale_box">

            <div class="sale_box_double">

              <div>
                <label class="table_name">예매권</label>
                <table class="table">
                 <thead class="table-light"><tr><th>구분</th><th>예매권 번호</th><th>사용기한</th><th>사용가능/매수</th><th>특이사항</th></tr></thead>
                 <tr><td>구분</td><td>예매권 번호</td><td>사용기한</td><td>사용가능/매수</td><td>특이사항</td></tr>
                 <tr><td>구분</td><td>예매권 번호</td><td>사용기한</td><td>사용가능/매수</td><td>특이사항</td></tr>
                 <tr><td>구분</td><td>예매권 번호</td><td>사용기한</td><td>사용가능/매수</td><td>특이사항</td></tr>
                 <tr><td>구분</td><td>예매권 번호</td><td>사용기한</td><td>사용가능/매수</td><td>특이사항</td></tr>
                </table>
              </div>
              <div class="such_text_box">
                <div class="c_info_text such_text">- 연간 예매권 등록매수는 1인당 24매(1인 1매권)로 제한됩니다. 24회 초과 시 예매권 등록이 불가합니다.</div>
                <div class="c_info_text such_text">- 동일한 그룹의 예매권은 한 아이디당 4매(1인 1매권)까지만 등록이 가능합니다.</div>
                <div class="c_info_text such_text">- 영화 예매권 결제는 관람요금이 14,000원 이하인 경우에 한합니다. (장당 추가 결제 불가)</div>
              </div>
            </div>
            <div class="sale_box_double_bottom">
              <div>
                <label class="table_name">예매권</label>
                <table class="table">
                 <thead class="table-light"><tr><th>구분</th><th>예매권 번호</th><th>사용기한</th><th>사용가능/매수</th><th>특이사항</th></tr></thead>
                 <tr><td>구분</td><td>예매권 번호</td><td>사용기한</td><td>사용가능/매수</td><td>특이사항</td></tr>
                 <tr><td>구분</td><td>예매권 번호</td><td>사용기한</td><td>사용가능/매수</td><td>특이사항</td></tr>
                 <tr><td>구분</td><td>예매권 번호</td><td>사용기한</td><td>사용가능/매수</td><td>특이사항</td></tr>
                 <tr><td>구분</td><td>예매권 번호</td><td>사용기한</td><td>사용가능/매수</td><td>특이사항</td></tr>
                </table>
              </div>
            </div>

          </div>
          
          
          <hr class="lhr6">
        </div>
        
        <div class="c_info_box">
          <div class="c_info">
            <div class="c_info_name">예매권</div>
            <div class="c_info_text">로그인 후 받으신 고유 번호를 등록하여 원하는 극장과 날짜의 영화를 예매할 수 있는 무료 이용권입니다.<br>단, 예매권의 형태에 따라 사용방법이 상이하오니 예매권이 종류를 정확히 확인 해주세요.<br><br>- 일반영화 예매권 : 사이트 내에서 예매 가능한 모든 극장과 날짜의 영화 예매 가능<br>- 지정영화 예매권 : 예매권에 지정된 영화만 예매 가능<br>- 1+1예매권 : 2인 이상 예매시 1매 예매 가능<br>- 평일 예매권 : 토요일, 일요일, 공휴일을 제외한 평일영화만 예매 가능</div>
         </div>

          <div class="c_info" style="position: relative; top: 30px;">
            <div class="c_info_name">할인권</div>
            <div class="c_info_text">로그인 후 받으신 고유 번호를 등록하여 예매시, 할인권 금액만큼 할인 받고 예매할 수 있는 이용권입니다.<br>※ 예매권/할인권의 분실 또는 도난에 대해서는 영화 사이트가 책임지지 않습니다.</div>
          </div>

          <div class="c_info" style="position: relative;bottom: 90px;">
            <div class="c_info_name" >예매권/할인권 등록</div>
            <div class="c_info_text">- 영화예매권/할인권을 등록하신 이후에는 반드시 나의 예매내역 > 예매권/할인권 에서 등록된 예매권의 사용기간과 사용매수, 할인금액을 확인하시기 바랍니다.<br>- 영화예매권 결제는 관람요금이 14,000원 이하인 경우에 한합니다. (극장별 3D상영버전이나 묶음상영, 일부 극장의 주말 요금이 14,000원을 초과할 경우 예매권 결제 금액에 따라 이용불가)<br>- 영화예매권/할인권 등록만으로 영화관람은 불가능하며, 반드시 예매 마감 시간 전에 영화 사이트에서 영화 예매를 완료하셔야 합니다. (영화, 극장, 날짜, 회차 등 선택 후 마지막 결제 단계에서 예매권, 할인권 사용 가능)<br>- 영화예매권/할인권에 지정된 사용기간은 따로 표기가 있지 않으면 예매일 기준입니다.(관람일이 예매권/할인권 사용기간 이후라도, 기간안에 미리 예매해두시면 됩니다.)<br>- 특정한 영화나 극장이 지정된 영화예매권/할인권 인지 확인해 주세요. 영화가 지정된 영화예매권은 사용기간 내에 해당영화가 종영되면 사용기간이 남아도 영화예매권을 사용할 수 없습니다.<br>- 예매권/할인권은 영화 사이트에서 예매가 가능한 상영관에 한 해 사용이 가능합니다. (예매가 오픈 되지 않는 일부 특별관 제외)<br>- 영화할인권은 한번 예매시 1개만 사용 가능합니다. (단, 마니아 추가혜택 영화할인권은 해당 영화할인권에 한해 2매 이상 예매시 2개 동시 사용이 가능합니다.)<br>- 영화예매권/할인권으로 예매 후 극장에서 예매번호로 반드시 티켓발권을 하셔야 합니다.</div>
          </div>

          <div class="c_info" style="position: relative; top:90px">
            <div class="c_info_name">예매 취소 시</div>
            <div class="c_info_text">영화예매 취소시, 영화예매권/할인권은 다시 사용가능으로 복구됩니다.<br>- 단, 예매 취소하는 시점이 영화예매권/할인권 사용기간이 지난 후라면 영화예매권은 복구되지 않습니다. 예매취소하기 전에 사용기간을 꼭 확인해 주시기 바랍니다.<br>- 극장현장에서 영화예매권/할인권으로 결제한 영화를 취소할 경우, 현금 환불을 받거나 다른 영화로 변경이 불가합니다.<br>- 극장 현장에서 취소하신 경우 취소 내역은 관람일 다음날 오전 중에 반영 됩니다. 사용하신 예매권/할인권의 복구도 이 때 함께 진행되니 취소에 유의하시기 바랍니다.</div>
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
