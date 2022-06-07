
$(function(){
   
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
                      error: (xhr, result) => console.log(`[실패]`)
                  });
	})
})