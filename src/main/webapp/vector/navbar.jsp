<%@ page import="db.User" %>
<style>
  .navbar-nav{
    padding-left: 360px;
    color:black;
  }
</style>
<%
  User currentUser = (User) session.getAttribute("authUser");
%>

<nav class="navbar navbar-expand-lg" style="border-bottom: 1px #e0e0e0 solid;" >
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><b>BBC</b></a>

    <div class="collapse navbar-collapse" id="navbarNav" >
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/hello">News</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/addContent">Add News</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            By Language
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">KAZ</a></li>
            <li><a class="dropdown-item" href="#">RUS</a></li>
            <li><a class="dropdown-item" href="#">ENG</a></li>
          </ul>
        </li>
        <%
          if(currentUser!=null){
        %>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           <%=currentUser.getFullName()%>
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/edit">Edit profile</a></li>
            <li><a class="dropdown-item" href="/logout">Logout</a></li>
          </ul>
        </li>
        <%
          }else{
        %>
        <li class="nav-item">
          <a class="nav-link" href="/login">Sign In</a>
        </li>

        <%
          }
        %>
      </ul>
    </div>
  </div>
</nav>