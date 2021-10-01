
//========================= 현재 접속위치 첫화면에 출력 (시작) ==============================
var mapContainer = document.getElementById('map'),
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 6
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption);

// geolocation으로 접속위치 가져옴
if (navigator.geolocation) {
    
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude,
            lon = position.coords.longitude;
        
        // 위도,경도 좌표 생성
        var locPosition = new kakao.maps.LatLng(lat, lon);
        // 좌표 마커생성
        displayMarker(locPosition);
      });
    
} else { 
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 현재위치 마커표시
function displayMarker(locPosition) {
	
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    });
    
    // 지도 중심좌표를 접속위치로 변경
    map.setCenter(locPosition);      
}    
//========================= 현재 접속위치 첫화면에 출력 (종료) ==============================

// 지도,스카이뷰 컨트롤러
var mapTypeControl = new kakao.maps.MapTypeControl();
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

//========================= DB에 저장된 park 마커표시 (시작) ==============================
$.ajax({
    	url:"/guest/parkRequest",
    	type:"post",
    
    	success:function(parkData){
    	
    		parkData = parkData.slice(0.100);
    		for(i =0; i<parkData.length; i++){
    			
    			// 마커 이미지 생성
    			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    			var imageSize = new kakao.maps.Size(25, 35); 
    			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
    		    //위치 지정 		  
    		    var position= new kakao.maps.LatLng(parkData[i]["parkLat"],parkData[i]["parkLng"])
    		    var title = parkData[i]["parkName"]
    		    
    		  
    		    var Parkmarker = new kakao.maps.Marker({
    		    	map: map,
    		       	position: position,
    		       	image:markerImage,
    		        clickable: true
    		    });
    		    
    		    // 마커를 지도에 표시합니다.
    		    Parkmarker.setMap(map);

    		    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    		    var iwContent = '<div class="wrap">' + 
                '    <div class="info">' + 
                '        <div class="title" style="background-color:yellowgreen;color:black;">' + 
                			parkData[i]["parkName"]+ 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="../img/parkImg/parkImg.png" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc">' + 
                '                <div class="ellipsis">' + 
                '					<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + parkData[i]["parkScore"] +
                '					 , 후기 : <a href="' + parkData[i]["parkScoreLink"] + '" target="_blank" class="link">' + parkData[i]["parkScoreCnt"] + '</a>' + 
                '					 , 리뷰 : <a href="' + parkData[i]["parkReviewLink"] + '" target="_blank" class="link">' + parkData[i]["parkReview"] + '</a>' + 
                '			 	 </div>' + 
                '                <div class="ellipsis">' + parkData[i]["parkAddr"] + '</div>' + 
                '                <div><a href="' + parkData[i]["parkLink"] + '" target="_blank" class="link">상세보기</a></div>' + 
                '            </div>' + 
                '        </div>' + 
                '    </div>' +    
                '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    		        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    		    // 인포윈도우를 생성합니다
    		    var infowindow = new kakao.maps.InfoWindow({
    		        content : iwContent,
    		        removable : iwRemoveable
    		    });

    		    kakao.maps.event.addListener(Parkmarker, 'click', makeClickListener(map, Parkmarker, infowindow));
    		    
    		    // 마커에 클릭이벤트를 등록합니다
    		    function makeClickListener(map, Parkmarker, infowindow){
    		        return function(){  
    		    	// 마커 위에 인포윈도우를 표시합니다
    		          infowindow.open(map, Parkmarker);  
    		    	};
    		    }

    	   	
    	    } // end of for
    
    		
   		
    } // end of function(parkJson)
    
}) // end of ajax
//========================= DB에 저장된 park 마커표시 (종료) ==============================
