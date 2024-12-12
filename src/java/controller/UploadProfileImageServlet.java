/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import model.Account;

/**
 *
 * @author 11
 */
@WebServlet(name = "UploadProfileImageServlet", urlPatterns = {"/uploadProfileImage"})
@MultipartConfig
public class UploadProfileImageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadProfileImageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadProfileImageServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("account") == null) {
            request.getRequestDispatcher("client/404.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("client/profile.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        InputStream inputStream = null;
        Part filePart = request.getPart("profileImage");
        if (filePart != null && filePart.getSize() > 0) {
            inputStream = filePart.getInputStream();
        }
        AccountDAO accountDAO = new AccountDAO();
        if (request.getSession().getAttribute("account") == null) {
            response.sendRedirect("404");
        } else {
            Account account = (Account) request.getSession().getAttribute("account");

            int id = account.getAccountID();

            if (accountDAO.updateProfileImage(inputStream, filePart, account.getAccountID())) {
                account = accountDAO.getAccountByID(id);
                request.getSession().removeAttribute("account");
                request.getSession().setAttribute("account", account);
                response.sendRedirect("profile");
            } else {
                response.sendRedirect("404");
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
