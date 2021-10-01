
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
    	
    		parkData = parkData
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
    		    

    	   	
    	    } // end of for
   		
    } // end of function(parkJson)
    
}) // end of ajax
//========================= DB에 저장된 park 마커표시 (종료) ==============================
