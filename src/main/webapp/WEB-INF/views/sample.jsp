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
	<c:if test="${page == 'mypage'}">
		<!-- 마이페이지에 해당하는 페이지라면 nav 삽입과 -->
		<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>
		<!-- 컨텐츠 묶음용 div 삽입이 필요합니다. -->
		<div class="main_wrap">
	</c:if>
	<a class="btn" href="/sample.paw">일반 레이아웃 보기</a>
	<a class="btn" href="/sample/mypage.paw">마이페이지 레이아웃 보기</a>
	<a class="btn" href="/sample/admin.paw">어드민 레이아웃 보기</a>
	<hr>
	<!-- 컨텐츠 출력 -->
	<h1>h1 페이지의 제목 태그</h1>
	<h2>h2 중 제목 태그</h2>
	<h3>h3 소 제목 태그</h3>
	<hr>
	
	<h4>폰트 크기, 굵기, 정렬 클래스</h4>
	<p>
		<small>small 태그로 지정하는 작은 글씨</small>
		<span class="txt_small">txt_small 작은 글씨</span>
		<span class="txt_normal">txt_normal 중간 글씨</span>
		<span class="txt_big">txt_big 큰 글씨</span>
	</p>
	<p class="txt_left">txt_left 좌측 정렬</p>
	<p class="txt_center">txt_center 중앙 정렬</p>
	<p class="txt_right">txt_right 우측 정렬</p>
	<hr>
	
	<h4>부모 기준 자식 정렬 레이아웃 클래스</h4>
	<style>
		.pp{ width: 100%; height: 150px; background-color: var(--mainColor); }
		.pp *{ width: 100px; height: 120px; background-color: yellow; }
		.pp div:first-child{ background-color: red; height: 50px; }
		.pp div:last-child{ background-color: blue; height: 100px; }
	</style>
	<p>flex 왼쪽 상단 기준 나열</p>
	<!-- pp는 색깔 줄려고 넣은 클래스! 무시해도 됩니다~ -->
	<div class="pp flex">
		<div>자식태그1</div>
		<div>자식태그2</div>
		<div>자식태그3</div>
	</div>
	<p>flexBetween 세로 가운데, 가로 양쪽 맞춤 정렬</p>
	<div class="pp flexBetween">
		<div>자식태그1</div>
		<div>자식태그2</div>
		<div>자식태그3</div>
	</div>
	<p>flexCenter 가로 세로 가운데 정렬</p>
	<div class="pp flexCenter">
		<div>자식태그1</div>
		<div>자식태그2</div>
		<div>자식태그3</div>
	</div>
	<hr>
	
	<h4>색상 클래스</h4>
	<p>
		<span class="color">color 글씨 메인 색상</span>
		<span class="subColor">subColor 글씨 서브 색상</span>
	</p>
	<p>
		<span class="bgColor">bgColor 메인 배경 색상</span>
		<span class="bgSubColor">bgSubColor 서브 배경 색상</span>
	</p>
	<hr>
	
	<h4>도움말 클래스</h4>
	<p class="info_warn">info_warn 경고, 주의 문구</p>
	<p class="info_help">info_help 안내문구</p>
	<hr>
	
	<h4>버튼 클래스</h4>
	<p>(a, input[type=button], button 태그에 사용 권장)</p>
	<a class="btn" href="#">btn</a>
	<a class="btn disable" href="#">btn disable</a>
	<a class="btn submit" href="#">btn submit</a>
	<a class="btn warn" href="#">btn warn</a>
	<a class="btn slim" href="#">btn slim</a>
	<p>btn fa 아이콘 형식의 버튼 클래스</p>
	<a class="btn fa" href="#"><i class="fa-solid fa-xmark"></i></a>
	<a class="btn fa" href="#"><i class="fa-regular fa-heart"></i></a>
	<hr>
	
	<h4>체크박스</h4> <input type="checkbox" name="check_test" value="a" checked><input type="checkbox" name="check_test" value="b"><input type="checkbox" name="check_test" value="c">
	<hr>
	
	<h4>라디오 버튼 클래스</h4>
	기본 라디오:
		<input type="radio" name="test" value="a" checked>
		<input type="radio" name="test" value="b"><br>
	switch_radio 스위치 라디오:
		on
		<fieldset class="switch_radio">
			<input type="radio" name="switch" value="on" checked>
			<input type="radio" name="switch" value="off">
		</fieldset>
		 off<br>
	tab_radio 탭 라디오: 꼭 input 태그 다음으로 label 태그를 쌍으로 작성할 것!
		<fieldset class="tab_radio">
			<input type="radio" id="tab_a" name="tab" value="a" checked>
			<label for="tab_a">탭 A</label>
			<input type="radio" id="tab_b" name="tab" value="b">
			<label for="tab_b">탭 B</label>
		</fieldset><br>
	<hr>
	
	<h4>테이블 클래스</h4>
	<p>기본 테이블</p>
	<table>
		<thead><!-- 테이블 테그의 제목 -->
			<tr>
				<th>제목 열1</th><!-- th태그 사용 -->
				<th>제목 열2</th>
				<th>제목 열3</th>
				<th>제목 열4</th>
			</tr>
		</thead>
		<tbody><!-- 테이블 태그의 내용 -->
			<c:forEach var="i" begin="0" end="4">
			<tr>
				<th>서브제목${i}</th><!-- td태그 사용 -->
				<td>내용${i}</td>
				<td>내용${i}</td>
				<td>내용이 길 때, Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni.</td>
			</tr>
			</c:forEach>
		</tbody>
	</table><br>
	<p>toggle_ellip 말줄임을 여닫고 싶다면(td태그에 클래스로 각각 지정)</p>
	<table>
		<thead><!-- 테이블 테그의 제목 -->
			<tr>
				<th>제목 열1</th><!-- th태그 사용 -->
				<th>제목 열2</th>
				<th>제목 열3</th>
				<th>제목 열4</th>
			</tr>
		</thead>
		<tbody><!-- 테이블 태그의 내용 -->
			<tr>
				<th>서브제목</th><!-- td태그 사용 -->
				<td class="toggle_ellip">toggle_ellip 말줄임을 여닫고 싶다면, Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni.</td>
				<td>일반 내용, Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni.</td>
				<td class="toggle_ellip">toggle_ellip 말줄임을 여닫고 싶다면, Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni.</td>
			</tr>
		</tbody>
	</table><br>
	<p>card_table 카드형 테이블</p>
	<p>card_table 클래스와 함께 row1 또는 row2 클래스를 주어 정렬하는 단 수를 바꿀 수 있습니다!</p>
	<input class="btn" type="button" value="기본" onclick="$('.card_table').removeClass().addClass('card_table');">
	<input class="btn" type="button" value="row2" onclick="$('.card_table').removeClass().addClass('card_table').addClass('row2');">
	<input class="btn" type="button" value="row1" onclick="$('.card_table').removeClass().addClass('card_table').addClass('row1');">
	<table class="card_table">
		<thead><!-- 테이블 테그의 제목 -->
			<tr>
				<th>제목 열1</th><!-- th태그 사용 -->
				<th>제목 열2</th>
				<th>제목 열3</th>
				<th>제목 열4</th>
			</tr>
		</thead>
		<tbody><!-- 테이블 태그의 내용 -->
			<c:forEach var="i" begin="0" end="4">
			<tr>
				<td>내용${i}</td><!-- td태그 사용 -->
				<td>내용${i}</td>
				<td>내용${i}</td>
				<td>내용이 길 때, Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni.</td>
			</tr>
			</c:forEach>
		</tbody>
	</table><br>
	<p>empty 결과가 없을 때</p>
	<p>paw_hover 마우스 호버 시 발바닥을 보여주고 싶을 때</p>
	<table>
		<tr><td class="empty paw_hover">일치하는 결과가 없습니다.</td></tr>
	</table>
	<hr>
	
	<h4>paging 페이징</h4>
	<p>부모태그에 paging + 자식 태그에 first, before, next, end, select 클래스<br>자식 태그의 내부 내용은 숫자만 넣기<br>HTML 구조를 꼭 참고해주기!</p>
	<ul class="paging">
		<li class="first">1</li>
		<li class="before">10</li>
		<li>11</li>
		<li>12</li>
		<li class="select">13</li>
		<li>14</li>
		<li>15</li>
		<li>16</li>
		<li>17</li>
		<li>18</li>
		<li>19</li>
		<li>20</li>
		<li class="next">21</li>
		<li class="end">33</li>
	</ul>
	<hr>
	
	<h4>use_move 이동하면서 데이터를 넘겨주고 싶을 때</h4>
	<a class="use_move" href="/sample.paw" onclick="move(this, 'test:value_a', 'test:value_b')">하하 링크입니다</a>
	<hr>
	
	<h4>slim_scroll 스크롤을 예쁘게 만들고 싶을 때</h4>
	<div class="slim_scroll" style="width:200px; height: 250px; overflow:auto;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure suscipit aperiam asperiores facilis cumque pariatur atque quasi distinctio accusamus officia ad, vel inventore commodi et eaque soluta. Laboriosam, maxime magni.</div>
	<!-- //컨텐츠 종료 -->
	<c:if test="${page == 'mypage'}">
		<!-- 마이페이지에 해당하는 페이지라면 nav와 컨텐츠 묶음용 div 삽입이 필요합니다. -->
		</div>
	</c:if>
</main><!-- //main 종료 -->

<c:if test="${page != 'admin'}">
	<!-- 풋터. 모든 페이지에 삽입! -->
	<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</c:if>