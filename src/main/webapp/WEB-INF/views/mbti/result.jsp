<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 부트 스트랩보다 css가 더 우선적으로 작동할 수 있도록 css를 나중에 작성 -->
<%@ include file="/WEB-INF/include/user-header.jspf" %>

<link href="/resources/css/mbti/style.css" rel="stylesheet">

<main class="layoutCenter">
<div class="container2">

	<article class="result">
		<!-- <h2 id="mbti" class="text-center mt-5">MBTI</h2>
		<img id="mbtiImg" alt="mbtiImg" src="resources/image/mbti/ENFJ.jpg">
		<img id="explainImg" class="mt-3" alt="explainImg" src="resources/image/mbti/ENFJ0.JPG"> -->
		
		<h2 id="mbti" class="text-center">${mbti}</h2>
		<img id="mbtiImg" alt="mbtiImg" src="/resources/image/mbti/${mbti}.jpg">
		<img id="explainImg" class="mt-3" alt="explainImg" src="/resources/image/mbti/${mbti}0.JPG">
		
		<button id="mbtiButton" type="button" class="btn submit" onclick="location.replace('/mbti.paw')">테스트 다시 하기</button>
		<button id="mbtiButton" name="mbti_modify" type="button" class="btn submit" onclick="mbti_modify();">테스트 결과 저장</button><br>
		
		<!-- 공유 버튼 --> 
		<h3 class="text-center">* 공유하기 *</h3><br>
		<div class="addthis_inline_share_toolbox_j6rc share"></div><br><br>
	</article>
	
		<input type="hidden" id="mbti" value="${mbti}">
		
		
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

		<script src="/resources/js/mbti/mbti.js"></script>
		
		<script type="text/javascript">
			function mbti_modify() {
				var id = '<%= session.getAttribute("loginId") %>';
				
				if(id != null) {
					if (confirm("로그인 후 정보를 저장하시겠습니까?") == true) {
						location.replace("/login.paw");
					}
				} else {
					$(input[name=mbti_modify]).attr("action", "/mbti/modify.paw");
					$(input[name=mbti_modify]).submit;
					
				}
			}
		</script>
		
	<!-- Go to www.addthis.com/dashboard to customize your tools --> 
	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-63ba760d20bdd2c9"></script>
	
</div>
</main>