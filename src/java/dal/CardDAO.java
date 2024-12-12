/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Card;

/**
 *
 * @author 11
 */
public class CardDAO extends DBContext {

    public static void main(String[] args) {
        CardDAO dao = new CardDAO();
//        System.out.println(dao.getTopCardSale(4));
    }

    public List<Card> getTopCardNewFeatures(int top) {
        String sql = "select TOP (?) p.ProductID,p.ProductName,p.Price,i.image_data as image from Products p join ImageProducts i on p.ProductID = i.ProductID  where i.isMain = 1 and  p.isStorage = 0 order by CreatedDate desc";
        List<Card> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, top);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Card card = new Card();
                card.setId(rs.getInt("ProductID"));
                card.setProductName(rs.getString("ProductName"));
                card.setPrice(rs.getDouble("Price"));
                card.setImage(rs.getString("image"));
                list.add(card);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Card> getTopCardBestSeller(int top) {
        String sql = "select TOP (?) p.ProductID, p.ProductName, p.Price,i.image_data as image , count(ci.CartItemID) as CartCount\n"
                + "from CartItems ci\n"
                + "right join ProductItems pi on pi.ProductItemID = ci.ProductItemID\n"
                + "right join Products p on p.ProductID = pi.ProductID\n"
                + "join ImageProducts i on p.ProductID = i.ProductID\n"
                + "where i.isMain = 1 and  p.isStorage = 0\n"
                + "group by p.ProductID, p.ProductName, p.Price, i.image_data\n"
                + "order by CartCount desc";
        List<Card> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, top);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Card card = new Card();
                card.setId(rs.getInt("ProductID"));
                card.setProductName(rs.getString("ProductName"));
                card.setPrice(rs.getDouble("Price"));
                card.setImage(rs.getString("image"));
                list.add(card);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Card> searchProducts(String searchQuery, String[] selectedBrands, String[] selectedCategories, String[] priceRange, String sortOption) {
        String sql = "select p.ProductID, p.ProductName, p.Price, i.image_data as image\n"
                + "from Products p\n"
                + "join ImageProducts i on p.ProductID = i.ProductID\n"
                + "join ProductItems pi on pi.ProductID = p.ProductID\n"
                + "join Brands b on b.BrandID = p.BrandID\n"
                + "join CategoryProduct c on c.ProductID = p.ProductID\n"
                + "where i.isMain = 1 and  p.isStorage = 0 \n";
        if (searchQuery != null && !searchQuery.isEmpty()) {
            sql += "and p.ProductName like ?\n";
        }
        if (selectedBrands != null && selectedBrands.length > 0) {
            sql += "and b.BrandID in (";
            for (int i = 0; i < selectedBrands.length; i++) {
                sql += "?";
                if (i < selectedBrands.length - 1) {
                    sql += ",";
                }
            }
            sql += ")\n";
        }
        if (selectedCategories != null && selectedCategories.length > 0) {
            sql += "and c.CategoryID in (";
            for (int i = 0; i < selectedCategories.length; i++) {
                sql += "?";
                if (i < selectedCategories.length - 1) {
                    sql += ",";
                }
            }
            sql += ")\n";
        }
        if (priceRange != null && priceRange.length > 0) {
            sql += "and (";
            for (int i = 0; i < priceRange.length; i++) {
                if (i < priceRange.length - 1) {
                    sql += "p.Price between ? and ? or ";
                }
            }
            sql += "p.Price between ? and ?)\n";
        }
        sql += "group by p.ProductID, p.ProductName, p.Price, i.image_data\n";
        switch (sortOption) {
            case "price-asc":
               sql += "order by p.Price asc"; 
                break;
            case "price-desc":
                sql += "order by p.Price desc";
                break;
            case "name-asc":
                sql += "order by p.ProductName asc";
                break;
            case "name-desc":
                sql += "order by p.ProductName desc";
                break;
            default:
            sql += "order by p.ProductID asc";
                break;
        }
        List<Card> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int index = 1;
            if (searchQuery != null && !searchQuery.isEmpty()) {
                st.setString(index++, "%" + searchQuery + "%");
            }
            if (selectedBrands != null && selectedBrands.length > 0) {
                for (String brand : selectedBrands) {
                    st.setInt(index++, Integer.parseInt(brand));
                }
            }
            if (selectedCategories != null && selectedCategories.length > 0) {
                for (String category : selectedCategories) {
                    st.setInt(index++, Integer.parseInt(category));
                }
            }
            if (priceRange != null && priceRange.length > 0) {
                for(String price : priceRange){
                    String[] prices = price.split("-");
                    st.setDouble(index++, Double.parseDouble(prices[0]));
                    st.setDouble(index++, Double.parseDouble(prices[1]));
                }
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Card card = new Card();
                card.setId(rs.getInt("ProductID"));
                card.setProductName(rs.getString("ProductName"));
                card.setPrice(rs.getDouble("Price"));
                card.setImage(rs.getString("image"));
                list.add(card);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Card> getTopCardRelateCards(int top){
        String sql = "select TOP (?) p.ProductID, p.ProductName, p.Price, i.image_data as image\n"
                + "from Products p\n"
                + "join ImageProducts i on p.ProductID = i.ProductID\n"
                + "where i.isMain = 1 and p.isStorage = 0\n"
                + "order by NEWID()";
        List<Card> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, top);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Card card = new Card();
                card.setId(rs.getInt("ProductID"));
                card.setProductName(rs.getString("ProductName"));
                card.setPrice(rs.getDouble("Price"));
                card.setImage(rs.getString("image"));
                list.add(card);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
