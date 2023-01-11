<%@page import="biz.vo.GhblViewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id = (String)session.getAttribute("id");

   if(id==null){
%>
   <script>
      alert('로그인을 해 주세요');
      location.href = "index.jsp?content=login.jsp";
   </script>
<%   
   }
   // 로그인이 되어 있으면 회원의 예약정보를 가져옴
   int no = Integer.parseInt(request.getParameter("no"));
   GhblRentDAO gdao = new GhblRentDAO();
   ArrayList<GhblViewVO> v = gdao.getAllReserve(id);
%>
                <h2>Ghibli Studio Movies Reserve Result Page</h2>
                <div class="reserve_title">
                    <ul>
                        <li>이미지</li>
                        <li>이름</li>
                        <li>대여일</li>
                        <li>대여기간</li>
                        <li>금액</li>
                        <li>수량</li>
                        <li>옵션1</li>
                        <li>옵션2</li>
                        <li>옵션3</li>
                        <li>옵션4</li>
                        <li>삭제</li>
                    </ul>
                </div>    
                <div class="reserve_result">
<%
   for(int i=0; i<v.size(); i++){
      GhblViewVO bean = v.get(i);
%>
                        <ul>
                            <li>
                                 <img src="images/<%=bean.getImg()%>" width="120" height="70">
                            </li>
                            <li><%=bean.getName()%></li>
                            <li><%=bean.getDday()%></li>
                            <li><%=bean.getRday()%></li>
                            <li><%=bean.getPrice()%></li>
                            <li><%=bean.getQty()%></li>
                            <li><%=bean.getUserin()%></li>
                            <li><%=bean.getUsewifi()%></li>
                            <li><%=bean.getUsenavi()%></li>
                            <li><%=bean.getUseseat()%></li>
                            <!-- 접속자 id와 대여일을 파라메터로 넘겨줌 = 같은 날짜에 예약이 되어 있으면 모두 다 지워짐 -->
                            <li>
<%--                                <button type="button" onclick="location.href='ReserveDel.jsp?id=<%=id%>&rday=<%=bean.getRday()%>'">삭제</button> --%>
                               <button type="button" onclick="alert('해당일자 모든 대여를 삭제하시겠습니까?');">
                                  <a href="ReserveDel.jsp?id=<%=id%>&rday=<%=bean.getRday()%>">삭제</a>
                               </button>
                            </li>
                        </ul>
<%
   }
%>
                    </div>