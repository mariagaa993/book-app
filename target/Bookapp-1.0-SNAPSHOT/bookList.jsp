<%@ page import="models.Book" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="./styles/general.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <title>Book List</title>
</head>
<body>
    <div class="container-fluid sub-page p-0">
        <nav class="navbar navbar-dark bg-dark p-3">
            <a class="navbar-brand" href="index.jsp">Books Storage System</a>
            <h1 class="text-center" style="color:white;">Book List</h1>
            <a type="button" class="btn btn-primary add"
               data-bs-toggle="modal" data-bs-target="#addModal">
                <i class="fa fa-user-plus"></i> Add New Book</a>
            <a href="http://localhost:3001/bookapp/index.jsp" class="btn btn-success">Back!</a>
        </nav>
        <div class="container pt-4">
            <div class="row">
                <table class="table" id="table" style="width:100%">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>ISBN</th>
                            <th>Year</th>
                            <th>Available Quantity</th>
                            <th>Publisher Registration</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%  List<Book> bookList = (List) request.getSession().getAttribute("bookList");
                        for (Book book : bookList) { %>
                            <tr>
                                <td><%= book.getTitle() %></td>
                                <td><%= book.getIsbn() %></td>
                                <td><%= book.getYear() %></td>
                                <td><%= book.getAvailableQuantity() %></td>
                                <td><%= book.getPublisherRegistration() ? "Yes" : "No" %></td>
                                <td>
                                    <a type="button" class="btn btn-warning edit"
                                            data-bs-toggle="modal" data-bs-target="#editModal"><i class="fa fa-pencil"></i></a>
                                    <a type="button" class="btn btn-danger delete"
                                            data-bs-toggle="modal" data-bs-target="#deleteModal"><i class="fa fa-trash"></i></a>
                                    <input type="hidden" name="id" id="id" value=<%= book.getId() %>>
                                </td>
                            </tr>
                        <% };
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Add Modal -->
    <div class="modal" id="addModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Book</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="bookList" method="POST">
                        <div class="form-group pt-3">
                            <label for="title">Book's Title</label>
                            <input type="text" class="form-control" id="saveTitle" name="title" required>
                        </div>
                        <div class="form-row pt-3" style="display: flex">
                            <div class="form-group col-lg-6" style="padding-right: 10px">
                                <label for="isbn">ISBN</label>
                                <input type="text" class="form-control" id="saveIsbn" name="isbn" pattern="^[0-9]+" required>
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="year">Year</label>
                                <input type="text" class="form-control" id="saveYear" name="year" pattern="^[0-9]+" required>
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
                            <input type="hidden" name="action" value="saveBook">
                            <button type="submit" class="btn btn-primary" style="width: 100%">Add Book</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div class="modal" id="editModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Book</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="bookList" method="POST">
                        <div class="form-group">
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
                                <label for="availableQuantity">Available Quantity</label>
                                <input type="number" class="form-control" id="availableQuantity" name="availableQuantity" required>
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="publisherRegistration">Publisher Registration</label>
                                <select id="publisherRegistration" class="form-control" name="publisherRegistration" required>
                                    <option selected disabled value="">Choose...</option>
                                    <option>Yes</option>
                                    <option>No</option>
                                </select>
                            </div>
                        </div>
                        <div class="text-center pt-3 pb-4">
                            <input type="hidden" name="action" value="updateBook">
                            <input type="hidden" name="idUpdateBook" id="idUpdateBook">
                            <button type="submit" class="btn btn-warning" style="width: 100%">Edit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal" id="deleteModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="bookList" method="POST">
                    <div class="modal-header">
                        <h4 class="modal-title">Delete Book</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure to delete the book?
                    </div>
                    <div class="modal-footer">
                            <input type="hidden" name="action" value="deleteBook">
                            <input type="hidden" name="id" id="idDelete">
                            <button type="submit" class="btn btn-danger">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#table').DataTable({
                language: {
                    processing: "In progress...",
                    search: "Search&nbsp;",
                    lengthMenu: "View _MENU_ &nbsp;",
                    info: "Showing from item _START_ to _END_ of a total _TOTAL_ items",
                    infoEmpty: "There is no data to display.",
                    infoFiltered: "(filtering of _MAX_ elements in total)",
                    infoPostFix: "",
                    loadingRecords: "Loading...",
                    zeroRecords: "No data was found with your search",
                    emptyTable: "No data available in table",
                    paginate: {
                        first: "First",
                        previous: "Previous",
                        next: "Next",
                        last: "Last"
                    }
                },
                scrollY: 400,
                lengthMenu: [ [5, 15, 30, -1], [5, 15, 30, "All"] ],
            });
            $('#table .delete').on('click', function () {
                let id = $(this).parent().find('#id').val();
                $('#deleteModal #idDelete').val(id);
            });
            $('#table .edit').on('click', function () {
                let id = $(this).parent().find('#id').val();
                $.ajax({
                    type: 'GET',
                    url: 'http://localhost:3001/bookapp/index.jsp/bookList',
                    data: {action: 'find', id:id},
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function (result) {
                        $('#editModal #idUpdateBook').val(result.id);
                        $('#editModal #title').val(result.title);
                        $('#editModal #isbn').val(result.isbn);
                        $('#editModal #year').val(result.year);
                        $('#editModal #availableQuantity').val(result.availableQuantity);
                        $('#editModal #publisherRegistration').val(result.publisherRegistration ? "Yes" : "No");
                    }
                })
            });
        });

        /* String message = (String) request.getSession().getAttribute("msg")
        if(message != null) {
            alert(message);
        }*/
    </script>
</body>
</html>
