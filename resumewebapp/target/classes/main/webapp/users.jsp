<%@ page import="dao.inter.UserDaoInter" %>
<%@ page import="entity.User" %>
<%@ page import="main.Context" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resume.io</title>
    <link rel="stylesheet" href="assets/css/users.css">
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/df5b0cb1e1.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="assets/js/users.js"></script>

</head>
<body>

<%
    UserDaoInter userDao = Context.instanceUserDao();
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String email = request.getParameter("email");

    List<User> list = userDao.getAll(name, surname, email);
%>
<div class="container">
    <div>
        <div class="mycontainer">
            <form action="users" method="GET">
                <div class="col-4">
                    <div class="form-group">
                        <label>Name:</label>
                        <input class="form-control" type="text" name="name" value="" placeholder="Enter name "/>
                    </div>
                    <div class="form-group">
                        <label>Surname:</label>
                        <input class="form-control" type="text" name="surname" value="" placeholder="Enter surname"/>
                    </div>
                    <input class="btn btn-primary" type="submit" name="search" value="Search" class="btn">
                </div>
            </form>
        </div>
    </div>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>name</th>
                <th>surname</th>
                <th>email</th>
                <th>Operation</th>
            </tr>
            </thead>
            <tbody>
            <%for (User u : list) {%>
            <tr>
                <td><%=u.getName()%>
                </td>
                <td><%=u.getSurname()%>
                </td>
                <td ><%=u.getEmail()%>
                </td>

                <td width="10px">
                    <input type="hidden" name="id" value="<%=u.getId()%>">
                    <button class="btn btn-danger" type="button" value="delete"
                            class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                            onclick="setIdForDelete('<%=u.getId()%>')">
                        <i class="fa-sharp fa-solid fa-trash"></i>
                    </button>

                </td>
                <td width="7px">
                    <form action="userDetail" method="GET">
                        <input type="hidden" name="id" value="<%=u.getId()%>">
                        <button class="btn btn-primary">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                    </form>
                </td>
                <td width="7px">
                    <form action="userinfo" method="GET">
                        <input type="hidden" name="id" value="<%=u.getId()%>">
                        <button class="btn btn-info"><i class="fa-solid fa-circle-info"></i>
                        </button>
                    </form>
                </td>

            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <form action="users" method="POST">
                    <input type="hidden" name="id" value="" id="idForDelete">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>