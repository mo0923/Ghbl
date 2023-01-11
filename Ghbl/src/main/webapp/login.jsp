<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String home = request.getContextPath();
%>
                <h2>로그인</h2>
               <!-- member테이블에 회원가입되어 있는거 아무거나 사용 | mo/1234 -->                
                <form action="MemberLoginProc.jsp" method="post" class="login">
                    <ul>
                        <li>
                            <label for="id">아이디 : </label>
                            <input type="text" name="id" id="id">
                        </li>
                        <li>
                            <label for="pass">비밀번호 : </label>
                            <input type="password" name="pass" id="pass">
                        </li>
                        <li>
                            <input type="submit" value="LOGIN" class="btn btn-primary">&nbsp;&nbsp;
                            <input type="reset" value="CANCEL" class="btn btn-primary">
                        </li>
                    </ul>
                </form>