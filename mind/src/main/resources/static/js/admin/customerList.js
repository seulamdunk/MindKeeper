customerList()

//회원목록 가져오기
function customerList(){
	$.ajax({
	type:"GET",
	url:"customerList",
	success:function(result){
        var tblresult = result;
        var str = "";
        $.each(tblresult, function(i){
            str += "<tr>"
            str += '<td>' + tblresult[i].customerID + '</td><td>' + tblresult[i].customerName + '</td><td>' + tblresult[i].customerNick + '</td><td>' + tblresult[i].createDate.substring(0,10) + '</td><td>' + '권한처리'
            str += '</tr>'
        });
        $("#customerList").append(str);
	},
	error:function(err){
		console.log(err)
	}
	})	
}