/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.assignment.lecturer;

import controller.authentication.BaseRequiredAuthenticationController;
import controller.authentication.authorization.BaseRBACController;
import dal.assignement.LessionDBContext;
import dal.assignement.Role;
import dal.assignement.TimeSlotDBContext;
import entity.Account;
import entity.assignment.Lession;
import entity.assignment.TimeSlot;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.sql.*;
import util.DateTimeHelper;

/**
 *
 * @author sonnt
 */
public class TimeTableController extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account,ArrayList<Role> roles) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account,ArrayList<Role> roles) throws ServletException, IOException {
        int lid = Integer.parseInt(req.getParameter("id"));
        TimeSlotDBContext timeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.list();
        
        
        String raw_from = req.getParameter("from");
        String raw_to = req.getParameter("to");
        Date from = null;
        Date to = null;
        java.util.Date today = new java.util.Date();
        if(raw_from ==null)
        {
           from = DateTimeHelper.convertUtilToSql(DateTimeHelper.getBeginningOfWeek(today));
        }
        else
        {
           from = Date.valueOf(raw_from);
        }
        
        if(raw_to == null)
        {
           java.util.Date beginWeek = DateTimeHelper.getBeginningOfWeek(today);
           to= DateTimeHelper.convertUtilToSql(DateTimeHelper.addDaysToDate(beginWeek, 6));
        }
        else
        {
            to = Date.valueOf(raw_to);
        }
        
        LessionDBContext lessDB = new LessionDBContext();
        ArrayList<Lession> lessions = lessDB.getLessionBy(lid, from, to);
        
        req.setAttribute("dates", DateTimeHelper.toList(from, to));
        req.setAttribute("from", from);
        req.setAttribute("to", to);
        req.setAttribute("slots", slots);
        req.setAttribute("lessions", lessions);
        req.getRequestDispatcher("../view/lecturer/timetable.jsp").forward(req, resp);
    }
    
}
