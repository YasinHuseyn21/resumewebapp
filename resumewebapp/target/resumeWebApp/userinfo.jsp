<%@ page import="entity.User" %>
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
    User u = (User) request.getAttribute("user");
%>

<div>

    <div>
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th>Name</th>
                <th>Surname</th>
                <th>Email</th>
                <th>Phone</th>
                <th>BirthDate</th>


            </tr>
            </thead>
            <tbody>

            <tr>
                <td><%=u.getName()%>
                </td>
                <td><%=u.getSurname()%>
                </td>
                <td><%=u.getEmail()%>
                </td>
                <td><%=u.getPhone()%>
                </td>
                <td><%=u.getBirtDate()%>
                </td>


            </tr>

            </tbody>
        </table>

        <%--        <label>Name:</label>--%>
        <%--        <%=u.getName()%>--%>
        <%--        <label>Surname:</label>--%>
        <%--        <%=u.getSurname()%>--%>
        <%--        <label>Email:</label>--%>
        <%--        <%=u.getEmail()%>--%>
        <%--        <label>Phone:</label>--%>
        <%--        <%=u.getPhone()%>--%>
    </div>


</div>

</div>


</body>
</html>
