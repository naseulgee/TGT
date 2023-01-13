<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${page != 'admin'}">
	<!-- 어드민 제외한 모든 페이지의 헤더 -->
	<%@ include file="/WEB-INF/include/user-header.jspf" %>
</c:if>
<c:if test="${page == 'admin'}">
	<!-- 어드민 페이지의 헤더 -->
	<%@ include file="/WEB-INF/include/admin-header.jspf" %>
</c:if>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">

	<h1 class="txt_center">함께해요</h1>
	<!-- 카드 테이블로 게시글 리스트 출력 -->
	<c:choose>
		<c:when test="${!empty list}">
			<table class="card_table row1">
					<c:forEach items="${list}" var="to">
						<!-- tr클래스 클릭시 상세보기 페이지로 이동, value값만 정함, 이름값 아직 -->
						<tr class="use_move" data-href="/together/detail.paw" onclick="move(this,'TO_IDX:${to.TO_IDX}')">
							<td>${to.TO_TC_NAME}</td><!-- 글분류 -->
							<td>${to.TO_TITLE }</td><!-- 제목 -->
							<td>${to.TO_BR_NAME }</td><!-- 참여가능견종 -->
							<td>${to.TO_WT_IDX }</td><!-- 참여가능사이즈 -->
							<td>${to.TO_DATE }</td><!-- 모임날짜 -->
							<td>${to.TO_JOIN_PEOPLE }/${toli.TO_PEOPLE}</td><!-- 참여인원/모임인원 -->
							<td>${to.TO_REG_DATE }</td><!-- 등록날짜 -->
						</tr>
					</c:forEach>
			</table>
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
</main>

<c:if test="${page != 'admin'}">
	<!-- 풋터. 모든 페이지에 삽입! -->
	<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</c:if>