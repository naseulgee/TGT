<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/common/img_pop_slide.css"/>
<script src="/resources/js/common/img_pop_slide.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main/main.css"/>

<!-- 이미지 슬라이드 -->
<section id="main_banner" class="img_slide">
	<div class="img_wrap">
		<img src="/resources/image/main/top_banner_1.jpg" alt="반려견 성향분석. 우리 강아지는 어떤 성향일까?">
		<img src="/resources/image/main/top_banner_2.jpg" alt="나만의 너랑">
	</div>
</section>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<section id="talk">
	<h1>오늘 올라온 NEW 컨텐츠</h1>
	<h2>#견주님들과 소통하러 가자</h2>
	<article class="free_wrap">
		<h3><strong>자유게시판 게시글</strong><a class="use_move go" href="/board/list.paw" onclick="move(this, 'BC_BCC_NAME:자유게시판')">바로가기 <i class="fa-solid fa-arrow-right"></i></a></h3>
		<c:if test="${empty free}"><div class="empty">자유게시판 글이 없습니다</div></c:if>
		<c:if test="${!empty free}">
			<ul>
				<c:forEach var="i" items="${free}">
					<li class="use_move" data-href="/board/detail/${i.BC_IDX}.paw" onclick="move(this, 'BC_IDX:${i.BC_IDX}')">
						<strong class="title">${i.BC_TITLE}</strong> | <span class="writer">${i.BC_WRITER_NAME}</span> | <span class="when">${fn:substring(i.BC_MOD_DATE,2,10)}</span>
					</li>
				</c:forEach>
			</ul>
		</c:if>
	</article>
	<article class="together_wrap">
		<h3><strong>함께해요 게시글</strong><a class="go" href="/together/openList.paw">바로가기 <i class="fa-solid fa-arrow-right"></i></a></h3>
		<c:if test="${empty together}"><div class="empty">함께해요 모집글이 없습니다</div></c:if>
		<c:if test="${!empty together}">
			<table class="card_table row${fn:length(together)}">
				<tbody>
					<c:forEach var="i" items="${together}">
						<tr class="use_move ${i.C eq i.TO_PEOPLE?'finish':''}" data-href="/together/detail/${i.TO_IDX}.paw" onclick="move(this, 'TO_IDX:${i.TO_IDX}')">
							<td class="icon flex">
								<span class="cate btn slim">${i.TO_TC_NAME}</span>
								<span class="breed btn slim">${i.BR_NAME}</span>
								<c:set var="size" value="${fn:split('XS,S,M,L,XL',',')}"/>
								<span class="size btn slim">${size[i.TO_WT_IDX-1]}</span>
							</td>
							<td class="title"><strong>${i.TO_TITLE}</strong></td>
							<td class="writer">${i.TO_WRITER_ID}</td>
							<td class="content">${i.TO_CONTENTS}</td>
							<td class="when">${i.TO_DATE} | ${i.TO_TIME}</td>
							<td class="people"><span class="now">${i.C}</span>/${i.TO_PEOPLE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</article>
</section>

<section id="min_banner">
	<a class="txt_center flexCenter" href="/place/list.paw">
		<h1>
			<small>강아지와 함께할 수 있는 우리동네 스팟을 모았다!</small><br>
			<span>지역별 <strong>웰컴멍멍이존</strong> 보러가기 <i class="fa-solid fa-arrow-pointer"></i></span>
		</h1>
	</a>
</section>

<section id="help">
	<h1>우리 강아지 어디 있니?</h1>
	<h2>#따뜻한 관심과 도움이 필요해요!</h2>
	<div class="help_wrap flex flexWrap">
		<article class="missing_wrap">
			<h3><strong>긴급 실종 게시글</strong><a class="use_move go" href="/board/list.paw" onclick="move(this, 'BC_BCC_NAME:긴급실종유기견')">바로가기 <i class="fa-solid fa-arrow-right"></i></a></h3>
			<c:if test="${empty missing}"><div class="empty">실종신고 글이 없습니다</div></c:if>
			<c:if test="${!empty missing}">
				<table class="card_table">
					<tbody>
						<c:forEach var="i" items="${missing}">
							<tr class="use_move" data-href="/board/detail/${i.BC_IDX}.paw" onclick="move(this, 'BC_IDX:${i.BC_IDX}')">
								<td class="title"><strong>${i.BC_TITLE}</strong></td>
								<td class="writer">${i.BC_WRITER_NAME}</td>
								<td class="when">${fn:substring(i.BC_MOD_DATE,2,10)}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</article>
		<article class="volunteer_wrap">
			<h3><strong>자원봉사 모집글</strong><a class="use_move go" href="/board/list.paw" onclick="move(this, 'BC_BCC_NAME:자원봉사구해요')">바로가기 <i class="fa-solid fa-arrow-right"></i></a></h3>
			<c:if test="${empty volunteer}"><div class="empty">자원봉사 모집글이 없습니다</div></c:if>
			<c:if test="${!empty volunteer}">
				<ul>
					<c:forEach var="i" items="${volunteer}">
						<li class="use_move" data-href="/board/detail/${i.BC_IDX}.paw" onclick="move(this, 'BC_IDX:${i.BC_IDX}')">
							<strong class="title">${i.BC_TITLE}</strong> | <span class="writer">${i.BC_WRITER_NAME}</span> | <span class="when">${fn:substring(i.BC_MOD_DATE,2,10)}</span>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</article>
	</div>
</section>

<section id="info">
	<h1>반려동물 지식</h1>
	<h2>#우리 강아지에 대해 자세히 알아보자</h2>
	<article class="info_wrap">
		<h3><strong>정보 게시글</strong><a class="use_move go" href="/board/list.paw" onclick="move(this, 'BC_BCC_NAME:정보게시판')">바로가기 <i class="fa-solid fa-arrow-right"></i></a></h3>
		<c:if test="${empty info}"><div class="empty">정보게시판 글이 없습니다</div></c:if>
		<c:if test="${!empty info}">
			<table class="card_table">
				<tbody>
					<c:forEach var="i" items="${info}">
						<tr class="use_move" data-href="/board/detail/${i.BC_IDX}.paw" onclick="move(this, 'BC_IDX:${i.BC_IDX}')">
							<td class="title"><strong>${i.BC_TITLE}</strong></td>
							<td class="writer">${i.BC_WRITER_NAME}</td>
							<td class="when">${fn:substring(i.BC_MOD_DATE,2,10)}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</article>
</section>

</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>