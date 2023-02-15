<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<script src="/resources/js/paging/paging.js"></script>
<style>
span.fa-solid {
color:#f0b1aa;
}

.main_wrap thead{
font-weight:bold;
}

#catewrite.btn.submit{
margin-right:5px;
}

</style>
<main class="layoutCenter">

<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>

	<br/>
	<!-- 23.01.25 박선영 : 함께해요 관리자 페이지 게시글 리스트 출력 -->
<div class="main_wrap">
	<table class="txt_center" id="together_list">
		<%-- <colgroup>
			<col width="10%"/>
			<col width="7%"/>
			<col width="10%"/>
			<col width="12%"/>
			<col width="10%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="13%"/>
			<col width="13%"/>
			<col width="13%"/>
		</colgroup>
		<thead>
			<tr>
				<th>게시글 번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>모임일자</th>
				<th>마감여부</th>
				<th>작성자</th>
				<th>참여인원</th>
				<th>참여견종</th>
				<th>작성날짜</th>
				<th>수정날짜</th>
			</tr>
		</thead> --%>
		<tbody class="together">
			<%-- <c:choose>
				<c:when test="${!empty list }"> --%>
					<c:forEach items="${list }" var="adli">
						<tr class="use_move" data-href="/admin/together/detail/${adli.TO_IDX}" onclick="move(this,'TO_IDX:${adli.TO_IDX}')"
						id="admindetail">
							<td class="txt_center">${adli.TO_IDX}</td>
							<td class="txt_center">${adli.TO_TC_NAME }</td>
							<td class="txt_center">${adli.TO_TITLE}</td>
							<td class="txt_center"><fmt:formatDate value="${adli.TO_DATE }" pattern="yyyy/MM/dd"/></td>
							<td class="txt_center">
								<c:if test="${adli.TO_PEOPLE eq adli.C}">
									모집완료
								</c:if>
								<c:if test="${adli.TO_PEOPLE > adli.C}">
									모집중
								</c:if>
							</td>
							<td class="txt_center">${adli.TO_WRITER_ID }</td>
							<td class="txt_center">${adli.C}</td>
							<td class="txt_center">${adli.BR_NAME}</td>
							<td class="txt_center"><fmt:formatDate value="${adli.TO_REG_DATE }" pattern="yyyy/MM/dd"/></td>
							<td class="txt_center"><fmt:formatDate value="${adli.TO_MOD_DATE }" pattern="yyyy/MM/dd"/></td>
						</tr>
					</c:forEach>
				<%-- </c:when>
				<c:otherwise>
					<tr>
						<td colspan="9" align="center">조회된 리스트가 없습니다:(</td>
					</tr>
				</c:otherwise>
			</c:choose> --%>
		</tbody>
	</table>
	<br/>
	
	<!-- 23.02.02페이징처리 -->
	<div id="PAGE_NAVI" class="flexCenter">
		<input type="hidden" value="${now}" id="now" name="now"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br />
	
		<form id="commonForm" name="commonForm"></form>
	
	<!-- 버튼 -->	
	<div class="flexCenter">
		<a class="btn submit" id="catewrite" href="/admin/together/catewriteForm">카테고리 등록:)</a>
		<a class="btn" id="wtwrite" href="/admin/together/weightwriteForm">몸무게 등록:)</a>
	</div>
</div>	
</main>
<script type="text/javascript">
	$(document).ready(function(){
		fn_selectBoardList2(1);//첫화면 보이기

		});
	

		function fn_selectBoardList2(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/together/openlist' />");
			comAjax.setCallback("fn_selectBoardListCallback2");
			
			let p = pageNo;
			if(isNull(pageNo)) p = $("#PAGE_INDEX").val();
			if(isNull(p)) p = 1;
			comAjax.addParam("PAGE_INDEX", p);
			
			comAjax.addParam("PAGE_ROW", 10);
			//comAjax.addParam("now", $("#now").val());
			
			//let key = $("#subKeyword").val();
	        //if(isNull(key)) key = "";
	        //comAjax.addParam("subKeyword", key);

			comAjax.ajax();
		}
		

		function fn_selectBoardListCallback2(data) {
			var total2 = data.TOTAL;
			
			var body = $(".together");
			body.empty();
			
			
			//함께해요 리스트 세팅 로직
			if (total2 == 0) {
				var str = "<tr>" + "<td colspan='9' align='center'>조회된 게시글이 없습니다:(</td>"
						+ "</tr>";
				body.append(str);

			} else {
				var params2 = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total2,
					eventName : "fn_selectBoardList2",
				};
				gfn_renderPaging(params2);
				
				var now = new Date()//날짜 형식의 변수 선언
				var dnow = getFormatDate(now);//원하는 형태의 문자열로 변환(2023-02-09)
				var time = getFormatTime(now);//원하는 형태의 문자열 시간으로 변환(22:10)
				var str = "";
					str += "<colgroup>";
					str += "<col width='10%'/>";
					str += "<col width='7%'/>";
					str += "<col width='10%'/>";
					str += "<col width='12%'/>";
					str += "<col width='10%'/>";
					str += "<col width='7%'/>";
					str += "<col width='7%'/>";
					str += "<col width='13%'/>";
					str += "<col width='13%'/>";
					str += "<col width='13%'/>";
					str += "</colgroup>";
					str += "<thead>";
					str += "<tr>";
					str += "<th>게시글 번호</th>";
					str += "<th>카테고리</th>";
					str += "<th>제목</th>";
					str += "<th>모임일자</th>";
					str += "<th>마감여부</th>";
					str += "<th>작성자</th>";
					str += "<th>참여인원</th>";
					str += "<th>참여견종</th>";
					str += "<th>작성날짜</th>";
					str += "<th>수정날짜</th>";
					str += "</tr>";
					str += "</thead>"; 
				$.each(data.list,
						function(key, value) {
							str += "<tr class='use_move' name='togelist' data-href='/admin/together/detail/"+value.TO_IDX +"' onclick='move(this,\"TO_IDX:"+value.TO_IDX+"\")'>";
							str += "<input type='hidden' name='TO_IDX' id='TO_IDX' value=" + value.TO_IDX + ">";
							str += "<td class='txt_center'>" + value.TO_IDX + "</td>";
							str += "<td class='txt_center'>" + value.TO_TC_NAME + "</td>";
							str += "<td class='txt_center'>" + value.TO_TITLE + "</td>";
							str += "<td class='txt_center'>" + value.TO_DATE + "</td>";
							if(dnow < value.TO_DATE){//문자열 형태로 비교
								if(value.C == value.TO_PEOPLE){
									str += "<td class='txt_center'>모집완료</td>";
								}
								if(value.C < value.TO_PEOPLE){
									str += "<td class='txt_center'>모집중</td>";
								}
							}
							else if(dnow > value.TO_DATE){
								str += "<td class='txt_center'>마감</td>";
							}
							else{//현재 날짜와 모집날짜가 같을때
								if(time > value.TO_TIME){//모집시간이 지났다면
									str += "<td class='txt_center'>마감</td>";
								}else{
									if(value.C == value.TO_PEOPLE){
										str += "<td class='txt_center'>모집완료</td>";
									}
									if(value.C < value.TO_PEOPLE){
										str += "<td class='txt_center'>모집중</td>";
									}
								}
							}
							str += "<td class='txt_center'>" + value.TO_WRITER_ID + "</td>";
							str += "<td class='txt_center'>" + value.C + "</td>";		
							str += "<td class='txt_center'>"  + value.BR_NAME + "</td>"; 			
							str += "<td class='txt_center'>" + value.TO_REG_DATE + "</td>";
							str += "<td class='txt_center'>" + value.TO_MOD_DATE + "</td>";
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