var overlayOn = false, 
    container = document.getElementById('container'),
    mapWrapper = document.getElementById('mapWrapper'), 
    mapContainer = document.getElementById('map'), 
    rvContainer = document.getElementById('roadview'); 

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


//========================= 로드뷰 생성 (시작) ==============================
// 지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);

// 로드뷰 생성
var rv = new kakao.maps.Roadview(rvContainer); 

// 좌표로부터 로드뷰 객체 생성
var rvClient = new kakao.maps.RoadviewClient(); 

kakao.maps.event.addListener(rv, 'position_changed', function() {

    // 현재 로드뷰의 위치 좌표
    var rvPosition = rv.getPosition();

    map.setCenter(rvPosition);

    if(overlayOn) {
        marker.setPosition(rvPosition);
    }
});

// 마커 이미지를 생성
var markImage = new kakao.maps.MarkerImage(
    'https://t1.daumcdn.net/localimg/localimages/07/2018/pc/roadview_minimap_wk_2018.png',
    new kakao.maps.Size(26, 46),
    {
        spriteSize: new kakao.maps.Size(1666, 168),
        spriteOrigin: new kakao.maps.Point(705, 114),
        offset: new kakao.maps.Point(13, 46)
    }
);

// 드래그가 가능한 마커를 생성
var marker = new kakao.maps.Marker({
    image : markImage,
    position: mapCenter,
    draggable: true
});

// 마커에 이벤트 등록
kakao.maps.event.addListener(marker, 'dragend', function(mouseEvent) {

    var position = marker.getPosition();
    toggleRoadview(position);
});

//지도에 클릭 이벤트를 등록
kakao.maps.event.addListener(map, 'click', function(mouseEvent){
    
    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시
    if(!overlayOn) {
        return;
    }

    var position = mouseEvent.latLng;
    marker.setPosition(position);
    toggleRoadview(position);
});

// 전달받은 좌표(position)에 로드뷰 설정 함수
function toggleRoadview(position){
    rvClient.getNearestPanoId(position, 50, function(panoId) {
    	
        if (panoId === null) {
            toggleMapWrapper(true, position);
        } else {
         toggleMapWrapper(false, position);
            rv.setPanoId(panoId, position);
        }
    });
}

// 지도를 감싸고 있는 div의 크기를 조정하는 함수
function toggleMapWrapper(active, position) {
    if (active) {
        container.className = '';
        map.relayout();
        map.setCenter(position);
    } else {

        // 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경
        if (container.className.indexOf('view_roadview') === -1) {
            container.className = 'view_roadview';

            map.relayout();
            map.setCenter(position);
        }
    }
}

// 지도 위의 로드뷰 도로 오버레이를 추가,제거하는 함수
function toggleOverlay(active) {
    if (active) {
        overlayOn = true;

        map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);
        marker.setMap(map);
        marker.setPosition(map.getCenter());
        toggleRoadview(map.getCenter());
    } else {
        overlayOn = false;
        map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);
        marker.setMap(null);
    }
}

// 지도 위의 로드뷰 버튼을 눌렀을 때 호출되는 함수
function setRoadviewRoad() {
    var control = document.getElementById('roadviewControl');
    
    if (control.className.indexOf('active') === -1) {
        control.className = 'active';
        toggleOverlay(true);
    } else {
        control.className = '';
        toggleOverlay(false);
    }
}

// 로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수
function closeRoadview() {
    var position = marker.getPosition();
    toggleMapWrapper(true, position);
}
//========================= 로드뷰 생성 (종료) ==============================

//지도,스카이뷰 컨트롤러
var mapTypeControl = new kakao.maps.MapTypeControl();
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

//지도 확대, 축소 줌 컨트롤 생성
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

//========================= DB에 저장된 park 마커표시 (시작) ==============================

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
    			
     		    html = '<div class="wrap">';
     		    html += '<div style="font-weight: bold;" id="parkName">' + parkData[i]["parkName"] + '</div>';
     		    html += '<div>';
     		    html += '<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + parkData[i]["parkScore"] + ' ,';
     		    html += '후기 : <span id="parkScoreLink" src="' + parkData[i]["parkScoreLink"] + '" style="color:#007bff;">' + parkData[i]["parkScoreCnt"] + '</span> ,';
     		    html += '리뷰 : <span id="parkReviewLink" src="' + parkData[i]["parkReviewLink"] + '" style="color:#007bff;">' + parkData[i]["parkReview"] + '</span>';
     		    html += '</div>';
     		    html += '<div>' + parkData[i]["parkAddr"] + '</div>';
     		    html += '<div><span id="parkLink" src="' + parkData[i]["parkLink"] + '" style="color:#007bff;">상세보기 ></span></div>';
     		    html += '</div>';
     		    html += '<hr>';

     		    $("#parkList").append(html);
    			//*********************html 목록 출력 종료***********************
     		    
     		    $("#parkList #parkName").css({"cursor":"pointer"});
     		    $("#parkList #parkScoreLink").css({"cursor":"pointer"});
     		    $("#parkList #parkReviewLink").css({"cursor":"pointer"});
     		    $("#parkList #parkLink").css({"cursor":"pointer","fontWeight":"bold"});
     		    
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
                '					 , 후기 : <span id="parkScoreLink" style="color:#007bff;">' + parkData[i]["parkScoreCnt"] + '</span>' + 
                '					 , 리뷰 : <span id="parkReviewLink" style="color:#007bff;">' + parkData[i]["parkReview"] + '</span>' + 
                '			 	 </div>' + 
                '                <div class="ellipsis">' + parkData[i]["parkAddr"] + '</div>' + 
                '                <div><span id="parkLink" style="color:#007bff;">상세보기 ></span></div>' + 
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
    		
   			//************ 후기,리뷰,상세보기 클릭시 iframe 출력 시작 *************
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
	                '					 , 후기 : <span id="parkScoreLink" style="color:#007bff;">' + parkData[y]["parkScoreCnt"] + '</span>' + 
	                '					 , 리뷰 : <span id="parkReviewLink" style="color:#007bff;">' + parkData[y]["parkReview"] + '</span>' + 
	                '			 	 </div>' + 
	                '                <div class="ellipsis">' + parkData[y]["parkAddr"] + '</div>' + 
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
			    	
			    	
					} // end of if
				 } // end of for
 			}) // end of 공원이름
 			
        	// 후기
    		$("#parkList #parkScoreLink").click(function(){
    			// 공원 후기링크
 		    	var parkScoreLink = $(this).attr("src");
 		    	//alert(parkScoreLink);
	 			$("#iframeUrl").attr('src',parkScoreLink);
 			}) // end of 후기
    			
    		// 리뷰
    		$("#parkList #parkReviewLink").click(function(){
    			// 공원 리뷰
 		    	var parkReviewLink = $(this).attr("src");
	 			$("#iframeUrl").attr('src',parkReviewLink);
    		}) // end of 리뷰
    			
    		//상세보기
    		$("#parkList #parkLink").click(function(){
    			// 공원 상세보기
 		    	var parkLink = $(this).attr("src");
	 			$("#iframeUrl").attr('src',parkLink);
    		}) // end of 상세보기
    		//************ 후기,리뷰,상세보기 클릭시 iframe 출력 종료 *************
    		
    } // end of function(parkData)
    		
}) // end of ajax

//========================= DB에 저장된 park 마커표시 (종료) ==============================


//****************************************키워드 검색 후 마커와 리스트 출력***************************************************************
function getKeyword(){
    
var overlayOn = false,
container = document.getElementById('container'),
mapWrapper = document.getElementById('mapWrapper'),
mapContainer = document.getElementById('map'),
rvContainer = document.getElementById('roadview');

var mapCenter = new kakao.maps.LatLng(37.47908780531465, 126.87895238473779),
    mapOption = {
        center: mapCenter,
        level: 5
    };

var map = new kakao.maps.Map(mapContainer, mapOption);
var rv = new kakao.maps.Roadview(rvContainer); 
var rvClient = new kakao.maps.RoadviewClient(); 

kakao.maps.event.addListener(rv, 'position_changed', function() {

 var rvPosition = rv.getPosition();
 map.setCenter(rvPosition);

 if(overlayOn) {
     marker.setPosition(rvPosition);
 }
});

//마커 이미지를 생성
var markImage = new kakao.maps.MarkerImage(
 'https://t1.daumcdn.net/localimg/localimages/07/2018/pc/roadview_minimap_wk_2018.png',
 new kakao.maps.Size(26, 46),
 {
     spriteSize: new kakao.maps.Size(1666, 168),
     spriteOrigin: new kakao.maps.Point(705, 114),
     offset: new kakao.maps.Point(13, 46)
 }
);

//드래그가 가능한 마커를 생성
var marker = new kakao.maps.Marker({
 image : markImage,
 position: mapCenter,
 draggable: true
});

//마커에 이벤트 등록
kakao.maps.event.addListener(marker, 'dragend', function(mouseEvent) {

 var position = marker.getPosition();
 toggleRoadview(position);
});

//지도에 클릭 이벤트를 등록
kakao.maps.event.addListener(map, 'click', function(mouseEvent){
 
 if(!overlayOn) {
     return;
 }

 var position = mouseEvent.latLng;
 marker.setPosition(position);
 toggleRoadview(position);
});

//전달받은 좌표(position)에 로드뷰 설정 함수
function toggleRoadview(position){
 rvClient.getNearestPanoId(position, 50, function(panoId) {
 	
     if (panoId === null) {
         toggleMapWrapper(true, position);
     } else {
      toggleMapWrapper(false, position);
         rv.setPanoId(panoId, position);
     }
 });
}

//지도를 감싸고 있는 div의 크기를 조정하는 함수
function toggleMapWrapper(active, position) {
 if (active) {
     container.className = '';
     map.relayout();
     map.setCenter(position);
 } else {

     // 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경
     if (container.className.indexOf('view_roadview') === -1) {
         container.className = 'view_roadview';

         map.relayout();
         map.setCenter(position);
     }
 }
}

//지도 위의 로드뷰 도로 오버레이를 추가,제거하는 함수
function toggleOverlay(active) {
 if (active) {
     overlayOn = true;

     map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);
     marker.setMap(map);
     marker.setPosition(map.getCenter());
     toggleRoadview(map.getCenter());
 } else {
     overlayOn = false;
     map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);
     marker.setMap(null);
 }
}

//지도 위의 로드뷰 버튼을 눌렀을 때 호출되는 함수
function setRoadviewRoad() {
 var control = document.getElementById('roadviewControl');
 
 if (control.className.indexOf('active') === -1) {
     control.className = 'active';
     toggleOverlay(true);
 } else {
     control.className = '';
     toggleOverlay(false);
 }
}

//로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수
function closeRoadview() {
 var position = marker.getPosition();
 toggleMapWrapper(true, position);
}
//========================= 로드뷰 생성 (종료) ==============================
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
    			
    			html = '<div class="wrap">';
     		    html += '<div style="font-weight: bold;" id="parkName">' + keywordList[z]["parkName"] + '</div>';
     		    html += '<div>';
     		    html += '<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">' + keywordList[z]["parkScore"] + ' ,';
     		    html += '후기 : <span id="parkScoreLink" src="' + keywordList[z]["parkScoreLink"] + '" style="color:#007bff;">' + keywordList[z]["parkScoreCnt"] + '</span> ,';
     		    html += '리뷰 : <span id="parkReviewLink" src="' + keywordList[z]["parkReviewLink"] + '" style="color:#007bff;">' + keywordList[z]["parkReview"] + '</span>';
     		    html += '</div>';
     		    html += '<div>' + keywordList[z]["parkAddr"] + '</div>';
     		    html += '<div><span id="parkLink" src="' + keywordList[z]["parkLink"] + '" style="color:#007bff;">상세보기 ></span></div>';
     		    html += '</div>';
     		    html += '<hr>';

     		    $("#parkList").append(html);
    			//*********************html 목록 출력 종료***********************

     		    $("#parkList #parkName").css({"cursor":"pointer"});
     		    $("#parkList #parkScoreLink").css({"cursor":"pointer"});
     		    $("#parkList #parkReviewLink").css({"cursor":"pointer"});
     		    $("#parkList #parkLink").css({"cursor":"pointer","fontWeight":"bold"});
     		    
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
                '					 , 후기 : <span id="parkScoreLink" style="color:#007bff;">' + keywordList[z]["parkScoreCnt"] + '</span>' + 
                '					 , 리뷰 : <span id="parkReviewLink" style="color:#007bff;">' + keywordList[z]["parkReview"] + '</span>' + 
                '			 	 </div>' + 
                '                <div class="ellipsis">' + keywordList[z]["parkAddr"] + '</div>' + 
                '                <div><span id="parkLink" style="color:#007bff;">상세보기 ></span></div>' + 
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
    		var moveLatLng = new kakao.maps.LatLng(keywordList[10]["parkLat"],keywordList[10]["parkLng"]);   
    		map.panTo(moveLatLng);
    		
    		//************ 후기,리뷰,상세보기 클릭시 iframe 출력 시작 *************
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
	                '					 , 후기 : <span id="parkScoreLink" style="color:#007bff;">' + keywordList[y]["parkScoreCnt"] + '</span>' + 
	                '					 , 리뷰 : <span id="parkReviewLink" style="color:#007bff;">' + keywordList[y]["parkReview"] + '</span>' + 
	                '			 	 </div>' + 
	                '                <div class="ellipsis">' + keywordList[y]["parkAddr"] + '</div>' + 
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
					} // end of if
				 } // end of for
 			}) // end of 공원이름
 			
        	// 후기
    		$("#parkList #parkScoreLink").click(function(){
    			// 공원 후기링크
 		    	var parkScoreLink = $(this).attr("src");
 		    	//alert(parkScoreLink);
	 			$("#iframeUrl").attr('src',parkScoreLink);
 			}) // end of 후기
    			
    		// 리뷰
    		$("#parkList #parkReviewLink").click(function(){
    			// 공원 리뷰
 		    	var parkReviewLink = $(this).attr("src");
	 			$("#iframeUrl").attr('src',parkReviewLink);
    		}) // end of 리뷰
    			
    		//상세보기
    		$("#parkList #parkLink").click(function(){
    			// 공원 상세보기
 		    	var parkLink = $(this).attr("src");
	 			$("#iframeUrl").attr('src',parkLink);
    		}) // end of 상세보기
    		//************ 후기,리뷰,상세보기 클릭시 iframe 출력 종료 *************
    		
    	} // end of function(parkSearchData)
    		
	}) // end of ajax
	
//========================= 키워드와 관련된 값을 마커와 목록 출력(시작) ==============================
} // end of getKeyword()