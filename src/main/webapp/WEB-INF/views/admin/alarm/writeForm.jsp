<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/alarm/write.css"/>
<script src="/resources/js/alarm/admin_alarm_selectMem.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<h1>알람 등록</h1>
<form id="alarmWrite" method="post">
	<table>
		<tr>
			<th class="req">타겟</th>
			<td id="select_members">
				<div class="search flexCenter flexWrap">
					<input type="text" id="subKeyword" name="subKeyword" placeholder="회원 또는 강아지 이름을 검색해 주세요">
					<label class="btn"><input type="checkbox" onclick="check_toggle(this)">전체 선택</label>
				</div>
				<div id="members_list" class="flexCenter flexWrap"></div>
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