package com.example.javapro_sprinttask1;

import db.DBManager;
import db.User;

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
        String email = request.getParameter("name");
        String password = request.getParameter("password");
        User user = DBManager.getUser(email);

        String link = null;
        if(user!=null && user.getPassword().equals(password)){
            link="hello";
            HttpSession session = request.getSession();
            session.setAttribute("authUser",user);
        }
        else{
            link="login?error";
        }
        response.sendRedirect("/" +link);

    }
}
