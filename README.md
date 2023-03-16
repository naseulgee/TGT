# 🐾 ToGaeTher
> 23.01.03 ~ 02.28 / 투개더 / AWS클라우드 기반 자바개발 과정 제 2차 프로젝트  
> 팀 구성원: 나슬기, 박선영, 신현지, 이소영, 최선아, 최현주
<br/>

## 📖 주제: 반려인들이 공감대와 경험을 나눌 수 있는 커뮤니티 플랫폼
<div align="center">

<img alt="투개더 소개 이미지" src="https://user-images.githubusercontent.com/73747247/222654373-82a67ad3-b21f-4e04-8367-466ed59e2a40.jpg" width="100%"/>

</div>

### 프로젝트 목적
+ <우리동네 게시판>을 통해 반려동물 관련 시설과 리뷰를 자유롭게 등록하고 공유
+ <멍BTI>나 <멍멍왈왈 게시판> 등을 통해 반려동물에 대한 이해를 높이고 반려인들만의 공감대와 네트워크의 공간을 제공
+ 소켓을 이용한 알람, 채팅 구현 등 1차 프로젝트보다 더 다양한 API 사용
+ 협업중심 프로젝트에 대한 선행 체험

<br/>

## 🛠 사용언어 및 개발 환경
<div align="center">
<img alt="Java 11" src ="https://img.shields.io/badge/☕ Java 11-007396?&style=for-the-badge"/> <img alt="Jsp" src ="https://img.shields.io/badge/☕ Jsp-de6c18?&style=for-the-badge"/> <img alt="Html5" src ="https://img.shields.io/badge/HTML5-E34F26?&style=for-the-badge&logo=HTML5&logoColor=white"/> <img alt="Css3" src ="https://img.shields.io/badge/CSS3-1572B6?&style=for-the-badge&logo=CSS3&logoColor=white"/> <img alt="Javascript" src ="https://img.shields.io/badge/JavaScript ES6-F7DF1E?&style=for-the-badge&logo=JavaScript&logoColor=black"/> <img alt="jQuery" src ="https://img.shields.io/badge/jQuery 3-0769AD?&style=for-the-badge&logo=jQuery&logoColor=white"/>
<img alt="Oracle" src ="https://img.shields.io/badge/Oracle-F80000?&style=for-the-badge&logo=Oracle&logoColor=white"/>
<img alt="Apache Tomcat" src ="https://img.shields.io/badge/Apache Tomcat 11-F8DC75?&style=for-the-badge&logo=Apache Tomcat&logoColor=black"/>
<br/>
<img alt="Spring" src ="https://img.shields.io/badge/Spring 5-6DB33F?&style=for-the-badge&logo=Spring&logoColor=white"/> <img alt="Mybatis" src ="https://img.shields.io/badge/Mybatis-000000?&style=for-the-badge&logo=Twitter&logoColor=white"/> <img alt="Font Awesome 6" src ="https://img.shields.io/badge/Font Awesome 6-528DD7?&style=for-the-badge&logo=Font Awesome&logoColor=white"/> <img alt="Apache Maven" src ="https://img.shields.io/badge/Apache Maven-C71A36?&style=for-the-badge&logo=Apache Maven&logoColor=white"/>
</div>
<br/>

## 🗃 프로젝트 구조
### 유스케이스 다이어그램
<table>
<tr>
<th width="33.33%">비회원</th>
<th width="33.33%">회원</th>
<th width="33.33%">관리자</th>
</tr>
<tr>
<td><img alt="유스케이스 비회원 이미지" src="https://user-images.githubusercontent.com/73747247/222654855-efa62a57-d38a-4dd3-a783-6ccb0857c01c.png"/></td>
<td><img alt="유스케이스 회원 이미지" src="https://user-images.githubusercontent.com/73747247/222654858-8ab8f8e9-5ec8-41b4-a114-ea80fb2b3a57.png"/></td>
<td><img alt="유스케이스 관리자 이미지" src="https://user-images.githubusercontent.com/73747247/222654860-d3d17f26-162d-4ab2-bded-fd564b0e50bb.png"/></td>
</tr>
</table>

### ER 다이어그램
<img alt="ER 다이어그램 이미지1" src="https://user-images.githubusercontent.com/73747247/222654681-af276c60-af26-40a0-a6d0-b1e1a93b0ec6.png" width="100%"/>
<img alt="ER 다이어그램 이미지2" src="https://user-images.githubusercontent.com/73747247/222654687-d937ecb6-68fe-49d1-9ada-43bdc9f849a8.png" width="100%"/>

## 🖥 미리보기
<table>
    <tr>
        <th width="33.33%">메인 레이아웃</th>
        <th width="33.33%">관리자 레이아웃</th>
        <th width="33.33%">모바일 레이아웃</th>
    </tr>
    <tr>
        <td><img alt="메인 이미지" src="https://user-images.githubusercontent.com/73747247/225566126-8e972826-3019-4134-8ad2-c2010f6e7658.gif"/></td>
        <td><img alt="관리자 이미지" src="https://user-images.githubusercontent.com/73747247/225566130-e974b5ab-f7ec-421d-a0a9-4f2507692f29.gif"/></td>
        <td align="center" rowspan="3"><img alt="모바일 이미지" src="https://user-images.githubusercontent.com/73747247/225566122-727b50aa-ef04-4f4c-b811-82b09212f768.gif"/></td>
    </tr>
    <tr>
        <th width="33.33%">회원가입/로그인</th>
        <th width="33.33%">마이페이지</th>
    </tr>
    <tr>
        <td><img alt="회원가입/로그인 이미지" src="https://user-images.githubusercontent.com/73747247/225566147-3cde5779-3973-46b5-9d8f-627094ae952e.gif"/></td>
        <td><img alt="마이페이지 이미지" src="https://user-images.githubusercontent.com/73747247/225566153-3f8be0e6-ac81-4703-ad37-79b96e05b017.gif"/></td>
    </tr>
    <tr>
        <th width="33.33%">계정정보 찾기</th>
        <th width="33.33%">로그아웃 및 회원탈퇴</th>
        <th width="33.33%">회원정보 수정</th>
    </tr>
    <tr>
        <td><img alt="계정정보 찾기 이미지" src="https://user-images.githubusercontent.com/73747247/225566142-525329bc-2762-431e-a45c-40c13bb25696.gif"/></td>
        <td><img alt="로그아웃 및 회원탈퇴 이미지" src="https://user-images.githubusercontent.com/73747247/225566148-9c28b151-6977-483c-9203-c62623925689.gif"/></td>
        <td><img alt="회원정보 수정 이미지" src="https://user-images.githubusercontent.com/73747247/225566144-52e13e4f-db94-4f1e-a9dc-a31b69d1b948.gif"/></td>
    </tr>
    <tr>
        <th width="33.33%">함께해요</th>
        <th width="33.33%">참여하기 및 채팅</th>
        <th width="33.33%">멍BTI</th>
    </tr>
    <tr>
        <td><img alt="함께해요 이미지" src="https://user-images.githubusercontent.com/73747247/225566157-a8c08f1f-30e7-423c-b77a-0d8e2c3a2600.gif"/></td>
        <td><img alt="참여하기 및 채팅 이미지" src="https://user-images.githubusercontent.com/73747247/225566159-2dec19b0-ed5d-40a7-968d-7e851f0c036b.gif"/></td>
        <td><img alt="멍BTI 이미지" src="https://user-images.githubusercontent.com/73747247/225566171-28619a79-4c4f-4519-8544-dd586ed7171d.gif"/></td>
    </tr>
    <tr>
        <th width="33.33%">일반게시판</th>
        <th width="33.33%">시설 및 리뷰</th>
        <th width="33.33%">견종 및 회원정보 관리</th>
    </tr>
    <tr>
        <td><img alt="일반게시판 이미지" src="https://user-images.githubusercontent.com/73747247/225566162-3616518f-1409-4a10-8ccf-68e9ae4d61be.gif"/></td>
        <td><img alt="시설 및 리뷰 이미지" src="https://user-images.githubusercontent.com/73747247/225566181-0e8ee044-d028-4514-a571-fe8d1ef45c23.gif"/></td>
        <td><img alt="견종 및 회원정보 관리 이미지" src="https://user-images.githubusercontent.com/73747247/225566191-2584098e-6808-4b94-b42b-1c2ac3be9ead.gif"/></td>
    </tr>
    <tr>
        <th width="33.33%">일반게시판 관리</th>
        <th width="33.33%">시설관리</th>
        <th width="33.33%">리뷰 관리</th>
    </tr>
    <tr>
        <td><img alt="일반게시판 관리 이미지" src="https://user-images.githubusercontent.com/73747247/225566194-018ba9c9-06e5-4e47-b7c1-46c37b11ce55.gif"/></td>
        <td><img alt="시설관리 이미지" src="https://user-images.githubusercontent.com/73747247/225566196-5f0be6ae-aa24-43e0-92e0-d5dbc77053e8.gif"/></td>
        <td><img alt="리뷰 관리 이미지" src="https://user-images.githubusercontent.com/73747247/225566115-37a52931-84d2-4a32-83ae-be02e7eb758a.gif"/></td>
    </tr>
    <tr>
        <th width="33.33%">알람</th>
        <th width="33.33%"></th>
        <th width="33.33%"></th>
    </tr>
    <tr>
        <td><img alt="알람 이미지" src="https://user-images.githubusercontent.com/73747247/225567511-57bdc2d0-3c00-4eca-ac97-8d77917aea4c.gif"/></td>
        <td></td>
        <td></td>
    </tr>
</table>
