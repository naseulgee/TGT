<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link href="/resources/css/together/togetherlist.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<script src="/resources/js/paging/searchPaging_T.js"></script>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->

<main class="layoutCenter">
<br/>
	<h1 class="txt_center"><span class="fa-solid fa-paw" style="color:#f0b1aa;"></span>함께해요<span class="fa-solid fa-paw" style="color:#f0b1aa;"></span></h1>
	<br/>
<div class="cate_wrap">
	
	<!-- 카드 테이블로 전체게시글 리스트 출력 -->
	<!-- 23.02.01 박선영 모집여부 버튼 출력 구현 -->
	<div class="main_list">
		<%-- <c:choose>
			<c:when test="${!empty list}"> --%>
				<table class="card_table row1" id="together_list">
				
					<tbody class="together">
						<c:forEach items="${list}" var="tc">
							<!-- tr클래스 클릭시 상세보기 페이지로 이동-->
							<tr class="use_move" data-href="/together/detail/${tc.TO_IDX}.paw" onclick="move(this,'TO_IDX:${tc.TO_IDX}')">
								<td class="color"><span class="fa-solid fa-paw"></span>[${tc.TO_TC_NAME}] ${tc.TO_TITLE }  
									<c:if test="${tc.C eq tc.TO_PEOPLE}">
										<span class="btn submit">모집완료</span>
									</c:if>
									<c:if test="${tc.C < tc.TO_PEOPLE}">
										<span class="btn submit">모집중</span>
									</c:if>
								</td><!-- 글분류, 제목 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(견종): ${tc.BR_NAME }</td><!-- 참여가능견종 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(크기) : <c:if test="${tc.TO_WT_IDX eq '1'}">XS</c:if>
								<c:if test="${tc.TO_WT_IDX eq '2'}">S</c:if>
								<c:if test="${tc.TO_WT_IDX eq '3'}">M</c:if>
								<c:if test="${tc.TO_WT_IDX eq '4'}">L</c:if>
								<c:if test="${tc.TO_WT_IDX eq '5'}">XL</c:if>
									</td><!-- 참여가능사이즈 -->
								<td><span class="fa-solid fa-bone"></span> 언제개: <fmt:formatDate value="${tc.TO_DATE}" pattern="yyyy/MM/dd"/></td><!-- 모임날짜 -->
								<td><span class="fa-solid fa-bone"></span> 몇시개: ${tc.TO_TIME }</td><!-- 모임시간 -->
								<td><span class="fa-solid fa-bone"></span> 몇명이개: ${tc.C}/${tc.TO_PEOPLE}</td><!-- 참여인원/모임인원 -->
								<td class="txt_right" style="font-size:15px;"><fmt:formatDate value="${tc.TO_REG_DATE }" pattern="yyyy/MM/dd"/></td><!-- 등록날짜 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<%-- </c:when>
			
			<c:otherwise> --%>
				<table id="not_together">
					<tbody>
						<!-- <tr>
							<td class="empty paw_hover">게시글이 없습니다:(</td>
						</tr> -->
					</tbody>
				</table>
			<%-- </c:otherwise>
		</c:choose> --%>
		
	</div>
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
			<%-- <c:forEach items="${catelist}" var="ct"> --%>	
				<li class="tcname"></li>	
			<%-- </c:forEach> --%>	
		</ul>
	</div>
</div>
<br/>
			<ul id="paging">
			</ul>
			<!-- 23.02.02페이징처리 -->
			<div id="PAGE_NAVI_T" class="flexCenter"><input type="hidden" id="TC_NAME" name="TC_NAME" value="${TC_NAME}"></div>
			<input type="hidden" id="PAGE_INDEX_T" name="PAGE_INDEX_T" /> <br />
			<input type="hidden" name="TC_NAME" value="${TC_NAME}">
			<form id="commonForm" name="commonForm"></form>
			<div class="flexCenter">
				<a class="btn submit" style="font-size:15px;" href="/together/openList.paw">전체목록으로</a>
			</div>	
			
</main>
<script type="text/javascript">
	$(document).ready(function(){
		fn_selectBoardList2(1);//첫화면 보이기
			
		});

		function fn_selectBoardList2(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/together/catelist.paw'/>");
			comAjax.setCallback("fn_selectBoardListCallback2");
			
			comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX_T").val());
			comAjax.addParam("PAGE_ROW", 6);
			comAjax.addParam("TC_NAME", $("#TC_NAME").val());

			//comAjax.addParam("keyword", $('#keyword').val());
			//comAjax.addParam("searchType", $('#searchType').val());

			comAjax.ajax();
		}
		

		function fn_selectBoardListCallback2(data) {
			var total2 = data.TOTAL_T;
			
			var body = $("#not_together");
			var tbody = $(".together");
			tbody.empty();
			
			var cate = $(".tcname");
			cate.empty();
			
			//카테고리 세팅 로직
			if(data.catelist.length > 0){
				var str ="";
				$.each(data.catelist,
					function(key, value) {
						str += "<li class='tcname'>";
						str += "<input type='button' name='TC_NAME' class='use_move' data-href='/together/openCateList.paw' value="+value.TC_NAME+" onclick='move(this,\"TC_NAME:"+value.TC_NAME+"\")'>";
						str += "<input type='hidden' name='TC_NAME' id='TC_NAME' value="+value.TC_NAME+"/>";
						str += "</li>";
				});
				cate.append(str);
			}
			
			//함께해요 리스트 세팅 로직
			if (total2 == 0) {
				var str = "<tr>" + "<td class='empty paw_hover'>게시글이 없습니다:(</td>"
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
							str += "<tr class='use_move' name='togelist' data-href='/together/detail/"+value.TO_IDX +".paw' onclick='move(this,\"TO_IDX:"+value.TO_IDX+"\")'>";
							str += "<input type='hidden' name='TO_IDX' id='TO_IDX' value=" + value.TO_IDX + ">";
							str += "<td class='color'><span class='fa-solid fa-paw'></span>"+ "["+ value.TC_NAME + "]"  +value.TO_TITLE;
							if(value.C == value.TO_PEOPLE){
								str += "<span class='btn submit'>모집완료</span>";
							}
							if(value.C < value.TO_PEOPLE){
								str += "<span class='btn submit'>모집중</span>";
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
							str += "<td><span class='fa-solid fa-bone'></span>언제개 : " +value.TO_DATE + "</td>";
							str += "<td><span class='fa-solid fa-bone'></span>몇시개 : "  + value.TO_TIME + "</td>";
							str += "<td><span class='fa-solid fa-bone'></span>몇명이개 : "  + value.C + "/" + value.TO_PEOPLE + "</td>";
							//str += "<input type='hidden' id='TW_TO_IDX' name='TW_TO_IDX' value=" + value.TO_IDX + "/>" + "</td>"			
							str += "<td class='txt_right'>"  + value.TO_REG_DATE + "</td>";
							str +=	"</tr>";
						});

				tbody.append(str);
			}

		}
		
</script>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
