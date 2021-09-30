mindTalkList()

//회원목록 가져오기
function mindTalkList(){
	$.ajax({
	type:"GET",
	url:"mindTalkList",
	success:function(result){
        var tblresult = result;
        var str = '';
        var cnt = 0;
        
        $.each(tblresult, function(i){
			if(tblresult[i][2].length>=50){
				tblresult[i][2]=tblresult[i][2].substr(0,50);
			}
			if(tblresult[i][3]==null){
				tblresult[i][3]=""
			}else{
				tblresult[i][3]=tblresult[i][3].substring(0,10);				
			}// 나중에 삭제할것
			if(tblresult[i][4]==null){
				tblresult[i][4]=""
			}// 나중에 삭제할것
			str+='<tr><td>'+tblresult[i][1]+'</td><td>'+tblresult[i][2]
			+'</td><td>'+tblresult[i][3]+'</td><td>'+tblresult[i][4]+'</td><td>'
			+'<button class="btn btn-danger" onclick=mindTalkDelete('+"\""+tblresult[i][0]+"\""+');>삭제</button>'+'</td></tr>'
        });
		$('#mindTalkList').html(str)
	},
	error:function(err){
		console.log(err)
	}
	})	
}

//게시글 삭제
function mindTalkDelete(num){
	del=confirm("게시글을 삭제 하시겠습니까?");
	//삭제 확인
	if(del==true){
		
	$.ajax({
		type:"Delete",
		url:"mindTalkDelete/"+num,
		success:function(){
			
			mindTalkList()
		},
		error:function(err){
			alert("게시글삭제오류")
			console.log(err)
		}
	})
	
	}
}