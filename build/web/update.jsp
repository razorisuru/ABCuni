<%-- 
    Document   : update
    Created on : Feb 29, 2024, 10:44:23 PM
    Author     : iduni
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Models.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Student</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/style.css" />
    </head>
    <body>
        <div class="container-fluid vh-100 ptrn">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="card mt-5">
                        <div class="card-body">
                            <h5 class="card-title">Update Student Details Form</h5>
                            <form action="UpdateController" method="post">

                                <%
                                    try (Connection conn = DatabaseConnection.getConnection()) {

                                        String id = request.getParameter("id");
                                        String checkSql = "SELECT * FROM students WHERE id = ?";
                                        PreparedStatement checkStmt = conn.prepareStatement(checkSql);

                                        checkStmt.setString(1, id);

                                        ResultSet checkResult = checkStmt.executeQuery();

                                        while (checkResult.next()) {

                                %>
                                <input name="id" type="text" value="<%= id%>" hidden />
                                <div class="mb-3">
                                    <label for="name" class="form-label">ST ID</label>
                                    <input type="text" class="form-control" name="st_id" value="<%= checkResult.getString("st_id")%>" placeholder="Enter name" />
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" class="form-control" name="name" value="<%= checkResult.getString("name")%>" placeholder="Enter name" />
                                </div>
                                <div class="mb-3">
                                    <label for="age" class="form-label">Age</label>
                                    <input type="number" class="form-control" name="age" value="<%= checkResult.getString("age")%>" placeholder="Enter age" />
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Dep Name</label>
                                    <input type="text" class="form-control" name="dep_name" value="<%= checkResult.getString("dep_name")%>" placeholder="Enter name" />
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Fees</label>
                                    <input type="text" class="form-control" name="fees" value="<%= checkResult.getString("fees")%>" placeholder="Enter name" />
                                </div>

                                <%                                }
                                    } catch (SQLException ex) {
                                        System.out.println(ex);
                                    }
                                %>

                                <button type="submit" name="submit" class="btn btn-success">Submit</button>
                                <a class="btn btn-primary"  href="home.jsp">Home</a>
                                

                                <% String msg = (String) request.getAttribute("msg");
                                    String clz = (String) request.getAttribute("clz");
                                    if (msg != null && clz != null) {
                                %>

                                <div class="alert <%= clz%> alert-dismissible fade show mt-4" role="alert">
                                    <strong>Holy guacamole!</strong> <%= msg%>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <%
                                    }
                                %>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>

        </div>



        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
