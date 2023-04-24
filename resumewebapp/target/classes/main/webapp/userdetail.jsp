<%@ page import="dao.inter.UserDaoInter" %>
<%@ page import="entity.User" %>
<%@ page import="main.Context" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Detail</title>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/df5b0cb1e1.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<%
User u= (User) request.getAttribute("user");
%>

<div class="container">
    <form action="userDetail" method="POST">
        <div class="col-4">
        <div class="form-group">
            <input type="hidden" name="id" value="<%=u.getId()%>">
            <label>Name:</label>
            <input class="form-control" type="text" name="name" value="<%=u.getName()%>">
            <label>Surname:</label>
            <input class="form-control" type="text" name="surname" value="<%=u.getSurname()%>">
            <label>Email:</label>
            <input class="form-control" type="text" name="email" value="<%=u.getEmail()%>">
            <label>Phone:</label>
            <input class="form-control" type="text" name="phone" value="<%=u.getPhone()%>">
        </div>
        </div>
        <input class="btn btn-success" type="submit" name="save" value="Save"/>
    </form>
</div>




</body>
</html>
