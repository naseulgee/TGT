$(document).ready(function() {
	
});
//이미지 넘기기 함수
function move_img(param){
	let target_img = document.querySelector(".img_wrap img.on");
	console.log(param);
	let before_img = target_img.previousElementSibling;
	if(before_img == null) before_img = document.querySelector(".img_wrap img:last-child");
	let next_img = target_img.nextElementSibling;
	if(next_img == null) next_img = document.querySelector(".img_wrap img:first-child");
	
	if(param == "next") next_img.classList.add("on");
	if(param == "priv") before_img.classList.add("on");
	target_img.classList.remove("on");
}