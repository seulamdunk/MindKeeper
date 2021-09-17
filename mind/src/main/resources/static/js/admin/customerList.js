customerList()

function customerList(){
	$.ajax({
	type:"GET",
	url:"customerList",
	success:function(result){
        var tblresult = result;
        var str = "";
        $.each(tblresult, function(i){
            str += "<tr>"
            str += '<td>' + tblresult[i].customerID + '</td><td>' + tblresult[i].customerName + '</td><td>' + tblresult[i].phoneNum + '</td><td>' + tblresult[i].createDate.substring(0,10) + '</td>'
            str += '</tr>'
        });
        $("#customerList").append(str);
	},
	error:function(err){
		alert("조회오류")
		console.log(err)
	}
	})	
}