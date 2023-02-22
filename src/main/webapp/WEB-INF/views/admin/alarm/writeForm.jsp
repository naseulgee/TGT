<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="/resources/js/paging/searchPaging_B.js"></script>
<script src="/resources/js/alarm/admin_alarm_selectMem.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<h1>알람 등록</h1>
<form id="alarmWrite" method="post">
	<table>
		<tr>
			<th class="req">타겟</th>
			<td id="select_members"></td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="members_list"></div>
				<ul id="paging"></ul>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			</td>
		</tr>
		<tr>
			<th class="req">발송 내용</th>
			<td><input type="text" name="al_contents" value="" required></td>
		</tr>
		<tr>
			<th>연결 링크</th>
			<td><input type="text" name="al_link" value=""></td>
		</tr>
	</table>
	<input class="btn submit" type="submit" value="발송하기">
</form>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>