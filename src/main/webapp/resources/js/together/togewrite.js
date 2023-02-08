//유효성 검사 함수
function writeform_check(){
	var to_title = document.getElementById("TO_TITLE");
	var to_people = document.getElementById("TO_PEOPLE");
	var to_contents = document.getElementById("TO_CONTENTS");
	var to_date = document.getElementById("TO_DATE");
	var to_time = document.getElementById("TO_TIME");
	var to_loc = document.getElementById("TO_LOC");
	let tdate = document.getElementById("TO_DATE").value;//input date 값 가져오기
	let now = new Date();//현재시간
	let nowDate = getFormatDate(now);//형식 바꾸기 
	let t_time = document.getElementById("TO_TIME").value;//input time 값 가져오기
	let nowTime = getFormatTime(now);//형식 바꾸기
	
	if(to_title.value == ""){//제목 입력값이 없을경우
		alert("제목을 입력하세요:)");
		to_title.focus();//커서가 깜빡이는 효과 함수줌
		return false;//false를 반환하면 아래 코드 아무것도 진행하지 말라는 의미
	}
	
	
	//if(to_people.value == "1") {
		//alert("모집인원을 선택해주세요!:(");
		//to_people.focus();
		//return false;
	//}
		
		
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
	
	if(tdate == nowDate){
		if(t_time == nowTime){
			alert("현재시간은 불가합니다!:(");
			to_time.focus();
			return false;
		}
	}
	
	if(tdate < nowDate) {
		alert ("이미 지난 날짜입니다!");
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

//input date 형식과 비교를 위한 날짜 바꾸기
function getFormatDate(date){
	var year = date.getFullYear();//yyyy
	var month = (1 + date.getMonth());//M
	month = month >= 10? month: '0' + month;//month 두자리로 지정
	var day = date.getDate();//d
	day = day >= 10? day: '0' + day;//day 두자리로 지정
	return year + '-' + month + '-' + day;//-추가하여 yyyy-MM-dd 형태 지정가능
}

//input time 과 비교위한 바꾸기
function getFormatTime(date){
	var hours = date.getHours();//현재시간(한자리)
	hours = hours >= 10? hours : '0' + hours;//hours 두자리로 지정
	var minutes = date.getMinutes();//현재분
	minutes = minutes >= 10? minutes : '0' + minutes; //minutes두자리로 지정
	return hours + ":" + minutes;//형태변경
}

