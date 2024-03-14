<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<!--
		멀티파트로 파일을 보내는 이유: 파일을 한꺼번에 느리게 보내기보다 쪼개서 빠르게 보내기 위해서
		spring jsp 상관없이 멀티파트로 보내는 것이 좋다.
	-->
	<!--
		1. 파일을 하나씩 불러서 업로드하는 방법 
		2. 여러 파일을 드래그하고 한꺼번에 올려서 업로드하는 방법
	 -->
	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
		파일:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="file1"/><br />
		파일:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="file2"/><br />
		파일:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="file3"/><br />
		<input type="submit" value="업로드" />
	</form><br />
	<a href="fileDownload.jsp">파일 다운로드 페이지</a>
</body>
</html>