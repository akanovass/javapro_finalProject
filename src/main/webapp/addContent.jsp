<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Category" %>
<%@ page import="db.Language" %><%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 18.08.2022
  Time: 1:14
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
        <div class="col-8 mx-auto">
            <form action="/addContent" method="post">
                <div class="form-group">
                    <label>Title:</label> <br>
                    <input type="text" name="title" class="form-control" placeholder="Insert title">
                </div><br>
                <div class="form-group">
                    <label>Content:</label> <br>
                    <textarea type="text" name="content" class="form-control" placeholder="Insert content"></textarea>
                </div><br>
                <div class="form-group">
                    <%
                        ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
                        ArrayList<Language> languages = (ArrayList<Language>) request.getAttribute("languages");
                    %>
                    <label>Category:</label> <br>
                    <select name="category" class="form-control">
                        <%
                            if(categories != null){
                                for(Category c: categories){


                        %>
                        <option value="<%=c.getId()%>"><%=c.getName()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div><br>
                <div class="form-group">
                    <label>Language:</label> <br>
                    <select name="language" class="form-control">
                        <%
                            if(languages != null){
                                for(Language l: languages){


                        %>
                        <option value="<%=l.getId()%>"><%=l.getName()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div><br>
                <div class="form-group">
                    <button class="btn btn-success">Add Content</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>

