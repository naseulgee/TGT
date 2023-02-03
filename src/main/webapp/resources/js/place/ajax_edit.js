$(document).ready(function(){
	
});

//분류 추가/수정 취소 시 원래대로 돌리는 폼
function cancel(){
	//수정중인 대상 변수에 세팅
	let here = $(".edit");
	here.removeClass("edit");
	if(here.hasClass("add")){
		here.html("<button class='btn submit' type='button' onclick='cate_add(this);'>분류 등록하기</button>");
	}
	if(here.hasClass("modi")){
		here.removeClass("modi");
		here.children(".name").html(here.find(".name input").attr("data-before"));
		here.find(".reflect").remove();
	}
}
//분류 추가 함수
function cate_add(target){
	//이미 추가중인 함수가 있다면 수정하지 않기
	if($(".edit").length > 0) cancel();
	//클릭한 버튼 위치 내용 수정
	target = $(target).parent();
	target.addClass("edit");//클래스명 추가
	target.html("<span class='name'><input type='text' name='pc_name' placeholder='분류명을 입력해주세요' maxlength='10'></span>"
		+"<input value='반영' type='button' class='btn submit' onclick='cate_edit(1)'/> "
		+"<input value='취소' type='button' class='btn' onclick='cancel()'/>");
}
//분류 수정 함수
function cate_modi(target){
	//이미 추가중인 함수가 있다면 수정하지 않기
	if($(".edit").length > 0) cancel();
	target = $(target).closest("tr");
	let name = $(target).find(".name");
	let btn = $(target).find(".btn_wrap");
	target.addClass("edit modi");
	name.html("<input type='text' name='pc_name' data-before='"+name.text()+"' value='"+name.text()+"' maxlength='10'>");
	btn.prepend("<span class='reflect'>"
		+"<input value='반영' type='button' class='btn submit' onclick='cate_edit(2)'/> "
		+"<input value='취소' type='button' class='btn' onclick='cancel()'/>"
		+"</span>");
}
//분류 삭제 함수
function cate_del(target){
	if(!confirm("정말 해당 분류를 삭제하시겠습니까?")) return;
	$(target).closest("tr").addClass("edit del");
	cate_edit(3);
}
function cate_edit(target){
	let idx = $(".edit .idx");
	idx = (isNull(idx.text())) ? "0" : idx.text();
	let name = $(".edit .name input");
	name = (isNull(name)) ? name.text() : name.val();
	let _url = "/admin/place";
	if(target == 1) _url += "/cate/write";//등록
	if(target == 2) _url += "/cate/modify";//수정
	if(target == 3) _url += "/cate/delete";//삭제
	
	$.ajax({
		url: _url + ".paw",
		type: "POST",
		data: JSON.stringify({pc_idx: idx, pc_name: name}),
		contentType: "application/json",
		success: function(){
			if(target == 3) $(".edit").remove();//삭제
			else location.reload();//등록 및 수정 성공 시 페이지 새로고침
			$(".reflect").remove();//추가된 버튼 삭제
		},
		error: function(result){
			console.log(result.status);
			console.log(result.error);
			console.log(result.responseText);
		}
	});
}