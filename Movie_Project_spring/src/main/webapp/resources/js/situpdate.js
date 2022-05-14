$(function(){
	line=$(".teenager_button>input").val();
	row=$(".adult_button>input").val();
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
	const sitcode=$(".sitcode").text();
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
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).attr("id",`${row_item}${l}`);//좌석 재생성을 위한 아이디
			++k;
			//아래 코드는 좌석 클릭시 사라지거나 재생성
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).click(function(){
				if($(this).text()==' '){
					id=$(this).attr('id')
					$(this).text(id);
					$(this).addClass('sit_b');
					$(this).removeClass("sit_c");
				}
				else{
					$(this).text('');
					$(this).removeClass('sit_b');
					$(this).addClass("sit_c");
				}
			
			});
			
		}
	}
	
	
})
function sit_creat(){
	line=$(".teenager_button>input").val();
	row=$(".adult_button>input").val();
	if(line>49||row>17){
		alert("열과 행의 숫자를 초과하였습니다");
		return "";
	}
	console.log(line+"행-열"+row);
	
	if($(".sit_")){
		$(".sit_").remove();//좌석 있었으면 삭제
	}
	if($(".sit_list_garo")){
		$(".sit_list_garo").remove();//좌석 있었으면 삭제
	}
	
	for(i=0;i<row;i++){
		row_item=String.fromCharCode(65+i);
		$(".sit_checkbox").append(`<div></div>`);
		$(`.sit_checkbox`).children(`:eq(${i})`).addClass(`sit_${row_item}`);//좌석 어떤 열인지
		$(`.sit_checkbox`).children(`:eq(${i})`).addClass("sit_list_garo");//좌석 열 나누기
		for(j=0;j<line;j++){
			$(`.sit_checkbox`).children(`:eq(${i})`).append(`<div></div>`);//좌석div 생성
			l=j+1;
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_${row_item}`);//행삭제를 위한 숫자
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_${l}`);//열삭제를 위한 숫자
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_b`);//좌석 색상 정하기 
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).text(`${row_item}${l}`);//좌석명
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).attr("id",`${row_item}${l}`);//좌석 재생성을 위한 아이디
			
			//아래 코드는 좌석 클릭시 사라지거나 재생성
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).click(function(){
				if($(this).text()){
					$(this).text('');
					$(this).removeClass('sit_b');
					$(this).addClass("sit_c");
				}
				else{
					id=$(this).attr('id')
					$(this).text(id);
					$(this).addClass('sit_b');
					$(this).removeClass("sit_c");
				}
			
			});
			
		}
	}
	
	if($(".sit_aph_group")){
		$(".sit_aph_group").remove();//알파벳 있었으면 삭제
	}
	for(i=0;i<row;i++){
			row_item=String.fromCharCode(65+i);
			$(".sit_aph").append(`<div>${row_item}</div>`);//알파벳나열
			$(`.sit_aph`).children(`:eq(${i})`).addClass(`sit_aph_${i}`);//알파벳몇번째인지
			$(`.sit_aph`).children(`:eq(${i})`).addClass(`sit_aph_group`);//알파벳그룹화 시켜서 단체 삭제
			
/*			$(`.sit_aph_${i}`).click(function(){// 클릭에 텍스트는 바뀌는데 줄이 안사라져서 포기한코드
				
				if($(this).text()){
					$(this).text('');
					j=i+1;
					
					$(`.sit_${row_item}`).text('');
					$(`.sit_${row_item}`).removeClass('sit_b');
					$(`.sit_${row_item}`).addClass("sit_b");
				}
				else{
					id=$(`.sit_${row_item}`).attr('id')
					
					$(`.sit_${row_item}`).text(id);
					$(`.sit_${row_item}`).addClass('sit_b');
					$(`.sit_${row_item}`).removeClass("sit_c");
					$(this).text(`${row_item}`);

				}
			})*/
		}
	//위는 abcd를 생성
	if($(".sit_num_group")){
		$(".sit_num_group").remove();//좌석 있었으면 삭제
	}
	for(i=0;i<line;i++){
			l=i+1;
			$(".sit_aph_num").append(`<div>${l}</div>`);//숫자나열
			$(`.sit_aph_num`).children(`:eq(${i})`).addClass(`sit_num${i}`);//숫자몇번째인지
			$(`.sit_aph_num`).children(`:eq(${i})`).addClass(`sit_num_group`);//그룹화 시켜서 숫자 삭제
		}
	
	//위는 1234를 생성
}

function theater_add(){
	
	line=$(`.sit_aph_num`).children(":last").text();
	rw=$(`.sit_aph`).children(":last").text();
	ro=rw.codePointAt(0);//아스키코드변환
	row=ro-64;//아스키코드 열수로 변환
	let sit_inner=[];
	for(i=0;i<row;i++){
		for(j=0;j<line;j++){
			item=$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).text();//아이템에 좌석명 담기
			sit_inner.push(item)
		}
	}
	sit_inner=sit_inner.toString();
	console.log(sit_inner);
	var objectItem={
		cinemaCode:$(".codename").text(),
		theaterName:$(".nametext_val").val(),
		row:row,
		line:line,
		sit:sit_inner
	};
	$.ajax({
		  url:"../sit_update",
          method: "POST",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify(objectItem),
          success: result => { 
				alert('상영관이 수정 되었습니다');
				location.reload(true);
			},
           error: (xhr, result) => console.log(`[실패] print`)
       });
}


