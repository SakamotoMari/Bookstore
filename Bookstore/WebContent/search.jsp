<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Test</title>
</head>
<body>

<form action="servlet/SearchAction" method="post">
<table>
<tr>
<td>查询条件：<input type="text" name="searchName"/>
<input type="submit" value="search"/>
</td>
</tr>
</table>
</form>
</body>
</html>