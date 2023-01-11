<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<jsp:useBean id="bean" class="biz.vo.GhblViewVO">
		<jsp:setProperty name="bean" property="*"/>
	</jsp:useBean>
<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pass = request.getParameter("password");
   // 아이디와 패스워드 일치하는지 비교
   GhblRentDAO gdao = new GhblRentDAO();
   gdao.insertMember(bean);

 /*   if(result==0){ // 회원이 없다면  */
%>
	<script>
        alert("회원가입 완료");
        location.href="./index.jsp"
	</script>
<%--       <script>
         alert("로그인을 해주세요");
         location.href="index.jsp?content=login.jsp";
      </script>
<%
   }else {
      // 로그인 처리가 잘 되었으면 세션에 저장
      session.setAttribute("id", id); // 키명, 밸류값(위의 id값)
      response.sendRedirect("index.jsp?content=ReserveMain.jsp");
   }
%> --%>
</body>
</html>