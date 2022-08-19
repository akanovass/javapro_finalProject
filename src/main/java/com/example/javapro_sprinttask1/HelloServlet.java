package com.example.javapro_sprinttask1;

import db.DBManager;
import db.Item;
import db.NewsContent;
import db.User;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(value = "/hello")
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        User currentUser = (User) request.getSession().getAttribute("authUser");
        if(currentUser!=null) {
            ArrayList<NewsContent> newsContent = DBManager.getAllNewsContent();
            System.out.println("hello " + newsContent.size());
            request.setAttribute("newsContent", newsContent);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }else{
            response.sendRedirect("/login");
        }
    }


}