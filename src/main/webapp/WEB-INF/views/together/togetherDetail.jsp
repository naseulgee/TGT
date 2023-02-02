<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>

<style>
span.fa-solid.fa-paw {
color:#f0b1aa;
}

table{
width:800px;
font-size: 22px;
margin-right:auto;
margin-left:auto;
position:relative;
}

tr{
text-align:center;
}
.mypage{
top:100px;
}

.with li{
line-height:2em;
font-size:20px;
}

.main_detail{
float:right;
padding-right:100px;
}

.btn.submit{
margin-right:5px;
}

input[type="button"]{
border:1px solid #9ea7ad;
padding-top: 5px;
padding-right: 10px;
padding-bottom: 5px;
padding-left: 10px
}

</style>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>

	<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
	<!-- 23.01.18 박선영 게시글 상세보기 구현 -->
	<!-- 23.01.30 박선영 게시글 참여인원 반영 구현 -->
	<div class="main_detail">
		<table>
			<tbody>
				<tr>
					<td class="bgColor" style="font-size:20px;"><span class="fa-solid fa-paw" style="color:white;"></span> ${map.TO_TC_NAME} <span class="fa-solid fa-paw" style="color:white;"></span></td>
				</tr>
				<tr>
					<td><strong>${map.TO_TITLE}</strong></td>
				</tr>
				<tr>
					<td><strong>${map.BR_NAME}</strong>(이)랑!</td>
				</tr>
				<tr>
					<td>${map.TO_DATE}|${map.TO_TIME}</td>
				</tr>
				<tr>
					<td>${map.TO_LOC}</td>
				</tr>
				<tr>
					<td class="toggle_ellip">${map.TO_CONTENTS}</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<div class="flexCenter">
				<ul class="with">
				<li><span class="fa-solid fa-paw"></span> 참여중이개!  ${map.C}/${map.TO_PEOPLE }</li>
				<li><span class="fa-solid fa-paw"></span> 대장이개!  ${map.TO_WRITER_ID}</li>
				<c:choose>
						<c:when test="${!empty withlist}">
							<li><span class="fa-solid fa-paw"></span> 누구랑 가개?
								<c:forEach items="${withlist}" var="wili">
									${wili.TW_MEM_ID}
								</c:forEach>
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
					<input type="button" class="use_move" data-href="/together/modifyForm.paw" onclick="move(this, 'TO_IDX:${map.TO_IDX}')" value="수정하기" style="margin-right:5px;">
					<input type="button" class="use_move" data-href="/together/delete.paw" onclick="move(this, 'TO_IDX:${map.TO_IDX}')" value="삭제하기">
				</c:if>
			
				<!-- 로그인한 아이다가 작성자 아이디와 같지 않을때 -->
				<c:if test = "${mem_id ne map.TO_WRITER_ID}">
					<!-- 참여인원이 모집인원보다 작을때, 모집중일때-->
					<c:if test="${map.C < map.TO_PEOPLE}">
						<!-- 아직 참여하지 않은 상태라면 -->
						<c:if test="${empty checkwith}">
							<form id="withreg" name="withreg">
								<input type="hidden" id="TW_TO_IDX" name="TW_TO_IDX" value="${map.TO_IDX}">
								<input type="hidden" id="TW_MEM_ID" name="TW_MEM_ID" value="${mem_id}">
								<input type="button" class="btn" id="withmem" name="withmem" value="참여하개:)">
							</form>
						</c:if>
					</c:if>	
						<!-- 이미 참여한 상태라면 -->
						<c:if test="${!empty checkwith}">	
							<form id="withdel" name="withdel">
								<input type="hidden" id="TW_TO_IDX" name="TW_TO_IDX" value="${map.TO_IDX}">
								<input type="hidden" id="TW_MEM_ID" name="TW_MEM_ID" value="${mem_id}">
								<input type="button" class="btn" id="delwith" name="delwith" value="취소하개:(">
							</form>
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

</script>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
