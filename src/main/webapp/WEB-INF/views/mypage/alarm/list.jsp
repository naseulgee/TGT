<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/alarm/list.css"/>
<script src="/resources/js/alarm/alarm.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<!-- 마이페이지에 해당하는 페이지라면 nav 삽입과 -->
	<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>
	<!-- 컨텐츠 묶음용 div 삽입이 필요합니다. -->
	<div class="main_wrap">
		<h1>나의 알람</h1>
		<table class="alarm_list">
			<c:if test="${empty list}"><tr><td class="empty">새로운 알람이 없습니다.</td></tr></c:if>
			<c:forEach var="i" items="${list}">
				<tr class="${i.AL_CHECK eq 'N'?'':'check'}">
					<td class="flex">
						<a class="use_move" href="${i.AL_LINK}" onclick="al_check(this, '${i.AL_IDX}')">
							${i.AL_CONTENTS}
							<span class="date">${fn:substring(i.AL_REG_DATE,0,16)}</span>
						</a>
						<a class="al_del use_move" href="/mypage/alarm/delete" onclick="al_del(this, '${i.AL_IDX}')">
							<i class="fa-solid fa-xmark"></i>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>