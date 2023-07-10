package services;

import models.Book;
import repositories.BookRepository;

import java.util.List;

public class BookService {
    BookRepository bookRepository;

    public BookService() {
        bookRepository = new BookRepository();
    }

    public void registerBook(String title, Long isbn, Integer year, Integer quantity, Boolean registration) {
        Book book = new Book();
        book.setTitle(title);
        book.setIsbn(isbn);
        book.setYear(year);
        book.setAvailableQuantity(quantity);
        book.setPublisherRegistration(registration);

        bookRepository.register(book);
    }

    public Book getBookById(Integer id) {
        return bookRepository.searchById(id);
    }

    public List<Book> getAllBooks() {
        List<Book> bookList = bookRepository.getBooks();
        return bookList;
    }

    public void deleteBook(Integer id) {
        bookRepository.delete(id);
    }

    public void updateBook(Book book) {
        bookRepository.update(book);
    }

    public Book getBookByIsbn(Long isbn) {
        return bookRepository.searchByIsbn(isbn);
    }
}

