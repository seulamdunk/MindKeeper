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
            str += '<td>' + tblresult[i].customerID + '</td><td>' + tblresult[i].customerName + '</td><td>' + tblresult[i].customerNick 
            + '</td><td>'+'<button  class="btn btn-dark" onclick=customerPopup('+tblresult[i].customerNum+');>클릭</button>'
            str += '</tr>'
        });
        $("#customerList").append(str);
	},
	error:function(err){
		console.log(err)
	}
	})	
}

function customerPopup(num){
window.open("customer-detail/?num="+num, "a", "width=400, height=700, left=100, top=50"); 
}