$(document).ready(function() {
	fn_selectBoardList(1);
	
	//검색 감지
	$("#subKeyword").on("input", function(){fn_selectBoardList(1);});
});

//리스트 세팅 함수
function fn_selectBoardList(pageNo) {
	let comAjax = new ComAjax("common");

	comAjax.setUrl("/admin/alarm/list");
	comAjax.setCallback("fn_selectBoardListCallback");

	//페이징 세팅
	if(!isNull(pageNo)){//함수 호출 시 매개변수를 주었다면
		comAjax.addParam("PAGE_INDEX", pageNo);
	}else if(!isNull($('#PAGE_INDEX').val())){//매개변수가 없지만 페이징 값을 저장하는 input에 값이 있다면
		comAjax.addParam("PAGE_INDEX", $('#PAGE_INDEX').val());
	}else{ comAjax.addParam("PAGE_INDEX", 1); }//그 외: 모두 1페이지
	comAjax.addParam("PAGE_ROW", 10);
	
	//검색 값 추가
	//if(!isNull($('#subKeyword').val())) comAjax.addParam("subKeyword", $('#subKeyword').val());
	
	comAjax.ajax();
}

//ajax 통신 후 세팅 함수
function fn_selectBoardListCallback(data) {
	let total = data.TOTAL;
	let al_list_body = $("#admin_al_list");

	//페이징 세팅
	let params = {
		divId : "paging",
		pageIndex : "PAGE_INDEX",
		totalCount : total,
		eventName : "fn_selectBoardList",
		recordCount : 10,
	};
	gfn_renderPaging_B(params);
	
	//시설 리스트 세팅 로직
	if (total == 0) {
		al_list_body.html("<tr><td class='empty' colspan='4'>조회된 결과가 없습니다.</td></tr>");
	} else {
		let str = "", al_link = "";
		$.each(data.list, function(key, value) {
			al_link = isNull(value.AL_LINK)?"":value.AL_LINK;
			str += "<tr>"
				+ "<td class='check'><label><input type='checkbox' name='al_idx' value='"+value.AL_IDX+"'>"+value.AL_IDX+"</label></td>"
				+ "<td class='target'>"+value.AL_MEM_ID+"</td>"
				+ "<td class='content toggle_ellip'>"+value.AL_CONTENTS+"</td>"
				+ "<td class='link toggle_ellip'>"+al_link+"</td>"
			+ "</tr>";
		});
		al_list_body.html(str);
	}
	set_toggle_ellip();//내용과 링크의 토글 활성화
}

//알람 전체 선택/해제
function check_toggle(target){
	let chks = document.querySelectorAll("#admin_al_list input[type='checkbox']");
	if(chks.length == 0) return false;
	
	if(target.checked){//전체 선택 시
		chks.forEach(chk => { chk.checked = true; });
	}else{//전체 해제 시
		chks.forEach(chk => { chk.checked = false; });
	}
}

//알람 수정폼 출력 함수
function modi_form(){
	let chks = document.querySelectorAll("#admin_al_list input[type='checkbox']:checked");
	if(chks.length == 0) return alert("수정할 알람을 선택해 주세요.");
	
	//선택한 알람 번호값 세팅
	let idxs = "";
	chks.forEach(chk => { idxs += ","+chk.value; });
	idxs = idxs.replace(",","");
	
	//팝업창 세팅
	let popup = document.getElementById("pop");
	if(isNull(popup)){
		popup = document.createElement("div");
		popup.id = "pop";
	}
	popup.innerHTML = "<form id='modi_content'>"
			+"<p class='txt_center'>알람<br><strong>"+idxs+"</strong>에<br>대해 수정할 내용을 입력해주세요.</p>"
			+"<input placeholder='알람 내용을 적어주세요' type='text' name='al_contents' value='' class='al_contents' required><br>"
			+"<input placeholder='알람 링크를 적어주세요' type='text' name='al_link' value='' class='al_link'><br>"
			+"<input type='hidden' name='target' value='"+idxs+"' class='target'>"
			+"<div class='btn_wrap'>"
				+"<input class='btn' type='button' value='취소하기' onclick='pop.remove()'>"
				+"<input class='btn submit' type='button' value='수정하기' onclick='modi()'>"
			+"</div>"
		+"</form>";
	document.querySelector("main").appendChild(popup);
}
//알람 수정 함수
function modi(){
	let form = document.getElementById("modi_content");
	let idx = form.querySelector(".target");
	let con = form.querySelector(".al_contents");
	let link = form.querySelector(".al_link");
	
	if(isNull(form) || isNull(idx) || idx.value == "") return alert("비정상적인 접근입니다.");
	if(isNull(con) || con.value == "") return alert("수정하실 내용을 입력해 주세요.");
	
	if(!confirm("정말 수정하시겠습니까?")) return false;
	
	$.ajax({
		url: "/admin/alarm/modify",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify({target: idx.value, al_contents: con.value, al_link: link.value}),
		success: function(result){
			alert("알람 "+result+"개 수정이 완료되었습니다.");
			location.reload();
		},
		error: function(result){
			console.log(result.status);
			console.log(result.error);
			console.log(result.responseText);
		}
	});
}

//알람 삭제 함수
function del(){
	let chks = document.querySelectorAll("#admin_al_list input[type='checkbox']:checked");
	if(chks.length == 0) return alert("삭제할 알람을 선택해 주세요.");
	
	//선택한 알람 번호값 세팅
	let idxs = "";
	chks.forEach(chk => { idxs += ","+chk.value; });
	idxs = idxs.replace(",","");
	
	if(!confirm("알람 "+idxs+"를 정말 삭제하시겠습니까?")) return false;
	
	$.ajax({
		url: "/admin/alarm/delete",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify({target: idxs}),
		success: function(result){
			alert("알람 "+idxs+" 삭제가 완료되었습니다.");
			location.reload();
		},
		error: function(result){
			console.log(result.status);
			console.log(result.error);
			console.log(result.responseText);
		}
	});
}