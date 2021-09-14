memberList()

function memberList(){
	$.ajax({
	type:"GET",
	url:"memberList",
	success:function(result){
        var tblresult = result;
        var str = "";
        $.each(tblresult, function(i){
            str += "<tr>"
            str += '<td>' + tblresult[i].customerID + '</td><td>' + tblresult[i].customerName + '</td><td>' + tblresult[i].phoneNum + '</td><td>' + tblresult[i].createDate + '</td>'
            str += '</tr>'
        });
        $("#memberList").append(str);
	},
	error:function(err){
		alert("조회오류")
		console.log(err)
	}
	})	
}