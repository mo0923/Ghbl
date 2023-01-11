<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 화면</title>
</head>
<body>
<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   // 아이디와 패스워드 일치하는지 비교
   GhblRentDAO gdao = new GhblRentDAO();
   
   // 해당 회원이 있는지 여부를 숫자로 표현
   int result = gdao.getMember(id, pass);
   
   if(result==0){ // 회원이 없다면 
%>
      <script>
         alert("로그인을 해주세요");
         location.href="index.jsp?content=login.jsp";
      </script>
<%
   }else {
      // 로그인 처리가 잘 되었으면 세션에 저장
      session.setAttribute("id", id); // 키명, 밸류값(위의 id값)
      response.sendRedirect("index.jsp?content=ReserveMain.jsp");
   }
%>
   

</body>
</html>