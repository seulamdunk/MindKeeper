var mapContainer = document.getElementById('footerMap'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.47912186187098, 126.8789094692121), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.47912186187098, 126.8789094692121); 

//마커 이미지 생성
var imageSrc = "../img/parkImg/currentPosition.png"; 
var imageSize = new kakao.maps.Size(33, 35); 
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition,
   	image:markerImage
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;color:black;">서울 금천구 가산동</div>', 
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

//지도 확대, 축소 줌 컨트롤 생성
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);