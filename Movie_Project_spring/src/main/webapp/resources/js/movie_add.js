
$(function(){
   for(i=1;i<11;i++){
   var rank={rank:10,rnum:i};//10개중 //2번
	$("tbody").append(`<tr></tr>`);
   $.ajax({
          url:"/koficmovie",
          method: "POST",
          contentType: "application/json",
          async:false,
          //json으로 받은데이터
          dataType: "json",
          data: JSON.stringify(rank),
                 //서버로 보내는 데이터 타입
          success: result => {
//{rnum=1, rank=1, rankInten=0, rankOldAndNew=OLD, movieCd=20212725, movieNm=신비한 동물들과 덤블도어의 비밀, openDt=2022-04-13, salesAmt=912978290, salesShare=42.5, salesInten=539279350, salesChange=144.3, salesAcc=7412444160, audiCnt=83940, audiInten=49437, audiChange=143.3, audiAcc=700600, scrnCnt=1375, showCnt=4413}
//위 값이 넘어옴
//리턴값이 넘어오니 아래 값에 리턴값 적용
            //result.movieNm , result.rank , result.movieCd
               $.ajax({
                     url : "/navermovie",
                     method:"POST",
                     contentType:"application/json",
                     dataType:"json",
                     data:JSON.stringify(result),
                     success: result2=>{
						
						$.ajax({
					          url:"/koficmoviedata",
					          method: "POST",
					          contentType: "application/json",
					          //json으로 받은데이터
					          dataType: "json",
					          data: JSON.stringify(result),
					                 //서버로 보내는 데이터 타입
					          success: result3 => {
									console.log("사용중.."+result.rank);
			                        $("tbody").append(`<tr>${result.rank}</tr>`);
									$("tbody").children(`:eq(${result.rank})`).append(`<th><img class="posterimg"></th>`);
									$("tbody").children(`:eq(${result.rank})`).children(`:eq(${0})`).children(`:eq(${0})`).attr("src",`${result2.image}`);
									$("tbody").children(`:eq(${result.rank})`).children(`:eq(${0})`).children(`:eq(${0})`).attr("alt",`영화 포스터`);
									$("tbody").children(`:eq(${result.rank})`).append(`<th></th>`);
									$("tbody").children(`:eq(${result.rank})`).children(`:eq(${1})`).text(`${result.movieNm}`);
									$("tbody").children(`:eq(${result.rank})`).append(`<th></th>`);
									$("tbody").children(`:eq(${result.rank})`).children(`:eq(${2})`).text(`${result3.watchGradeNm}`);
									$("tbody").children(`:eq(${result.rank})`).append(`<th></th>`);
									$("tbody").children(`:eq(${result.rank})`).children(`:eq(${3})`).append(`<button class="btn btn-primary movieTitle${result.rank}">영화선정</button>`)
									
									$(`.movieTitle${result.rank}`).click(function(){
										$(`.namebox`).text(`${result.movieNm}`);
										$(`.imagebox`).val(`${result2.image}`);
										$(`.movie_rating`).val(`${result3.watchGradeNm}`)
									});
									
								},
					          error: (xhr, result) => console.log(`[실패] print`)
					       });
                     },
                      error: (xhr, result2) => console.log(`[실패] such`)
                  });
             //result값을 json에서 변경해온거 저렇게 쓰는구나! 템플릿리터널=$ !! `=백틱!   jsp입장에선$이엘문법임
             /*그래서 js파일로 바꿔줘야지 백틱과 템플릿리터널을 인식함*/
             //jsp는 서블릿으로 변환함
		 
    },
       error: (xhr, result) => console.log(`[실패] print`)
       });
//ajax이 끝나고,,
}
//반복문이 끝나고 영화가 끝나고

	$(".buttonadd").click(function(){
		var theaterName=$(".add_box").children(`:eq(${0})`).val();
		console.log("theaterName="+theaterName);
		var cinemaCode=$(".add_box").children(`:eq(${1})`).val();
		console.log("cinemaCode="+cinemaCode);
		var movieNm=$(".add_box").children(`:eq(${3})`).text();
		console.log("movieNm="+movieNm);
		var movieDate=$(".add_box").children(`:eq(${5})`).val();
		console.log("movieDate="+movieDate);
		var movieTime=$(".add_box").children(`:eq(${7})`).val();
		console.log("movieTime="+movieTime);
		var image=$(".add_box").children(`:eq(${8})`).val();
		var movieRating=$(".add_box").children(`:eq(${9})`).val();
				console.log("movieRating="+movieRating);
		var item={theaterName:theaterName,cinemaCode:cinemaCode,movieName:movieNm,movieDate:movieDate,movieTime:movieTime,image:image,movieRating:movieRating}
		 $.ajax({
                     url : "/myPage/theater/cinemaMovie/movieadd",
                     method:"POST",
                     contentType:"application/json",
                     dataType:"json",
                     data:JSON.stringify(item),
                     success: ()=>{
							alert(`${movieNm}영화 등록이 ${movieDate} ${movieTime}로 등록 되었습니다.`)
                     },
                      error: (xhr, result) => alert("모든 항목을 올바르게 입력해주세요")
                  });
	})
})