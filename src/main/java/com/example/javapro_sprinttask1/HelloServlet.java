package com.example.javapro_sprinttask1;

import db.DBManager;
import db.Item;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(value = "/hello")
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ArrayList<Item> items = DBManager.getAllItems();
        System.out.println("hello " +items);
        request.setAttribute("items", items);
        request.getRequestDispatcher("/index.jsp").forward(request,response);

    }


}