<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 좋아요 -->
<title>마음지킴이</title>
  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
</head>
<body>

<%String talkNum = request.getParameter("talkNum"); %> 
<%String customerNum = request.getParameter("tokenNum"); %> 
<%String writer = request.getParameter("writer"); %>
<script type="text/javascript">
$(function(){
	likeTalkview(<%=talkNum%>,<%=customerNum%>,<%=writer%>);

	
	
	




	
	
})

function likeTalkview(talkNum,customerNum,writer){
	
		let param= {

				"talkNum":talkNum,
				"customerNum":customerNum
				}
		console.log(param)	
		let data=''
		$.ajax({
			data:JSON.stringify(param),
			type:'post',
			url:'/countLiketalk',
			dataType:"JSON",
			contentType:'application/json; charset=utf-8',
			success:function(data){
				
				var a=''


					if(data.cnt==0){

					a+=  '<span class="btn btn-primary" onclick="insertTalkLike(' +talkNum +','+customerNum+','+writer+  ')">❤<span class="talkLikeCount">'+data.cntSum+'</span> </span>  '	 	
				   a+=  '<span class="btn btn-primary cheerUPBtn">🗨 ' 
				   a+= ' <input class="talkNum" type="hidden" value="'+talkNum+'"></span>'
				     
					if(writer ==customerNum){
					a+=	'<span class="btn btn-primary deleteTalkBtn">❌ </span>'
						}
			   
					}else{
						a+=	'<span class="btn btn-primary" onclick="deleteTalkLike(' +talkNum +','+customerNum+','+writer+  ')" style="color:red;" >❤<span class="talkLikeCount">'+data.cntSum+'</span> </span> '
			 	
						   a+=  '<span class="btn btn-primary cheerUPBtn">🗨 ' 
						   a+= ' <input class="talkNum" type="hidden" value="'+talkNum+'"></span>'
						     
							if(writer ==customerNum){
							a+=	'<span class="btn btn-primary deleteTalkBtn">❌ </span>'
								}
			}
	
					$(".taklLikeArea"+talkNum).html(a)


				
				}
		
				


			});

		
	}


function insertTalkLike(talkNum,customerNum,writer){
	
		let param= {
		
				"talkNum":talkNum,
				"customerNum":customerNum
				}
		
			$.ajax({
				type:'post',
				url:"/saveLiketalk",
				data:JSON.stringify(param),
				contentType:'application/json; charset=utf-8',
				success:function(){
					
					likeTalkview(talkNum,customerNum,writer)
						}
					
				
				})
				

		}

function deleteTalkLike(talkNum,customerNum,writer){
	
	let param= {

			"talkNum":talkNum,
			"customerNum":customerNum
			}
	
		$.ajax({
			type:'post',
			url:"/deleteLikeTalk",
			data:JSON.stringify(param),
			contentType:'application/json; charset=utf-8',
			success:function(){		
				likeTalkview(talkNum,customerNum,writer)
					}

			})
			

	}

</script>
</body>
</html>