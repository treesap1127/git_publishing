$(function(){
	$(".deleteBtn").click(function(){
      	  if(confirm("삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까?")){
      		var code=$(this).parent().parent().children(":eq(0)").text();
      		var url =`delete/${code}`;
      		$(location).attr('href',url);
      	  }
        });
})