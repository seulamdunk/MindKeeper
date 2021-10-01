<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
 
</head>

<body>


<% String talkNum = request.getParameter("talkNum"); %>
<% String tokenNum = request.getParameter("tokenNum"); %>
<%-- <input id="123"type="hidden" value='<%= request.getParameter("talkNum") %>'> --%>

<%-- <div class ="1234"><%= request.getParameter("talkNum") %></div> --%>

  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
<script>

$(document).ready(function(){
	
	 commentList();
    function commentList(){
        let talkNum='<%=talkNum%>'
    	const tokenNum ='<%=tokenNum%>'
    		
    var	param={'talkNum': talkNum}	
 	$.ajax({
    		url : '/guest/talkReview',
    		contentType:'application/json; charset=utf-8',
    		type:'post',
    		data : JSON.stringify(talkNum),
    		dataType:'JSON',
    		success : function(data){
    		
    		 	var a = '';
    			$.each(data.content, function(key, value){ // value가 list형태라서 for문같은 each돌림
    		
    				var customerNum = value.customer.customerNum;
					let tkClass = value.tkClass
					console.log(tkClass)
    				/* 
    				var date = value.writetime;
    				var wd = new Date(date.valueOf());
    				var w_time = wd.getTime();
    				
    				var cur = new Date();
    				var c_time = cur.getTime();
    				
    				var chai = c_time - w_time;
 */


/*                      
 a+=         '  <div class="card-body div-over"  style="margin-left:' + tkClass * 5  + '%">'
 a+=    					         '<div class="row" style="margin-left:10px"> '        	 
 a+=    		                             '<div class="d-flex justify-content-between align-items-center" > '
 a+=   		                                 '<div class="mr-2"> '
 a+=    		                                	 '<div class="col-12"> '
 a+=   		                                    	 '<img class="rounded-circle" width="45" src="'+1+'" alt=""> '
 a+=    		                                    '</div>'
 a+=   		                                    '<div class="col-12">'
 a+=   		                                    	'<span>'+value.talkReviewDate+'</span>'
 a+=   		                                    '</div>'
 a+=   		                                '</div>'
 a+=  		                                '<div class="ml-2">'
 a+=   		                                   ' <div class="inline-div " style="width=100%">'
 a+=   		                                    	'<div class=" text-bk">'
 a+=   		                                    		'<p><strong>'+value.customer.customerName+'</strong> &nbsp;&nbsp;'+value.talkReviewCon+'</p>'
 a+=   		                                    	'</div>'
 a+=   		                                    	'<div class="h7 text-muted">'
 a+=   		                                    		
 a+=   		                                    '	</div>'
 a+=    		                                    	'<div class="">'
 a+=    							                      ' <span class="btn btn-primary">🤍 '+value.talkReviewCnt +'  </span>  '
 a+=    							                    '   <span class="btn btn-primary cheerUPBtn2">🗨  </span>	'
 a+=    							                      ' <input type="hidden" class="tkClass" value="'+value.tkClass+'">	'
 a+=    							                       ' <input type="hidden" class="groupNum" value="'+value.groupNum+'">'
 a+=    							                         '<input type="hidden" class="talkReviewNum" value="'+value.talkReviewNum+'">'
 																if(tokenNum == value.customer.customerNum){
 																	 a+= '<span class="btn btn-primary deleteReviewBtn">❌ </span>'						
 	 																}
		                       
 a+=   							                  '  </div>'
 a+=   							                   ' <div class="insert-group-area"></div>	'	                                   
 a+=   		                                    '</div>  '    
 a+=   		                               ' </div>'
    		                                
 a+=  	                            	'</div>'
 a+=  				       			' </div>'
 a+=  				       		'</div> ' */





 a+=     '<div class="card-body"  style="margin-left:' + value.tkClass * 5 +'%">';
 a+=	        '<div class="row" style="margin-left:10px"> '       	 ;
 a+=                ' <div class="d-flex justify-content-between align-items-center" >';
 a+=                    ' <div class="mr-2">';
 a+=                     	'<div class="col-12">';
 a+=                        	'<img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">';
 a+=                      '  </div>';
 a+=                        '<div class="col-12">';
 a+=                        	'<span>시간</span>';
 a+=                       ' </div>';
 a+=                    '</div>';
 a+=                    '<div class="ml-2">';
 a+=                       ' <div class="inline-div " style="width=100%">';
 a+=                         	'<div class=" text-bk">';
 a+=                        		'<p><strong>'+value.customer.customerName +'</strong> &nbsp;&nbsp;'+ value.talkReviewCon +'</p>';
 a+=                        	'</div>';
 a+=                        	'<div class="h7 text-muted">';
                         		
 a+=                        	'</div>';
 a+=                        	'<div class="">';
 a+=			                      ' <span class="btn btn-primary">🤍'+ value.talkReviewCnt +' </span> '; 
 a+=			                       '<span class="btn btn-primary cheerUPBtn2">🗨  </span>	';
 a+=			                      ' <input type="hidden" class="tkClass" value="'+ value.tkClass +'">	';
 a+=			                       ' <input type="hidden" class="groupNum" value="'+value.groupNum+'">';
 a+=			                         '<input type="hidden" class="'+value.talkReviewNum+'" value="'+value.talkReviewNum+'">';
			                         if(tokenNum == value.customer.customerNum){
											 a+= '<span class="btn btn-primary deleteReviewBtn">❌ </span>'						
											}				                       
			                         a+=			                   ' </div>';
			                         a+=			                   ' <div class="insert-group-area"></div>';		                                    
			                         a+=                        '</div>  '    ;
			                         a+=                   ' </div>';
                     
			                         a+=           '</div>';
			                         a+=   			' </div>';
			                         a+=   		'</div> ';

    	













	 
                    
            /*         if(chai < 1000 * 60)
                    	a += Math.floor(chai / 1000) + ' 초전';
                    else if(chai < 1000 * 60 * 60)
                    	a += Math.floor(chai / (1000 * 60)) + ' 분전';
                    else if(chai < 1000 * 60 * 60 * 24)
                    	a += Math.floor(chai / (1000 * 60 * 60)) + ' 시간전';
                    else if(chai < 1000 * 60 * 60 * 24 * 30)
                    	a += Math.floor(chai / (1000 * 60 * 60 * 24)) + ' 일전';
                    else if(chai < 1000 * 60 * 60 * 24 * 30 * 12)
                    	a += Math.floor(chai / (1000 * 60 * 60 * 24 * 30)) + ' 달전';
                     */
                  
    	   }); 
			
    			 $(".cheerUPArea"+talkNum ).html(a);
    			 
     	   
               }
 
         }); 
      
    }
    	
    
});


</script>




</html>
