<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户</title>
    
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
  <p>系统管理-&gt;用户管理-&gt;添加用户  </p>
   <form name="addUserform" method="post" action="servlet/UserServlet">
    <input name="operation" type="hidden" id="operation" value="add">
     <table width="95%" height="389" border="0">
       <tr>
         <td>&nbsp;</td>
         <td>用 户 名：
           <label>
           <input name="username" type="text" id="username">
         </label></td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td>用户类型：
           <label>
           <select name="userType" id="userType">
             <option  value="2">管理员</option>
             <option  value="1">高级会员</option>
             <option  value="0">普通用户</option>
           </select>
         </label></td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td>真实姓名：
           <label>
           <input name="realname" type="text" id="realname">
         </label></td>
         <td>&nbsp;</td>
         <td>E-mail：
           <label>
           <input name="email" type="text" id="email">
         </label></td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td>性 别：
           <label>
           <select name="sex" id="sex">
             <option  value="1">男</option>
             <option  value="0">女</option>
           </select> 
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
         <td><label>
           <input type="submit" name="Submit" value="提交">
         </label></td>
         <td>&nbsp;</td>
       </tr>
     </table>
  </form>
   <p><br>
    </p>
  </body>
</html>
