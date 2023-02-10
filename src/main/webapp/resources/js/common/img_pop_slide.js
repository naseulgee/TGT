$(document).ready(function() {
	img_slide();
	img_pop();
});
/* 이미지 슬라이드 처리
	이미지 슬라이드 사용 시 필수 형태
	<태그 class="img_slide">
		<태그 class="img_wrap">
			<img class="첫번째 이미지는 on" src="이미지 주소" alt="이미지 설명">
			<img src="이미지 주소" alt="이미지 설명">
		</태그>
	</태그>
*/
function img_slide(target){
	//전달받은 target또는 img_slide 클래스를 가지는 태그 변수에 담기
	let slide_form = isNull(target) ? document.querySelectorAll(".img_slide") : target;
	//이미지 슬라이드가 없다면 함수 종료
	if(isNull(slide_form[0])) return;

	//사용할 변수 선언
	let slide, img_wrap;
	//이미지 슬라이드가 여러개일 수 있으니 개수만큼 반복 처리
	for(let i=0; i<slide_form.length; i++){
		slide = slide_form[i];
		img_wrap = slide.querySelector(".img_wrap");

		//img_wrap이 없으면 통과
		if(isNull(img_wrap)) continue;

		//이미지에 세팅된 on클래스가 없다면, 첫번째 자식 이미지에 on 클래스 추가
		if(isNull(img_wrap.querySelector("img.on"))) img_wrap.children[0].classList.add("on");

		//이미지 개수가 1개 이하라면 통과
		if(img_wrap.childElementCount <= 1) continue;

		//슬라이드 버튼 추가
		slide.innerHTML = slide.innerHTML
			+"<button class='arrow prev' onclick='move_img(this);' type='button'><i class='fa-solid fa-chevron-left'></i><span class='displaynone'>다음 이미지</span></button>"
			+"<button class='arrow next' onclick='move_img(this);' type='button'><i class='fa-solid fa-chevron-right'></i><span class='displaynone'>이전 이미지</span></button>";
	}
}
//이미지 넘기기 함수
function move_img(target){
	//전달된 target을 기준으로 부모인 img_slide를 찾아 자식 중 img_wrap 찾기
	let img_wrap = target.closest(".img_slide").querySelector(".img_wrap");
	//슬라이드 내 img 태그 중 on 클래스가 있는 이미지를 타겟변수에 담기
	let target_img = img_wrap.querySelector("img.on");

	//타켓 기준으로 이전/다음 이미지를 변수에 담기. 만약 없다면 첫번째/마지막 이미지 담기
	let before_img = target_img.previousElementSibling;
	if(before_img == null) before_img = img_wrap.querySelector("img:last-child");
	let next_img = target_img.nextElementSibling;
	if(next_img == null) next_img = img_wrap.querySelector("img:first-child");

	//전달된 target의 클래스명을 기준으로 해당하는 이미지에 on 클래스 붙이기
	if(target.classList.contains("next")) next_img.classList.add("on");
	if(target.classList.contains("prev")) before_img.classList.add("on");
	//기존 타겟은 on 클래스 제거하기
	target_img.classList.remove("on");
}

/* 이미지 클릭 시 팝업 처리
	이미지 팝업 사용 시 필수 형태
	- 한개 이미지만 팝업 시킬 때
		<img class="pop_img" src="이미지 주소" alt="이미지 설명">
	- 여러개 이미지를 팝업 후 슬라이드 시킬 때
		<조상태그 class="pop_img_wrap">
			<img class="pop_img" src="이미지 주소" alt="이미지 설명">
			<img class="pop_img" src="이미지 주소" alt="이미지 설명">
		</조상태그>
*/
function img_pop(){
	$("img.pop_img").on("click", function(){
		//모달을 띄울 객체 생성 및 세팅
		let pop = document.getElementById("popup_img");
		if(isNull(pop)){//기존 팝업 객체가 없다면
			pop = document.createElement("div");
			pop.id = "popup_img";
			pop.classList.add("flexCenter");
		}
		pop.innerHTML = "<div class='img_box img_slide'>"
				+"<button class='close' type='button' onclick='close_pop()'><i class='fa-solid fa-xmark'></i></button>"
				+"<div class='img_wrap'></div>"
			+"</div>"
			+"<div class='pop_bg' onclick='close_pop()'></div>";
		document.body.append(pop);
		pop = document.getElementById("popup_img");//다시 선택

		//클릭한 이미지 기준으로 팝업 이미지들을 감싸는 pop_img_wrap 찾기
		let pop_img_wrap = this.closest(".pop_img_wrap");
		let img;
		if(isNull(pop_img_wrap) && $(pop_img_wrap).find("img.pop_img").length <= 1){
			//자식 1개: pop_img_wrap가 없거나, 자식인 pop_img클래스의 이미지가 1개일 때
			img = this.cloneNode(true);
			img.src = img.src.replace("/s_","/");
			img.classList.add("on");
			pop.querySelector(".img_wrap").append(img);
			return;
		}else{
			//자식 여러개: pop_img_wrap가 있으면서, 자식인 pop_img클래스의 이미지가 여러개일 때
			//이미지 추가
			for (let i = 0; i < $(pop_img_wrap).find("img.pop_img").length; i++) {
				img = $(pop_img_wrap).find("img.pop_img")[i].cloneNode(true);
				img.src = img.src.replace("/s_","/");
				if(img == $(this)) img.addClass("on");
				pop.querySelector(".img_wrap").append(img);
			}
			//슬라이드 실행
			return img_slide([pop.querySelector(".img_box")]);
		}
	});
}
//팝업 닫기 함수
function close_pop(){
	if(isNull(popup_img)) return;
	popup_img.remove();
}