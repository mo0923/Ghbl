<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>로그인 아웃 처리 화면</title>
</head>
<body>
<%
   session.invalidate();
   response.sendRedirect("ReserveMain.jsp");
%>
</body>
</html>