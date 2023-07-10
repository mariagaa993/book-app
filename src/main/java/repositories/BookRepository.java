package repositories;

import connections.Connection;
import models.Book;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;

public class BookRepository {
    EntityManager entityManager = Connection.getEntityManager();

    public BookRepository() {}

    public void register(Book book) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(book);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Book> getBooks() {
        List<Book> bookList = new ArrayList<>();

        try {
            entityManager.getTransaction().begin();
            bookList = entityManager.createQuery("SELECT book from Book book").getResultList();
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return bookList;
    }

    public Book searchById(Integer id) {
        return entityManager.find(Book.class, id);
    }

    public Book searchByIsbn(Long isbn) {
        return entityManager.createQuery(
                "SELECT book from Book book WHERE book.isbn = :isbn", Book.class).
                setParameter("isbn", isbn).getSingleResult();
    }

    public void delete(Integer id) {
        Book book = searchById(id);

        try {
            entityManager.getTransaction().begin();
            entityManager.remove(book);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void update(Book book) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(book);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
