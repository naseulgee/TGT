	
	//파일 input에 값이 들어있는지 실시간 체크하는 메서드
	$("#photo1").on("propertychange change keyup paste input", function() {
	    var currentVal = $(this).val();
	    var reader = new FileReader();
		 	const imageSrc = URL.createObjectURL($(this)[0].files[0]);
	 	$("#thumbnail1").attr("src",imageSrc);
	 	$("#noImage1").hide();
	});
	$("#photo2").on("propertychange change keyup paste input", function() {
	    var currentVal = $(this).val();
	    var reader = new FileReader();
		 	const imageSrc = URL.createObjectURL($(this)[0].files[0]);
	 	$("#thumbnail2").attr("src",imageSrc);
	 	$("#noImage2").hide();
	});
	$("#photo3").on("propertychange change keyup paste input", function() {
	    var currentVal = $(this).val();
	    var reader = new FileReader();
		 	const imageSrc = URL.createObjectURL($(this)[0].files[0]);
	 	$("#thumbnail3").attr("src",imageSrc);
	 	$("#noImage3").hide();
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
			
			//1. 파일객체 가져오기
			var inputFile1 = $("input[name='photo1']")[0].files;
			//2. 확장자 알맞지 않거나 파일용량이 크면 FormData객체에 삽입X
			if (inputFile1.length > 0) { //첫번째 파일을 formData에 삽입
				if (checkExtension(inputFile1[0].name, inputFile1[0].size, inputFile1[0].name.length)) {
					formData.append("uploadFile", inputFile1[0]);
				} else { return false; }	
			}
			
			//3. 시설이나 리뷰라면 사진이 여러 개이므로 로직을 2번 더 추가 
			var board_type = $("input[name=ph_board_type]").val();
			if(board_type == 'review' || board_type == 'place') {
				
				var inputFile2 = $("input[name='photo2']")[0].files; //두번째 파일객체
				var inputFile3 = $("input[name='photo3']")[0].files; //세번째 파일객체
				
				if (inputFile2.length > 0) {//두번째 파일을 formData에 삽입
					if (!checkExtension(inputFile2[0].name, inputFile2[0].size, inputFile2[0].name.length)) {
						return false; 
					} else {
						formData.append("uploadFile", inputFile2[0]);
					}	
				}	
				if (inputFile3.length > 0) {//세번째 파일을 formData에 삽입
					if (!checkExtension(inputFile3[0].name, inputFile3[0].size, inputFile3[0].name.length)) {
						return false; 
					} else {
						formData.append("uploadFile", inputFile3[0]);
					}	
				}	

			}
			
			
			let target = $("main input:not([name^='photo']), textarea");
			for(let i=0; i<target.length ; i++) {
				let in_name = target[i].name;
				let in_value = target[i].value;
				let in_type = target[i].type;
				if ((in_type == 'radio'||in_type =='checkbox')&& !target[i].checked) {
					continue;
				}
				formData.append(in_name, in_value);		
			}

			$.ajax({
				url: insert_url,
				processData: false, 
				contentType: false,
			 	data: formData,
			 	type: 'POST',
			 	success: function(result){ 
			 		alert("글을 성공적으로 업로드했습니다!");
			 		location.href=result;
			 	}
			 }); //$.ajax
	
		}); 
	}