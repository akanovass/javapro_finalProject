package db;

import java.sql.Timestamp;

public class News {
    private Long id;
    private Timestamp post_date;
    private Category category;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Timestamp getPost_date() {
        return post_date;
    }

    public void setPost_date(Timestamp post_date) {
        this.post_date = post_date;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
