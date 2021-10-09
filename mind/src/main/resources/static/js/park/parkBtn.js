//========================= 전체버튼 클릭시 목록과 전체마커 표시(시작) ==============================
function total(){

	var total = $("#Total").text(); // 전체버튼 텍스트값 가져오기
/*	alert(total);*/
	
	$.ajax({
    	url:"/totalBtn",
    	type:"post",
    	success:function(total){
    		
    	for(i=0; i< total.length; i++){
    				
    			//*********************html 목록 출력 시작***********************
    			var html = "";
    			
    			html = '<tr>'
     		    html += '<td style="font-weight: bold;" id="parkName">' + total[i]["parkName"] + '</td>';
     		    html += '<td>' + total[i]["parkAddr"] + '</td>';
     		    html += '<td><img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18"> ' + total[i]["parkScore"] + '</td>';
     		    html += '<td><a id="parkScoreLink" href="' + total[i]["parkScoreLink"] + '" target="_blank">' + total[i]["parkScoreCnt"] + '</a></td>';
     		    html += '<td><a id="parkReviewLink" href="' + total[i]["parkReviewLink"] + '" target="_blank">' + total[i]["parkReview"] + '</a></td>';
     		    html += '<td><a id="parkLink" href="' + total[i]["parkLink"] + '" target="_blank">상세보기 ></a></td>';
    			html += '</tr>'
    				
     		    $("#parkList").append(html);
    			//*********************html 목록 출력 종료***********************
     		    $("#parkList #parkName").css({"cursor":"pointer"});
     		    
    			// 마커 이미지 생성
    			var imageSrc = "../img/parkImg/running.png"; 
    			var imageSize = new kakao.maps.Size(40, 45); 
    			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
    		    //위치 지정 		  
    		    var position= new kakao.maps.LatLng(total[i]["parkLat"],total[i]["parkLng"])
    		    var title = total[i]["parkName"]
    		    
    		   Parkmarker = new kakao.maps.Marker({
    		    	map: map,
    		       	position: position,
    		       	image:markerImage,
    		        clickable: true
    		    });
    		    
    		    var iwContent = '<div class="wrap">' + 
                '    <div class="info">' + 
                '        <div class="title" style="background-color:yellowgreen;color:black;font-size:1em;">' + 
                			total[i]["parkName"]+ 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc" style="font-size:0.8em;">' + 
                '                <div class="ellipsis">' + 
                '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + total[i]["parkScore"] +
                '					 , 후기 : <a href="' + total[i]["parkScoreLink"] +'" id="parkScoreLink" target="_blank">' + total[i]["parkScoreCnt"] + '</a>' + 
                '					 , 리뷰 : <a href="' + total[i]["parkReviewLink"] +'" id="parkReviewLink" target="_blank">' + total[i]["parkReview"] + '</a>' + 
                '			 	 </div>' + 
                '                <div class="ellipsis">' + total[i]["parkAddr"] + '</div>' + 
                '                <div><a href="'+ total[i]["parkLink"] +'" id="parkLink" target="_blank">상세보기 ></a></div>' + 
                '            </div>' + 
                '        </div>' + 
                '    </div>' +    
                '</div>',
    		    iwRemoveable = true;

    		    // 인포윈도우를 생성
    		    var infowindow = new kakao.maps.InfoWindow({
    		        content : iwContent,
    		        removable : iwRemoveable
    		    });

    		    kakao.maps.event.addListener(Parkmarker, 'click', makeClickListener(map, Parkmarker, infowindow));
    		    
    		    // 마커에 클릭이벤트를 등록
    		    function makeClickListener(map, Parkmarker, infowindow){
    		        return function(){  
    		        	infowindow.open(map, Parkmarker);
    		    	};
    		    } // end of 마커 클릭이벤트
	
    	    } // end of for
    		
   			//************ 공원이름 클릭시 위치, 인포윈도우 생성(시작) *************
    		// 공원이름
    		$("#parkList #parkName").click(function(){
    			//alert($(this).text());
    			var parkName = $(this).text();
    			
				for(y=0;y<total.length;y++){
					
	    			var parkListName = total[y]["parkName"];
	    			
					if(parkListName == parkName){
				    	
		    			var mapContainer = document.getElementById('map'),
		    			// 공원이름과 같은 위치 
		    			position = new kakao.maps.LatLng(total[y]["parkLat"],total[y]["parkLng"]);
		    			// 마커 이미지
		    			var imageSrc = "../img/parkImg/searchPosition.png"; 
		    			var imageSize = new kakao.maps.Size(40, 45);
		    			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		    			
		    		    mapOption = { 
		    		        center: position, // 지도의 중심좌표
		    		        level: 5 // 지도의 확대 레벨
		    		    };
	
			    		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
			    		// 마커를 생성
			    		var marker = new kakao.maps.Marker({
			    		    position: position,
		    		       	image:markerImage
			    		});
		
			    		marker.setMap(map);
		    		
		    		var iwContent = '<div class="wrap">' + 
	                '    <div class="info">' + 
	                '        <div class="title" style="background-color:lightpink;color:black;font-size:1em;">' + 
	                			total[y]["parkName"]+ 
	                '        </div>' + 
	                '        <div class="body">' + 
	                '            <div class="img">' +
	                '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
	                '           </div>' + 
	                '            <div class="desc" style="font-size:0.8em;">' + 
	                '                <div class="ellipsis">' + 
	                '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + total[y]["parkScore"] +
	                '					 , 후기 : <span id="parkScoreLink" style="color:#007bff;">' + total[y]["parkScoreCnt"] + '</span>' + 
	                '					 , 리뷰 : <span id="parkReviewLink" style="color:#007bff;">' + total[y]["parkReview"] + '</span>' + 
	                '			 	 </div>' + 
	                '                <div class="ellipsis">' + total[y]["parkAddr"] + '</div>' + 
	                '                <div><span id="parkLink" style="color:#007bff;">상세보기 ></span></div>' + 
	                '            </div>' + 
	                '        </div>' + 
	                '    </div>' +    
	                '</div>'

			    	// 인포윈도우를 생성
			    	var infowindow = new kakao.maps.InfoWindow({
			    	    position : iwPosition, 
			    	    content : iwContent 
			    	});
			    	infowindow.open(map, marker); 
			    	
				 } // end of for
				}
 			}) // end of 공원이름

    		//************ 공원이름 클릭시 위치, 인포윈도우 생성(종료) *************
    		
    	},// end of function(total)
    	error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	}) // end of ajax
	
} // end of function total()
//========================= 전체버튼 클릭시 목록과 전체마커 표시(종료) ==============================


//========================= 지역버튼 클릭시 목록과 전체마커 표시(시작) ==============================
function area(){
	
	alert(document.getElementById("area").innerText);
}