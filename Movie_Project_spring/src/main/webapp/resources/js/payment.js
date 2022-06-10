$(function(){
	item=JSON.parse(localStorage.getItem("link_item"));
	//item{movieCode:movieCode,sitCode:sitCode,adult:adult,teenager:teenager}
	//이미지 영화명 상영관 상영일자 상영시간
	//complete image movieName theaterName movieDate movieTime
	$(".sit_che_btn").attr("type","button");
	console.log(`코드~~~${item.movieCode}`)
	data={movieCode:item.movieCode}
	$.ajax({
		url : "/ticket/paymentItem",
                     method:"POST",
                     contentType:"application/json",
                     async:false,
                     dataType:"json",
                     data:JSON.stringify(data),
                     success: complete =>{
						if(`${complete.image}`!='null'){
						$(".movie_poster").children("img").attr(`src`,`${complete.image}`);
						}
						filename=complete.movieImage.filename;
						uuid=complete.movieImage.uuid;
						url="/upload/"+uuid+"_"+filename;
						console.log(`${url}+ 제발`)
						if(`${complete.movieImage.filename}`!='null'){
							$(".movie_poster").children("img").attr(`src`,url);
						}
						
						$(".movieName").text(`${complete.movieName}`);
						$(".movieName").attr("id",`${complete.movieName}`);
 						$(".theaterName").text(`상영관 :${complete.theaterName}`);
						$(".theaterName").attr("id",`${complete.theaterName}`);
 						$(".movieDate").text(`상영 일자: ${complete.movieDate}`);
						$(".movieDate").attr("id",`${complete.movieDate}`);
						$(".movieTime").text(`상영 시간:${complete.movieTime}`);
						$(".movieTime").attr("id",`${complete.movieTime}`);
						$(".movieCode").text(`${complete.movieCode}`);
						$(".movieCode").attr("id",`${complete.movieCode}`);
 						
 /*						$(".cinemaCode_post").val(`${complete.cinemaCode}`);
 						$(".theaterName_post").val(`${complete.theaterName}`);
 						$(".sitCode_post").val(`${item.sitCode}`);
 						$(".movieCode_post").val(`${item.movieCode}`);
 						$(".teenager_post").val(`${item.teenager}`);
 						$(".adult_post").val(`${item.adult}`);
  */						
 						$(".cinemaCode_post").attr("value",`${complete.cinemaCode}`);
 						$(".theaterName_post").attr("value",`${complete.theaterName}`);
 						$(".sitCode_post").attr("value",`${item.sitCode}`);
 						$(".movieCode_post").attr("value",`${item.movieCode}`);
 						$(".teenager_post").attr("value",`${item.teenager}`);
 						$(".adult_post").attr("value",`${item.adult}`);
						
                     	//`${complete.theaterName}`
				}, error: (xhr, result2) => console.log(`[실패] print`)
			});
	adult=item.adult;
	adultmone=adult*13000;
	adultmoney=numberWithCommas(adultmone);
	teenager=item.teenager;
	teenagermone=teenager*11000;
	teenagermoney=numberWithCommas(teenagermone);
	paynum=adult+teenager;
	paymone=paynum*500;
	paymoney=numberWithCommas(paymone);
	$(".adultnum").text(`${adult}`);
	$(".teenagernum").text(`${teenager}`);
	$(".paynum").text(`${paynum}`);
	$(".adultmoney").text(`${adultmoney}`);
	$(".teenagermoney").text(`${teenagermoney}`);
	$(".paymoney").text(`${paymoney}`);
	paytota=paymone+teenagermone+adultmone;
	paytotal=numberWithCommas(paytota);
	$(".paytotal").text(`${paytotal}`);
	var a=$(".movieName").text();
	console.log(`일단 가져 올 수 있는지? ${a}`)// 하나에 몰아야함.
	//post로 보내고 만약에 결제 되면 스케줄러 삭제 //post로 보낼 폼 만들기
	
	//여기서 만약에 결제 한다면 ticket_code제작 id세션가져오기
	//pay_tool,pay_time->현재시간 가져오기!
	
	//cinema_code,theater_name,sit_code,movie_code,adult,teenager
	movieDate=$(".movieDate").attr("id");
	console.log(movieDate)
	movieDate=movieDate.substr(8,9);
		console.log(movieDate)
	movieCode=$(".movieCode_post").text();
	teenager=$(".teenager_post").text();
	if(teenager==''){teenager=0}
	adult=$(".adult_post").text();
	if(adult==''){adult=0}
	
	ran=Math.floor(Math.random() * 10);
	ran2=Math.floor(Math.random() * 90)+10;
	ticket_code=ran2+movieCode+teenager+movieDate+adult+ran
	ticket_code=ticket_code+"000000"
	ticket_code=ticket_code.substr(0,9)+"0";
	//
	$(".ticketCode_post").attr("value",`${ticket_code}`)
	
	$(".Bank").click(function(){
		ticketCode=$(".Bank").attr('id');
		$(".payTool_post").attr("value",`${ticketCode}`);
		$(".credit_box_top>button").css("color","black");
		$(".sit_che_btn").removeAttr("onclick");
		$(".sit_che_btn").removeAttr("type");
	});
	$(".Phone").click(function(){
		ticketCode=$(".Phone").attr('id');
		$(".payTool_post").attr("value",`${ticketCode}`);
		$(".credit_box_top>button").css("color","black");
		$(".sit_che_btn").removeAttr("onclick");
		$(".sit_che_btn").removeAttr("type");
	});
	$(".credit_box_top").children('button').click(function(){
		creadit=$(this).val();
		$(".payTool_post").attr("value",`${creadit}`);
		$(".sit_che_btn").removeAttr("onclick");
		$(".sit_che_btn").removeAttr("type");
	});
	 $(".credit").click(function(){
		$(".sit_che_btn").attr("onclick","warning()");
		$(".payTool_post").attr("value",``);
		$(".sit_che_btn").attr("type",`button`);
	});
	// 그리고 ticketsit에서 스케줄러 등록하고 여기서 삭제 등록 트렌젝션 해도 될듯 실패시 좌석고르는거부터 다시하라하고 ㅇㅇ
	//좌석을 만들때 Movie 테이블에 있는 예매좌석 가져와서 디자인 해주기
	// 그리구 인터셉터로 막아버리자 시발 ㅎㅎ
	// 예매 성공시 내역이랑 마이페이지 꾸며야징? ㅎㅎ
	// 그리고 해야하는일들 순번대로 하면 됨
})


function numberWithCommas(x) {//사용시 원단위에 맞게 반점
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function warning(){
	alert("결제 방법을 선택 해주세요")
}