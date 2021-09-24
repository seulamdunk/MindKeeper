<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>다음 지도 API</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<div id="map" style="width:50%;height:50vh;"></div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a2c6577da696f87c0359d059fa9c8a7"></script>

	<!-- 부트스트랩 primary 버튼 -->
	<button type="button" class="btn btn-lg btn-primary" id="getMyPositionBtn" onclick="getCurrentPosBtn()">내 위치 가져오기</button>

	<!-- 부트스트랩 이용을 위한 jQuery와 CDN -->
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="../js/maps.js"></script>
	<div class="insertMap">
	
	</div>
	
	</body>
	
</html>