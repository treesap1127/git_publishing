$(function(){
	line=$(".line").val();
	row=$(".row").val();
	for(i=0;i<row;i++){//이거 row 선택자로 끌어오기
		row_item=String.fromCharCode(65+i);
		$(".sit_aph").append(`<div>${row_item}</div>`);//알파벳나열
		$(`.sit_aph`).children(`:eq(${i})`).addClass(`sit_aph_${i}`);//알파벳몇번째인지
		$(`.sit_aph`).children(`:eq(${i})`).addClass(`sit_aph_group`);//알파벳그룹화 시켜서 단체 삭제
	}
	for(i=0;i<line;i++){//이거 line 선택자로 끌어오기
		l=i+1;
		$(".sit_aph_num").append(`<div>${l}</div>`);//숫자나열
		$(`.sit_aph_num`).children(`:eq(${i})`).addClass(`sit_num${i}`);//숫자몇번째인지
		$(`.sit_aph_num`).children(`:eq(${i})`).addClass(`sit_num_group`);//그룹화 시켜서 숫자 삭제
	}
	var k=0;
	//리스트 split으로 분할 해서 넣어주기
	const sitcode=$(".sit").val();
	var sititem =sitcode.split(",");
	for(i=0;i<row;i++){//이거 row 선택자로 끌어오기
		
		row_item=String.fromCharCode(65+i);
		$(".sit_checkbox").append(`<div></div>`);
		$(`.sit_checkbox`).children(`:eq(${i})`).addClass(`sit_${row_item}`);//좌석 어떤 열인지
		$(`.sit_checkbox`).children(`:eq(${i})`).addClass("sit_list_garo");//좌석 열 나누기
		for(j=0;j<line;j++){//이거 line 선택자로 끌어오기
			$(`.sit_checkbox`).children(`:eq(${i})`).append(`<div></div>`);//좌석div 생성
			l=j+1;
			p=k+1;
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_${row_item}`);//행삭제를 위한 숫자
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_${l}`);//열삭제를 위한 숫자
//			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_b`);//좌석 색상 정하기
//			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).text(`${row_item}${l}`);//좌석명
 			//리스트 split으로 분할한거 [k]해서 넣고
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).text(sititem[k]);
			//색상을 if=text=''이면 sit_c로 해버리고 있으면 b하기
			if($(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).text()==''){
				$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_d`);
			}
			else{
				$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_b`);
			}
			++k;
		}
	}
$(".aud_but").click(function(){// 어른 클릭시
	$(".aud_but").css("background-color","white");
	$(".aud_but").css("color","black");
	$(this).css("background-color","gray");
	$(this).css("color","white");
	i=$(this).text();

	$(".adultnum").text(`${i}`);
	money=i*13000;
	moneystr=numberWithCommas(money);
	$(".adultmoney").text(`${moneystr}`);// 기본 설정
	
	adultnum=$(".adultnum").text();
	console.log(`${adultnum} 성인 숫자`);
	teenagernum=$(".teenagernum").text();
	console.log(`${teenagernum} 청소년 숫자`);
	adultnum=parseInt(adultnum);
	teenagernum=parseInt(teenagernum);
	paytotal=adultnum+teenagernum;
	console.log(`${paytotal} 토탈 숫자`);
	paymon=paytotal*500;
	paymoney=numberWithCommas(paymon);
	
	$(".paynum").text(paytotal);
	$(".paymoney").text(paymoney);// 수수료
	
	//최종 결제 금액
	adultpay=adultnum*13000;
	tenagerpay=teenagernum*11000;
	paytot=paymon+tenagerpay+adultpay
	paytotal=numberWithCommas(paytot);
	$(".paytotal").text(paytotal);
	
})

$(".ten_but").click(function(){// 청소년 클릭시
	$(".ten_but").css("background-color","white");
	$(".ten_but").css("color","black");
	$(this).css("background-color","gray");
	$(this).css("color","white");
	i=$(this).text();

	$(".teenagernum").text(`${i}`);
	money=i*11000;
	moneystr=numberWithCommas(money);
	$(".teenagermoney").text(`${moneystr}`);// 기본 설정
	
	adultnum=$(".adultnum").text();
	teenagernum=$(".teenagernum").text();
	adultnum=parseInt(adultnum);
	teenagernum=parseInt(teenagernum);
	paytotal=adultnum+teenagernum;
	paytotal=adultnum+teenagernum;
	paymon=paytotal*500;
	paymoney=numberWithCommas(paymon);
	
	$(".paynum").text(paytotal);
	$(".paymoney").text(paymoney);// 수수료
	
	//최종 결제 금액
	adultpay=adultnum*13000;
	tenagerpay=teenagernum*11000;
	paytot=paymon+tenagerpay+adultpay
	paytotal=numberWithCommas(paytot);
	$(".paytotal").text(paytotal);
})
$(".sit_b").click(function(){
	$(this).removeClass("sit_b");
	$(this).off("click");
	$(this).addClass("sit_a");
	$(".sit_a").attr("onclick","confirm_test()");
	
	sit_code=$(this).text();
	$(".sit_info").append(`<div class="smalltype">${sit_code}</div>`)
});
	
	//요러코롬 링크 설정 해줘야함 값=.check_com_box ㅇㅇ$(".sit_checkbox").attr("href","payment");
})
function confirm_test(){
	if(confirm("좌석 취소 시 재 선택 해야합니다\n 재선택 하시겠습니까?")){
  			location.reload();
  	 		}
}
function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}