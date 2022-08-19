<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 17.08.2022
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>registration</title>
    <%@include file="vector/bootstrap0.jsp"%>
</head>
<body>
<div class="container"> <div class="row mt-3">
    <div class="col-6 mx-auto">
        <%
            String success = request.getParameter("success");
            if(success!=null){
        %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            You are successfully registered!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
        %><form action="/register" method="post">
        <div class="card" style="margin-top: 20px;">
            <h5 class="card-header">Registration</h5>
            <div class="card-body">

                <div class="row mt-3">
                    <div class="col-6"><span>Email:</span></div>
                    <div class="col-6"><input type="text" name="email" class="form-control"></div>
                </div>
                <div class="row mt-3" >
                    <div class="col-6"><span>Full Name::</span></div>
                    <div class="col-6"><input type="text" name="fullName" class="form-control"></div>
                </div>
                <div class="row mt-3 " >
                    <div class="col-6"><span>Password:</span></div>
                    <div class="col-6"><input type="password" name="password" class="form-control"></div>
                </div>
                <div class="row mt-3 " >
                    <div class="col-6"><span>Re-password:</span></div>
                    <div class="col-6"><input type="password" name="rePassword" class="form-control"></div>
                </div>
                <div class="row mt-3 " >
                    <div class="col-12"><button class="btn btn-success">Sign In</button></div>
                    <div class="col-12"></div>
                </div>

            </div>

        </div> </form>
    </div>
</div>

</div>

</body>
</html>
