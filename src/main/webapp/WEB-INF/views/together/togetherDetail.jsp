<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link href="/resources/css/together/togetherdetail.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<script>
function logincheck(){
	alert("로그인하세요:(");
	location.href = '/member/login';//로그인 페이지로 이동
}


</script>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>

	<!-- 23.01.18 박선영 게시글 상세보기 구현 -->
	<!-- 23.01.30 박선영 게시글 참여인원 반영 구현 -->
	<div class="main_wrap">
	<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
		<table>
			<tbody>
				<tr>
					<td class="bgColor" style="font-size:20px;"><span class="fa-solid fa-paw" style="color:white;"></span> ${map.TO_TC_NAME} <span class="fa-solid fa-paw" style="color:white;"></span></td>
				</tr>
				<tr>
					<td>제목:)<strong>${map.TO_TITLE}</strong></td>
				</tr>
				<tr>
					<td>누구랑? <strong>${map.BR_NAME}</strong>(이)랑!</td>
				</tr>
				<tr>
					<td>날짜 :${map.TO_DATE} || 시간 :${map.TO_TIME}</td>
				</tr>
				<tr>
					<td>어디서 모이개?<strong>${map.TO_LOC}</strong></td>
				</tr>
				<tr>
					<td class="toggle_ellip">내용 : ${map.TO_CONTENTS}</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<div class="flexCenter">
			<ul class="with">
				<li class="txt_center"><span class="fa-solid fa-paw"></span> 참여중이개!   ${map.C}/${map.TO_PEOPLE }</li>
				<li class="txt_center"><span class="fa-solid fa-paw"></span> 대장이개! 
					<c:if test="${!empty mem_id}"> <!-- 로그인시 참여멤버 상세보기 가능 -->
						<button class="use_move" data-href = "/together/writerdetail" onclick="move(this, 'TO_WRITER_ID:${map.TO_WRITER_ID}', 'TO_IDX:${map.TO_IDX}')" id="wtmem">
						<span class="fa-solid fa-paw" id="wtmem"></span> ${map.TO_WRITER_ID} </button>
					</c:if>
					<c:if test="${empty mem_id}"><!-- 미로그인시 로그인함수 실행 -->
						<button id="wtmem" onclick="logincheck();">
						<span class="fa-solid fa-paw" id="wtmem"></span> ${map.TO_WRITER_ID} </button>
					</c:if>
				</li>
				<c:choose>
					<c:when test="${!empty withlist}">
						<li>
							<c:if test="${!empty mem_id}"><!-- 로그인시 상세보기에서 목록으로 돌아올 수 있도록 작성 -->
								<span class="fa-solid fa-paw"></span> 누구랑 가개?
								<c:forEach items="${withlist}" var="wili">
									<button class="use_move" data-href = "/together/withdetail" onclick="move(this, 'TW_MEM_ID:${wili.TW_MEM_ID}', 'TO_IDX:${map.TO_IDX}')" id="withmem">
									<span class="fa-solid fa-paw" id="withmem"></span> ${wili.TW_MEM_ID}</button>
								</c:forEach>
							</c:if>
							<c:if test="${empty mem_id}"><!-- 멤버 상세보기 클릭시 로그인 페이지로 이동 -->
								<span class="fa-solid fa-paw"></span> 누구랑 가개?
								<c:forEach items="${withlist}" var="wili">
									<button id="withmem" onclick="logincheck();">
									<span class="fa-solid fa-paw" id="withmem"></span> ${wili.TW_MEM_ID}</button>
								</c:forEach>
							</c:if>
						</li>
					</c:when>
					<c:otherwise>
						<li>
						참여자가 없습니다:(
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<br/>
		
		<div class="flexCenter">
			<a class="btn submit" href="/together/openList.paw">목록으로</a>
			<c:if test="${!empty mem_id}">
				<!--로그인 되어있고 로그인한 아이디가 작성자 아이디와 같을때  -->
				<c:if test="${mem_id eq map.TO_WRITER_ID}">
					<input type="button" class="btn submit" id="creatChat" name="creatChat" value="채팅참여">
					<!-- 23.02.23 박선영 마감하지 않았을때만 수정가능 -->
					<c:if test="${nowDate < map.TO_DATE}">
						<input type="button" class="use_move" data-href="/together/modifyForm.paw" onclick="move(this, 'TO_IDX:${map.TO_IDX}')" value="수정하기" style="margin-right:5px;">
					</c:if>
					<!-- 23.02.23 시간도 고려하여 마감하지 않았을때만 수정가능 -->
					<c:if test="${nowDate eq map.TO_DATE}">
						<c:if test="${nowTime <= map.TO_TIME }">
							<input type="button" class="use_move" data-href="/together/modifyForm.paw" onclick="move(this, 'TO_IDX:${map.TO_IDX}')" value="수정하기" style="margin-right:5px;">
						</c:if>
					</c:if>
					<input type="button" class="use_move" data-href="/together/delete.paw" onclick="move(this, 'TO_IDX:${map.TO_IDX}')" value="삭제하기">
				</c:if>
				
				<!-- 로그인한 아이다가 작성자 아이디와 같지 않을때 -->
				<c:if test = "${mem_id ne map.TO_WRITER_ID}">
					<!-- 참여인원이 모집인원보다 작을때, 모집중일때-->
					<c:if test="${map.C < map.TO_PEOPLE}">
					<!-- 23.02.08 박선영 모집날짜가 지나지 않았을때 -->
						<c:if test="${nowDate < map.TO_DATE}">
								<!-- 아직 참여하지 않은 상태라면 -->
								<c:if test="${empty checkwith}">
									<form id="withreg" name="withreg">
										<input type="hidden" id="TW_TO_IDX" name="TW_TO_IDX" value="${map.TO_IDX}">
										<input type="hidden" id="TW_MEM_ID" name="TW_MEM_ID" value="${mem_id}">
										<input type="button" class="btn" id="withmem" name="withmem" value="참여하개:)">
									</form>
								</c:if>
						</c:if>
					<!--23.02.21 박선영 모집시간도 고려할때 -->
						<c:if test="${nowDate eq map.TO_DATE}">
							<c:if test="${nowTime <= map.TO_TIME }">
								<!-- 아직 참여하지 않은 상태라면 -->
								<c:if test="${empty checkwith}">
									<form id="withreg" name="withreg">
										<input type="hidden" id="TW_TO_IDX" name="TW_TO_IDX" value="${map.TO_IDX}">
										<input type="hidden" id="TW_MEM_ID" name="TW_MEM_ID" value="${mem_id}">
										<input type="button" class="btn" id="withmem" name="withmem" value="참여하개:)">
									</form>
								</c:if>
							</c:if>
						</c:if>
					</c:if>
					<!-- 이미 모집완료된 상태에서도 취소버튼 활성화 -->
					<c:if test="${map.C <= map.TO_PEOPLE}">
					<!-- 23.02.08 박선영 모집날짜가 지나지 않았을때 -->
						<c:if test="${nowDate < map.TO_DATE}">
							<!-- 이미 참여한 상태라면 -->
							<c:if test="${!empty checkwith}">	
								<form id="withdel" name="withdel">
									<input type="button" class="btn submit" id="creatChat" name="creatChat" value="채팅참여">
									<input type="hidden" id="TW_TO_IDX" name="TW_TO_IDX" value="${map.TO_IDX}">
									<input type="hidden" id="TW_MEM_ID" name="TW_MEM_ID" value="${mem_id}">
									<input type="button" class="btn" id="delwith" name="delwith" value="취소하개:(">
								</form>
							</c:if>	
						</c:if>
						<!--23.02.21 박선영 모집시간도 고려할때 -->
						<c:if test="${nowDate eq map.TO_DATE}">
							<c:if test="${nowTime <= map.TO_TIME }">
								<!-- 이미 참여한 상태라면 -->
							<c:if test="${!empty checkwith}">	
								<form id="withdel" name="withdel">
									<input type="button" class="btn submit" id="creatChat" name="creatChat" value="채팅참여">
									<input type="hidden" id="TW_TO_IDX" name="TW_TO_IDX" value="${map.TO_IDX}">
									<input type="hidden" id="TW_MEM_ID" name="TW_MEM_ID" value="${mem_id}">
									<input type="button" class="btn" id="delwith" name="delwith" value="취소하개:(">
								</form>
							</c:if>	
							</c:if>
						</c:if>
					</c:if>
					
					
				</c:if>	
			</c:if>		
		</div>
	</div>
	
</main>
<script type="text/javascript" src="/resources/js/together/togetherwith.js"></script>

<script>
$(document).ready(function(){
	
	var togewith = {
            "TW_TO_IDX": $("input[name='TW_TO_IDX']").val(),
            "TW_MEM_ID": $("input[name='TW_MEM_ID']").val(),
          };

	$("input[name='withmem']").on("click",function(e){
	      
	      
	      withService.add(togewith, function(result){
	        
	        alert(result);
	         
	      });//withService 함수 끝
	      location.reload();
	});//클릭함수 끝
	
	
	$("input[name='delwith']").on("click",function(e){
		
		withService.remove(togewith, function(deleteResult){
			
			alert(deleteResult);
			
		});//withService 함수 끝
		location.reload();
	});//클릭함수 끝
	
});


//작성자 - 채팅방 들어가기
$("#creatChat").click(function() {
	const roomNumber = ${TO_IDX};
	const data = {
		"roomNumber" : ${TO_IDX},
		"roomName" : '${map.TO_TITLE}',
		"nickname" : '${mem_id}'
	}
	$.ajax({
			url : "/chattingRoom",
			type : "POST",
			data : data,
		}).then(function(){
			location.href = "/chat.paw";
			enterChatingRoom(roomNumber)
		})
});

const initRoom = function(room, nickname) {
	// 방 목록 업데이트
	stomp.send("/socket/roomList");

}
</script>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
