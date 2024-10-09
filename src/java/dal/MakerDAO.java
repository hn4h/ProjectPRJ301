/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Maker;

/**
 *
 * @author 11
 */
public class MakerDAO extends DBContext {

    public List<Maker> getAll() {
        List<Maker> list = new ArrayList<>();
        String sql = "Select * from Makers";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Maker m = new Maker();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("Name"));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int delete(int id) {
        String sql = "delete from Makers where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    //check exist
    public Maker getMakerByID(int id) {
        String sql = "select * from Makers where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Maker m = new Maker();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                return m;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(Maker m) {
        String sql = "insert into Makers values(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, m.getId());
            st.setString(2, m.getName());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getMaxID() {
        String sql = "select max(id) as max from Makers";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("max");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void update(Maker m) {
        String sql = "update Makers set name=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, m.getName());
            st.setInt(2, m.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
