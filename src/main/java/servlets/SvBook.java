package servlets;

import com.google.gson.Gson;
import models.Book;
import services.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "bookList", urlPatterns = "/bookList")
public class SvBook extends HttpServlet {
    BookService bookService;
    String msg = "";

    public SvBook() {
        bookService = new BookService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if(action == null) {
            try {
                List<Book> bookList = bookService.getAllBooks();
                HttpSession session = request.getSession();
                session.setAttribute("bookList", bookList);

                request.getRequestDispatcher("bookList.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

        } else if(action.equals("searchByIsbn")) {
            Long isbn = Long.parseLong(request.getParameter("isbn"));

            try {
                Book book = bookService.getBookByIsbn(isbn);
                HttpSession session = request.getSession();
                session.setAttribute("bookByIsbn", book);

                response.sendRedirect("card.jsp");
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

        } else if(action.equals("find")) {
            Integer id = Integer.parseInt(request.getParameter("id"));

            try {
                Book book = bookService.getBookById(id);
                Gson gson = new Gson();
                PrintWriter writer = response.getWriter();
                writer.print(gson.toJson(book));
                writer.flush();
                writer.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        switch (action) {
            case "saveBook":
                String title = request.getParameter("title");
                Long isbn = Long.parseLong(request.getParameter("isbn"));
                Integer year = Integer.parseInt(request.getParameter("year"));
                Integer quantity = Integer.parseInt(request.getParameter("quantity"));
                Boolean registration = request.getParameter("registration").equals("Yes");

                try {
                    bookService.registerBook(title, isbn, year, quantity, registration);

                    msg = "It was saved successfully";
                    session.setAttribute("msg", msg);
                    response.sendRedirect("bookList");
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }

                break;
            case "deleteBook": {
                Integer id = Integer.parseInt(request.getParameter("id"));

                try {
                    bookService.deleteBook(id);

                    msg = "It was deleted successfully";
                    session.setAttribute("msg", msg);
                    response.sendRedirect("bookList");
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }

                break;
            }
            case "updateBook": {
                Integer id = Integer.parseInt(request.getParameter("idUpdateBook"));

                try {
                    Book book = bookService.getBookById(id);
                    book.setTitle(request.getParameter("title"));
                    book.setIsbn(Long.parseLong(request.getParameter("isbn")));
                    book.setYear(Integer.parseInt(request.getParameter("year")));
                    book.setAvailableQuantity(Integer.parseInt(request.getParameter("availableQuantity")));
                    book.setPublisherRegistration(request.getParameter("publisherRegistration").equals("Yes"));

                    bookService.updateBook(book);

                    msg = "It was updated successfully!";
                    session.setAttribute("msg", msg);
                    response.sendRedirect("bookList");
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                break;
            }
        }
    }
}
