<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<script src="/resources/js/paging/searchPaging_T.js"></script>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<style>
.layoutCenter{
width:100%;
}

.span.fa-solid {
color:#f0b1aa;
}

.fa-bone {
color:#f0b1aa;
}

.color {
font-size:20px;
font-weight:bold;
}

table{
width:100%;
display:absolute;
}

.cate_wrap{
width:100%;
display:flex;
}

.main_list{
width:100%;
padding-right:90px;
padding-left:95px;
position:relative;
}

.cate_button{
position:relative;
height:auto;
}

.cate_button li{
text-align:center;
}

.button_list{
border:1px solid #f0b1aa;
width:100%;
}

li{
margin : 20px;
}

.btn.submit{
white-space :nowrap;
font-size:20px;
}

span.btn.submit{
white-space : nowrap;
font-size : 15px;
}

input[type="button"]{
border:1px solid #9ea7ad;
padding-top: 5px;
padding-right: 10px;
padding-bottom: 5px;
padding-left: 10px
}
</style>
<main class="layoutCenter">
<br/>
	<h1 class="txt_center"><span class="fa-solid fa-paw" style="color:#f0b1aa;"></span>함께해요<span class="fa-solid fa-paw" style="color:#f0b1aa;"></span></h1>
	<br/>
	
<div class="cate_wrap">
	
	<!-- 카드 테이블로 전체게시글 리스트 출력 -->
	<!-- 23.01.30 박선영 참여인원 반영 구현 -->
	<!-- 23.02.01 박선영 모집여부 버튼 출력 구현 -->
	<div class="main_list">
		<c:choose>
			<c:when test="${!empty list}">
				<table class="card_table row1" id="together_list">
					<tbody class="together">
						<c:forEach items="${list}" var="to">
							<!-- tr클래스 클릭시 상세보기 페이지로 이동-->
							<tr class="use_move" data-href="/together/detail/${to.TO_IDX}.paw" onclick="move(this,'TO_IDX:${to.TO_IDX}')">
								<td class="color"><span class="fa-solid fa-paw"></span>[${to.TO_TC_NAME}] ${to.TO_TITLE } 
									<c:if test="${to.C eq to.TO_PEOPLE}">
										<span class="btn submit">모집완료</span>
									</c:if>
									<c:if test="${to.C < to.TO_PEOPLE}">
										<span class="btn submit">모집중</span>
									</c:if>
								</td><!-- 글분류, 제목 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(견종): ${to.BR_NAME }</td><!-- 참여가능견종 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(크기) : <c:if test="${to.TO_WT_IDX eq '1'}">XS</c:if>
								<c:if test="${to.TO_WT_IDX eq '2'}">S</c:if>
								<c:if test="${to.TO_WT_IDX eq '3'}">M</c:if>
								<c:if test="${to.TO_WT_IDX eq '4'}">L</c:if>
								<c:if test="${to.TO_WT_IDX eq '5'}">XL</c:if>
									</td><!-- 참여가능사이즈 -->
								<td><span class="fa-solid fa-bone"></span> 언제개: <fmt:formatDate value="${to.TO_DATE}" pattern="yyyy/MM/dd"/></td><!-- 모임날짜 -->
								<td><span class="fa-solid fa-bone"></span> 몇시개: ${to.TO_TIME }</td><!-- 모임시간 -->
								<td><span class="fa-solid fa-bone"></span> 몇명이개: ${to.C}/${to.TO_PEOPLE}<!-- 참여인원/모임인원 -->
									<input type="hidden" value="${to.TO_IDX}" id="TW_TO_IDX" name="TW_TO_IDX"/></td>
								<td class="txt_right" style="font-size:15px;"><fmt:formatDate value="${to.TO_REG_DATE }" pattern="yyyy/MM/dd"/></td><!-- 등록날짜 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- <ul id="paging">
				</ul>
				<div id="PAGE_NAVI_T"></div>
				<input type="hidden" id="PAGE_INDEX_T" name="PAGE_INDEX_T" />
				<form id="commonForm" name="commonForm"></form> -->
			</c:when>
			
			<c:otherwise>
				<table>
					<tbody>
						<tr>
							<td class="empty paw_hover">게시글이 없습니다:(</td>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<ul id="paging">
	</ul>
	<!-- 페이징처리 -->
	<div id="PAGE_NAVI_T"></div>
	<input type="hidden" id="PAGE_INDEX_T" name="PAGE_INDEX_T" /> <br />

	<form id="commonForm" name="commonForm"></form>
	
	<br/>
	
	<!-- 카테고리별 게시글 리스트 출력, 글쓰기 버튼 -->
	<!-- 23.01.31 박선영 로그인여부에 따른 버튼 출력 -->
	<div class="cate_button">
		<ul class="button_list">
			<li><c:if test="${!empty mem_id }">
				<a class="btn submit" id="writebtn" href="/together/writeForm.paw">글쓰개:)</a>
				</c:if></li>
			<li><c:if test="${empty mem_id}">
				<a class="btn submit" id="nowritebtn" href="/member/login.paw">로그인하개:)</a>
				</c:if></li>
			<c:forEach items="${catelist}" var="ct">	
				<li><input type="button" name="TC_NAME" data-href="/together/catelist.paw" value="${ct.TC_NAME }" class="use_move" 
					onclick="move(this, 'TC_NAME:${ct.TC_NAME}')"></li>	
			</c:forEach>	
		</ul>
	</div>
</div>	
</main>
<script type="text/javascript">
	$(document).ready(function(){
		fn_selectBoardList2(1);
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail2($(this));
			});
		});

		function fn_selectBoardList2(pageNo) {
			var comAjax = new ComAjax();
			
			comAjax.setUrl("<c:url value='/together/openlist.paw' />");
			comAjax.setCallback("fn_selectBoardListCallback2");
			
			if(!isNull(pageNo)) comAjax.addParam("PAGE_INDEX", pageNo);//pageNo가 비어있지 않다면
			else comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX_T").val());
			comAjax.addParam("PAGE_ROW", 6);
			
			if(!isNull($('#subKeyword').val()))
			comAjax.addParam("subKeyword", $('#subKeyword').val());
			//comAjax.addParam("searchType", $('#searchType').val());

			comAjax.ajax();
		}
		

		function fn_selectBoardListCallback2(data) {
			var total2 = data.TOTAL_T;
			
			var body = $(".together");
			body.empty();
			
			//리스트 세팅 로직
			if (total2 == 0) {
				var str = "<tr align='center'>" + "<td colspan='empty'>조회된 결과가 없습니다.</td>"
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

				var str = "";
				$.each(data.list,
					function(key, value) {
						str += "<tr class='use_move' data-href='/together/detail/{value.TO_IDX}.paw' onclick='move(this,'TO_IDX:value.TO_IDX')'>"
						str += "<input type='hidden' name='TO_IDX' id='TO_IDX' value=" + value.TO_IDX + ">"
						str += "<td>"+ value.TC_NAME + "" +value.TO_TITLE+ "</td>"
						str += "<td>"+ value.TO_TITLE + "</td>"				
						str += "<td>" + value.BR_NAME + "</td>" 
						str += "<td>" + value.TO_WT_IDX + "</td>"
						str += "<td>" + value.TO_DATE + "</td>"
						str += "<td>" + value.TO_TIME + "</td>"
						str += "<td>" + value.C + "/" + value.TO_PEOPLE + 
						str += "<input type='hidden' id='TW_TO_IDX' name='TW_TO_IDX' value=" + value.TO_IDX + "/>" + "</td>"			
						str += "<td>" + value.TO_REG_DATE + "</td>"
						str +=	"</tr>";
					});
				body.append(str);
			}

				$("table[id='together_list']").on("click", function(e) { //제목 
					e.preventDefault();
					fn_openBoardDetail2($(this));
				});
				
				function fn_openBoardDetail2(obj) {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/together/detail/{TO_IDX}.paw' />");
					comSubmit.addParam("TO_IDX", obj.parent().find("#IDX").val());
					comSubmit.submit();
				}
		//}
	</script>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
