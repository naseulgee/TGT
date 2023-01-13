/* ===================== 테스트 시작 함수 ===================== */
function start() {
	$(".start").hide();
	$(".question").show();
	next();
	$(".container").css("background-color", "#FEF6EF");
}

/* ===================== 테스트 계산 함수 ===================== */		
$("#A").click(function() {					//id가 A인 버튼을 클릭하면
	var type = $("#type").val();			//id=type의 vlaue를 변수 type으로 지정 ex)EI
	var preValue = $("#"+type).val();		//id = (#+변수 type id)인 value(기존값)를 변수 preValue로
				
	$("#"+type).val(parseInt(preValue)+1);	//id = (#+변수 type id)값의 기존 value에 +1
					//String 타입이라 연산을 위해 int 타입으로
	next();
});
		
$("#B").click(function() {					//id가 A인 버튼을 클릭하면
	next();
});
		
		
/* ===================== 테스트 문제 함수 ===================== */
/* 테스트 문제 */
var q = {
		 1 : {"title":"다른 강아지 친구들을 만났을때, 강아지의 반응은?",	"type":"EI", "A":"새친구 좋다멍!", 								"B":"근처도 오지마라 으르렁"},
		 2 : {"title":"집사가 쉬는날! 집사와의 데이트 장소는?",		"type":"EI", "A":"하루 전부터 두근두근! 나갈 준비 완료",  			"B":"나는 집,집,집! 집이 좋아"},
		 3 : {"title":"지나가는 인간이 나를 본다면?", 				"type":"EI", "A":"나 진짜 귀엽지? 친구하자!", 						"B":"저리가라 인간...(질끈)"},
		 4 : {"title":"눈 앞에 집사가 사라진다면?",				"type":"NS", "A":"또 시작이네, 여기저기 찾으러 가자!", 				"B":"방금까지 있었는데.. 나는 내 할 일 하련다!"},
		 5 : {"title":"집사가 외출한다면 나는...?", 				"type":"NS", "A":"진짜 간거야? 확인하고 기다린다", 					"B":"갔냐? 왈왈 내가 왕이다"},
		 6 : {"title":"새로운 장난감이 생긴다면?", 				"type":"NS", "A":"나의 왕국에 온 것을 환영해! 너는 나의 베스트 장난감", 	"B":"넌 뭐야! 정체를 밝혀라! 약 3초 관심 후 관심 끝!"},
		 7 : {"title":"집사가 간실을 들고 처음보는 훈련을 시도한다", 	"type":"TF", "A":"뭐해?ㅡㅡ (지켜본다)", 							"B":"킁킁 맛있는 냄새! 일단 따라하고 본다"},
		 8 : {"title":"친구 멍이 같이 사고를 치자고 날 꼬신다면?", 	"type":"TF", "A":"주인한테 혼날거야 난 뻬줘 멍~", 					"B":"나는야 날나리멍, 사고는 치고 있는 것!"},
		 9 : {"title":"집사와 간식 중에 선택해야 한다면?", 			"type":"TF", "A":"나의 pick은 간식이지롱", 						"B":"하찮은 간식 치워! 집사가 최고다 멍"},
		10 : {"title":"산책할 때의 나는...?", 					"type":"JP", "A":"거참.. 아는 길로 가자 집사야", 					"B":"저 나비를 쫓아가볼까? 왈왈멍멍"},
		11 : {"title":"산책 중 화장실이 급하다", 					"type":"JP", "A":"마킹한 곳을 찾아 배변한다", 						"B":"참지 않고 바로 쏴아"},
		12 : {"title":"자동 급식기를 집사가 사왔다", 				"type":"JP", "A":"아침 점식 저녁! 정확하게 나눠 먹겠어",			 	"B":"뷔페가.. 요기잉네?"}
}
		
		
var num = 1; 	//현재 문제 번호

var mbti = "";

/* ===================== 테스트 문제 넘기기 + 미무리 함수 ===================== */
function next() {
	if (num == 13) {				//마지만 질문 12번이 지나 13번이 될 경우
		
		($("#EI").val() > 1) ? mbti = mbti + "E" : mbti = mbti + "I";	//EI 값이 1보다 크면 E, 아니면 I
		($("#NS").val() > 1) ? mbti += "N" : mbti += "S";		
		($("#TF").val() > 1) ? mbti += "T" : mbti += "F";
		($("#JP").val() > 1) ? mbti += "J" : mbti += "P";
		
		// /mbti/result에 mbti값 넘기기
		$(function() {
			$.ajax({
			url : '/mbti/result.paw',
			async: false,
			type : 'get',
			success : function (result) {
				let url = '/mbti/result.paw?mbti='+mbti		//url에 담아 mbti 전달
				location.replace(url);
//				alert("데이터 넘기기는 성공"+ mbti);
				},
			error : function() {
				alert("error");
			}
			});
		});
		

	} else {

		$(".progress-bar").attr('style', 'width: calc(100/12*'+num+'%)')	//progress-bar 차오르게 style 변경

		$("#title").html(q[num]["title"]);	//<h2 id="title">을 불러와 번호에 따른 title로 변경
		$("#type").val(q[num]["type"]);		//<input id="type">를 불러와 번호에 따른 type으로 변경
		$("#A").html(q[num]["A"]);			//id=A인 버튼은 해당 num의 A로 변경
		$("#B").html(q[num]["B"]);
		num++;
	}
}