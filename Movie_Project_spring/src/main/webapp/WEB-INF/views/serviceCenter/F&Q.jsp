<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <jsp:include page="../include/header.jsp"></jsp:include>
<link href="../css/serviceCenter/faq.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/style/style.css">
  <script>
       $(function(){
      const con = ".faq_box";
      const con2 =".faq_box2";
      const con3 =".faq_box3";
      const con4 =".faq_box4";     
      


      $(".area2").click(function() { 
      $(con).css('display', 'none');
      $(con3).css('display', 'none');
      $(con4).css('display', 'none');      
      $(con2).css('display', 'block');
      });

      $(".area3").click(function() { 
      $(con).css('display', 'none');
      $(con2).css('display', 'none');
      $(con4).css('display', 'none');   
      $(con3).css('display', 'block');
      });
      
      $(".area4").click(function() { 
      $(con).css('display', 'none');
      $(con2).css('display', 'none');
      $(con3).css('display', 'none');      
      $(con4).css('display', 'block');
      });
     
      $(".area").click(function() {     
      $(con4).css('display', 'none');
      $(con2).css('display', 'none');
      $(con3).css('display', 'none');
      $(con).css('display', 'block');
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
	                <div class="login_link"><a href="../serviceCenter/CenterService" >고객센터</a></div>
	              	<c:if test="${sessionScope.member.grade==0}">	<div class="login_link"><a href="../login">로그인</a></div></c:if>
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
    <!--area-->
    <div class="faqs_box">

        <div class="FAQ_seq">FAQ</div>
  
        <div class="faq_box">        
          <div class="area red">
            <div class="area_index" style="background-color: #ec6159;;">전체</div>
          </div>
  
          <div class="area2">
            <div class="area_index">영화예매</div>
          </div>
  
          <div class="area3">
            <div class="area_index">이벤트</div>
          </div>
  
          <div class="area4">
            <div class="area_index">결제/취소</div>
          </div> 
          
          <div class="faq_area">
          
            <table class="faq_table">                     
              <thead>  
                <tr>           
                    <td><details>
                      <summary>Q 네이버 페이로 결제할수 있나용?</summary>
                      결제창 정보에 따라서 진행 하거나 진행이 어려울 경우 질문게시판에 올리시면 됩니다.
                    </details></td>   
                </tr>              
                <tr>           
                  <td><details>
                    <summary>Q 예매는 어떻게 하냐요?</summary>
                  </details></td>   
              </tr>              
              <tr>           
                <td><details>
                  <summary>Q 예매후 극장 예매표는 어떻게 받나요?</summary>
                </details></td>   
            </tr> 
               <tr>           
                <td><details>
                  <summary>Q 예매하는법?</summary>
                </details></td>   
            </tr>             
              </thead>
                                  
          </table>
        </div>
        
   
      </div>

  
  
   <!-- 무브 2박스 -->
   <div class="faq_box2">        
    <div class="area">
      <div class="area_index">전체</div>
    </div>

    <div class="area2 red">
      <div class="area_index" style="background-color: #ec6159;;">영화예매</div>
    </div>

    <div class="area3">
      <div class="area_index">이벤트</div>
    </div>

    <div class="area4">
      <div class="area_index" >결제/취소</div>
    </div>            
  
    <div class="faq_area">
          
      <table class="faq_table">
               
        <thead>
          <tr>           
            <td><details>
              <summary>Q 한번에 몇 매까지 예매가 가능한가요?</summary>
            </details></td>   
        </tr>              
        <tr>           
          <td><details>
            <summary>Q 예매는 어떻게 하냐요?</summary>
          </details></td>   
      </tr>              
      <tr>           
        <td><details>
          <summary>Q 예매 취소내역은 어디서 확인하나요?</summary>
        </details></td>   
    </tr>              
        </thead>
                            
    </table>
  </div>

</div>


   <!-- 무브 2박스 -->     
      

  
  
  <!-- 무브3박스 -->
  <div class="faq_box3">        
    <div class="area">
      <div class="area_index" >전체</div>
    </div>

    <div class="area2">
      <div class="area_index">영화예매</div>
    </div>

    <div class="area3 red">
      <div class="area_index" style="background-color: #ec6159;;">이벤트</div>
    </div>

    <div class="area4">
      <div class="area_index">결제/취소</div>
    </div> 
    
    <div class="faq_area">
          
      <table class="faq_table">
               
        <thead>
          <tr>           
            <td><details>
              <summary>Q 당첨여부는 어디서 확인하나요?</summary>
            </details></td>   
        </tr>              
        <tr>           
          <td><details>
            <summary>Q 경품수령은 어디서 하나요?</summary>
          </details></td>   
      </tr>              
           
        </thead>
                            
    </table>
  </div>
  

</div>

<!-- 무브3박스 -->


  <!-- 무브4 박스 -->
  
  <div class="faq_box4">        
    <div class="area">
      <div class="area_index">전체</div>
    </div>

    <div class="area2">
      <div class="area_index">영화예매</div>
    </div>

    <div class="area3">
      <div class="area_index">이벤트</div>
    </div>

    <div class="area4 red">
      <div class="area_index" style="background-color: #ec6159;;">결제/취소</div>
    </div> 
    
    <div class="faq_area">
          
      <table class="faq_table">
               
        <thead>
          <tr>           
            <td><details>
              <summary>Q 취소는 어떻게 하나요?</summary>
            </details></td>   
        </tr>              
        <tr>           
          <td><details>
            <summary>Q 예매내역 중 일부만 취소가 가능한가요?</summary>
          </details></td>   
      </tr>              
      <tr>           
        <td><details>
          <summary>Q 언제까지 영화예매 취소가 가능한가요?</summary>
        </details></td>   
    </tr>              
        </thead>
                            
    </table>
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