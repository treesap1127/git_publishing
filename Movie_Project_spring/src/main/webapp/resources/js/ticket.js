$(function(){
$(".movie_place_").click(function(){
		bigCity=$(this).text();
		item={bigCity:bigCity};
		 $.ajax({
          url:"/ticket/movieplace",
          method: "POST",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify(item),
          success: result => {
			console.log("이게 와야하는 영화관들"+result.movieAreaName);
	
		},
       error: (xhr, result) => console.log(`[실패] print`)
       });
		
	})
})
