nickname()

function nickname(){
	$.ajax({
	type:"POST",
	url:"nickname",
	success:function(result){
        $('#nickname').text(result+" 님");
	},
	error:function(err){
		console.log(err)
	}
	})	
}