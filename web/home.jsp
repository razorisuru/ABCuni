<%-- 
    Document   : home
    Created on : Feb 7, 2024, 7:50:43 PM
    Author     : razor
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Models.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% session = request.getSession(false);

    if (session == null) {
        session.invalidate();
        response.sendRedirect("signin.jsp");
        return;
    }

//                if (session == null || session.isNew()) {
//                    response.sendRedirect("signin.jsp");
//                }

%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Project</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/style.css" />
        <style>
            /* Set height of the container */
            .container-full {
                height: 100vh;
            }
            .card {
                margin-top: 20px;
            }
        </style>
    </head>


    <body>
        <div class="container-fluid ptrn">
            <nav class="navbar navbar-expand-lg navbar-dark transparent-nav sticky">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/">
                        <!-- You can use an image or just text for the brand -->
                        <img src="" />ABC UNI
                    </a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link text-light" href="home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-light" href="LogOutController">LogOut</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>





            <div class="row">
                <div class="col-md-4 vh-100">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Student Details Form</h5>
                            <form action="StDataSendController" method="post">
                                <div class="mb-3">
                                    <label for="name" class="form-label">ST ID</label>
                                    <input type="text" class="form-control" name="st_id" placeholder="Enter name" />
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" class="form-control" name="name" placeholder="Enter name" />
                                </div>
                                <div class="mb-3">
                                    <label for="age" class="form-label">Age</label>
                                    <input type="number" class="form-control" name="age" placeholder="Enter age" />
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Dep Name</label>
                                    <input type="text" class="form-control" name="dep_name" placeholder="Enter name" />
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Fees</label>
                                    <input type="text" class="form-control" name="fees" placeholder="Enter name" />
                                </div>
                                <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                                <button type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">Reset</button>
                                <% String msg = (String) request.getAttribute("msg");
                                    String clz = (String) request.getAttribute("clz");
                                    if (msg != null && clz != null) {
                                %>

                                <div class="alert <%= clz%> alert-dismissible fade show mt-4" role="alert">
                                    <strong><%= msg%></strong> 
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <%
                                    }
                                %>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Student Details Table</h5>
                            <table class="table table-responsive table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">ST ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Age</th>
                                        <th scope="col">Dep</th>
                                        <th scope="col">Fees</th>
                                        <th scope="col">Options</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        try (Connection conn = DatabaseConnection.getConnection()) {

                                            String checkSql = "SELECT * FROM students";
                                            PreparedStatement checkStmt = conn.prepareStatement(checkSql);

                                            ResultSet checkResult = checkStmt.executeQuery();

                                            while (checkResult.next()) {
                                                String id = checkResult.getString("id");


                                    %>
                                    <tr>
                                        <td><%= checkResult.getString("st_id")%></td>
                                        <td><%= checkResult.getString("name")%></td>
                                        <td><%= checkResult.getString("age")%></td>
                                        <td><%= checkResult.getString("dep_name")%></td>
                                        <td><%= checkResult.getString("fees")%></td>
                                        <td><a class="btn btn-sm btn-success"  href="update.jsp?id=<%=id%>">Edit</a>
                                            <a class="btn btn-sm btn-danger" href="DeleteController?id=<%=id%>" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
                                        </td> 
                                    </tr>

                                    <%

                                            }
                                        } catch (SQLException ex) {
                                            System.out.println(ex);
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>

</html>

