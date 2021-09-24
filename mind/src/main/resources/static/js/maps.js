var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(37.56646, 126.98121),
        level: 5,
        mapTypeId : kakao.maps.MapTypeId.ROADMAP,
        draggable: false
    };
// 지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);
var mapTypeControl = new kakao.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);


// 마커 이미지 생성
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
var imageSize = new kakao.maps.Size(25, 35); 
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

//============================================================================
// 현재위치 로드를 성공했다면
function locationLoadSuccess(pos){
    var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);
    map.panTo(currentPos);
    
    
    var marker = new kakao.maps.Marker({
        position: currentPos,
        image : markerImage,
        clickable: true
    });

    marker.setMap(null);
    marker.setMap(map);

    
    //============================================================================
    // DB에 저장된 park 마커표시 시작
    $.ajax({
    	url:"/guest/parkSearch",
    	type:"post",
    
    	success:function(parkJson){
    	
    		
    		//****** 한번에 다 찍으면 너무 많아서 문제가 발생 **************
    		parkData = parkJson.slice(300);
    		for(idx =0; idx<parkData.length; idx++){
    			 var imageSize = new kakao.maps.Size(24, 35); 
    		    //위치 지정 		  
    		    var position= new kakao.maps.LatLng(parkData[idx]["park_Wido"],parkData[idx]["park_Gyungdo"])
    		    //타이틀
    		    var title = parkData[idx]["park_Name"]
    		    // 마커를 생성합니다
    		  
    		    var Parkmarker = new kakao.maps.Marker({
    		    	map: map,
    		       	position: position, // 마커를 표시할 위치
    		    });
    		    var infowindow = new kakao.maps.InfoWindow({
    		        content: title // 인포윈도우에 표시할 내용
    		    });

    		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    		    kakao.maps.event.addListener(Parkmarker, 'mouseover', makeOverListener(map, Parkmarker, infowindow));
    		    kakao.maps.event.addListener(Parkmarker, 'mouseout', makeOutListener(infowindow));
    		    
    		   
    		
    		}
    		
    		var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
    		var centerPosition; // 원의 중심좌표 입니다
    		var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
    		var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
    		var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
    		var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

    		var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다

    		// 지도에 클릭 이벤트를 등록합니다
    		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    		        
    		    // 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
    		    if (!drawingFlag) {    
    		        
    		        // 상태를 그리고있는 상태로 변경합니다
    		        drawingFlag = true; 
    		        
    		        // 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
    		        centerPosition = mouseEvent.latLng; 

    		        // 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
    		        if (!drawingLine) {
    		            drawingLine = new kakao.maps.Polyline({
    		                strokeWeight: 3, // 선의 두께입니다
    		                strokeColor: '#00a0e9', // 선의 색깔입니다
    		                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
    		                strokeStyle: 'solid' // 선의 스타일입니다
    		            });    
    		        }
    		        
    		        // 그려지고 있는 원을 표시할 원 객체를 생성합니다
    		        if (!drawingCircle) {                    
    		            drawingCircle = new kakao.maps.Circle({ 
    		                strokeWeight: 1, // 선의 두께입니다
    		                strokeColor: '#00a0e9', // 선의 색깔입니다
    		                strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
    		                strokeStyle: 'solid', // 선의 스타일입니다
    		                fillColor: '#00a0e9', // 채우기 색깔입니다
    		                fillOpacity: 0.2 // 채우기 불투명도입니다 
    		            });     
    		        }
    		        
    		        // 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
    		        if (!drawingOverlay) {
    		            drawingOverlay = new kakao.maps.CustomOverlay({
    		                xAnchor: 0,
    		                yAnchor: 0,
    		                zIndex: 1
    		            });              
    		        }
    		    }
    		    });

    		// 지도에 마우스무브 이벤트를 등록합니다
    		// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
    		kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
    		        
    		    // 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
    		    if (drawingFlag) {

    		        // 마우스 커서의 현재 위치를 얻어옵니다 
    		        var mousePosition = mouseEvent.latLng; 
    		        
    		        // 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
    		        var linePath = [centerPosition, mousePosition];     
    		        
    		        // 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
    		        drawingLine.setPath(linePath);
    		        
    		        // 원의 반지름을 선 객체를 이용해서 얻어옵니다 
    		        var length = drawingLine.getLength();
    		        
    		        if(length > 0) {
    		            
    		            // 그려지고 있는 원의 중심좌표와 반지름입니다
    		            var circleOptions = { 
    		                center : centerPosition, 
    		            radius: length,                 
    		            };
    		            
    		            // 그려지고 있는 원의 옵션을 설정합니다
    		            drawingCircle.setOptions(circleOptions); 
    		                
    		            // 반경 정보를 표시할 커스텀오버레이의 내용입니다
    		            var radius = Math.round(drawingCircle.getRadius()),   
    		            content = '<div class="info">반경 <span class="number">' + radius + '</span>m</div>';
    		            
    		            // 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
    		            drawingOverlay.setPosition(mousePosition);
    		            
    		            // 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
    		            drawingOverlay.setContent(content);
    		            
    		            // 그려지고 있는 원을 지도에 표시합니다
    		            drawingCircle.setMap(map); 
    		            
    		            // 그려지고 있는 선을 지도에 표시합니다
    		            drawingLine.setMap(map);  
    		            
    		            // 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
    		            drawingOverlay.setMap(map);
    		            
    		        } else { 
    		            
    		            drawingCircle.setMap(null);
    		            drawingLine.setMap(null);    
    		            drawingOverlay.setMap(null);
    		            
    		        }
    		    }     
    		});     

    		// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
    		// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
    		// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
    		kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

    		    if (drawingFlag) {

    		        // 마우스로 오른쪽 클릭한 위치입니다 
    		        var rClickPosition = mouseEvent.latLng; 

    		        // 원의 반경을 표시할 선 객체를 생성합니다
    		        var polyline = new kakao.maps.Polyline({
    		            path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
    		            strokeWeight: 3, // 선의 두께 입니다
    		            strokeColor: '#00a0e9', // 선의 색깔입니다
    		            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
    		            strokeStyle: 'solid' // 선의 스타일입니다
    		        });
    		        
    		        // 원 객체를 생성합니다
    		        var circle = new kakao.maps.Circle({ 
    		            center : centerPosition, // 원의 중심좌표입니다
    		            radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
    		            strokeWeight: 1, // 선의 두께입니다
    		            strokeColor: '#00a0e9', // 선의 색깔입니다
    		            strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
    		            strokeStyle: 'solid', // 선의 스타일입니다
    		            fillColor: '#00a0e9', // 채우기 색깔입니다
    		            fillOpacity: 0.2  // 채우기 불투명도입니다 
    		        });
    		        
    		        var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
    		            content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다

    		        
    		        // 반경정보를 표시할 커스텀 오버레이를 생성합니다
    		        var radiusOverlay = new kakao.maps.CustomOverlay({
    		            content: content, // 표시할 내용입니다
    		            position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
    		            xAnchor: 0,
    		            yAnchor: 0,
    		            zIndex: 1 
    		        });  

    		        // 원을 지도에 표시합니다
    		        circle.setMap(map); 
    		        
    		        // 선을 지도에 표시합니다
    		        polyline.setMap(map);
    		        
    		        // 반경 정보 커스텀 오버레이를 지도에 표시합니다
    		        radiusOverlay.setMap(map);
    		        
    		        // 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
    		        var radiusObj = {
    		            'polyline' : polyline,
    		            'circle' : circle,
    		            'overlay' : radiusOverlay
    		        };
    		        
    		        // 배열에 추가합니다
    		        // 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
    		        circles.push(radiusObj);   
    		    
    		        // 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
    		        drawingFlag = false;
    		        
    		        // 중심 좌표를 초기화 합니다  
    		        centerPosition = null;
    		        
    		        // 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
    		        drawingCircle.setMap(null);
    		        drawingLine.setMap(null);   
    		        drawingOverlay.setMap(null);
    		    }
    		});    
    		    
    		// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
    		function removeCircles() {         
    		    for (var i = 0; i < circles.length; i++) {
    		        circles[i].circle.setMap(null);    
    		        circles[i].polyline.setMap(null);
    		        circles[i].overlay.setMap(null);
    		    }         
    		    circles = [];
    		}

    		// 마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
    		// 그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
    		// HTML Content를 만들어 리턴하는 함수입니다
    		function getTimeHTML(distance) {

    		    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
    		    var walkkTime = distance / 67 | 0;
    		    var walkHour = '', walkMin = '';

    		    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
    		    if (walkkTime > 60) {
    		        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
    		    }
    		    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

    		    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
    		    var bycicleTime = distance / 227 | 0;
    		    var bycicleHour = '', bycicleMin = '';

    		    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
    		    if (bycicleTime > 60) {
    		        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
    		    }
    		    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

    		    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
    		    var content = '<ul class="info">';
    		    content += '    <li>';
    		    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
    		    content += '    </li>';
    		    content += '    <li>';
    		    content += '        <span class="label">도보</span>' + walkHour + walkMin;
    		    content += '    </li>';
    		    content += '    <li>';
    		    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
    		    content += '    </li>';
    		    content += '</ul>'

    		    return content;
    		} // end of getTimeHTML()
    		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    		function makeOverListener(map, Parkmarker, infowindow) {
    		    return function() {
    		        infowindow.open(map, Parkmarker);
    		    };
    		} // end of makeOverListener()

    		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    		function makeOutListener(infowindow) {
    		    return function() {
    		        infowindow.close();
    		    };
    		} // end of makeOutListener()
    			} // end of function(parkJson)
    
		    }) // end of ajax
	    
	};
    // DB에 저장된 park 마커표시 종료
	//============================================================================
	
	
	
	
// 현재위치 로드 에러난다면
function locationLoadError(pos){
    alert('위치 정보를 가져오는데 실패했습니다.');
};
//============================================================================


// 위치 가져오기 버튼 클릭시
function getCurrentPosBtn(){
    navigator.geolocation.watchPosition(locationLoadSuccess,locationLoadError);
};