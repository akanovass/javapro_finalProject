<%@ page import="db.Item" %>
<%@ page import="java.util.ArrayList" %>
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
            width: 31%;
            margin: 10px;
            text-align: center;
        }
        .items{
            display: flex;
            flex-wrap: wrap;




        }
    </style>
</head>
<body style="margin: 0px 200px;">
    <%@include file="vector/navbar.jsp"%>
    <h2>Welcome to BITLAB SHOP</h2>
    <h6>Electronic devices with high quality and service</h6>
    <div class="items">
        <%
        ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
        if(items!=null){
            for(Item it:items){
    %>

            <div class="card">
                <h5 class="card-header"><%=it.getName()%></h5>
                <div class="card-body">
                    <h5 class="card-title" style="color:green;"><%=it.getPrice()%> $</h5>
                    <p class="card-text"><%=it.getDescription()%></p>
                    <a href="#" class="btn btn-success">Buy Now</a>
                </div>
            </div>

<%
    }
    }
%>
    </div>
</body>
</html>