<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="entity.*"%>
<jsp:useBean id="bookMgr" class="entity.BookMgr" scope="application" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>发布新书</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<p>书籍管理-&gt;书籍列表</p>
	<form name="addBookform" method="post" action="servlet/BookServlet">
		<input name="operation" type="hidden" id="operation" value="edit">
		<%
         String name = request.getParameter("name"); 
   		 Book book = bookMgr.getBook(name);
     %>
		<table width="95%" height="389" border="0">
			<tr>
				<td>&nbsp;</td>
				<td>书名： <label> <input name="name" type="text"
						id="bookname" value="<%=name%>" readonly="true">
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>书籍类型： <label> <select name="booktype">
							<option value="0"
								<% 
        if(book.getBooktype() == 0)
        	out.print("selected=\"true\"");
        %>>文学</option>
							<option value="1"
								<% 
        if(book.getBooktype() == 1)
        	out.print("selected=\"true\"");
        %>>艺术</option>
							<option value="2"
								<% 
        if(book.getBooktype() == 2)
        	out.print("selected=\"true\"");
        %>>信息技术</option>
					</select>
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>作者： <label> <input name="author" type="text"
						id="author" value="<%=book.getAuthor()%>">
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>出版社： <label> <input name="press" type="text"
						id="press" value="<%=book.getPress()%>">
				</label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>价格： <label> <input name="price" type="text"
						id="price" value="<%=book.getPrice()%>">
				</label></td>
				<td>&nbsp;</td>
			</tr>
				<tr>
				<td>&nbsp;</td>
				<td>数量： <label> <input name="amount" type="text"
						id="amount" value="<%=book.getAmount()%>">
				</label></td>
				<td>&nbsp;</td>
			</tr>
			
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><label> <input type="submit" name="Submit"
						value="提交">
				</label></td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
	<p>
		<br>
	</p>
</body>
</html>
