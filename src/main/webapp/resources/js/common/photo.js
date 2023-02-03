//!참고! 해당 자바스크립트는 defer 속성이 적용되어 호출됨으로 항상 DOM 로딩 완료 후 작동합니다.


$(document).ready( function() {	
		//기존에 등록한 이미지가 바뀌면 idx_n 제거
		$("#previousImg input[type='file']").on("propertychange change keyup paste input", function() {
			let idx = $(this).parent().children("[name^='idx_']")[0];
			if(!isNull(idx)) idx.remove();
		});
});


//파일 input에 값이 들어있는지 실시간 체크하는 메서드
let photo_inputs = $("input[id^='photo']");//id가 photo로 시작하는 input들 모두 변수에 담기
//photo_inputs 개수만큼 반복 적용
photo_inputs.each(function(index, item){
	//photo_inputs의 값이 변경될 때(사진이 첨부될 때)마다 실행
	$(item).on("input", function(){
		//첨부된 파일의 URL 변수에 담기
		const imageSrc = URL.createObjectURL(item.files[0]);
		if(isNull(imageSrc)) return;//만약 첨부된게 없다면 함수 종료
		//photo_inputs의 부모 변수에 담기
		let photo_wrap = $(item).parent();
		//img태그, no-image 태그 변수에 담기
		let img = photo_wrap.children("img");
		let no_img = photo_wrap.children(".no-image");
		//만약 자식태그로 img 태그가 이미 있다면 src 변경 => 수정 고려
		if(img.length > 0){
			img.attr("src",imageSrc);
		}else{//없다면 img 태그 추가
			photo_wrap.prepend("<img src='"+imageSrc+"'>");
		}
		//no-imge 태그가 있다면 제거
		if(no_img.length > 0) no_img.remove();
	});
});

//사이즈와 확장자 설정
var regex = new RegExp("(.*?)\.(jpeg|jpg|gif|png|bmp)$"); //이미지 파일 확장자
var maxSize = 5242880; //5MB
var maxLength = 200; //파일명의 최대 길이
//사이즈와 확장자가 잘못되었을 경우 제한하는 함수
function checkExtension(fileName, fileSize,fileNameLength) {
	if (fileSize >= maxSize) {
		alert("파일 사이즈는 5MB이하여야 합니다.");
		return false;
	}
	if (!regex.test(fileName)) {
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	if (fileNameLength > maxLength) {
		alert("파일명이 너무 길어 업로드할 수 없습니다.");
		return false;
	}
	return true;
} 

function form_submit(insert_url) {
	//클릭시 
	$("#uploadBtn").on("click", function(e) {
		//유효성 검증
		if(!checkForm()) { return false; };

		var formData = new FormData();
		
		//photo_inputs 개수만큼 반복 적용
		photo_inputs.each(function(index, item){
			//1. 파일객체 가져오기
			let inputFile = item.files[0];
			//2. 확장자 알맞지 않거나 파일용량이 크면 FormData객체에 삽입X
			if (!isNull(inputFile)) { //첫번째 파일을 formData에 삽입
				//사이즈 및 확장자가 올바른 경우 formData 객체에 파일 추가
				if (checkExtension(inputFile.name, inputFile.size, inputFile.name.length)) {
					formData.append("uploadFile", inputFile);
				} else { return false; }//아니면 함수 종료
			}
		});
		
		//main 자식 중 사진용 input이 아닌 input들과 textarea 선택
		let target = $("main input:not([name^='photo']), main textarea");
		for(let i=0; i<target.length ; i++) {//target 갯수만큼 반복
			//target의 name, value, type 변수에 담기
			let in_name = target[i].name;
			let in_value = target[i].value;
			let in_type = target[i].type;
			//타입이 만약 라디오나 체크박스라면 통과
			if ((in_type == 'radio'||in_type =='checkbox')&& !target[i].checked) {
				continue;
			}
			//formData객체에 name, value 속성 추가
			formData.append(in_name, in_value);
		}
		
		//main 자식 중 select는 따로 처리
		let target_select = $("main select");
		for(let i=0; i<target_select.length ; i++){
			//select의 이름과 선택된 option의 value 변수에 담기
			let in_name = target_select[i].name;
			let in_value = target_select[i].selectedOptions[0].value;
			//formData객체에 name, value 속성 추가
			formData.append(in_name, in_value);
		}

		$.ajax({
			url: insert_url,
			processData: false, 
			contentType: false,
			data: formData,
			type: 'POST',
			success: function(result){
				console.log(result);
				if (result == '/member/login') {
					alert("회원가입이 성공적으로 되었습니다!");
				} else {
					alert("글을 성공적으로 업로드했습니다!");
				}
				location.href=result;
			}
		}); //$.ajax
	});
}