<%@page import="java.io.PrintWriter"%>
<%@page import="biz.vo.GhblListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 한글처리
   request.setCharacterEncoding("utf-8");
   // 검색조건 = 제목, 내용
   String searchField = (String)request.getParameter("searchCondition");
   // 검색어 문자열
   String searchText = (String)request.getParameter("searchWord");
   // dao 생성
   GhblRentDAO gdao = new GhblRentDAO();
   // 검색 메서드
   ArrayList<GhblListVO> list = gdao.getSearchMovie(searchField, searchText);
 	
if(list.size() == 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('검색결과가 없습니다.')");
	script.println("history.go(-1)");
	script.println("</script>");
	
   }
%>

   <h2>Ghibli Studio Search Movies</h2>
   <div class="list">
      <ul>
<%
   for(int i=0; i<list.size(); i++){
      GhblListVO bean = list.get(i);
%>
         <li>
            <a href="index.jsp?content=ReserveInfo.jsp?no=<%=bean.getNo()%>">
               <img src="./images/<%=bean.getImg() %>" alt="<%=bean.getName() %>">
            </a>
            <p>영화명 : <%=bean.getName() %></p>
         </li>
<%
   }
%>
      </ul>
   </div>