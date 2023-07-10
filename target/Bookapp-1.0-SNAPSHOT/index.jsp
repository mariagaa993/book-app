<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="./styles/general.css" />
    <title>Book App</title>
</head>
<body>
    <div class="container-fluid home" style="display: flex; align-items: center">
        <div class="row">
            <div class="col-lg-6 text-center">
                <div class="container p-5">
                <h1 class="pb-3" style="font-weight: 700; font-size: 3em">Welcome to Books Storage System</h1>
                <p style="font-weight: 600">Web system created with Java using Sqlite as database,
                    JPA to persist objects, JSP as web technology and
                    Maven as dependency manager</p>
                <p style="font-weight: 600">You can search for a specific ISBN or simply see the entire list of stored books</p>
                <form action="bookList" method="GET" style="display: flex; justify-content: center" class="pb-3">
                    <input type="hidden" name="action" value="searchByIsbn">
                    <div class="input-group" style="width: 50%">
                        <input type="text" name="isbn" class="form-control" pattern="^[0-9]+" required placeholder="Search...">
                        <div class="input-group-append">
                            <button class="btn btn-secondary" type="submit">ISBN</button>
                        </div>
                    </div>
                </form>
                <form action="bookList" method="GET">
                    <button type="submit" class="btn btn-primary" style="width: 50%">See Book List</button>
                </form>
                </div>
            </div>
            <div class="col-lg-6" style="display: flex; justify-content: center">
                <form action="bookList" method="POST"
                      style="background-color: #ffffff; border-radius: 6px; width: 75%" class="p-4">
                    <input type="hidden" name="action" value="saveBook">
                    <h3 class="text-center pt-4">Store a book</h3>
                    <div class="form-group pt-3">
                        <label for="title">Book's Title</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="form-row pt-3" style="display: flex">
                        <div class="form-group col-lg-6" style="padding-right: 10px">
                            <label for="isbn">ISBN</label>
                            <input type="text" class="form-control" id="isbn" name="isbn" pattern="^[0-9]+" required>
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="year">Year</label>
                            <input type="text" class="form-control" id="year" name="year" pattern="^[0-9]+" required>
                        </div>
                    </div>
                    <div class="form-row pt-3" style="display: flex">
                        <div class="form-group col-lg-6" style="padding-right: 10px">
                            <label for="quantity">Available Quantity</label>
                            <input type="number" class="form-control" id="quantity" name="quantity" required>
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="registration">Publisher Registration</label>
                            <select id="registration" class="form-control" name="registration" required>
                                <option selected disabled value="">Choose...</option>
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                    <div class="text-center pt-3 pb-4">
                        <button type="submit" class="btn btn-primary" style="width: 100%">Save the book!</button>
                     </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
