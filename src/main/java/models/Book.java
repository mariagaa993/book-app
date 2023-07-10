package models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String  title;
    private Long    isbn;
    private Integer year;
    private Integer availableQuantity;
    private Boolean publisherRegistration;

    public Book() {}

    public Book(String title, Long isbn, Integer year, Integer availableQuantity, Boolean publisherRegistration) {
        this.title                 = title;
        this.isbn                  = isbn;
        this.year                  = year;
        this.availableQuantity     = availableQuantity;
        this.publisherRegistration = publisherRegistration;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public Long getIsbn() {
        return isbn;
    }

    public void setIsbn(Long isbn) {
        this.isbn = isbn;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getAvailableQuantity() {
        return availableQuantity;
    }

    public void setAvailableQuantity(Integer availableQuantity) {
        this.availableQuantity = availableQuantity;
    }

    public Boolean getPublisherRegistration() {
        return publisherRegistration;
    }

    public void setPublisherRegistration(Boolean publisherRegistration) {
        this.publisherRegistration = publisherRegistration;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", isbn=" + isbn +
                ", year=" + year +
                ", availableQuantity=" + availableQuantity +
                ", publisherRegistration=" + publisherRegistration +
                '}';
    }
}
