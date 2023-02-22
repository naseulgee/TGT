<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
 
<link href="resources/css/chat/chat.css" rel="stylesheet">

<main class="layoutCenter">
	<!-- 채팅방 입장 -->
    <div class="chat">
   		<div class = "chat_zone">
   			<div class="chat_body">
		        <h2 class="chat_title">1번방</h2>		
		        <!-- <button class="chat_back">◀</button> -->
		
		        <ul class="chat_list">
		            <li>
		            	<!-- <div class="notification">
		            		<span></span>
		            	</div> -->
		            </li>
		        </ul>
	
		        <div class="chat_input">
		            <div class="chat_input_area">
		                <textarea></textarea>
		            </div>
		            
		            <div class="chat_button_area">
		                <button class="btn submit">전송</button>
		            </div>
		        </div>
	        </div>
        
	        <div class="chat_users">
	        	<h2>
	        		참가인원
	        		<span class="user"></span>
	        	</h2>
	        	<div class="chat_nickname">
	        		<ul>
	        			<li>
	       				</li>
	        		</ul>
	        	</div>
	        	<br><input type="button" class="chat_exit btn submit" value="퇴장하기"/>
	        	<img alt="chat" src="resources/image/chat/popo.jpg" width="100%">
	        </div>	
   		</div>
   		<input type="hidden" id="mem_id" name="mem_id" value="{mem_id}">
    </div>
    <!-- 채팅방 입장 -->
</main>

    <!-- sock js -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
	<!-- STOMP -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="/resources/js/chat/chat.js"></script>