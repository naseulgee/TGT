<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<style>
.layoutCenter{
width:100%;
}
.fa-solid {
color:#f0b1aa;
}

.color {
font-size:20px;
font-weight:bold;
}

table{
width:100%;
display:flex;
}

.main_wrap{
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

input[type="button"]{
border:1px solid #9ea7ad;
padding-top: 5px;
padding-right: 10px;
padding-bottom: 5px;
padding-left: 10px
}
</style>
<main class="layoutCenter">

	<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
<div class="main_wrap">
	
	<!-- 카드 테이블로 전체게시글 리스트 출력 -->
	<div class="main_list">
		<c:choose>
			<c:when test="${!empty catelist}">
				<table class="card_table row1">
					<tbody class="bgSubColor">
						<c:forEach items="${catelist}" var="tc">
							<!-- tr클래스 클릭시 상세보기 페이지로 이동-->
							<tr class="use_move" data-href="/together/detail/${tc.TO_IDX}.paw" onclick="move(this,'TO_IDX:${tc.TO_IDX}')">
								<td class="color"><span class="fa-solid fa-paw"></span>[${tc.TO_TC_NAME}] ${tc.TO_TITLE }</td><!-- 글분류, 제목 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(견종): ${tc.TO_BR_NAME }</td><!-- 참여가능견종 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(크기) : <c:if test="${tc.TO_WT_IDX eq '1'}">XS</c:if>
								<c:if test="${tc.TO_WT_IDX eq '2'}">S</c:if>
								<c:if test="${tc.TO_WT_IDX eq '3'}">M</c:if>
								<c:if test="${tc.TO_WT_IDX eq '4'}">L</c:if>
								<c:if test="${tc.TO_WT_IDX eq '5'}">XL</c:if>
									</td><!-- 참여가능사이즈 -->
								<td><span class="fa-solid fa-bone"></span> 언제개: ${tc.TO_DATE }</td><!-- 모임날짜 -->
								<td><span class="fa-solid fa-bone"></span> 몇시개: ${tc.TO_TIME }</td><!-- 모임시간 -->
								<td><span class="fa-solid fa-bone"></span> 몇명이개: ${tc.TO_JOIN_PEOPLE }/${tc.TO_PEOPLE}</td><!-- 참여인원/모임인원 -->
								<td class="txt_right" style="font-size:15px;">${tc.TO_REG_DATE }</td><!-- 등록날짜 -->
							</tr>
						</c:forEach>
					</tbody>
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
	</div>
<br/>
	
	<!-- 카테고리별 게시글 리스트 출력, 글쓰기 버튼 -->
	<div class="cate_button">
		<ul class="button_list">
			<li><a class="btn submit" href="/together/writeForm.paw">글쓰기</a></li>
				<li>
				<input type="button" name="category" data-href="/together/catelist.paw" value="산책하개" class="use_move" 
					onclick="move(this, 'TC_NAME:산책하개')"></li>
				<li><input type="button" name="category" data-href="/together/catelist.paw" value="카페가개" class="use_move" 
					onclick="move(this, 'TC_NAME:카페가개')"></li>
				<li><input type="button" name="category" data-href="/together/catelist.paw" value="놀러가게" class="use_move" 
					onclick="move(this, 'TC_NAME:놀러가개')"></li>
				<li><input type="button" name="category" data-href="/together/catelist.paw" value="친구하개" class="use_move" 
					onclick="move(this, 'TC_NAME:친구하개')"></li>
		
		</ul>
	</div>
</div>	
</main>

<c:if test="${page != 'admin'}">
	<!-- 풋터. 모든 페이지에 삽입! -->
	<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</c:if>