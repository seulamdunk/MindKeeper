var mapContainer = document.getElementById('map');

var mapCenter = new kakao.maps.LatLng(37.47908780531465, 126.87895238473779),
    mapOption = {
        center: mapCenter, // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

// 현재위치 담을 배열
var locPosition =[]
//========================= 현재 접속위치 첫화면에 출력 (시작) ==============================
if (navigator.geolocation) {
    
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, 
            lon = position.coords.longitude; 
       
        locPosition = new kakao.maps.LatLng(lat, lon); 
        
        // 마커와 인포윈도우를 표시
        displayMarker(locPosition);
            
      });
    
} else { 
    
    var locPosition = new kakao.maps.LatLng(37.47908780531465, 126.87895238473779),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

//지도에 마커와 인포윈도우를 표시하는 함수
function displayMarker(locPosition) {

    // 마커 이미지 생성
	var imageSrc = "../img/parkImg/currentPosition.png"; 
	var imageSize = new kakao.maps.Size(33, 35); 
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
    
    // 마커를 생성
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition,
       	image:markerImage
    }); 
    
    map.setCenter(locPosition);      
}     
//========================= 현재 접속위치 첫화면에 출력 (종료) ==============================

// 지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);

//지도,스카이뷰 컨트롤러
var mapTypeControl = new kakao.maps.MapTypeControl();
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

//지도 확대, 축소 줌 컨트롤 생성
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

//========================= DB에 저장된 park 마커표시 (시작) ==============================
/*function pageload(page)
if ap*/
$.ajax({
    	url:"/parkRequest",
    	type:"post",
    
    	success:function(parkData){
    	
    		for(i=0; i< parkData.length; i++){
    			
    			 								  // lat1,lng1 => 현재위치 좌표, lat2,lng2 => 마커들의 위치 좌표
    			function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
    				function deg2rad(deg) {
	    				return deg * (Math.PI/180)
    				}
	    			var R = 6371; // 지구반경(km)
	    			var dLat = deg2rad(lat2-lat1); // (마커 위도 - 현재위치 위도) 
	    			var dLon = deg2rad(lng2-lng1); // (마커 경도 - 현재위치 경도)
	    			var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
	    			var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    			// Math.Atan2(Double, Double) => 탄젠트를 적용했을 때 지정된 두 숫자의 몫이 나오는 각도를 반환, Math.sqrt => 제곱근 반환
	    			var d = R * c; // 거리(km) = 지구반경  * (각도*2)
	    			
	    			return d;
    			} // end of function getDistanceFromLatLonInKm()

    			var d =getDistanceFromLatLonInKm(locPosition["Ma"], locPosition["La"],parkData[i]["parkLat"],parkData[i]["parkLng"])
    			//console.log(locPosition["Ma"]) // 현재위치 위도 가져와 지는지 확인
    			//console.log(d) // 현재위치와 DB공원 위치와의 거리 차이 확인
    			
    			// 반경 2km이내 이면
    			if(d <= 2){
    				
    			//*********************html 목록 출력 시작***********************
    			var html = "";
    			
    			html = '<tr>'
     		    html += '<td style="font-weight:bold;width:250px;" id="parkName">' + parkData[i]["parkName"] + '</td>';
     		    html += '<td style="width:600px;">' + parkData[i]["parkAddr"] + '</td>';
     		    html += '<td><img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18"> ' + parkData[i]["parkScore"] + '</td>';
     		    html += '<td><a id="parkScoreLink" href="' + parkData[i]["parkScoreLink"] + '" target="_blank">' + parkData[i]["parkScoreCnt"] + '</a></td>';
     		    html += '<td><a id="parkReviewLink" href="' + parkData[i]["parkReviewLink"] + '" target="_blank">' + parkData[i]["parkReview"] + '</a></td>';
     		    html += '<td><a id="parkLink" href="' + parkData[i]["parkLink"] + '">상세보기 ></a></td>';
    			html += '</tr>'
    				
     		    $("#parkList").append(html);
    			//*********************html 목록 출력 종료***********************
     		    
     		    $("#parkList #parkName").css({"cursor":"pointer"});
     		    
    			// 마커 이미지 생성
    			var imageSrc = "../img/parkImg/running.png"; 
    			var imageSize = new kakao.maps.Size(40, 45); 
    			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
    		    //위치 지정 		  
    		    var position= new kakao.maps.LatLng(parkData[i]["parkLat"],parkData[i]["parkLng"])
    		    var title = parkData[i]["parkName"]
    		    
    		   Parkmarker = new kakao.maps.Marker({
    		    	map: map,
    		       	position: position,
    		       	image:markerImage,
    		        clickable: true
    		    });
    		    
    		    var iwContent = '<div class="wrap">' + 
                '    <div class="info">' + 
                '        <div class="title" style="background-color:yellowgreen;color:black;font-size:1em;">' + 
                			parkData[i]["parkName"]+ 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc" style="font-size:0.8em;">' + 
                '                <div class="ellipsis">' + 
                '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + parkData[i]["parkScore"] +
                '					 , 후기 : <a href="' + parkData[i]["parkScoreLink"] +'" id="parkScoreLink" target="_blank">' + parkData[i]["parkScoreCnt"] + '</a>' + 
                '					 , 리뷰 : <a href="' + parkData[i]["parkReviewLink"] +'" id="parkReviewLink" target="_blank">' + parkData[i]["parkReview"] + '</a>' + 
                '			 	 </div>' + 
                '                <div class="ellipsis">' + parkData[i]["parkAddr"] + '</div>' + 
                '                <div><a href="'+ parkData[i]["parkLink"] +'" id="parkLink" target="_blank">상세보기 ></a></div>' + 
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
    		    
    		  } // end of if(d <=3)
	
    	    } // end of for
    		
   			//************ 공원이름 클릭시 위치, 인포윈도우 생성(시작) *************
    		// 공원이름
    		$("#parkList #parkName").click(function(){
    			//alert($(this).text());
    			var parkName = $(this).text();
    			
				for(y=0;y<parkData.length;y++){
					
	    			var parkListName = parkData[y]["parkName"];
	    			
					if(parkListName == parkName){
				    	
		    			var mapContainer = document.getElementById('map'),
		    			// 공원이름과 같은 위치 
		    			position = new kakao.maps.LatLng(parkData[y]["parkLat"],parkData[y]["parkLng"]);
		    			// 마커 이미지
		    			var imageSrc = "../img/parkImg/searchPosition.png"; 
		    			var imageSize = new kakao.maps.Size(40, 45);
		    			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		    			
		    		    mapOption = { 
		    		        center: position, // 지도의 중심좌표
		    		        level: 3 // 지도의 확대 레벨
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
	                			parkData[y]["parkName"]+ 
	                '        </div>' + 
	                '        <div class="body">' + 
	                '            <div class="img">' +
	                '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
	                '           </div>' + 
	                '            <div class="desc" style="font-size:0.8em;">' + 
	                '                <div class="ellipsis">' + 
	                '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + parkData[y]["parkScore"] +
	                '					 , 후기 : <a href="' + parkData[y]["parkScoreLink"] +'" id="parkScoreLink" target="_blank">' + parkData[y]["parkScoreCnt"] + '</a>' + 
	                '					 , 리뷰 : <a href="' + parkData[y]["parkReviewLink"] +'" id="parkReviewLink" target="_blank">' + parkData[y]["parkReview"] + '</a>' + 
	                '			 	 </div>' + 
	                '                <div class="ellipsis">' + parkData[y]["parkAddr"] + '</div>' + 
	                '                <div><a href="'+ parkData[y]["parkLink"] +'" id="parkLink" target="_blank">상세보기 ></a></div>' + 
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
			    	
			    	
					} // end of if
				 } // end of for
 			}) // end of 공원이름

    		//************ 공원이름 클릭시 위치, 인포윈도우 생성(종료) *************
    		
    } // end of function(parkData)
    		
}) // end of ajax

//========================= DB에 저장된 park 마커표시 (종료) ==============================


//****************************************키워드 검색 후 마커와 리스트 출력***************************************************************
function getKeyword(){
    
var mapContainer = document.getElementById('map');

var mapCenter = new kakao.maps.LatLng(37.47908780531465, 126.87895238473779),
	mapOption = {
	    center: mapCenter, // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};

var map = new kakao.maps.Map(mapContainer, mapOption);

//지도,스카이뷰 컨트롤러
var mapTypeControl = new kakao.maps.MapTypeControl();
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

//지도 확대, 축소 줌 컨트롤 생성
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


//========================= 키워드와 관련된 값을 마커와 목록 출력(시작) ==============================
	//alert(document.getElementById("keyword").value);
	var keyword = document.getElementById("keyword").value;
	
	$.ajax({
    	url:"/parkSearch",
    	type:"post",

    	success:function(parkSearchData){
    		// alert(parkSearchData[0]["parkAddr"].includes(keyword)); // 키워드가 주소의 값과 같다면 true

    		// 처음 위치주변 공원 목록 출력했던거 지우기
    		// .empty() => 선택한 요소의 자식요소 제거
    	    $("#parkList").empty(html);
    	    marker.setMap(null);
    	    
    		var keywordList = []
    		for(i=0; i< parkSearchData.length; i++){
	    		if(parkSearchData[i]["parkAddr"].includes(keyword)){
	    			keywordList.push(parkSearchData[i]); // keywordList에 추가
	    		} // end of if 같다면
    		} // end of for
    		 
    		//console.log(keywordList);

    		 // 검색한 키워드 리스트에 담긴 배열 
    		for(z=0; z< keywordList.length; z++){
     			//console.log(keywordList[z]["parkAddr"])
    			//*********************html 목록 출력 시작***********************
    			var html = "";
    			
    			html = '<tr>'
         		html += '<td style="font-weight: bold;" id="parkName">' + keywordList[z]["parkName"] + '</td>';
         		html += '<td>' + keywordList[z]["parkAddr"] + '</td>';
         		html += '<td><img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18"> ' + keywordList[z]["parkScore"] + '</td>';
         		html += '<td><a id="parkScoreLink" href="' + keywordList[z]["parkScoreLink"] + '" target="_blank">' + keywordList[z]["parkScoreCnt"] + '</a></td>';
         		html += '<td><a id="parkReviewLink" href="' + keywordList[z]["parkReviewLink"] + '" target="_blank">' + keywordList[z]["parkReview"] + '</a></td>';
         		html += '<td><a id="parkLink" href="' + keywordList[z]["parkLink"] + '" target="_blank">상세보기 ></a></td>';
        		html += '</tr>'

     		    $("#parkList").append(html);
    			//*********************html 목록 출력 종료***********************

     		    $("#parkList #parkName").css({"cursor":"pointer"});
     		    
    			// 마커 이미지 생성
    			var imageSrc = "../img/parkImg/running.png"; 
    			var imageSize = new kakao.maps.Size(40, 45);
    			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
    		    //위치 지정 		  
    		    var position= new kakao.maps.LatLng(keywordList[z]["parkLat"],keywordList[z]["parkLng"])
    		    var title = keywordList[z]["parkName"]
    		    
    		   Parkmarker = new kakao.maps.Marker({
    		    	map: map,
    		       	position: position,
    		       	image:markerImage,
    		        clickable: true
    		    });
    		    
    		    var iwContent = '<div class="wrap">' + 
                '    <div class="info">' + 
                '        <div class="title" style="background-color:yellowgreen;color:black;font-size:1em;">' + 
                			keywordList[z]["parkName"]+ 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc" style="font-size:0.8em;">' + 
                '                <div class="ellipsis">' + 
                '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + keywordList[z]["parkScore"] +
                '					 , 후기 : <a href="' + keywordList[z]["parkScoreLink"] +'" id="parkScoreLink" target="_blank">' + keywordList[z]["parkScoreCnt"] + '</a>' + 
                '					 , 리뷰 : <a href="' + keywordList[z]["parkReviewLink"] +'" id="parkReviewLink" target="_blank">' + keywordList[z]["parkReview"] + '</a>' + 
                '			 	 </div>' + 
                '                <div class="ellipsis">' + keywordList[z]["parkAddr"] + '</div>' + 
                '                <div><a href="'+ keywordList[z]["parkLink"] +'" id="parkLink" target="_blank">상세보기 ></a></div>' + 
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
    		
    		// 키워드 입력한 값들 중 10번째 마커의 위치로 이동
    		var moveLatLng = new kakao.maps.LatLng(keywordList[0]["parkLat"],keywordList[0]["parkLng"]);   
    		map.panTo(moveLatLng);
    		
    		//************ 공원이름 클릭시 위치, 인포윈도우 생성(시작) *************
    		// 공원이름
    		$("#parkList #parkName").click(function(){
    			//alert($(this).text());
    			var parkName = $(this).text();
    			
				for(y=0;y<keywordList.length;y++){
	    			var parkListName = keywordList[y]["parkName"];
					if(parkListName == parkName){
						//console.log(parkData[y]["parkLat"],parkData[y]["parkLng"]);
	    			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    			// 공원이름과 같은 위치 
	    			position = new kakao.maps.LatLng(keywordList[y]["parkLat"],keywordList[y]["parkLng"]);
	    			// 마커 이미지
	    			var imageSrc = "../img/parkImg/searchPosition.png";
	    			var imageSize = new kakao.maps.Size(40, 45);
	    			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	    			
	    		    mapOption = { 
	    		        center: position, // 지도의 중심좌표
	    		        level: 3 // 지도의 확대 레벨
	    		    };

		    		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		    		// 마커를 생성
		    		var marker = new kakao.maps.Marker({
		    		    position: position,
		    		    image: markerImage
		    		});
	
		    		marker.setMap(map);
		    		
		    		var iwContent = '<div class="wrap">' + 
	                '    <div class="info">' + 
	                '        <div class="title" style="background-color:lightpink;color:black;font-size:1em;">' + 
	                			keywordList[y]["parkName"]+ 
	                '        </div>' + 
	                '        <div class="body">' + 
	                '            <div class="img">' +
	                '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
	                '           </div>' + 
	                '            <div class="desc" style="font-size:0.8em;">' + 
	                '                <div class="ellipsis">' + 
	                '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + keywordList[y]["parkScore"] +
	                '					 , 후기 : <a href="' + keywordList[y]["parkScoreLink"] +'" id="parkScoreLink" target="_blank">' + keywordList[y]["parkScoreCnt"] + '</a>' + 
	                '					 , 리뷰 : <a href="' + keywordList[y]["parkReviewLink"] +'" id="parkReviewLink" target="_blank">' + keywordList[y]["parkReview"] + '</a>' + 
	                '			 	 </div>' + 
	                '                <div class="ellipsis">' + keywordList[y]["parkAddr"] + '</div>' + 
	                '                <div><a href="'+ keywordList[y]["parkLink"] +'" id="parkLink" target="_blank">상세보기 ></a></div>' + 
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
					} // end of if
				 } // end of for
 			}) // end of 공원이름
    		//************ 공원이름 클릭시 위치, 인포윈도우 생성(종료) *************
    		
    	}, // end of function(parkSearchData)
    	error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
	}) // end of ajax
	
} // end of getKeyword()
//========================= 키워드와 관련된 값을 마커와 목록 출력(종료) ==============================
