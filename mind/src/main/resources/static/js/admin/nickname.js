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

CustomerProfile()

function CustomerProfile(){
	$.ajax({
	type:"POST",
	url:"CustomerProfile",
	success:function(result){
        $('#CustomerProfile').attr("src",result);
	},
	error:function(err){
		console.log(err)
	}
	})	
	
}