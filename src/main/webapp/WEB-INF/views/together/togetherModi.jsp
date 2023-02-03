<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<script src="/resources/js/together/togewrite.js"></script>
<style>
.fa-solid {
color:#f0b1aa;
}

.mypage{
top:100px;
}

.btn.submit{
margin-right:5px;
}

textarea{
width:100%;
height:100px;
white-space:pre;
}

</style>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>

<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>

	<div class="main_wrap">
		<form method="post" action="/together/modify.paw" name="writefrm">
		<input type="hidden" id="TO_IDX" name="TO_IDX" value="${map.TO_IDX }">
		<input type="hidden" id="TO_WRITER_ID" name="TO_WRITER_ID" value="${mem_id}">
			<table class="modi_table">
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td><input type="text" id="TO_TITLE" name="TO_TITLE" value="${map.TO_TITLE}"
							placeholder="입력해주개:)"></td>
					</tr>
					<tr>
						<th scope="row">게시글 분류</th>
						<td><select name="TO_TC_NAME" id="TO_TC_NAME">
								<c:forEach items="${catelist}" var="ct">
									<option value="${ct.TC_NAME}">${ct.TC_NAME}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">모집인원</th>
						<td><select name="TO_PEOPLE" id="TO_PEOPLE">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>		
						</select></td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td><textarea class="slim_scroll" id="TO_CONTENTS" name="TO_CONTENTS" placeholder="내용입력해주게:)">${map.TO_CONTENTS}</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">날짜</th>
						<td><input type="date" id="TO_DATE" name="TO_DATE" value="${map.TO_DATE}"/></td>
					</tr>
					<tr>
						<th scope="row">시간</th>
						<td><input type="time" id="TO_TIME" name="TO_TIME" value="${map.TO_TIME}"/></td>
					</tr>
					<tr>
						<th scope="row">장소</th>
						<td><input type="text" id="TO_LOC" name="TO_LOC" placeholder="입력해주개:)" value="${map.TO_LOC }"/></td>
					</tr>
					<tr>
						<th scope="row">참여가능견종</th>
						<td><select id="TO_BR_IDX" name="TO_BR_IDX">
								<c:forEach items="${brlist}" var="br">
									<option value="${br.BR_IDX}">${br.BR_NAME}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th scope="row">참여가능사이즈
						<pre class="info_help"> 참고하개!:) XS: 3kg 미만
S : 3 ~ 9kg 미만
M : 9 ~ 22kg 미만
L : 22 ~ 45kg 미만
XL : 45 ~ 90kg
											</pre></th><!-- css때문에 이렇게 씀ㅜ -->
						<td><select id="TO_WT_IDX" name="TO_WT_IDX">
								<option value="1" selected>XS</option>
								<option value="2">S</option>
								<option value="3">M</option>
								<option value="4">L</option>
								<option value="5">XL</option>	
						</select></td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div class="flexCenter">
				<input type="button" class="btn submit" value="수정하기" onclick="writeform_check();"/><!-- 유효성검사 -->
				<a class="btn" href="/together/openList.paw">목록으로</a>
			</div>
		</form>
	</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>