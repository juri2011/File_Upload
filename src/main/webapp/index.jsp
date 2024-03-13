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
	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
		파일:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="file"/>
		<input type="submit" value="업로드" />
	</form>
</body>
</html>