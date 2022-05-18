$(function(){
	length=$(".movie_").children().length;
	for(p=0;p<length;p++){
	var moviename=$(".movie").children(`:eq(${p})`).text();
	var movieName={movieName:moviename}
	console.log("뭐가 되고 있는겨..?");
$.ajax({
	url:"/ticket/cinemaCode",
          method: "POST",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify(movieName),
          success: result3 => {
			for(l=0;l<result3.length;l++){
//				$(".movie").children(`:eq(${p})`).addClass(`${result3[l].cinemaCode}`);
				console.log("뭐가 되고 있는겨..?");
				//여기서 addclass 해주면 영화관 코드 들어가서 되었어야함..
			}
		},
           error: (xhr, result2) => console.log(`[실패] print`)
		});
	}          
});


$(".movie_place_").click(function(){
	console.log("뭐가 되고 있는겨..?")
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
			console.log("이게 와야하는 영화관값:"+result[i].movieAreaName);
			$(".movie_place_sub2").append(`<button class="movieAreaName" value="${result[i].cinemaCode}">${result[i].movieAreaName}</button>`)
			$(`#${result[i].movieAreaName}`).click(function(){
				var name=$(this).text();
				var code=$(this).val();
				$(".cinema_check").text(`영화관명 : ${name}`);
				$(".movieAreaName").css("color","black");
				$(this).css("color","red");
				cinema={movieAreaName:name,cinemaCode:code};
				$.ajax({
					  url:"/ticket/cinema",
			          method: "POST",
			          contentType: "application/json",
			          dataType: "json",
			          data: JSON.stringify(cinema),
			          success: result2 => {
							for(j=0;j<result2.length;j++){
								$(".movie_name").css("color","darkgray");
								$(".movie_name").addClass('nocheckmovie');
//								$(``)//${result2[j].cinemaCode} val()같은거 검정으로
//			이거 하다맘				$(`.${result2[j].cinemaCode}`).css("color","black");
//								$(`.${result2[j].cinemaCode}`).removeClass('nocheckmovie');
							}
						},
				       error: (xhr, result2) => console.log(`[실패] print`)
				       });//2차ajax끝
				})//2차 클릭시
			};//반복끝
			},//1차 success끝
//<button id="${item.movieAreaName}" class="movieAreaName">${item.movieAreaName}</button>
       error: (xhr, result) => console.log(`[실패] print`)
       });//1차 ajax끝
	})
