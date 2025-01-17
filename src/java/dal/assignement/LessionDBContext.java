/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.assignement;

import dal.DBContext;
import entity.assignment.Student;
import entity.assignment.Attendence;
import entity.assignment.Lecturer;
import entity.assignment.Lession;
import entity.assignment.Room;
import entity.assignment.StudentGroup;
import entity.assignment.Subject;
import entity.assignment.TimeSlot;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt
 */
public class LessionDBContext extends DBContext<Lession> {

    public void takeAttendance(int leid, ArrayList<Attendence> atts) {
        try {
            connection.setAutoCommit(false);
            String sql_remove_atts = "DELETE Attendence WHERE leid = ?";
            PreparedStatement stm_remove_atts = connection.prepareStatement(sql_remove_atts);
            stm_remove_atts.setInt(1, leid);
            stm_remove_atts.executeUpdate();

            String sql_insert_att = "INSERT INTO [Attendence]\n"
                    + "           ([leid]\n"
                    + "           ,[sid]\n"
                    + "           ,[description]\n"
                    + "           ,[isPresent]\n"
                    + "           ,[capturedtime])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE())";
            for (Attendence att : atts) {
                PreparedStatement stm_insert_att = connection.prepareStatement(sql_insert_att);
                stm_insert_att.setInt(1, leid);
                stm_insert_att.setInt(2, att.getStudent().getId());
                stm_insert_att.setString(3, att.getDescription());
                stm_insert_att.setBoolean(4, att.isPresent());
                stm_insert_att.executeUpdate();
            }
            
            String sql_update_less = "UPDATE Lession SET isAttended = 1 WHERE leid = ?";
            PreparedStatement stm_update_less = connection.prepareStatement(sql_update_less);
            stm_update_less.setInt(1, leid);
            stm_update_less.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Attendence> getAttendencesByLession(int leid) {
        ArrayList<Attendence> atts = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "s.sid,s.sname,\n"
                    + "a.aid,a.isPresent,a.description,a.capturedtime\n"
                    + "FROM Student s INNER JOIN Enrollment e ON s.sid = e.sid\n"
                    + "						INNER JOIN StudentGroup g ON g.gid = e.gid\n"
                    + "						INNER JOIN Lession les ON les.gid = g.gid\n"
                    + "						LEFT JOIN Attendence a ON les.leid = a.leid\n"
                    + "						AND a.sid = s.sid\n"
                    + "WHERE les.leid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, leid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendence att = new Attendence();
                Student s = new Student();
                Lession les = new Lession();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                att.setStudent(s);

                les.setId(leid);
                att.setLession(les);

                att.setId(rs.getInt("aid"));
                if (att.getId() != 0) {
                    att.setDescription(rs.getString("description"));
                    att.setPresent(rs.getBoolean("isPresent"));
                    att.setTime(rs.getTimestamp("capturedtime"));
                }
                atts.add(att);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    public ArrayList<Lession> getLessionBy(int lid, Date from, Date to) {
        ArrayList<Lession> lessions = new ArrayList<>();
        try {

            String sql = "SELECT \n"
                    + "le.leid,le.date,le.isAttended,\n"
                    + "g.gid,g.gname,su.subid,su.suname,\n"
                    + "t.tid,t.tname,\n"
                    + "r.rid,r.rname,\n"
                    + "l.lid,l.lname\n"
                    + "FROM Lession le INNER JOIN StudentGroup g ON le.gid = g.gid\n"
                    + "						INNER JOIN TimeSlot t ON t.tid = le.tid\n"
                    + "						INNER JOIN Room r ON r.rid = le.rid\n"
                    + "						INNER JOIN Lecturer l ON le.lid = l.lid\n"
                    + "						INNER JOIN [Subject] su ON su.subid = g.subid\n"
                    + "WHERE l.lid=? AND le.[date] >= ? AND le.[date] <=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lession le = new Lession();
                StudentGroup g = new StudentGroup();
                Subject sub = new Subject();
                Lecturer l = new Lecturer();
                Room r = new Room();
                TimeSlot slot = new TimeSlot();
                le.setId(rs.getInt("leid"));
                le.setDate(rs.getDate("date"));
                le.setAttended(rs.getBoolean("isAttended"));

                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("suname"));
                g.setSubject(sub);
                le.setGroup(g);

                slot.setId(rs.getInt("tid"));
                slot.setName(rs.getString("tname"));
                le.setSlot(slot);

                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("rname"));
                le.setRoom(r);

                l.setId(lid);
                l.setName(rs.getString("lname"));
                le.setLecturer(l);

                lessions.add(le);
            }

        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessions;
    }

    @Override
    public ArrayList<Lession> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Lession entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lession entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lession entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lession get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
