mindTalkList()

//게시글 가져오기
function mindTalkList(){
	$.ajax({
	type:"GET",
	url:"mindTalkList",
	success:function(result){
        var tblresult = result;
        var str = '';
        $.each(tblresult, function(i){
			if(tblresult[i][2].length>=50){
				tblresult[i][2]=tblresult[i][2].substr(0,50);
			}
			if(tblresult[i][3]==null){
				tblresult[i][3]=""
			}// 나중에 삭제할것
			if(tblresult[i][4]==null){
				tblresult[i][4]=""
			}// 나중에 삭제할것
            
            var tr = $('<tr/>');
            var id = $('<td/>').html(tblresult[i][1]);
            tr.append(id);
            var con = $('<td/>').html(tblresult[i][2]);
            tr.append(con);
            var date = $('<td/>').html(tblresult[i][3]);
            tr.append(date);
            var cnt = $('<td/>').html(tblresult[i][4]);
            tr.append(cnt);
            var del = $('<td/>').html('<button onclick=mindTalkDelete('+"\""+tblresult[i][0]+"\""+');>삭제</button>');
            tr.append(del);
	        $("#mindTalkList").append(tr);
        });
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
