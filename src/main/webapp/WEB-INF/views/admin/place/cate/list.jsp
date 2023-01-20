<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/place/form.css"/>
<script src="/resources/js/place/ajax_edit.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main id="cate_list" class="layoutCenter">
	<section class="top_wrap flexBetween bgSubColor">
		<ul class="first_list flex flexWrap">
			<li>목록: </li>
			<c:forEach var="list" items="${first_map}">
				<li><a href="#${list.key}">${list.key}</a></li>
			</c:forEach>
		</ul>
		<div class="add flex">
			<button class="btn submit" type="button" onclick="cate_add(this);">분류 등록하기</button>
		</div>
	</section>
	<section class="table_wrap flex flexWrap">
		<c:forEach var="list" items="${first_map}">
			<article>
				<h3 id="${list.key}">${list.key}</h3>
				<table>
					<thead>
						<th class="idx">분류 번호</th>
						<th class="name">분류 이름</th>
						<th class="btn_wrap">수정/삭제</th>
					</thead>
					<tbody>
						<c:forEach var="i" items="${list.value}">
						<tr>
							<td class="idx">${i.PC_IDX}</td>
							<td class="name">${i.PC_NAME}</td>
							<td class="btn_wrap">
								<input class="btn" type="button" value="수정" onclick="cate_modi(this)">
								<input class="btn warn" type="button" value="삭제" onclick="cate_del(this)">
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</c:forEach>
	</section>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>