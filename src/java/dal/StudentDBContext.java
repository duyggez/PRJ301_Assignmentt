/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Department;
import entity.Student;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt
 */
public class StudentDBContext extends DBContext<Student> {

    @Override
    public ArrayList<Student> list() {
        ArrayList<Student> students = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT  \n"
                    + "	s.id,s.name,s.gender,s.dob\n"
                    + "	,s.did, d.name as dname\n"
                    + "FROM Student s INNER JOIN Department d ON s.did = d.id";
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                s.setDept(d);

                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!stm.isClosed()) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;
    }
    
    public ArrayList<Student> searchByDid(int did)
    {
         ArrayList<Student> students = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT  \n"
                    + "	s.id,s.name,s.gender,s.dob\n"
                    + "	,s.did, d.name as dname\n"
                    + "FROM Student s INNER JOIN Department d ON s.did = d.id";
            
            if(did != 0)
            {
                sql+= " WHERE s.did = ?";
            }
            stm = connection.prepareStatement(sql);
            if(did != 0)
            {
                stm.setInt(1, did);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                s.setDept(d);

                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!stm.isClosed()) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;
    }

    @Override
    public void insert(Student entity) {
        try {
            String sql = "INSERT INTO [Student]\n"
                    + "           ([id]\n"
                    + "           ,[name]\n"
                    + "           ,[gender]\n"
                    + "           ,[dob]\n"
                    + "           ,[did])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getId());
            stm.setString(2, entity.getName());
            stm.setBoolean(3, entity.isGender());
            stm.setDate(4, entity.getDob());
            stm.setInt(5, entity.getDept().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void update(Student entity) {
        try {
            String sql = "UPDATE [Student]\n"
                    + "   SET \n"
                    + "      [name] = ?\n"
                    + "      ,[gender] = ?\n"
                    + "      ,[dob] = ?\n"
                    + "      ,[did] = ?\n"
                    + " WHERE [id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(5, entity.getId());
            stm.setString(1, entity.getName());
            stm.setBoolean(2, entity.isGender());
            stm.setDate(3, entity.getDob());
            stm.setInt(4, entity.getDept().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void delete(Student entity) {
        try {
            String sql = "DELETE Student\n"
                    + " WHERE [id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Student get(int id) {
        PreparedStatement stm = null;
        try {
            String sql = "SELECT  \n"
                    + "	s.id,s.name,s.gender,s.dob\n"
                    + "	,s.did, d.name as dname\n"
                    + "FROM Student s INNER JOIN Department d ON s.did = d.id WHERE s.id =?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                s.setDept(d);

                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!stm.isClosed()) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

}
