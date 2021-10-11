
	function getYoutubeReview(){
		
		param={
			youtubeNum:$("#youtube-num").val()
		}
		$.ajax({
			type:"post",
			url:"/getYoutubeReview",
			data:JSON.stringify(param),
			contentType:'application/json; charset=utf-8',
			dataType:"JSON",
			success:function(data){
				userNum=$("#user-num").val()
				console.log(data)
				$(".comments-list").html("")
				$.each(data,function(key, value){
					console.log(value.youtubeReviewDate )
			
					
					var date = value.youtubeReviewDate;
				
					var wd = new Date(date.valueOf());
					var w_time = wd.getTime();
					
					var cur = new Date();
					var c_time = cur.getTime();
					
					var chai = c_time - w_time;
					
					let datef;
					if(chai < 1000 * 60)
	                	datef= Math.floor(chai / 1000) + " 초전";
	                else if(chai < 1000 * 60 * 60)
	                	 datef= Math.floor(chai / (1000 * 60)) + ' 분전';
	                else if(chai < 1000 * 60 * 60 * 24)
	                	datef= Math.floor(chai / (1000 * 60 * 60)) + ' 시간전';
	                else if(chai < 1000 * 60 * 60 * 24 * 30)
	                	 datef= Math.floor(chai / (1000 * 60 * 60 * 24)) + ' 일전';
	                else if(chai < 1000 * 60 * 60 * 24 * 30 * 12)
	                	 datef= Math.floor(chai / (1000 * 60 * 60 * 24 * 30)) + ' 달전';
					
					
					
						
		 let div = '<div class="media">' +
	               ' <div class="media-left" href="#">'+
	                 ' <img width=40px height=40px src="'+value.customer.profileImg+'">'    +                      
	               ' </div> '  +
	               ' <div class="media-body"> '+     
	               '<input class="youtube-review-num" type="hidden" value="'+value.youtubeReviewNum  +'">'+
	                 ' <h4 class="media-heading user_name">'+value.customer.customerNick+'</h4>'+
	                ' <p class="pull-right"><small>'+datef+'</small></p>'+value.youtubeReviewCon
	                
	                if(userNum== value.customer.customerNum){
	                	 div += ' <p class="delete-y-com"><small ><i class="fas fa-trash "></i></small></p>'
	                 }
	                console.log(userNum)
	                console.log(value.customer.customerNum)
	                
		 div += ' </div>'+
	                ' </div>'
	               
	              
	            
					
				$(".comments-list").append(div)	
					
					console.log(div)
				
					
				})
				
				
			},error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		})
		
		
	}
		
	
	
	
	
	
	


function insertYoutubeReview(){
	
	param={
		youtubeNum:$("#youtube-num").val(),
		youtubeCon:$("#youtubeCon").val()
	}
	$.ajax({
		type:"post",
		url:"/insertYoutubeReview",
		data:JSON.stringify(param),
		contentType:'application/json; charset=utf-8',		
		success:function(data){
			
			$("#youtubeCon").val("")
			getYoutubeReview()
		},error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	})
		

}








$(function(){
	getYoutubeReview()

	
	
	$(document).on("click",".delete-y-com",function(){
		youtubeReviewNum=$(this).parent(".media-body").find(".youtube-review-num").val()
		param={
			"youtubeReviewNum":youtubeReviewNum
			
		}
		
		$.ajax({
			type:"post",
			url:"/deleteYoutubeReview",
			data:JSON.stringify(param),
			contentType:'application/json; charset=utf-8',		
			success:function(data){
				
				$("#youtubeCon").val("")
				
				getYoutubeReview()
			},error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		})
			

	})
	
})