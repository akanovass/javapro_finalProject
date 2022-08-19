package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;
    static{
        try {
            Class.forName("org.postgresql.Driver");
            connection= DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5433/javapro_db",
                    "postgres",
                    "postgres");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static ArrayList<NewsContent> getAllNewsContent() {
        ArrayList<NewsContent> newsContents = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT nc.id, nc.title, nc.content, nc.news_id, nc.language_id, l.name AS lang, l.code, n.post_date, n.category_id, c.name AS category " +
                    "FROM news_contents nc " +
                    "INNER JOIN news n ON n.id=nc.news_id " +
                    "INNER JOIN news_categories c ON c.id = n.category_id " +
                    "INNER JOIN languages l ON l.id=nc.language_id " +
                    "ORDER BY nc.id DESC ");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                NewsContent nc = new NewsContent();
                nc.setId(resultSet.getLong("id"));
                nc.setTitle(resultSet.getString("title"));
                nc.setContent(resultSet.getString("content"));

                News news = new News();
                news.setId(resultSet.getLong("news_id"));
                news.setPost_date(resultSet.getTimestamp("post_date"));

                Category category = new Category();
                category.setId(resultSet.getLong("category_id"));
                category.setName(resultSet.getString("category"));
                news.setCategory(category);

                nc.setNews(news);

                Language language = new Language();
                language.setId(resultSet.getLong("language_id"));
                language.setName(resultSet.getString("lang"));
                language.setCode(resultSet.getString("code"));

                nc.setLanguage(language);

                newsContents.add(nc);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newsContents;
    }
    public static User getUser(String email) {
        User user = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE email=?");
            statement.setString(1,email);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getLong("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFullName(resultSet.getString("full_name"));
                user.setRole(resultSet.getString("role_id"));
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static void addUser(User user){

        try{
            PreparedStatement statement = connection.prepareStatement("INSERT INTO users (email, password, full_name, role_id) " + "VALUES(?,?,?,?) ");
            statement.setString(1,user.getEmail());
            statement.setString(2,user.getPassword());
            statement.setString(3,user.getFullName());
            statement.setString(4,user.getRole());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void addPost(NewsContent newsContent){
        try{
            PreparedStatement statement = connection.prepareStatement("INSERT INTO news_contents (title,content,news_id, language_id) " + "VALUES(?,?,?,?)");
            statement.setString(1, newsContent.getTitle());
            statement.setString(2, newsContent.getContent());
            statement.setLong(3, newsContent.getNews().getId());
            statement.setLong(4,newsContent.getLanguage().getId());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void addNews(News news){
        try{
            PreparedStatement statement = connection.prepareStatement("INSERT INTO news(post_date, category_id) " + "VALUES(NOW(), ?)");
            statement.setLong(1,news.getCategory().getId());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static News getNews(Long id) {
        News news = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM news WHERE id=? ");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                news = new News();
                news.setId(resultSet.getLong("id"));
                news.setPost_date(resultSet.getTimestamp("post_date"));
                Category category = getCategory(resultSet.getLong("category_id"));
                news.setCategory(category);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    public static void edit(User user){
        try{
            PreparedStatement statement = connection.prepareStatement("UPDATE users SET email = ?, password = ?, full_name = ? " +
                    "WHERE id = ?");
            statement.setString(1,user.getEmail());
            statement.setString(3,user.getFullName());
            statement.setString(2,user.getPassword());
            statement.setLong(4,user.getId());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Category> getAllCategories() {
        ArrayList<Category> categories = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * " +
                    "FROM news_categories ");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getLong("id"));
                category.setName(resultSet.getString("name"));

                categories.add(category);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }
    public static ArrayList<Language> getAllLanguages() {
        ArrayList<Language> languages = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * " +
                    "FROM languages");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Language language = new Language();
                language.setId(resultSet.getLong("id"));
                language.setName(resultSet.getString("name"));
                language.setCode((resultSet.getString("code")));

                languages.add(language);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return languages;
    }

    public static Language getLanguage(Long id) {
        Language language = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM languages WHERE id=?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                language = new Language();
                language.setId(resultSet.getLong("id"));
                language.setName(resultSet.getString("name"));
                language.setCode(resultSet.getString("code"));
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return language;
    }

    public static Category getCategory(Long id) {
        Category category = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM news_categories WHERE id=?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                category = new Category();
                category.setId(resultSet.getLong("id"));
                category.setName(resultSet.getString("name"));
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }


}
