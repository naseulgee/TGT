$(document).ready(function() {
	set_members();
	
	//검색 감지
	$("#subKeyword").on("input", function(){ set_members(); });
});

function set_members(){
	let mem_list_body = document.getElementById("members_list");
	let search = document.getElementById("subKeyword").value;
	
	$.ajax({
		url: "/admin/alarm/member",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify({subKeyword: search}),
		success: function(result){
			//회원 리스트 세팅 로직
			if (result.length == 0) {
				mem_list_body.innerHTML = "<p>조회된 결과가 없습니다.</p>";
			} else {
				let str = "";
				$.each(result, function(key, value) {
					str += "<input type='checkbox' name='target' value='"+value.MEM_ID+"' id='"+value.MEM_ID+"'>"
							+"<label for='"+value.MEM_ID+"'>"+value.MEM_ID+"("+value.MEM_DOG_NAME+")</label>";
				});
				mem_list_body.innerHTML = str;
			}
		},
		error: function(result){
			console.log(result.status);
			console.log(result.error);
			console.log(result.responseText);
		}
	});
}

//전체 선택/해제
function check_toggle(target){
	let chks = document.querySelectorAll("#members_list input[type='checkbox']");
	if(chks.length == 0) return false;
	
	if(target.checked){//전체 선택 시
		chks.forEach(chk => { chk.checked = true; });
	}else{//전체 해제 시
		chks.forEach(chk => { chk.checked = false; });
	}
}