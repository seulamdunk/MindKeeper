<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Weather</title>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
</head>
<script>
/*  
$.getJSON("파일경로", function(data){
	// data로 할일 작성
}); 
*/
</script>

<body>
<div id="map" style="width:100%;height:100vh;"></div>

<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=12a1ea904d5ba7f7679a6aedc74e4913&libraries=clusterer"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.56381, 126.98171), // 지도의 중심좌표
		draggable: false,
		level: 13, // 지도의 확대 레벨
		mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	}; 

// 지도를 생성한다 
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });

var data = [
    [37.96560565610974, 124.66992514856672, '<div>${test3[0] }</div>'],
    [37.55833029166853, 126.98781186361127,'<div>${test3[1] }</div>'],
    [37.88721562441267, 127.74254172440317, '<div>춘천</div>'],
    [37.72000269051544, 128.8645374109962, '<div>강릉</div>'],
    [36.337136709383465, 127.39481035412976, '<div>대전</div>'],
    [36.62550886273778, 127.49819460346839, '<div>청주</div>'],
    [35.82716510800298, 127.11546336164004, '<div>전주</div>'],
    [35.863838906099666, 128.58272153789764, '<div>대구</div>'],
    [35.15199621925454, 126.84225457499286, '<div>광주</div>'],
    [35.15685147978738, 129.05188539266413, '<div>부산</div>'],
    [33.39809260788402, 126.54827962215151, '<div>제주</div>'],
    [37.36092612710671, 131.41304657927483, '<div>울릉/독도</div>'],
    [37.27865825237089, 127.00748177106634, '<div>수원</div>'],
    [36.57862029176811, 128.78039193458747, '<div>안동</div>'],
    [34.81135203404336, 126.39245050863407, '<div>목포</div>'],
    [34.76011083959945, 127.6626670923337, '<div>여수</div>'],
    [35.54359459796801, 129.2550244292698, '<div>울산</div>']
];


var markers = [];
for(var i=0; i<data.length; i++){
    // 지도에 마커를 생성하고 표시한다
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(data[i][0],data[i][1]), // 마커의 좌표
        map: map // 마커를 표시할 지도 객체
    });
    
    // 마커 위에 표시할 인포윈도우를 생성한다
    var infowindow = new kakao.maps.InfoWindow({
    content : data[i][2] // 인포윈도우에 표시할 내용
    });
    
    // 인포윈도우를 지도에 표시한다
    infowindow.open(map, marker);
    markers.push(marker);
}
</script>
</body>
</html>