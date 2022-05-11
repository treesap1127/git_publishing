
$(function(){
	
	
})
function sit_creat(){
	line=$(".teenager_button>input").val();
	row=$(".adult_button>input").val();
	if(line>49||row>17){
		alert("열과 행의 숫자를 초과하였습니다");
		return "";
	}
	console.log(line+"행-열"+row);
	if($(".sit_aph_group")){
		$(".sit_aph_group").remove();
	}
	for(i=0;i<row;i++){
			row_item=String.fromCharCode(65+i);
			$(".sit_aph").append(`<div>${row_item}</div>`);
			
			$(`.sit_aph`).children(`:eq(${i})`).addClass(`sit_aph_${i}`);
			$(`.sit_aph`).children(`:eq(${i})`).addClass(`sit_aph_group`);
		}
	//위는 abcd를 생성
	if($(".sit_num_group")){
		$(".sit_num_group").remove();
	}
	for(i=0;i<line;i++){
			l=i+1;
			$(".sit_aph_num").append(`<div>${l}</div>`);
			$(`.sit_aph_num`).children(`:eq(${i})`).addClass(`sit_num${i}`);
			$(`.sit_aph_num`).children(`:eq(${i})`).addClass(`sit_num_group`);
		}
	
	//위는 1234를 생성
	if($(".sit_")){
		$(".sit_").remove();
	}
	if($(".sit_list_garo")){
		$(".sit_list_garo").remove();
	}
	for(i=0;i<row;i++){
		row_item=String.fromCharCode(65+i);
		$(".sit_checkbox").append(`<div></div>`);
		$(`.sit_checkbox`).children(`:eq(${i})`).addClass(`sit_${row_item}`);
		$(`.sit_checkbox`).children(`:eq(${i})`).addClass("sit_list_garo");
		for(j=0;j<line;j++){
			$(`.sit_checkbox`).children(`:eq(${i})`).append(`<div></div>`);
			l=j+1
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_${l}`);
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).addClass(`sit_`);
			$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).text(`${row_item}${l}`);
		}
	}
	//위는 좌석 생성
}
function theater_add(){
	
	line=$(`.sit_aph_num`).children(":last").text();
	rw=$(`.sit_aph`).children(":last").text();
	ro=rw.codePointAt(0);//아스키코드변환
	row=ro-64;//아스키코드 열수로 변환
	let sit_inner=[];
	for(i=0;i<row;i++){
		for(j=0;j<line;j++){
			item=$(`.sit_checkbox`).children(`:eq(${i})`).children(`:eq(${j})`).text();
			sit_inner.push(item)
		}
	}
	var objectItem={
		"cinemaCode":$(".ticketing_name").text(),
		theaterName:$(".nametext").val(),
		row:row,
		line:line,
		sit:sit_inner
	};
	$.ajax({
		  url:"sit_add",
          method: "POST",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify(objectItem),
          success: result => { 
				alert('옴');
			},
           error: (xhr, result) => console.log(`[실패] print`)
       });
}







