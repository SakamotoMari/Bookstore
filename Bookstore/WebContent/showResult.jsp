<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@page import="servlet.*" %>
     <%@page import="entity.*" %>
     <%@page import="java.util.*" %>
     
 <%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>show Result</title>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.useso.com/css?family=Maven+Pro:400,900,700,500' rel='stylesheet' type='text/css'>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--- start-mmmenu-script---->
<script src="<%=basePath%>js/jquery.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/jquery.mmenu.all.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.mmenu.js"></script>
    <script type="text/javascript">
      //  The menu on the left
      $(function() {
        $('nav#menu-left').mmenu();
      });
    </script>
<!-- start top_js_button -->
<script type="text/javascript" src="<%=basePath%>js/easing.js"></script>
<script type="text/javascript" src="<%=basePath%>js/move-top.js"></script>
   <script type="text/javascript">
    jQuery(document).ready(function($) {
      $(".scroll").click(function(event){   
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
      });
    });
  </script>
<title>搜索结果</title>
</head>
<body style="font-family: PMingLiU">

<!-- start header -->
<div class="top_bg">
<div class="wrap">
  <div class="header">
    <div class="logo">
      <a href="<%=basePath%>index.jsp"><img src="<%=basePath%>images/logo.png" alt=""/></a>
    </div>
     <div class="log_reg">
        <ul>
          <li><a href="login.jsp">登录</a> </li>
          <span class="log"> or </span>
          <li><a href="register.html">注册</a> </li>                   
          <div class="clear"></div>
        </ul>
    </div>  
    <div class="web_search">
      <form action="<%=basePath%>servlet/SearchAction" method="post">
        <input type="text" value="" name="searchName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
        <input type="submit" value=" " />
      </form>
      </div>            
    <div class="clear"></div>
  </div>  
</div>
</div>
<!-- start header_btm -->
<div class="wrap">
<div class="header_btm">
    <div class="menu">
      <ul>
        <li><a href="<%=basePath%>index.jsp">主页</a></li>
        <li><a href="<%=basePath%>BookList.jsp">书市</a></li>
        <li><a href="<%=basePath%>contact.html">Contact</a></li>
        <div class="clear"></div>
      </ul>
    </div>
    <div id="smart_nav">
      <a class="navicon" href="#menu-left"> </a>
    </div>
    <nav id="menu-left">
      <ul>
          <li><a href="<%=basePath%>index.jsp">主页</a></li>
        <li><a href="<%=basePath%>BookList.jsp">书市</a></li>
        <li><a href="<%=basePath%>contact.html">Contact</a></li>
        <div class="clear"></div>
      </ul>
    </nav>
  <div class="header_right">
    <ul>
      <li><a href="#"><i  class="art"></i><span class="color1">0</span></a></li>
      <li><a href="/Bookstore/Cart.jsp"><i  class="cart"></i><span><%=session.getAttribute("cartNum") %></span></a></li>
    </ul>
  </div>
  <div class="clear"></div>
</div>
</div>
<!-- start top_bg -->
<div class="top_bg">
<div class="wrap">
<div class="main_top">
  <h4 class="style">Show Search Results</h4>
</div>
</div>
</div>
<!-- start main -->
 <div class="main_bg"> 
 <div class="wrap">
  <div class="main">
  <div class="top_main">
    <h2>搜索结果</h2>
    <div class="clear"></div>
  </div>


<% 
   ArrayList list=(ArrayList)request.getAttribute("searchlist");
   Book  book=new Book();
%>
<form action="solr.SearchAction">
<table width="100%" height="125" border="1">
  <tr>
    <th width="20%" height="50" bgcolor="#cccccc" scope="col">id</th>
    <th width="20%" height="50" bgcolor="#cccccc" scope="col">bookname</th>
    <th width="20%" height="50" bgcolor="#cccccc" scope="col">author</th>
    <th width="20%" height="50" bgcolor="#cccccc" scope="col">press</th>
    <th width="20%" height="50" bgcolor="#cccccc" scope="col">price</th>
    <th width="20%" height="50" bgcolor="#cccccc" scope="col">amount</th>
  
  </tr>
 <%for(int i=0;i<list.size();i++){
	  book=(Book)list.get(i);
	  
	 %>

  <tr>
  <td align="center">
    <%=book.getId() %>
  </td>
  <td align="center">
    <a href="/Bookstore/details.jsp?action=show&id=<%=book.getId() %>" style="border:0">
   <%=book.getName() %>
     </a>
  </td >
  <td align="center">
   <%=book.getAuthor() %>
  </td>
  <td align="center">
   <%=book.getPress() %>
  </td>
  <td align="center">
   <%=book.getPrice() %>
  </td>
  <td align="center">
   <%=book.getAmount() %>
  </td>
  </tr>

   <%   } %>
</table>
</form>
</div>
</div>
</div>

<!-- start footer -->
<div class="footer_bg">
<div class="wrap">
<div class="footer">
    <!-- scroll_top_btn -->
      <script type="text/javascript">
      $(document).ready(function() {
      
        var defaults = {
            containerID: 'toTop', // fading element id
          containerHoverID: 'toTopHover', // fading element hover id
          scrollSpeed: 1200,
          easingType: 'linear' 
        };
        
        
        $().UItoTop({ easingType: 'easeOutQuart' });
        
      });
    </script>
     <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
    <!--end scroll_top_btn -->
  <div class="f_nav1">
    <ul>
      <li><a href="#">home /</a></li>
      <li><a href="#">support /</a></li>
      <li><a href="#">Terms and conditions /</a></li>
      <li><a href="#">Faqs /</a></li>
      <li><a href="#">Contact us</a></li>
    </ul>
    </div>
  <div class="copy">
    <p class="link"><span>Copyright &copy; 2016.麓山书市 All rights reserved.</p>
  </div>
  <div class="clear"></div>
</div>
</div>
</div>

</body>
</html>