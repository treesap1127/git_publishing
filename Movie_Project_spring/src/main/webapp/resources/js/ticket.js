$(function(){
	length=$(".movie_audits").children().length;
	a=0;
	for(p=0;p<length;p++){
	var moviename=$(".movie_audits").children(`:eq(${p})`).children("div").text();
	var movieName={movieName:moviename};
	$(".movie_audits").addClass("nodisplay");
$.ajax({
	url:"/ticket/cinemaCode",
          method: "POST",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify(movieName),
          success: code => {
			for(l=0;l<code.length;l++){
				$(".movie_audits").children(`:eq(${a})`).addClass(`name${code[l].cinemaCode}`);
				var testcode=`${code[l].cinemaCode}`
				$(".movie_").click(function(){
					$(".movie_").css("background-color","gainsboro");
					$(this).css("background-color","white");
					moviename=$(this).children("div").text();
					$(".movie_check_").text(`${moviename}`);
					
					$(`.movieAreaName`).css("color","darkgray");
					
					$(`.the${testcode}`).css("color","black");
					//영화관명 같은 theater 회색 이면 클래스 ㅇㅇ
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
			$("check_com").append(`<div class="cinemaCode"style="display:none">${result[i].cinemaCode}</div>`)
			$(`#${result[i].movieAreaName}`).click(function(){//영화관 클릭시
			$(".movie_audits").attr("display","block");
				$(this).css("color","red");
				var name=$(this).text();
				var code=$(this).val();
				$(".cinema_check").text(`영화관명 : ${name}`);
				$(".movieAreaName").css("color","black");
				$(this).css("color","red");
				cinema={movieAreaName:name,cinemaCode:code};
				
				console.log("네임 코드 "+name+"+++++++"+code);
				$.ajax({
					  url:"/ticket/cinema",
			          method: "POST",
			          contentType: "application/json",
			          dataType: "json",
			          data: JSON.stringify(cinema),
			          success: result2 => {
							for(j=0;j<result2.length;j++){
								$(".movie_").children("div").css("color","darkgray");
								$(".movie_").children("div").addClass('nocheckmovie');
								$(`.name${result2[j].cinemaCode}`).children("div").css("widit","1000px");
								$(`.name${result2[j].cinemaCode}`).children("div").css("color","black");
								$(`.name${result2[j].cinemaCode}`).children("div").removeClass('nocheckmovie');
								$(".movie_audits").removeClass("nodisplay");
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
      htmlDummy += `<div class="datebutton" id="${nowYear}-${nowMonth}-${i}">${i}</div>`;
      
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
		$(".cinema_date").text(`${dateval}`);
		console.log(`${dateval}`);
		var moviename=$(".movie_check_").text();
		var cinemacode=$(".cinemaCode").text();
		var date=`${dateval}`;
		var time={movieName:moviename,cinemaCode:cinemacode,movieDate:date}
		
		$.ajax({
			url:"/ticket/cinematime",
			          method: "POST",
			          contentType: "application/json",
			          dataType: "json",
			          data: JSON.stringify(time),
			          success: result4 => {
				console.log(`${result4}`)
				console.log(`${result4[0].movieName}`)
				console.log(`${result4[0].movieRating}`)
				console.log(`${result4[0].theaterName}`)
				console.log(`${result4[0].movieTime}`)
			},
       error: (xhr, result) => console.log(`[실패] print`)
       });
		})
	})