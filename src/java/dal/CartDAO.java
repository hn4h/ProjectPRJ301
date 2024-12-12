/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;

/**
 *
 * @author 11
 */
public class CartDAO extends DBContext {

    public List<CartItem> getCartItems(int accountID) {
        String sql = "Select p.productID, c.CartItemID, p.ProductName, i.image_data as image, p.Price, c.quantity,pi.Size\n"
                + "  from CartItems c\n"
                + "  join ProductItems pi on pi.ProductItemID = c.ProductItemID\n"
                + "  join Products p on p.ProductID = pi.ProductID\n"
                + "  join ImageProducts i on i.ProductID = p.ProductID\n"
                + "  where i.isMain = 1 and c.isOrder = 0 \n"
                + "  and [AccountID] = ? order by CartItemID asc";
        List<CartItem> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartItem item = new CartItem();
                item.setId(rs.getInt("CartItemID"));
                item.setName(rs.getString("ProductName"));
                item.setQuantity(rs.getInt("Quantity"));
                item.setPrice(rs.getDouble("Price"));
                item.setImage(rs.getString("image"));
                item.setSize(rs.getInt("size"));
                item.setProductID(rs.getInt("productID"));
                item.setTotalPrice(item.getPrice()* item.getQuantity());
                list.add(item);
                // System.out.println(item);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public void setCartItemIsOrder(int id){
        String sql = "update CartItems set isOrder = 1 where CartItemID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        System.out.println(dao.getCartItems(2));
    }

    public void deleteCartItem(int cartItemID) {
        String sql = "delete from CartItems where CartItemID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartItemID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addCartItem(int accountID, int productItemID, int quantity) {
        String sql = "insert into CartItems (CartItemID,AccountID,ProductItemID,quantity) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, this.getNextCartItemID());
            st.setInt(2, accountID);
            st.setInt(3, productItemID);
            st.setInt(4, quantity);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getNextCartItemID() {
        String sql = "Select max(CartItemID) from CartItems";
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

    public CartItem getCartItemByID(int id) {
        String sql = "Select c.CartItemID, p.ProductName, i.image_data as image, p.Price, c.quantity,pi.Size\n"
                + "  from CartItems c\n"
                + "  join ProductItems pi on pi.ProductItemID = c.ProductItemID\n"
                + "  join Products p on p.ProductID = pi.ProductID\n"
                + "  join ImageProducts i on i.ProductID = p.ProductID\n"
                + "  where i.isMain = 1\n"
                + "  and c.CartItemID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                CartItem item = new CartItem();
                item.setId(rs.getInt("CartItemID"));
                item.setName(rs.getString("ProductName"));
                item.setQuantity(rs.getInt("Quantity"));
                item.setPrice(rs.getDouble("Price"));
                item.setImage(rs.getString("image"));
                item.setSize(rs.getInt("size"));
                item.setTotalPrice(item.getPrice()* item.getQuantity());
                return item;
                // System.out.println(item);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
