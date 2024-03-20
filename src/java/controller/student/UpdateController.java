/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.student;

import dal.DepartmentDBContext;
import dal.StudentDBContext;
import entity.Department;
import entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author sonnt
 */
public class UpdateController extends HttpServlet {
   
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        StudentDBContext stuDB = new StudentDBContext();
        DepartmentDBContext deptDB = new DepartmentDBContext();
        
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = stuDB.get(id);
        
        ArrayList<Department> depts = deptDB.list();
        
        request.setAttribute("depts", depts);
        request.setAttribute("student", student);
        request.getRequestDispatcher("../view/student/update.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        StudentDBContext db = new StudentDBContext();
        Student s = new Student();
        Department d = new Department();
        d.setId(Integer.parseInt(request.getParameter("did")));
        s.setDept(d);
        
        s.setId(Integer.parseInt(request.getParameter("id")));
        s.setName(request.getParameter("name"));
        s.setGender(request.getParameter("gender").equals("male"));
        s.setDob(Date.valueOf(request.getParameter("dob")));
        
        db.update(s);
        response.sendRedirect("list");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
