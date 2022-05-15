
$(function(){
   for(i=1;i<6;i++){
   var rank={rank:10,rnum:i};//10개중 //2번
   $.ajax({
          url:"/koficmovie",
          method: "POST",
          contentType: "application/json",
          //json으로 받은데이터
          dataType: "json",
          data: JSON.stringify(rank),
                 //서버로 보내는 데이터 타입
          success: result => {
//{rnum=1, rank=1, rankInten=0, rankOldAndNew=OLD, movieCd=20212725, movieNm=신비한 동물들과 덤블도어의 비밀, openDt=2022-04-13, salesAmt=912978290, salesShare=42.5, salesInten=539279350, salesChange=144.3, salesAcc=7412444160, audiCnt=83940, audiInten=49437, audiChange=143.3, audiAcc=700600, scrnCnt=1375, showCnt=4413}
//위 값이 넘어옴

//리턴값이 넘어오니 아래 값에 리턴값 적용
            $(`#movie_data_${result.rank}>div>div>div>p`).text(`${result.rank}`);
            
            //result.movieNm , result.rank , result.movieCd
            
               $.ajax({
                     url : "/navermovie",
                     method:"POST",
                     contentType:"application/json",
                     dataType:"json",
                     data:JSON.stringify(result),
                     success: result2=>{
                        $(`#movie_data_${result.rank}>div>div>img`).attr("src",`${result2.image}`);
                        $(`#movie_data_${result.rank}>div>div>img`).attr("alt",`${result.movieNm}`);
                        
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
//반복문이 끝나고,,
})