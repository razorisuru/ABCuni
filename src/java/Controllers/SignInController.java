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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author iduni
 */
@WebServlet(name = "SignInController", urlPatterns = {"/SignInController"})
public class SignInController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");

        String POSTusername = request.getParameter("username");
        String POSTpassword = request.getParameter("password");

        if (POSTusername.equals("") || POSTpassword.equals("")) {
            request.setAttribute("Login_msg", "Empty Fields.");
            request.setAttribute("Login_clz", "alert-danger");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        } else {
            try (Connection conn = DatabaseConnection.getConnection()) {

                String checkSql = "SELECT * FROM users WHERE username = ? and password = ?";
                PreparedStatement checkStmt = conn.prepareStatement(checkSql);
                checkStmt.setString(1, POSTusername);
                checkStmt.setString(2, POSTpassword);

                ResultSet checkResult = checkStmt.executeQuery();

                if (checkResult.next()) {
                    String username = checkResult.getString("Username");
//                    String password = checkResult.getString("Password");

                    HttpSession session = request.getSession(true);
                    session.setAttribute("UN", username);
                    request.setAttribute("Message", "Hello " + username);
                    response.sendRedirect("home.jsp");
//                    out.println("{ \"status\": \"ERROR\", \"message\": \"Correct username or password\" }");

                } else {
//                out.println("ERROR");
//                out.println("{ \"status\": \"ERROR\", \"message\": \"Invalid username or password\" }");
                    request.setAttribute("Login_msg", "Incorrect Username and Password.");
            request.setAttribute("Login_clz", "alert-danger");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(SignInController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
