<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="/resources/js/paging/paging.js" defer></script>
<style>
#phIcon,#stars { display: inline-block;}
#stars {font-size : 30px;}
#place, #contents, #phIcon,#regDate {color : #b8bfc4;}
#ppp { line-height : 1.2;}
img { border-radius : 15px; height : 100%;}
</style>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>
		<div class="main_wrap txt_center">
		
		<h1>나의 리뷰</h1>
		<div class="color">${mem_dog_name}(${mem_id})님의 리뷰페이지입니다 :)</div><br><br>

			<c:if test="${!empty reviewList}">
			<table class="">
				<tbody>
					<c:forEach items="${reviewList}" var="i" varStatus="status">
					<tr >
						<td width="80%">
							<div id="regDate" class="txt_right">
									<fmt:formatDate value="${i.RE_REG_DATE}" pattern="yy.MM.dd" /> 
							</div>
						
							<div class="pp flexBetween">
								<div class="txt_left">
									<p id="ppp">
									<!-- 시설명 -->
									<span id="place" class="txt_big">${i.PL_NAME}&nbsp;|&nbsp;</span>
									
					    			<!-- 별점 -->
					    			<c:forEach var="j" begin="1" end="${i.RE_STAR}">
				   						<i class="fa-solid fa-paw color" id="stars"></i>
									</c:forEach>
									<c:forEach var="j" begin="1" end="${5-i.RE_STAR}">
				   						<i class="fa-solid fa-paw subColor" id="stars"></i>
									</c:forEach>&nbsp; 
									</p>
									<br>
									
									<!-- 후기내용 -->
									<span id="contents">
										<c:choose>
					       					 <c:when test="${fn:length(i.RE_CONTENTS) gt 51}">
					        					${fn:substring(i.RE_CONTENTS, 0, 50)}...
					        				</c:when>
					        				<c:otherwise> ${i.RE_CONTENTS} </c:otherwise>
										</c:choose>		
										<!-- 사진후기 -->		
										<c:if test="${i.PHCOUNT>0}">
											<i class="fa-solid fa-image" id="phIcon"></i>
										</c:if>
									</span> &nbsp;&nbsp;
									<a class="use_move btn slim" href="/mypage/review/detail.paw" 
									onclick="move(this, 're_idx:${i.RE_IDX}','pl_idx:${i.RE_PL_IDX}', 'ph_board_type:review')">
									상세보기</a>
								</div>
								
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
							</div>					
						</td>	
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div id="PAGE_NAVI"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
			
			</c:if>
	
			<c:if test="${empty reviewList}">
				<br><br>
				<div class="center">
					🤔<br>작성하신 리뷰가 없어요
				</div>
			</c:if>
	
	
		</div>
</main><!-- //main 종료 -->

<script>
$(document).ready(function(){
	fn_selectBoardList(1); //1페이지 받기

});

function fn_selectBoardList(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/mypage/review/selectList.paw' />");
	comAjax.setCallback("fn_selectBoardListCallback"); //setCallback은 Ajax 요청이 완료된 후 호출될 함수의 이름을 지정
	comAjax.addParam("PAGE_INDEX",pageNo);//현재 페이지 번호
	comAjax.addParam("PAGE_ROW", 10);//한 페이지에 보여줄 행(데이터)의 수
	comAjax.ajax();
}

//Ajax 요청이 완료된 후 호출될 함수
function fn_selectBoardListCallback(data){
	var total = data.TOTAL;
	var body = $("table>tbody");
	body.empty();
	if(total == 0){
		var str = "<div class='center'><br><br>🤔<br>작성하신 리뷰가 없어요</div>";
		body.append(str);
	}
	else{
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_selectBoardList"
		};
		gfn_renderPaging(params);
		
		var str = "";
		$.each(data.list, function(key, value){
			str += "<tr>" + 
						"<td>" + value.IDX + "</td>" + 
						"<td class='title'>" +
							"<a href='#this' name='title'>" + value.TITLE + "</a>" +
							"<input type='hidden' name='title' value=" + value.IDX + ">" + 
						"</td>" +
						"<td>" + value.HIT_CNT + "</td>" + 
						"<td>" + value.CREA_DTM + "</td>" + 
					"</tr>";
		});
		body.append(str);
		
		$("a[name='title']").on("click", function(e){ //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});
	}
}
</script>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>		