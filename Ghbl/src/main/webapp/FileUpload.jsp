<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cos.jar 멀티파티업로드</title>
</head>
<body>
	<h2>파일 업로드</h2>
	<form action="FileUploadProc.jsp" method="post" enctype="multipart/form-data"> <!-- 멀티파티데이터로 서버에 테이터 전송 -->
		<table width="350" border="1">
			<tr>
				<td width="150">이름</td>
				<td width="150">
					<input type="text" name="name" >
				</td>
			</tr>
			<tr>
				<td width="150">파일 선택</td>
				<td width="150">
					<input type="file" name="fieldata" >
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" name="파일업로드" >
				</td>
			</tr>
		</table>
	</form>
</body>
</html>