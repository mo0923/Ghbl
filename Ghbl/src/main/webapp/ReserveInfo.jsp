<%@page import="biz.vo.GhblListVO"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	GhblRentDAO gdao = new GhblRentDAO();
	GhblListVO bean = gdao.getOneMovie(no);
	
	
	String temp = "";
	int category = bean.getCategory();
	if(category ==1) temp = "소박";
	else if(category ==2) temp = "중박";
	else if(category ==3) temp = "대박";
	
	
%>
	<h2>Ghibli Studio Movie Info</h2>
	<form action="index.jsp?content=ReserverOptionSelect.jsp" method="post">
		<div class="info">
			<ul>
				<li>
					<a href="#">
						<img src="./images/<%=bean.getImg() %>" alt="<%=bean.getName() %>">
					</a>
				</li>
			</ul>
			<ul>
				<li>영화 이름 : <%=bean.getName() %></li>
				<li>영화 수량 : &nbsp;&nbsp;&nbsp;
					<select name="qty" class="form-control">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
				</li>
				<li>영화 분류 : <%=temp %></li>
				<li>영화 가격 : <%=bean.getPrice() %></li>
				<li>영화사 : <%=bean.getCompany() %> </li>
				<li>영화 정보 : <%=bean.getInfo() %></li>
			</ul>
		</div>
		<div>
			<input type="hidden" name="no" value="<%= bean.getNo()%>">
			<input type="hidden" name="img" value="<%= bean.getImg()%>">
			<input type="submit" name="옵션선택" class="btn btn-success">
		</div>
	</form>