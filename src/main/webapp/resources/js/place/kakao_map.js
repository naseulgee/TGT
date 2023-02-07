function set_map() {
    //주소-좌표 변환 객체 생성
    let geocoder = new kakao.maps.services.Geocoder();
    //중점좌표 세팅 객체 생성
    let bounds = new kakao.maps.LatLngBounds();
	//지도 세팅
	let mapContainer = document.getElementById('map'),//지도를 표시할 태그 지정
		mapOption = {
			center: new kakao.maps.LatLng(37.5699505905734, 126.986036227827),//지도의 중심좌표
			level: 3//지도 확대 레벨
		};
	let map = new kakao.maps.Map(mapContainer, mapOption);//지도 생성

	//마커 이미지 세팅
	let imageSrc = "/resources/image/paw.svg";//이미지 주소
	let imageSize = new kakao.maps.Size(25, 25);//이미지 크기
	let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, {alt: "marker"});//마커 이미지 생성
	let clickImage = new kakao.maps.MarkerImage(imageSrc, imageSize, {alt: "marker click"});//클릭한 마커 이미지
	let selectedMarker = null;//클릭한 마커를 담을 변수

	//마커를 표시할 위치와 title 시설객체 배열
	let mapping_list = document.querySelectorAll("[data-mapping]");
	let titles = document.querySelectorAll(".pl_name");
	let locations = document.querySelectorAll(".loc");
	
	for (let i = 0; i < locations.length; i++) {
		let title = titles[i].innerText;
		let loc = locations[i].innerText.split(",")[0].split("(")[0];

		//주소로 좌표 검색
		geocoder.addressSearch(loc, function (result, status) {
			//정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				let set_makerImage = (locations.length == 1)?clickImage:markerImage;
				//결과값으로 받은 위치를 마커로 표시
				let marker = new kakao.maps.Marker({
					map: map,//마커를 표시할 지도
					position: coords,//마커 표시 위치
					image: set_makerImage//마커 이미지
				});
				if(locations.length > 1){
					marker.normalImage = markerImage;
					//마커에 click 이벤트를 등록
					kakao.maps.event.addListener(marker, 'click', function() {
						//클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
						if (!selectedMarker || selectedMarker !== marker) {
							//클릭된 마커 객체가 null이 아니면
							//클릭된 마커의 이미지가 기본 이미지로 변경하고
							!!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
							//현재 클릭된 마커의 이미지는 클릭 이미지로 변경
							marker.setImage(clickImage);
							mapping_event();
						}
				
						//클릭된 마커를 현재 클릭된 마커 객체로 설정
						selectedMarker = marker;
					});
				}

				//커스텀 오버레이 내용
				let mapping_target = (mapping_list.length > 0) ? mapping_list[i].dataset.mapping : "";
				let content = '<div class="custom_maker" data-target="'+mapping_target+'"><strong class="title">'+title+'</strong></div>';
				
				//커스텀 오버레이 생성
				let customOverlay = new kakao.maps.CustomOverlay({
					map: map,
					position: coords,
					content: content,
					yAnchor: -0.3
				});

				//지도 중심을 계산하기 위한 좌표 추가
				bounds.extend(coords);
				map.setBounds(bounds, 100, 10, 50, 10);
			}
		});
	}
}

//좌표 이미지 클릭 시 리스트 표기
function mapping_event(){
	let target = document.querySelector("img[alt='marker click']");
	if(isNull(target)) return;
	target = target.parentElement.nextSibling.children[0].dataset.target;
	if(!isNull(document.querySelector(".on[data-mapping]"))) document.querySelector(".on[data-mapping]").classList.remove("on");
	document.querySelector("[data-mapping='"+target+"']").classList.add("on");
}