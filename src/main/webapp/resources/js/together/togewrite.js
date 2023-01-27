//유효성 검사 함수
function writeform_check(){
	var to_title = document.getElementById("TO_TITLE");
	var to_people = document.getElementById("TO_PEOPLE");
	var to_contents = document.getElementById("TO_CONTENTS");
	var to_date = document.getElementById("TO_DATE");
	var to_time = document.getElementById("TO_TIME");
	var to_loc = document.getElementById("TO_LOC");
	
	if(to_title.value == ""){//제목 입력값이 없을경우
		alert("제목을 입력하세요:)");
		to_title.focus();//커서가 깜빡이는 효과 함수줌
		return false;//false를 반환하면 아래 코드 아무것도 진행하지 말라는 의미
	}
	
	
	if(to_people.value == "1") {
		alert("모집인원을 선택해주세요!:(");
		to_people.focus();
		return false;
	}
	
	if(to_contents.value == "") {
		alert("내용을 입력해주세요!:(");
		to_contents.focus();
		return false;
	}
	
	if(to_date.value == ""){
		alert("날짜를 선택해주세요!:(");
		to_date.focus();
		return false;
	}
	
	if(to_time.value == ""){
		alert("시간을 선택해주세요!:(");
		to_time.focus();
		return false;
	}
	
	if(to_loc.value == ""){
		alert("장소를 입력해주세요!:(");
		to_loc.focus();
		return false;
	}
	
	document.writefrm.submit();//값 넘겨주기	
}
