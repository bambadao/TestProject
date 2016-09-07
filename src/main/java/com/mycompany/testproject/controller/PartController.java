package com.mycompany.testproject.controller;

import com.mycompany.testproject.dao.PartDao;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PartController extends HttpServlet {
    
    private PartDao dao;

    public PartController() {
        super();
        dao = new PartDao();
    }   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String vendor = request.getParameter("vendor");
        Integer qty;
        try {
            qty = Integer.parseInt(request.getParameter("qty"));
        } catch (Exception e) {
            qty = Integer.MIN_VALUE;
        } 
        
        SimpleDateFormat format = new SimpleDateFormat("MMM dd, yyyy", Locale.ENGLISH);
        Date shipAfter;
        try {
            shipAfter = format.parse(request.getParameter("shipAfter"));
        } catch (Exception e) {
            shipAfter = null;
        }
        Date shipBefore;
        try {            
            shipBefore = format.parse(request.getParameter("shipBefore"));
        } catch (Exception e) {
            shipBefore = null;
        }
        Date recAfter;
        try {            
            recAfter = format.parse(request.getParameter("recAfter"));
        } catch (Exception e) {
            recAfter = null;
        }
        Date recBefore;
        try {            
            recBefore = format.parse(request.getParameter("recBefore"));
        } catch (Exception e) {
            recBefore = null;
        }
        
        request.setAttribute("parts", dao.getPartSeacrch(name, number, vendor, qty, shipAfter, shipBefore, recAfter, recBefore));
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
