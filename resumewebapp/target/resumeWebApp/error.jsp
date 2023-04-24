<%--
  Created by IntelliJ IDEA.
  User: Yasin
  Date: 4/13/2023
  Time: 1:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>why are you here ?</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
%>
<%=msg%>
</body>
</html>
