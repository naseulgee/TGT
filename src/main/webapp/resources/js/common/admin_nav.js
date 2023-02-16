//접속한 url 변수에 담기
let url = location.pathname;
$(document).ready(function() {
	select_nav();
});

//접속한 url에 따라 nav 활성화
function select_nav(){
	//접속한 url과 동일한 링크를 가지고 있는 a태그 변수에 담기
	let a = document.querySelector("a[href='"+url+"']");
	if(isNull(a)) return;//a태그가 없다면 함수 종료
	
	//a태그에 클래스 추가
	a.classList.add("select");
	//조상 ul태그 변수에 담기
	let ul = a.closest("ul");
	//만약 a태그 조상인 ul의 이전 형제가 toggle_li라면
	if(ul.previousElementSibling.classList.contains("toggle_li")){
		//toggle_li에 on 클래스 붙이기
		ul.previousElementSibling.classList.add("on");
		//ul 펼치기
		ul.style.display = "block";
	}
}

//하위 메뉴가 있는 어드민 nav 클릭 시 작동하는 함수 
function toggle_down(target){
	//클릭한 대상의 조상인 li를 찾아 형제 li들을 모두 변수에 담기
	let sib = $(target).closest("li").siblings();
	//li 내부에 toggle_li 요소가 있다면 on 클래스 지워주기(화살표의 방향이 바뀐다)
	sib.find(".toggle_li").removeClass("on");
	//하위 메뉴 접기
	sib.find("ul").slideUp();
	
	//클릭한 대상에 on 클래스가 있다면 제거하고, 없다면 붙이기
	$(target).toggleClass("on");
	//하위 메뉴가 펼쳐져 있다면 접고, 접혀있다면 펼치기
	$(target).next().slideToggle();
}