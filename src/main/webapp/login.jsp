<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 01.08.2022
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <%@include file="vector/bootstrap0.jsp"%>

</head>
<body style="margin: 0px 200px;">
    <%@include file="vector/navbar.jsp"%>
    <%
       String error = request.getParameter("error");
        if(error!=null){
    %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        Incorrect <strong>email</strong> or <strong>password</strong>!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }

    %>



    <div class="card" style="margin-top: 20px;">
        <h5 class="card-header">Login Page</h5>
        <form action="/login" method="post">
        <div class="card-body">
            <div class="row">
                <div class="col">Email</div>
                <div class="col"><div class="input-group input-group-sm mb-3">
                    <input type="text" name="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                </div>
                </div>
            </div>
            <div class="row">
                <div class="col">Password</div>
                <div class="col"><div class="input-group input-group-sm mb-3">
                    <input type="password" name="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                </div>
                </div>
            </div>
            <div>
                <button class="btn btn-success">Login</button>
            </div>
        </div>
        </form>
    </div>

</body>
</html>
