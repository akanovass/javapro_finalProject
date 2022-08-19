<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 17.08.2022
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vector/bootstrap0.jsp"%>
</head>
<body>




<div class="container"><%@include file="vector/navbar.jsp"%>
    <div class="row mt-3">
        <div class="col-8 mx-auto"><%
            String success = request.getParameter("success");
            if(success!=null){
        %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Successfully edited!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }

            %>
            <form action="/edit" method="post">
                <input type="hidden" name="id" value="<%=currentUser.getId()%>">
                <div class="form-group">
                    <label>Email::</label>
                    <input type="text" name="email" class="form-control" value="<%=currentUser.getEmail()%>">
                </div><br>
                <div class="form-group">
                    <label>Full name:</label>
                    <input type="text" name="fullName" class="form-control" value="<%=currentUser.getFullName()%>">
                </div><br>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" class="form-control" value="<%=currentUser.getPassword()%>">
                </div><br>
                <div class="form-group">
                    <button class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete account</button>
                </div>
            </form>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/delete" method="post">
                            <input type="hidden" name="id" value="<%=currentUser.getId()%>">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Are You Sure?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                                <button class="btn btn-danger">YES</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
