<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오시는 길</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_Template.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script.js"></script>
<style type="text/css">
h2#indexGuideMsg {
    display: table-cell;
    vertical-align: middle;
    height: 474px;
}
</style>
</head>

<body>

	<div id="wrap">

		<%@ include file="../ind/headerTmp.jsp"%>

		<main id="main" class="dFlex">

			<div id="lnb">
				<%@ include file="../ind/mainLnbTmp.jsp"%>
			</div>

			<!-- 실제 작업 영역 시작 -->
			<div id="contents">
				<br>
    			<h1 style="color: #00009b; text-align: center;">&nbsp;[오시는 길]</h1>
    			<br><br>
				<div id="map" style="width: 500px; height: 380px; margin: 0 auto;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e834f6cecdf444248fd6eb3f4bafc4ae"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(35.2381, 128.6995),
						level: 3
					};
					
					//마커 위치
					var markerPosition  = new kakao.maps.LatLng(35.2381, 128.6995); 
					//마커 생성
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});
					
					//지도 set
					var map = new kakao.maps.Map(container, options);
					//마커 set
					marker.setMap(map);
					
				</script>
			</div>
			
			<div id="time">
				<h2 id="indexGuideMsg">
					<br><br>
					<span id="sp1">[주소]</span><br>
					<span id="sp2">경상남도 창원시 의창구<br>
					용동로 197번길 77</span><br><br>
					<span id="sp1">[전화]</span><br>
					<span id="sp3">055-123-0000</span>
				</h2>
			</div>
			<br><br><br><br><br>
			<!-- 실제 작업 영역 끝 -->

		</main>

		<%@ include file="../ind/footerTmp.jsp"%>
	</div>
</body>

</html>