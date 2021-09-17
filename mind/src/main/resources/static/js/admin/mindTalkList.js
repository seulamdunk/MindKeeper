mindTalkList()

function mindTalkList(){
	$.ajax({
	type:"GET",
	url:"mindTalkList",
	success:function(result){
        var tblresult = result;
        var str = "";
        $.each(tblresult, function(i){
		if(tblresult[i][1].length>=50){
			tblresult[i][1]=tblresult[i][1].substr(0,50)
		}
            str += "<tr>"
            str += '<td>' + tblresult[i][0] + '</td><td>' + tblresult[i][1] + '</td><td>' + tblresult[i][2].substring(0,10) + '</td><td>' + tblresult[i][3] + '</td>'
            str += '</tr>'
        });
        $("#mindTalkList").append(str);
	},
	error:function(err){
		alert("조회오류")
		console.log(err)
	}
	})	
}