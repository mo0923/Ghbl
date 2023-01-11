<%@page import="biz.vo.GhblListVO"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   int no = Integer.parseInt(request.getParameter("no"));
   int qty = Integer.parseInt(request.getParameter("qty"));
   
   String img = request.getParameter("img");

%>
   <h2>Ghibli Studio Movies Option</h2>
   <form action="index.jsp?content=ReserverResult.jsp" method="post">
      <div class="info">
         <ul>
            <li>
               <a href='#'>
                  <img src="./images/<%=img %>" alt="이미지" >
               </a>
            </li>
         </ul>
         <ul class="movie_info">
            <li>대여기간 : &nbsp;&nbsp;&nbsp;
               <select name="dday" class="form-control">
                  <option value="1">1일</option>
                  <option value="2">2일</option>
                  <option value="3">3일</option>
                  <option value="3">4일</option>
                  <option value="3">5일</option>
                  <option value="3">6일</option>
                  <option value="3">7일</option>
               </select>
            </li>
            <li>포스터 선택 : &nbsp;&nbsp;&nbsp;
               <select name="usein" class="form-control">
                  <option value="10000">적용(1만원)</option>
                  <option value="0">비적용</option>
               </select>
            </li>
            <li>블루레이 선택 : &nbsp;&nbsp;&nbsp;
               <select name="useblue" class="form-control">
                  <option value="10000">적용(1만원)</option>
                  <option value="0">비적용</option>
               </select>
            </li>
            <li>팝콘 선택 : &nbsp;&nbsp;&nbsp;
               <select name="usepop" class="form-control">
                  <option value="10000">적용(1만원)</option>
                  <option value="0">비적용</option>
               </select>
            </li>
            <li>콜라 선택 : &nbsp;&nbsp;&nbsp;
               <select name="usecola" class="form-control">
                  <option value="10000">적용(1만원)</option>
                  <option value="0">비적용</option>
               </select>
            </li>
            
         </ul>
      </div>
      <div>
         <input type="hidden" name="no" value="<%=no %>" >
         <input type="hidden" name="qty" value="<%=qty %>" >
         <input type="submit" value="영화대여" class="btn btn-success">
      </div>
   </form>