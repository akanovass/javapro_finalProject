<%@ page import="db.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.NewsContent" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <%@include file="vector/bootstrap0.jsp"%>
    <style>
        h2,h6 {
            text-align: center;
        }
        h6{
            color:grey;
        }
        h2{
            margin: 20px 0px 10px;
            font-weight: bold;
        }
        .card{
            width: 100%;
            margin: 10px;
            padding: 10px;
        }
        .card-title{
            text-align: center;
            padding-top: 4px;
        }
        .items{
            display: flex;
            flex-wrap: wrap;




        }
        p{
            color:grey;
            margin-bottom: 0;
        }
        .headergoi{
            display:flex;
            justify-content: space-between;
            padding-bottom: 0;
            margin-bottom: 0;
        }
    </style>
</head>
<body style="margin: 0px 200px;">
    <%@include file="vector/navbar.jsp"%>
    <div class="items">
        <%
        ArrayList<NewsContent> newsContent = (ArrayList<NewsContent>) request.getAttribute("newsContent");
        if(newsContent!=null){
            for(NewsContent it:newsContent){
    %>
            <div class="card">
                <div class="headergoi">
                    <p><%=it.getNews().getPost_date()%></p>
                    <div>
                        <p>by John Sudworth</p>
                        <p><%=it.getLanguage().getCode()%></p>
                    </div>
                </div>



                <div class="card-body">
                    <h4 class="card-title" style="color:green;"><%=it.getTitle()%></h4>

                    <label class="card-text"><%=it.getContent()%></label>
                    <a href="#" >Read More</a>
                </div>
            </div>

<%
    }
    }
%>
    </div>
</body>
</html>