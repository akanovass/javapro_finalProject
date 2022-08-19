package com.example.javapro_sprinttask1;

import db.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/addContent")
public class AddContentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Category> categories = DBManager.getAllCategories();
        ArrayList<Language> languages = DBManager.getAllLanguages();
        request.setAttribute("categories", categories);
        request.setAttribute("languages", languages);
        request.getRequestDispatcher("/addContent.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Long categoryId = Long.parseLong(request.getParameter("category"));
        Long languageId = Long.parseLong(request.getParameter("language"));

        NewsContent newNewsContent = new NewsContent();
        newNewsContent.setTitle(title);
        newNewsContent.setContent(content);

        News newNews = new News();
        Category newCategory = DBManager.getCategory(categoryId);
        newNews.setCategory(newCategory);
        DBManager.addNews(newNews);
        News newNews2 = DBManager.getNews(newNews.getId());
        newNewsContent.setNews(newNews2);//

        Language newLanguage = DBManager.getLanguage(languageId);
        newNewsContent.setLanguage(newLanguage);//

        DBManager.addPost(newNewsContent);
        response.sendRedirect("/hello");
    }
}
