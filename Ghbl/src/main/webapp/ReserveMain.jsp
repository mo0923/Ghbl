<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<form action="ReserveMainProc.jsp" method="post">
			<table class="table">
	        	<tr>
	                <td>아이디</td>
	                <td>
	                <input type="text" name="id" required>
	            	</td>
	            </tr>
	            <tr>
		            <td>비밀번호</td>
		            <td>
		            <input type="password" name="password" required >
		            </td>
	            </tr>
	            <tr>
	            	<td>구분</td>
	                <td>
	                <select name="role" >
	                <option value="Admin">Admin</option>
	                <option value="User">User</option>
	                </select>      
	             	</td>
	            </tr>
	            <tr>
	            	<td colspan="2">
	                	<br><br><br><br>
	                    <input type="submit" value="회원가입" class="btn btn-primary">&nbsp;&nbsp;
	                    <input type="reset" value="취소" class="btn btn-secondary">        
	               </td>               
	        	</tr>
	    	</table>
		</form>
	</div>
</body>
</html>