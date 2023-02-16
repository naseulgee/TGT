<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link href="/resources/css/together/togethermypagelist.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<script src="/resources/js/paging/searchPaging_T.js"></script>
<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
<br/>

	
	<!-- 23.02.08 박선영 카드 테이블로 참여게시글 리스트 출력 -->
	<div class="main_wrap">
	<h1 class="txt_center"><span class="fa-solid fa-paw" style="color:#f0b1aa;"></span>함께해요<span class="fa-solid fa-paw" style="color:#f0b1aa;"></span></h1>
	<br/>
		<%-- <c:choose>
			<c:when test="${!empty list}"> --%>
				<table class="card_table" id="together_list">
					<tbody class="together">
						<c:forEach items="${list}" var="to">
							<!-- tr클래스 클릭시 상세보기 페이지로 이동-->
							<tr class="use_move" data-href="/together/detail/${to.TO_IDX}.paw" onclick="move(this,'TO_IDX:${to.TO_IDX}')" id="togetherDetail">
								<td class="color"><span class="fa-solid fa-paw"></span>[${to.TO_TC_NAME}] ${to.TO_TITLE } 
								<!-- 현재날짜에 따른 모집여부변경 -->
								<c:if test="${nowDate > to.TO_DATE }">
									<span class="btn warn">마감</span>
								</c:if>
								<c:if test="${nowDate < to.TO_DATE }">
									<c:if test="${to.C eq to.TO_PEOPLE}">
										<span class="btn submit">모집완료</span>
									</c:if>
									<c:if test="${to.C < to.TO_PEOPLE}">
										<span class="btn submit">모집중</span>
									</c:if>
								</c:if>
								</td><!-- 글분류, 제목 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(견종): ${to.BR_NAME }</td><!-- 참여가능견종 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(크기) : <c:if test="${to.TO_WT_IDX eq '1'}">XS</c:if>
								<c:if test="${to.TO_WT_IDX eq '2'}">S</c:if>
								<c:if test="${to.TO_WT_IDX eq '3'}">M</c:if>
								<c:if test="${to.TO_WT_IDX eq '4'}">L</c:if>
								<c:if test="${to.TO_WT_IDX eq '5'}">XL</c:if>
									</td><!-- 참여가능사이즈 -->
								<td><span class="fa-solid fa-bone"></span> 언제개: ${to.TO_DATE}</td><!-- 모임날짜 -->
								<td><span class="fa-solid fa-bone"></span> 몇시개: ${to.TO_TIME }</td><!-- 모임시간 -->
								<td><span class="fa-solid fa-bone"></span> 몇명이개: ${to.C}/${to.TO_PEOPLE}<!-- 참여인원/모임인원 -->
								<td class="txt_right" style="font-size:15px;">${to.TO_REG_DATE }</td><!-- 등록날짜 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<%-- </c:when> 

			<c:otherwise>
			<table id="not_together">
					<tbody>
						<tr>
							<td class="empty paw_hover">참여글이 없습니다:(</td>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose> --%>
				<!-- 23.02.14 박선영 페이징처리 -->
				<div id="PAGE_NAVI_T" class="flexCenter">
				<input type="hidden" value="${mem_id}" id="mem_id" name="mem_id"></div>
				<input type="hidden" id="PAGE_INDEX_T" name="PAGE_INDEX_T" /> <br />
			
				<form id="commonForm" name="commonForm"></form>
	</div>
</main>
<script type="text/javascript">
	$(document).ready(function(){
		fn_selectBoardList2(1);//첫화면 보이기

		});
	

		function fn_selectBoardList2(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/mypage/together/openlist' />");
			comAjax.setCallback("fn_selectBoardListCallback2");
			
			let p = pageNo;
			if(isNull(pageNo)) p = $("#PAGE_INDEX_T").val();
			if(isNull(p)) p = 1;
			comAjax.addParam("PAGE_INDEX", p);
			
			comAjax.addParam("PAGE_ROW", 6);
			comAjax.addParam("mem_id", $("#mem_id").val());
			//comAjax.addParam("now", $("#now").val());
			
			//let key = $("#subKeyword").val();
	        //if(isNull(key)) key = "";
	        //comAjax.addParam("subKeyword", key);

			comAjax.ajax();
		}
		

		function fn_selectBoardListCallback2(data) {
			var total2 = data.TOTAL_T;
			
			var body = $(".together");
			body.empty();
			
			
			//함께해요 리스트 세팅 로직
			if (total2 == 0) {
				var str = "<tr>" + "<td class='empty'>게시글이 없습니다:(</td>"
						+ "</tr>";
				body.append(str);

			} else {
				var params2 = {
					divId : "PAGE_NAVI_T",
					pageIndex : "PAGE_INDEX_T",
					totalCount : total2,
					eventName : "fn_selectBoardList2",
				};
				gfn_renderPaging_T(params2);
				
				var now = new Date()//날짜 형식의 변수 선언
				var dnow = getFormatDate(now);//원하는 형태의 문자열로 변환(2023-02-09)
				var time = getFormatTime(now);//원하는 형태의 문자열 시간으로 변환(22:10)
				var str = "";
				$.each(data.list,
						function(key, value) {
							str += "<tr class='use_move' name='togelist' data-href='/together/detail/"+value.TO_IDX +".paw' onclick='move(this,\"TO_IDX:"+value.TO_IDX+"\")'>";
							str += "<input type='hidden' name='TO_IDX' id='TO_IDX' value=" + value.TO_IDX + ">";
							str += "<td class='color'><span class='fa-solid fa-paw'></span>"+ "["+ value.TC_NAME + "]"  +value.TO_TITLE;
							if(dnow < value.TO_DATE){//문자열 형태로 비교
								if(value.C == value.TO_PEOPLE){
									str += "<span class='btn submit'>모집완료</span>";
								}
								if(value.C < value.TO_PEOPLE){
									str += "<span class='btn submit'>모집중</span>";
								}
							}
							else if(dnow > value.TO_DATE){
								str += "<span class='btn warn'>마감</span>";
							}
							else{//현재 날짜와 모집날짜가 같을때
								if(time > value.TO_TIME){//모집시간이 지났다면
									str += "<span class='btn warn'>마감</span>";
								}else{
									if(value.C == value.TO_PEOPLE){
										str += "<span class='btn submit'>모집완료</span>";
									}
									if(value.C < value.TO_PEOPLE){
										str += "<span class='btn submit'>모집중</span>";
									}
								}
							}
							str += "</td>";
							str += "<td><span class='fa-solid fa-bone'></span>" + value.TO_TITLE + "</td>";		
							str += "<td><span class='fa-solid fa-bone'></span>참여가능하개(견종) :"  + value.BR_NAME + "</td>"; 
							str += "<td><span class='fa-solid fa-bone'></span>참여가능하개(크기) :";
							if(value.TO_WT_IDX == 1){
								str += "XS"
							}
							if(value.TO_WT_IDX == 2){
								str += "S"
							}
							if(value.TO_WT_IDX == 3){
								str += "M"
							}
							if(value.TO_WT_IDX == 4){
								str += "L"
							}
							if(value.TO_WT_IDX == 5){
								str += "XL"
							}
							str += "</td>";
							str += "<td class='to_date'><span class='fa-solid fa-bone'></span>언제개 : " +value.TO_DATE + "</td>";
							str += "<td><span class='fa-solid fa-bone'></span>몇시개 : "  + value.TO_TIME + "</td>";
							str += "<td><span class='fa-solid fa-bone'></span>몇명이개 : "  + value.C + "/" + value.TO_PEOPLE + "</td>";
							//str += "<input type='hidden' id='TW_TO_IDX' name='TW_TO_IDX' value=" + value.TO_IDX + "/>" + "</td>"			
							str += "<td class='txt_right'>" + value.TO_REG_DATE + "</td>";
							str +=	"</tr>";
						});
				
				body.append(str);
			}
			   

		}
		//input time 과 비교위한 바꾸기
		function getFormatTime(date){
			var hours = date.getHours();//현재시간(한자리)
			hours = hours >= 10? hours : '0' + hours;//hours 두자리로 지정
			var minutes = date.getMinutes();//현재분
			minutes = minutes >= 10? minutes : '0' + minutes; //minutes두자리로 지정
			return hours + ":" + minutes;//형태변경
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
		
</script>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>