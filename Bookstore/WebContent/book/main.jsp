<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="entity.*"%>
<jsp:useBean id="BookMgr" class="entity.BookMgr" scope="application"/>
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
  <p>书籍管理-&gt;书籍列表
    <br>
  </p>
  <form name="searchForm" method="post" action="../book/searchBook.jsp">

  	 请选择搜索条件： <select name="searchType">
  	    <option value="0">书名</option>
  	    <option value="1">书籍类型</option>
    </select>
   	<label>
  	请输入搜索内容：<input type="text" name="searchInput">
  	</label>
	<label>
	   
	   <input type="submit" name="Submit" value="提交">
	</label>
	

<p></p>
  
  书市库存：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <input type="button" align="right" value="添加新书" onClick="location.href='..book/addBook.jsp'">
  <table width="95%" height="125" border="1">
    <tr>
      <th width="15%" height="46" bgcolor="#FF8B53" scope="col">书籍编号</th>
       <th width="15%" height="46" bgcolor="#FF8B53" scope="col">书籍分类</th>
        <th width="15%" height="46" bgcolor="#FF8B53" scope="col">书名</th>
        <th width="15%" height="46" bgcolor="#FF8B53" scope="col">作者</th>
        <th width="15%" height="46" bgcolor="#FF8B53" scope="col">出版社</th>
        <th width="15%" height="46" bgcolor="#FF8B53" scope="col">价格</th>
      <th  width="15%" bgcolor="#FF8B53" scope="col">数量</th>
      <th  width="15%" bgcolor="#FF8B53" scope="col">编辑</th>
      <th  width="15%" bgcolor="#FF8B53" scope="col">删除</th>
    </tr>
   <%
	java.util.HashMap<String,Book> bookmap = new java.util.HashMap<String,Book>();
    bookmap = BookMgr.getBookList();
	java.util.Iterator iterator = bookmap.keySet().iterator();

   while(iterator.hasNext()){
		Book book = (Book)bookmap.get(iterator.next());
		//int bookType = book.getBooktype();
		//String booktypeName = "";
		/*	
		switch(bookType){
		case 0:
			booktypeName = "文学";
			break;
		case 1:
			booktypeName = "艺术";
			break;
		case 2:
			booktypeName = "信息技术";
			break;
		}*/
%>

  
  <tr>
    <td align="center"><%=book.getId()%></td>
    <td align="center"><%=book.getBooktype()%></td>
    <td align="center"><%=book.getName()%></td>
    <td align="center"><%=book.getAuthor()%></td>
     <td align="center"><%=book.getPress()%></td>
     <td align="center"><%=book.getPrice()%></td>
     <td align="center"><%=book.getAmount()%></td>
    <td align="center">
     <input type="button" align="right" value="编辑" onClick="location.href='../book/editBook.jsp?name=<%=book.getName()%>'">
     </td>  
    <td align="center">
    <a href="servlet/BookServlet?operation=del&name=<%=book.getName()%>&booktype=<%=book.getBooktype()%>" onclick='return window.confirm("该用户将被删除，\n您确实要删除用户吗？")'>删除</a>
    </td>
   
  </tr>
<%
  	}
  %>
  </table>
</form>
  </body>
</html>