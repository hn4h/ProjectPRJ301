/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
/**
 *
 * @author 11
 */
public class BrandDAO extends DBContext{
   public List<Brand> getAllBrands() {
        String sql = "select * from Brands";
        List<Brand> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand();
                brand.setId(rs.getInt("BrandID"));
                brand.setBrandName(rs.getString("BrandName"));
                list.add(brand);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        BrandDAO dao = new BrandDAO();
        System.out.println(dao.getAllBrands());
    } 
    public void addBrand(String brandName) {
        String sql = "insert into Brands(BrandID, BrandName) values(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, this.getNextBrandID());
            st.setString(2, brandName);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    private int getNextBrandID() {
        String sql = "select max(BrandID) from Brands";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 1;
    }
    public Brand getBrandById(int id) {
        String sql = "select * from Brands where BrandID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Brand brand = new Brand();
                brand.setId(rs.getInt("BrandID"));
                brand.setBrandName(rs.getString("BrandName"));
                return brand;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public void updateBrand(int id, String name) {
        String sql = "update Brands set BrandName = ? where BrandID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
