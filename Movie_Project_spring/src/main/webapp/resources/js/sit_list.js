$(function(){
	line=$(".line").val();
	row=$(".row").val();
	console.log(`여기요 여기${line}`)
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
				$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_c`);
			}
			else{
				$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_b`);
			}
			++k;

			
		}
	}
	
	
})



