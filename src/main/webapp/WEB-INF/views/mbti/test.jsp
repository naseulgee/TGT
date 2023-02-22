<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>

<%@ include file="/WEB-INF/include/user-header.jspf" %>
<!-- 부트 스트랩보다 css가 더 우선적으로 작동할 수 있도록 css를 나중에 작성 -->

<link href="resources/css/mbti/style.css" rel="stylesheet">

<!--   
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
-->
<main class="layoutCenter mbtiMain">
	<div class="container">

	<article class="start">
		<h1 class="mt-5 text-center" style="color: white;">내 강아지의 MBTI는?</h1>
		<img alt="mbtiMain" src="resources/image/mbti/mbtiMain.jpg" width="100%">
		<button id="mbtiButton" type="button" class="btn submit" onclick="start();">테스트 시작하기</button>
		
		<!-- 공유 버튼 -->
		<h4 class="text-center mt-5" style="color: white;">* 공유하기 *</h4><br>
		<div class="addthis_inline_share_toolbox_j6rc share"></div><br><br><br>
	</article> 
	
	<article class="question">
		<div class="progress mt-5" role="progressbar" aria-label="Animated striped example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
			<div class="progress-bar progress-bar-striped progress-bar-animated" style="width: calc(100/12*0%);"></div>
		</div>
		
		<h4 id="title" class="text-center mt-5">문제</h4>
			<input type="hidden" id="type" value="EI">
		
		<button id="A" type="button" class="btn mt-5">A</button>
		<button id="B" type="button" class="btn mt-5">B</button>
		
		<img alt="bgImg" src="resources/image/mbti/bgImg.png" style="width: 400px; margin-top: 45px;">
	</article>
	
		<input type="hidden" id="EI" value="0">
		<input type="hidden" id="NS" value="0">
		<input type="hidden" id="TF" value="0">
		<input type="hidden" id="JP" value="0">
	</div>
</main>	
	<!-- 제이쿼리를 이용해 동적으로 움직이는 코드를 위한 js -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="/resources/js/mbti/mbti.js"></script>

	<!-- Go to www.addthis.com/dashboard to customize your tools --> 
	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-63ba760d20bdd2c9"></script>
	
	<%@ include file="/WEB-INF/include/common-footer.jspf" %>
