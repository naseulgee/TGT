$(document).ready(function() {
	//지도 세팅 함수
	set_map();
});

//삭제요청/삭제취소 버튼 클릭 시 통신 함수
function req_del(param){
	$.ajax({
		url: "/place/delete",
		type: "POST",
		data: JSON.stringify({
			pl_idx: document.querySelector("[name='pl_idx']").value,
			pl_del_gb: param
		}),
		contentType: "application/json",
		success: function(){
			alert("처리되었습니다!");
			return location.reload();
		},
		error: function(result){
			console.log(result.status);
			console.log(result.error);
			console.log(result.responseText);
		}
	});
}

//메뉴 추가/수정/삭제 함수
function menu(what, where){
	if(!isNull(document.querySelector(".edit"))) return alert("작성중인 변경사항을 완료해주세요!");

	let name = "", price = "";
	if(!isNull(where)){
		name = where.closest("li").querySelector(".menu_name").innerText;
		price = where.closest("li").querySelector(".menu_price").innerText;
	}
	let edit;
	let edit_parent;
	let edit_html = "<p>"
			+"<span><input type='text' name='pm_name' value='"+name+"' placeholder='메뉴명을 입력해주세요' maxlength='10'></span>"
			+"<span><input type='number' name='pm_price' value='"+price+"' placeholder='가격을 입력해주세요'></span> 원"
		+"</p>"
		+"<div class='btn_wrap'>"
			+"<button class='btn' type='button' onclick='menu_check(this, \""+what+"\")'>"
				+"<i class='fa-solid fa-check'></i>"
				+"<span class='displaynone'>반영하기</span>"
			+"</button> "
			+"<button class='btn warn' type='button' onclick='menu_cancel()'>"
				+"<i class='fa-solid fa-xmark'></i>"
				+"<span class='displaynone'>취소하기</span>"
			+"</button>"
		+"</div>";
	if(what == "del"){
		if(confirm("정말로 해당 메뉴를 삭제하시겠습니까?")) return menu_check(where, what);
		return;
	}
	if(what == "add"){
		edit = document.createElement("li");
		edit_parent = document.querySelector(".menu_list ul");
	}else if(what == "modi"){
		edit = document.createElement("p");
		edit_parent = where.closest("li");
	}else{
		return alert("비정상적인 접근입니다!");
	}
	edit.classList.add("edit");
	edit.innerHTML = edit_html;
	edit_parent.prepend(edit);
	return;
}
//메뉴 반영 함수
function menu_check(where, what){
	where = where.closest("li");
	let _url = "",
		idx = where.closest("li").querySelector("input[name='pm_idx']"),
		_name = "",
		_price = "";
	idx = isNull(idx)?"":idx.value;
	if(what == "del") _url = "/place/menu/delete";//삭제라면
	else{
		_name = where.querySelector("[name='pm_name']").value,
		_price = where.querySelector("[name='pm_price']").value;
		if(isNull(_name) || isNull(_price)) return alert("메뉴명과 가격을 모두 입력해주세요!");
		if(what == "add") _url = "/place/menu/write";//등록이라면
		if(what == "modi") _url = "/place/menu/modify";//수정이라면
	}

	$.ajax({
		url: _url,
		type: "POST",
		data: JSON.stringify({
			pm_idx: idx,
			pl_idx: document.querySelector("[name='pl_idx']").value,
			pm_name: _name,
			pm_price: _price
		}),
		contentType: "application/json",
		success: function(result){
			if(what == "del") return where.remove();//삭제라면 li 제거
			if(what == "modi"){//수정이라면
				where.querySelector(".menu_name").innerText = _name;
				where.querySelector(".menu_price").innerText = _price;
				return document.querySelector(".edit").remove();
			}
			if(what == "add"){//등록이라면
				where.classList.remove("edit");
				where.innerHTML = "<input type='hidden' name='pm_idx' value='"+result+"'>"
					+"<p class='print'>"
						+"<span class='menu_name'>"+_name+"</span><span class='menu_price'>"+_price+"</span> 원"
					+"</p>"
					+"<div class='btn_wrap'>"
						+"<input class='btn' type='button' onclick='menu(\"modi\", this)' value='수정'> "
						+"<input class='btn warn' type='button' onclick='menu(\"del\", this)' value='삭제'>"
					+"</div>";
			}
		},
		error: function(result){
			console.log(result.status);
			console.log(result.error);
			console.log(result.responseText);
		}
	});
}
//메뉴 반영 취소 함수
function menu_cancel(){
	document.querySelector(".edit").remove();
}

//탭 클릭 시 스크롤 이동 함수
function move_tab(param){
	let target = document.querySelector("#"+param+"_wrap");
	if(isNull(target)) return;
	window.scrollTo(0, target.offsetTop-30);
}

//주소 복사 함수
function copy_addr(){
	let target = document.querySelector(".addr .loc");
	if(isNull(target)) return alert("복사할 주소가 없습니다!");
	window.navigator.clipboard.writeText(target.textContent).then(() => {
	  // 복사가 완료되면 이 부분이 호출된다.
	  alert("복사 완료!");
	});
}