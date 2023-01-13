<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<head>
<title>회원가입</title>
<%@ include file="/WEB-INF/include/memberinclude-header.jspf" %>
</head>
<body>
    <div class="user_view wdp_30" >
        <div class="con_center under_line"><h5>회원 가입</h5></div>
        <form id="frm" class="padding_5" onSubmit="JavaScript:fn_joinMember()">
            <fieldset>
                <input type="text" class="input_text" name="MEM_ID" maxlength="15" id="MEM_ID" required>
 
                <input type="password" class="input_text" name="MEM_PW" maxlength="15" id="MEM_PW" required>
                
                <input type="text" class="input_text" name="MEM_CALL" maxlength="50" id="MEM_CALL" required>
                
                <input type="text" class="input_text" name="MEM_EMAIL" maxlength="50" id="MEM_EMAIL" required>
                
                <input type="text" class="input_text" name="MEM_ADDR" maxlength="50" value="" id="MEM_ADDR" required>
 
                <input type="hidden" id="MEM_TYPE" value="1">
 
                <input type="text" class="input_text" name="MEM_DOG_NAME" maxlength="15" placeholder="이름" value="" id="MEM_DOG_NAME" required>
 
                <input type="text" class="input_text" name="UNICK" maxlength="15" placeholder="닉네임" value="" id="unick" required>
 
            </fieldset>
             
 
            <c:if test="${! empty error}">
                ${error} 값이 중복된 값입니다.           
            </c:if>
            <button type="submit" class="btn con_center">회원 가입</button>
        </form>
    </div>
</body>
    <%@ include file="/WEB-INF/include/memberinclude-body.jspf" %>
    <script type="text/javascript">
         
        function fn_joinMember(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/sample/joinUser.do'/>");
            comSubmit.submit();
        }
         
    </script>
</html>