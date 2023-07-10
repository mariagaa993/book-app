<%@ page import="models.Book" %>
<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="./styles/general.css" />
    <title>Book Card</title>
</head>
<body>
    <div class="container-fluid sub-page p-0">
        <nav class="navbar navbar-dark bg-dark p-3">
            <a class="navbar-brand" href="index.jsp">Books Storage System</a>
        </nav>
        <div class="container pt-4" style="display: flex; justify-content: center">
            <div class="card" style="width: 22rem;">
                <% Book book = (Book) request.getSession().getAttribute("bookByIsbn"); %>
                <img class="card-img-top" src="images/result.jpg" alt="Card Image">
                <div class="card-body">
                    <h5 class="card-title pb-2" style="font-weight: 700; text-transform: uppercase"><%= book.getTitle() %></h5>
                    <p class="card-text m-0">ISBN: <%= book.getIsbn() %></p>
                    <p class="card-text m-0">Year: <%= book.getYear() %></p>
                    <p class="card-text m-0">Available Quantity: <%= book.getAvailableQuantity() %></p>
                    <p class="card-text m-0 pb-4">Publisher Registration: <%= book.getPublisherRegistration() ? "Yes" : "No" %></p>
                    <a href="http://localhost:3001/bookapp/index.jsp" style="width: 100%" class="btn btn-success">Back!</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
