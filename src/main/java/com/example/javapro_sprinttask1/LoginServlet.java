package com.example.javapro_sprinttask1;

import db.DBManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        Boolean bool = DBManager.checkUser(name,password);
        String link =null;
        if(bool){
            link="userPage";
        }
        else{
            link="login?error";
        }
        response.sendRedirect("/" +link);

    }
}
