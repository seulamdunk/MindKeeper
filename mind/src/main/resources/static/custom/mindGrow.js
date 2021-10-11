
$(function(){
	
	
basename="listCnt"
tag_cnt= document.getElementsByClassName("img-list").length;
$(".recommendList").attr("id",basename+tag_cnt)	
	for(i=1; i<=tag_cnt;i++ ){
		eval(basename+i+"=1")
	}
$(".recommendList").attr("id",basename+tag_cnt)	
	
let limit= 18

$(document).on("click",".btn1",function(){
	let id =$(this).parent().attr("id")
	
	
	if(eval(id+"==1")){
	
	}else{
		$(this).parent().find(".move-area").animate({left:"+=345"}, 500)
		eval(id+"="+id +"- 1")
		al
	}
		
	
	
	
})


$(document).on("click",".btn2",function(){
	let id =$(this).parent().attr("id")
if(eval(id+"=="+limit)){
		
	}else{
		eval(id+"="+id +"+ 1")
		$(this).parent().find(".move-area").animate({left:"-=345"}, 500)
	}
		
	});

	
	
	
	
	
	

});

