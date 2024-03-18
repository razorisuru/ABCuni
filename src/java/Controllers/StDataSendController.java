/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author iduni
 */
@WebServlet(name = "StDataSendController", urlPatterns = {"/StDataSendController"})
public class StDataSendController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");

        String st_id = request.getParameter("st_id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String dep_name = request.getParameter("dep_name");
        String fees = request.getParameter("fees");

        if (st_id.equals("") || name.equals("") || age.equals("") || dep_name.equals("") || fees.equals("")) {
            request.setAttribute("msg", "Empty Fields.");
            request.setAttribute("clz", "alert-danger");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            try (Connection conn = DatabaseConnection.getConnection()) {
                String sql = "INSERT INTO students(st_id, name, age, dep_name, fees) VALUES (?,?,?,?,?)";
                PreparedStatement stmt = conn.prepareStatement(sql);

                stmt.setString(1, st_id);
                stmt.setString(2, name);
                stmt.setString(3, age);
                stmt.setString(4, dep_name);
                stmt.setString(5, fees);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    request.setAttribute("msg", "Data send succesfully.");
                    request.setAttribute("clz", "alert-success");
                    request.getRequestDispatcher("home.jsp").forward(request, response);

                } else {
                    request.setAttribute("msg", "Data error.");
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
                DatabaseConnection.closeConnection(conn);

            } catch (SQLException e) {
                out.println(e);
            }
        }

    }
}
