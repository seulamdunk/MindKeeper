

	var id = '${id}'; // postid

	$('[name=commentInsertBtn]').click(function() {
		var insertData = $('[name=commentInsertForm]').serialize();
		commentInsert(insertData);
	});

	function commentList(){
		$.ajax({
			url : '/comment/list',
			type:'get',
			data : {'id': id},
			success : function(data){
				var a = '';
				$.each(data, function(key, value){ // value가 list형태라서 for문같은 each돌림
					var confirms = "댓글을 삭제하시겠습니까?"
					var userid = value.user.id;
					var date = value.writetime;
					var wd = new Date(date.valueOf());
					var w_time = wd.getTime();
					
					var cur = new Date();
					var c_time = cur.getTime();
					
					var chai = c_time - w_time;
					
					a += '<div class="commentArea">';
					a += '<div class="img"><a href="/main/user/'+ value.user.id +'">'; 
					
					if(value.user.profile_photo != null)
						a += '<img src="/images/profile/'+ value.user.profile_photo"></a>';
					else
						a += '<img src="/images/noimage.png'"></a>';
					a += '</div>';
	                a += '<div class="commentContent'+value.id+'"> <a href="/main/user/'
	                	+ value.user.id +'"><p> <b>' 
	                	+ value.user.userId + '</b></p></a>' + ' <p>' + value.content +'</p>';
	                a += '<div>';
	                
	                if(chai < 1000 * 60)
	                	a += Math.floor(chai / 1000) + ' 초전';
	                else if(chai < 1000 * 60 * 60)
	                	a += Math.floor(chai / (1000 * 60)) + ' 분전';
	                else if(chai < 1000 * 60 * 60 * 24)
	                	a += Math.floor(chai / (1000 * 60 * 60)) + ' 시간전';
	                else if(chai < 1000 * 60 * 60 * 24 * 30)
	                	a += Math.floor(chai / (1000 * 60 * 60 * 24)) + ' 일전';
	                else if(chai < 1000 * 60 * 60 * 24 * 30 * 12)
	                	a += Math.floor(chai / (1000 * 60 * 60 * 24 * 30)) + ' 달전';
	                
	                if(${currentid} == userid)
	                	a += '<a onclick="commentDelete('+ value.id + ');">삭제</a>';
	                a += '</div></div></div>';
		   });
		   $(".commentList").html(a);
	           }
	     });
	}
	
	//댓글 등록
	function commentInsert(insertData){
	    $.ajax({
	        url : '/comment/insert',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	                commentList();
	                $('#content').val('');
	            }
	        }
	    });
	}
	
	function commentDelete(cmt){
		$.ajax({
			url : '/comment/delete/' + cmt,
			type : 'post',
			success : function(data){
				if(data == 1)
					commentList(id);
			}
		});
	}
	
	$(document).ready(function(){
	    commentList();
	});
