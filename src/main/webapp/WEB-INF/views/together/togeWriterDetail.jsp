<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<style>
span.fa-solid.fa-paw {
color:#f0b1aa;
}

span.fa-solid.fa-bone{
color:#f0b1aa;
}


.main_memdetail{
float:right;
padding-right:100px;
}

table#detail.card_table.row1{
width:800px;
font-size: 17px;
margin-right:auto;
margin-left:auto;
position:relative;
}

input[type="button"]{
padding-top: 5px;
padding-right: 10px;
padding-bottom: 5px;
padding-left: 10px;
font-size : 17px;
background-color:#f0b1aa;
color: #fff;
}

</style>
<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	
	<div class="main_memdetail">
	<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
		<table class="card_table row1" id="detail">
			<tbody class="bgSubColor">
				<tr class="memdetail">
					<td style="font-size:23px; color:#f0b1aa;"><span class="fa-solid fa-paw"></span>
						<strong>보호자 프로필 :)</strong>
						<span class="fa-solid fa-paw"></span>
					</td>
					<td style="font-size:20px; color:#f0b1aa;"><span class="fa-solid fa-bone"></span> 보호자 이름 :) 
						<strong>[${wtdetail.MEM_ID }]</strong><span class="fa-solid fa-bone"></span>
					</td>
					<td><span class="fa-solid fa-bone"></span> 가입날짜 :)  [${wtdetail.MEM_REG_DATE }]</td>
				</tr>
				<tr class="dogdetail">
					<td style="font-size:23px; color:#f0b1aa;"><span class="fa-solid fa-paw"></span>
						<strong>멍멍 프로필 :)</strong>
						<span class="fa-solid fa-paw"></span>
					</td>
					<td style="font-size:20px; color:#f0b1aa;"><span class="fa-solid fa-bone"></span> 강아지 이름이 뭐개? :) 
						<strong> [${wtdetail.MEM_DOG_NAME}]<span class="fa-solid fa-bone"></span></strong></td>
					<td><span class="fa-solid fa-bone"></span> 견종이 뭐개? :)  [${wtdetail.BR_NAME }]</td>
					<td><span class="fa-solid fa-bone"></span> 몸무게가 얼마개? :)  ${wtdetail.MEM_DOG_WEIGHT }Kg</td>
					<td><span class="fa-solid fa-bone"></span> 나는 이런 강아지개! :)  [${wtdetail.MEM_DOG_ETC}]</td>
				</tr>
				<tr class="dogphoto">
					<td></td>
				</tr>
			</tbody>
		</table>
		<br/>
		<br/>
		<div class="flexCenter">
		<input type="button" id="wtdetail" class="use_move" data-href="/together/detail/${wtdetail.TO_IDX}.paw" onclick="move(this,'TO_IDX:${wtdetail.TO_IDX}')"
		value="돌아가기:)">
		<input type="hidden" id="TO_IDX" name="TO_IDX" value="${wtdetail.TO_IDX}">
		</div>
	</div>
	
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>