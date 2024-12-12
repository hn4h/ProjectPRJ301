/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CardDAO;
import dal.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Card;

/**
 *
 * @author 11
 */
@WebServlet(name = "SearchServlet", urlPatterns = { "/search" })
public class SearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        String[] selectedBrands = request.getParameterValues("brand");
        String[] selectedCategories = request.getParameterValues("category");
        String[] priceRange = request.getParameterValues("price-range");
        String sortOption = request.getParameter("sort");
        if(sortOption == null){
            sortOption = "relevance";
        }
        int page = 1;
        int recordsPerPage = 12;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        CardDAO dao = new CardDAO();
        List<Card> cards = dao.searchProducts(searchQuery, selectedBrands, selectedCategories, priceRange, sortOption);
        if (cards.isEmpty()) {
            request.setAttribute("message", "No products found");
        }
        int noOfRecords = cards.size();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("totalPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("cards", cards);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("selectedBrands", selectedBrands);
        request.setAttribute("selectedCategories", selectedCategories);
        request.setAttribute("priceRange", priceRange);
        request.setAttribute("sortOption", sortOption);
        request.getRequestDispatcher("client/search.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        String[] selectedBrands = request.getParameterValues("brand");
        String[] selectedCategories = request.getParameterValues("category");
        String[] priceRange = request.getParameterValues("price-range");
        String sortOption = request.getParameter("sort");
        if(sortOption == null){
            sortOption = "relevance";
        }
        CardDAO dao = new CardDAO();
        List<Card> cards = dao.searchProducts(searchQuery, selectedBrands, selectedCategories, priceRange, sortOption);
        if (cards.isEmpty()) {
            request.setAttribute("message", "No products found");
        }
        request.setAttribute("cards", cards);

        request.setAttribute("sortOption", sortOption);
        request.getRequestDispatcher("client/search.jsp").forward(request, response);
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
