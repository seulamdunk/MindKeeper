//========================= 지역버튼 클릭시 목록과 전체마커 표시(시작) ==============================
function area(){

/*	alert(document.getElementById("seoul").innerText);*/
	var seoul = document.getElementById("seoul").innerText;

	$.ajax({
    	url:"/areaBtn",
    	type:"post",
    	success:function(area){
    		
    	    $("#parkList").empty(html);
    	    Parkmarker.setMap(null);
    	    
    	var seoulList = [];
    	for(i=0; i< area.length; i++){
    		
    		if(area[i]["parkAddr"].includes(seoul)){
       		 seoulList.push(area[i]);
    		} // 서울
    	} // end of for
		
    	// 서울이 담긴 배열
		for(z=0; z< seoulList.length; z++){
			//*********************html 목록 출력 시작***********************
			var html = "";
			
			html = '<tr>'
     		html += '<td style="font-weight: bold;" id="parkName">' + seoulList[z]["parkName"] + '</td>';
     		html += '<td>' + seoulList[z]["parkAddr"] + '</td>';
     		html += '<td><img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18"> ' + seoulList[z]["parkScore"] + '</td>';
     		html += '<td><a id="parkScoreLink" href="' + seoulList[z]["parkScoreLink"] + '">' + seoulList[z]["parkScoreCnt"] + '</a></td>';
     		html += '<td><a id="parkReviewLink" href="' + seoulList[z]["parkReviewLink"] + '">' + seoulList[z]["parkReview"] + '</a></td>';
     		html += '<td><a id="parkLink" href="' + seoulList[z]["parkLink"] + '">상세보기 ></a></td>';
    		html += '</tr>'

 		    $("#parkList").append(html);
			//*********************html 목록 출력 종료***********************

 		    $("#parkList #parkName").css({"cursor":"pointer"});
 		    
			// 마커 이미지 생성
			var imageSrc = "../img/parkImg/running.png"; 
			var imageSize = new kakao.maps.Size(40, 45);
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		    //위치 지정 		  
		    var position= new kakao.maps.LatLng(seoulList[z]["parkLat"],seoulList[z]["parkLng"])
		    var title = seoulList[z]["parkName"]
		    
		   Parkmarker = new kakao.maps.Marker({
		    	map: map,
		       	position: position,
		       	image:markerImage,
		        clickable: true
		    });
		    
		    var iwContent = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title" style="background-color:yellowgreen;color:black;font-size:1em;">' + 
            			seoulList[z]["parkName"]+ 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc" style="font-size:0.8em;">' + 
            '                <div class="ellipsis">' + 
            '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + seoulList[z]["parkScore"] +
            '					 , 후기 : <a href="' + seoulList[z]["parkScoreLink"] +'" id="parkScoreLink">' + seoulList[z]["parkScoreCnt"] + '</a>' + 
            '					 , 리뷰 : <a href="' + seoulList[z]["parkReviewLink"] +'" id="parkReviewLink">' + seoulList[z]["parkReview"] + '</a>' + 
            '			 	 </div>' + 
            '                <div class="ellipsis">' + seoulList[z]["parkAddr"] + '</div>' + 
            '                <div><a href="'+ seoulList[z]["parkLink"] +'" id="parkLink">상세보기 ></a></div>' + 
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

		var moveLatLng = new kakao.maps.LatLng(seoulList[10]["parkLat"],seoulList[10]["parkLng"]);   
		map.panTo(moveLatLng);
		
		//************ 공원이름 클릭시 위치, 인포윈도우 생성(시작) *************
		// 공원이름
		$("#parkList #parkName").click(function(){
			//alert($(this).text());
			var parkName = $(this).text();
			
			for(y=0;y<seoulList.length;y++){
				
    			var parkListName = seoulList[y]["parkName"];
    			
				if(parkListName == parkName){
			    	
	    			var mapContainer = document.getElementById('map'),
	    			// 공원이름과 같은 위치 
	    			position = new kakao.maps.LatLng(seoulList[y]["parkLat"],seoulList[y]["parkLng"]);
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
                			seoulList[y]["parkName"]+ 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc" style="font-size:0.8em;">' + 
                '                <div class="ellipsis">' + 
                '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + seoulList[y]["parkScore"] +
                '					 , 후기 : <span id="parkScoreLink" style="color:#007bff;">' + seoulList[y]["parkScoreCnt"] + '</span>' + 
                '					 , 리뷰 : <span id="parkReviewLink" style="color:#007bff;">' + seoulList[y]["parkReview"] + '</span>' + 
                '			 	 </div>' + 
                '                <div class="ellipsis">' + seoulList[y]["parkAddr"] + '</div>' + 
                '                <div><span id="parkLink" style="color:#007bff;">상세보기 ></span></div>' + 
                '            </div>' + 
                '        </div>' + 
                '    </div>' +    
                '</div>'

		    	// 인포윈도우를 생성
		    	var infowindow = new kakao.maps.InfoWindow({
		    	    position : position, 
		    	    content : iwContent 
		    	});
		    	infowindow.open(map, marker); 
		    	
			 } // end of for
			}
		}) // end of 공원이름
		//************ 공원이름 클릭시 위치, 인포윈도우 생성(종료) *************
		
	},// end of function(area)
	error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
	
    }) // end of ajax
} // end of function area()
//========================= (서울)지역버튼 클릭시 목록과 전체마커 표시(종료) ==============================


//========================= (인천)지역버튼 클릭시 목록과 전체마커 표시(시작) ==============================
function brea(){

/*	alert(document.getElementById("incheon").innerText);*/
	var incheon = document.getElementById("incheon").innerText;
	
	$.ajax({
    	url:"/areaBtn",
    	type:"post",
    	success:function(area){
    		
    	    $("#parkList").empty(html);
    	    Parkmarker.setMap(null);
    	    
    	var incheonList = [];
    	for(i=0; i< area.length; i++){
    		
    		if(area[i]["parkAddr"].includes(incheon)){
    			incheonList.push(area[i]);
    		} // 서울
    	} // end of for
		
    	// 서울이 담긴 배열
		for(z=0; z< incheonList.length; z++){
			//*********************html 목록 출력 시작***********************
			var html = "";
			
			html = '<tr>'
     		html += '<td style="font-weight: bold;" id="parkName">' + incheonList[z]["parkName"] + '</td>';
     		html += '<td>' + incheonList[z]["parkAddr"] + '</td>';
     		html += '<td><img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18"> ' + incheonList[z]["parkScore"] + '</td>';
     		html += '<td><a id="parkScoreLink" href="' + incheonList[z]["parkScoreLink"] + '">' + incheonList[z]["parkScoreCnt"] + '</a></td>';
     		html += '<td><a id="parkReviewLink" href="' + incheonList[z]["parkReviewLink"] + '">' + incheonList[z]["parkReview"] + '</a></td>';
     		html += '<td><a id="parkLink" href="' + incheonList[z]["parkLink"] + '">상세보기 ></a></td>';
    		html += '</tr>'

 		    $("#parkList").append(html);
			//*********************html 목록 출력 종료***********************

 		    $("#parkList #parkName").css({"cursor":"pointer"});
 		    
			// 마커 이미지 생성
			var imageSrc = "../img/parkImg/running.png"; 
			var imageSize = new kakao.maps.Size(40, 45);
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		    //위치 지정 		  
		    var position= new kakao.maps.LatLng(incheonList[z]["parkLat"],incheonList[z]["parkLng"])
		    var title = incheonList[z]["parkName"]
		    
		   Parkmarker = new kakao.maps.Marker({
		    	map: map,
		       	position: position,
		       	image:markerImage,
		        clickable: true
		    });
		    
		    var iwContent = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title" style="background-color:yellowgreen;color:black;font-size:1em;">' + 
            			incheonList[z]["parkName"]+ 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc" style="font-size:0.8em;">' + 
            '                <div class="ellipsis">' + 
            '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + incheonList[z]["parkScore"] +
            '					 , 후기 : <a href="' + incheonList[z]["parkScoreLink"] +'" id="parkScoreLink">' + incheonList[z]["parkScoreCnt"] + '</a>' + 
            '					 , 리뷰 : <a href="' + incheonList[z]["parkReviewLink"] +'" id="parkReviewLink">' + incheonList[z]["parkReview"] + '</a>' + 
            '			 	 </div>' + 
            '                <div class="ellipsis">' + incheonList[z]["parkAddr"] + '</div>' + 
            '                <div><a href="'+ incheonList[z]["parkLink"] +'" id="parkLink">상세보기 ></a></div>' + 
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
		
		var moveLatLng = new kakao.maps.LatLng(incheonList[10]["parkLat"],incheonList[10]["parkLng"]);   
		map.panTo(moveLatLng);
		
		//************ 공원이름 클릭시 위치, 인포윈도우 생성(시작) *************
		// 공원이름
		$("#parkList #parkName").click(function(){
			//alert($(this).text());
			var parkName = $(this).text();
			
			for(y=0;y<incheonList.length;y++){
				
    			var parkListName = incheonList[y]["parkName"];
    			
				if(parkListName == parkName){
			    	
	    			var mapContainer = document.getElementById('map'),
	    			// 공원이름과 같은 위치 
	    			position = new kakao.maps.LatLng(incheonList[y]["parkLat"],incheonList[y]["parkLng"]);
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
                			incheonList[y]["parkName"]+ 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc" style="font-size:0.8em;">' + 
                '                <div class="ellipsis">' + 
                '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + incheonList[y]["parkScore"] +
                '					 , 후기 : <span id="parkScoreLink" style="color:#007bff;">' + incheonList[y]["parkScoreCnt"] + '</span>' + 
                '					 , 리뷰 : <span id="parkReviewLink" style="color:#007bff;">' + incheonList[y]["parkReview"] + '</span>' + 
                '			 	 </div>' + 
                '                <div class="ellipsis">' + incheonList[y]["parkAddr"] + '</div>' + 
                '                <div><span id="parkLink" style="color:#007bff;">상세보기 ></span></div>' + 
                '            </div>' + 
                '        </div>' + 
                '    </div>' +    
                '</div>'

		    	// 인포윈도우를 생성
		    	var infowindow = new kakao.maps.InfoWindow({
		    	    position : position, 
		    	    content : iwContent 
		    	});
		    	infowindow.open(map, marker); 
		    	
			 } // end of for
			}
		}) // end of 공원이름
		//************ 공원이름 클릭시 위치, 인포윈도우 생성(종료) *************
		
	},// end of function(area)
	error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
	
    }) // end of ajax
} // end of brea()
//========================= (인천)지역버튼 클릭시 목록과 전체마커 표시(종료) ==============================


//========================= (경기)지역버튼 클릭시 목록과 전체마커 표시(시작) ==============================
function crea(){

/*	alert(document.getElementById("gyeonggi").innerText);*/
	var gyeonggi = document.getElementById("gyeonggi").innerText;

	$.ajax({
    	url:"/areaBtn",
    	type:"post",
    	success:function(area){
    		
    	    $("#parkList").empty(html);
    	    Parkmarker.setMap(null);
    	    
    	var gyeonggiList = [];
    	for(i=0; i< area.length; i++){
    		
    		if(area[i]["parkAddr"].includes(gyeonggi)){
    			gyeonggiList.push(area[i]);
    		} // 서울
    	} // end of for
		
    	// 서울이 담긴 배열
		for(z=0; z< gyeonggiList.length; z++){
			//*********************html 목록 출력 시작***********************
			var html = "";
			
			html = '<tr>'
     		html += '<td style="font-weight: bold;" id="parkName">' + gyeonggiList[z]["parkName"] + '</td>';
     		html += '<td>' + gyeonggiList[z]["parkAddr"] + '</td>';
     		html += '<td><img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18"> ' + gyeonggiList[z]["parkScore"] + '</td>';
     		html += '<td><a id="parkScoreLink" href="' + gyeonggiList[z]["parkScoreLink"] + '">' + gyeonggiList[z]["parkScoreCnt"] + '</a></td>';
     		html += '<td><a id="parkReviewLink" href="' + gyeonggiList[z]["parkReviewLink"] + '">' + gyeonggiList[z]["parkReview"] + '</a></td>';
     		html += '<td><a id="parkLink" href="' + gyeonggiList[z]["parkLink"] + '">상세보기 ></a></td>';
    		html += '</tr>'

 		    $("#parkList").append(html);
			//*********************html 목록 출력 종료***********************

 		    $("#parkList #parkName").css({"cursor":"pointer"});
 		    
			// 마커 이미지 생성
			var imageSrc = "../img/parkImg/running.png"; 
			var imageSize = new kakao.maps.Size(40, 45);
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		    //위치 지정 		  
		    var position= new kakao.maps.LatLng(gyeonggiList[z]["parkLat"],gyeonggiList[z]["parkLng"])
		    var title = gyeonggiList[z]["parkName"]
		    
		   Parkmarker = new kakao.maps.Marker({
		    	map: map,
		       	position: position,
		       	image:markerImage,
		        clickable: true
		    });
		    
		    var iwContent = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title" style="background-color:yellowgreen;color:black;font-size:1em;">' + 
            			gyeonggiList[z]["parkName"]+ 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc" style="font-size:0.8em;">' + 
            '                <div class="ellipsis">' + 
            '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + gyeonggiList[z]["parkScore"] +
            '					 , 후기 : <a href="' + gyeonggiList[z]["parkScoreLink"] +'" id="parkScoreLink">' + gyeonggiList[z]["parkScoreCnt"] + '</a>' + 
            '					 , 리뷰 : <a href="' + gyeonggiList[z]["parkReviewLink"] +'" id="parkReviewLink">' + gyeonggiList[z]["parkReview"] + '</a>' + 
            '			 	 </div>' + 
            '                <div class="ellipsis">' + gyeonggiList[z]["parkAddr"] + '</div>' + 
            '                <div><a href="'+ gyeonggiList[z]["parkLink"] +'" id="parkLink">상세보기 ></a></div>' + 
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
		
		var moveLatLng = new kakao.maps.LatLng(gyeonggiList[15]["parkLat"],gyeonggiList[15]["parkLng"]);   
		map.panTo(moveLatLng);
		
		//************ 공원이름 클릭시 위치, 인포윈도우 생성(시작) *************
		// 공원이름
		$("#parkList #parkName").click(function(){
			//alert($(this).text());
			var parkName = $(this).text();
			
			for(y=0;y<gyeonggiList.length;y++){
				
    			var parkListName = gyeonggiList[y]["parkName"];
    			
				if(parkListName == parkName){
			    	
	    			var mapContainer = document.getElementById('map'),
	    			// 공원이름과 같은 위치 
	    			position = new kakao.maps.LatLng(gyeonggiList[y]["parkLat"],gyeonggiList[y]["parkLng"]);
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
                			gyeonggiList[y]["parkName"]+ 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc" style="font-size:0.8em;">' + 
                '                <div class="ellipsis">' + 
                '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + gyeonggiList[y]["parkScore"] +
                '					 , 후기 : <span id="parkScoreLink" style="color:#007bff;">' + gyeonggiList[y]["parkScoreCnt"] + '</span>' + 
                '					 , 리뷰 : <span id="parkReviewLink" style="color:#007bff;">' + gyeonggiList[y]["parkReview"] + '</span>' + 
                '			 	 </div>' + 
                '                <div class="ellipsis">' + gyeonggiList[y]["parkAddr"] + '</div>' + 
                '                <div><span id="parkLink" style="color:#007bff;">상세보기 ></span></div>' + 
                '            </div>' + 
                '        </div>' + 
                '    </div>' +    
                '</div>'

		    	// 인포윈도우를 생성
		    	var infowindow = new kakao.maps.InfoWindow({
		    	    position : position, 
		    	    content : iwContent 
		    	});
		    	infowindow.open(map, marker); 
		    	
			 } // end of for
			}
		}) // end of 공원이름
		//************ 공원이름 클릭시 위치, 인포윈도우 생성(종료) *************
		
	},// end of function(area)
	error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
	
    }) // end of ajax
    
} // end of function crea()