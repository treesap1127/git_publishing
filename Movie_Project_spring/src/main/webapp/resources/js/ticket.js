$(function(){
	$.ajax({
		url:"/ticket/movieview",
          method: "GET",
          async:false,
          dataType: "json",
          success: view => {
			for(i=0;i<view.length;i++){
				$(".movie_audits").append(`<div class="movie_ movie_${i}"><img src="../../img/ticketing/${view[i].movieRating}.png" alt="심의등급" class="movie_audits_photo">
            <div class="movie_name" id="${view[i].movieName}">${view[i].movieName}</div></div>`);
				
			}
},
          error: (xhr, result2) => console.log(`[실패] print`)
		
	})
	
	
	
	length=$(".movie_audits").children().length;
	a=0;
	for(p=0;p<length;p++){ 
	var moviename=$(".movie_audits").children(`:eq(${p})`).children("div").text();
	var movieName={movieName:moviename};
	$(".movie_audits").addClass("nodisplay");
	console.log(`tllll${moviename}`);
$.ajax({
	url:"/ticket/cinemaCode",
          method: "POST",
          async:false,
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify(movieName),
          success: code => {
			for(l=0;l<code.length;l++){
				$(".movie_audits").children(`:eq(${a})`).addClass(`name${code[l].cinemaCode}`);
				console.log(`1차 무비 명:~~~~~${a}`)
				var testcode=`${code[l].cinemaCode}`
				
				$(`.movie_${a}`).click(function(){
					$(".movie_").css("background-color","gainsboro");
					$(this).css("background-color","white");
					moviename=$(this).children("div").text();
					$(".movie_check_").text(`${moviename}`);
					movieName={movieName:moviename}
					$.ajax({
						url:"/ticket/cinemaCode",
				          method: "POST",
				          async:false,
				          contentType: "application/json",
				          dataType: "json",
				          data: JSON.stringify(movieName),
				          success: moviecode => {
								for(i=0;i<moviecode.length;i++)
								$(`.movieAreaName`).css("background-color","white");
								$(`.the${moviecode.cinemaCode}`).css("background-color","darkgray");
								//요거 해당하는 test 코드 다 가져와서 넣어줘야겠다.
								$(".movieAreaName").addClass("nocheckmovie");
								//그리고 모든 movieAreaName에 클래스로 nocheck 주고
								 $(`.the${moviecode.cinemaCode}`).removeClass("nocheckmovie");
								//체크 되어있는건 removeClass 박기
					},
 							error: (xhr, result2) => console.log(`[실패] print`)
					})
					
					
					
					dateitem={cinemaCode:testcode,movieName:moviename}
					$.ajax({
						url:"/ticket/cinemaDate",
					       method: "POST",
					       contentType: "application/json",
					       dataType: "json",
					       data: JSON.stringify(dateitem),
					       success: date => {
							
							for(j=0;j<date.length;j++){
								$(".movie_poster img").attr(`src`,`${date[j].image}`);
							var	stringdate =date[j].movieDate;
							mon=stringdate.substring(5, 7);
							day_=stringdate.substring(8, 10);
							month=parseInt(mon);
							day=parseInt(day_);
							$(`.${month}월${day}일`).css("background-color","white");
							
							}
					},
				           error: (xhr, result2) => console.log(`[실패] print`)
						});
				});
			}
			a++;
		},
           error: (xhr, result2) => console.log(`[실패] print`)
		});
	}          



$(".movie_place_").click(function(){
		$(".movie_place_").css("background-color","gainsboro")
		$(this).css("background-color","white")
		bigCity=$(this).attr('id');
		item={bigCity:bigCity};
		$(".movie_place_sub2").empty();
		 $.ajax({
          url:"/ticket/movieplace",
          method: "POST",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify(item),
          success: result => {
			for(i=0;i<result.length;i++){
			$(".movie_place_sub2").append(`<button class="movieAreaName the${result[i].cinemaCode}" id="${result[i].movieAreaName}"value="${result[i].cinemaCode}">${result[i].movieAreaName}</button>`)
			$(`#${result[i].movieAreaName}`).click(function(){//영화관 클릭시	
			var name=$(this).text();//영화관명 (달빛)
			var code=$(this).val();//상영관 번호 test~
			
			cinema={movieAreaName:name,cinemaCode:code};			
				$.ajax({
					  url:"/ticket/cinema",
			          method: "POST",
			          contentType: "application/json",
			          dataType: "json",
			          data: JSON.stringify(cinema),
			          success: result2 => {
							for(j=0;j<result2.length;j++){
								console.log(`${result2[0].cinemaCode}`);
								if(`${result2[0].cinemaCode}!='fail'`){
									$(this).css("color","red");
									$(".check_com").append(`<div class="cinemaCode"style="display:none">${code}</div>`)
									$(".cinema_check").text(`영화관명 : ${name}`);
									$(".movieAreaName").css("color","black");
									$(this).css("color","red");
									
									
								$(`.check_com`).append(`<div class="theaterName" style="display:none">${result2[j].theaterName}</div>`)
								$(".movie_").children("div").css("color","darkgray");
								$(".movie_").children("div").addClass('nocheckmovie');
								$(`.name${result2[j].cinemaCode}`).children("div").css("widit","1000px");
								$(`.name${result2[j].cinemaCode}`).children("div").css("color","black");
								$(`.name${result2[j].cinemaCode}`).children("div").removeClass('nocheckmovie');
								$(".movie_audits").removeClass("nodisplay");
								}
								else if(`${result2[0].cinemaCode}=='fail'`){
									select=confirm("상영 영화가 등록 되지 않은 영화관 입니다. \n 다시 선택 하시겠습니까?")
									if(select==true){
										alert("초기화 되었습니다.");
										location.reload();
									}
								}

							}
						},
				       error: (xhr, result2) => console.log(`[실패] print`)
				       });//2차ajax끝
				})//2차 클릭시
			};//반복끝
			},//1차 success끝
       error: (xhr, result) => console.log(`[실패] print`)
       });//1차 ajax끝
	})//지역 클릭 끝
	
	
	
	
	
	
	
	//캘린더!
	// Date 포맷 
const dateFormat = (date) => {
    return date.toLocaleDateString().replace(/\./g, "").split(" ");
  }
  
  // 달력 생성
  const makeCalendar = (date) => {
    
    // 현재의 년도와 월 받아오기
    const [nowYear, nowMonth] = dateFormat(date);

    // 지난달의 마지막 요일
    const prevDay = new Date(nowYear, nowMonth - 1, 1).getDay();

    // 현재 월의 마지막 날 구하기
    const lastDay = dateFormat(new Date(nowYear, nowMonth, 0)).pop() * 1;

    let htmlDummy = '';

    // 전달 날짜 표시하기
    for (let i = 0; i < prevDay; i++) {
      htmlDummy += `<div class="noColor"></div>`;
    }

    // 현재 날짜 표시하기
    for (let i = 1; i <= lastDay; i++) {    
      htmlDummy += `<div class="datebutton ${nowMonth}월${i}일" id="${nowYear}-${nowMonth}-${i}">${i}</div>`;
      
    }

    // 지금까지 추가한 날짜 박스
    const maxDay = prevDay + lastDay;

    // 마지막날이 들어있는 열에 남은 박스 채우기
    const nextDay = (Math.ceil(maxDay / 7) * 7) - maxDay;

    // 다음달 날짜
    for (let i = 0; i < nextDay; i++) {
      htmlDummy += `<div class="noColor"></div>`;
    }

    document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
    document.querySelector(`.dateTitle`).innerText = `${nowYear}년 ${nowMonth}월`;

  }
    
  const date = new Date();
  
  // Date 객체를 보내서 달력 생성
  makeCalendar(date);
  
  date.setMonth(date.getMonth() - 1);
  
  // 이전달 이동
  document.querySelector(`.prevDay`).onclick = () => {
    makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
  }
  
  // 다음달 이동
  document.querySelector(`.nextDay`).onclick = () => {
    makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
  }
  $(".datebutton").click(function(){
		var dateval=$(this).attr("id");
		$(".cinema_date").text(`예매일: ${dateval}`);
		var movieName=$(".movie_check_").text();
		
		var cinemaCode=$(".cinemaCode").text();
		console.log(`${movieName}-------${cinemaCode}`)
		var date=`${dateval}`;
		var time={movieName:movieName,cinemaCode:cinemaCode,movieDate:date}
		
		$.ajax({
			url:"/ticket/cinematime",
			          method: "POST",
			          contentType: "application/json",
			          dataType: "json",
			          data: JSON.stringify(time),
			          success: result4 => {
						console.log(`${result4}`);
						for(j=0;j<result4.length;j++){
						console.log(`${result4}`);
						console.log(`${result4[j].movieName}`)
						console.log(`${result4[j].movieRating}`)
						console.log(`${result4[j].theaterName}`)
						console.log(`${result4[j].movieTime}`)
						$(".contact").append(`<div class="movie_contact"><div class="movie_contact_sub1"><img src="../img/ticketing/${result4[j].movieRating}.png" alt="심의등급" class="movie_audits_photo"><div class="movie_name contact_name">${result4[j].movieName}</div></div><div class="movie_contact_sub2"><button class="contact_button" id="${result4[j].movieTime}">상영시간: ${result4[j].movieTime}<br> 상영관:${result4[j].theaterName}</button></div></div>`);
						$(".contact_button").click(function(){
							var time=$(this).attr("id");
							console.log(`시간${time}`);
							$(".check_com").append(`<div>예매 시각: ${time}</div>`)
							//movieName
							//dateval date
							//cinemaCode
							theatername=$(`.theaterName`).text();
							//time
							console.log(`영화명: ${movieName} 날짜:${dateval} 시네마코드:${cinemaCode} 영화관이름:${theatername} 시간:${time}`)
							$(".sitting a").attr("href",`sit?movieName=${movieName}&cinemaCode=${cinemaCode}&theaterName=${theatername}&movieDate=${dateval}&movieTime=${time}`)
						});
				}
				
			},
       error: (xhr, result) => console.log(`[실패] print`)
       });
		})
	})