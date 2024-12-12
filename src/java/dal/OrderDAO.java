/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author 11
 */
public class OrderDAO extends DBContext {
    public void updateOrderStatus(int id, String status) {
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [status] = ?\n"
                + " WHERE OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public int addOrder(int AccountID, double TotalAmount, String status, String phone, String name,
            String note, String paymentMethod, String ShippingAddress) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([OrderID]\n"
                + "           ,[AccountID]\n"
                + "           ,[TotalAmount]\n"
                + "           ,[status]\n"
                + "           ,[phone]\n"
                + "           ,[name]\n"
                + "           ,[note]\n"
                + "           ,[paymentMethod]\n"
                + "           ,[ShippingAddress])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int id = this.getNextOrderID();
            st.setInt(1, id);
            st.setInt(2, AccountID);
            st.setDouble(3, TotalAmount);
            st.setString(4, status);
            st.setString(5, phone);
            st.setString(6, name);
            st.setString(7, note);
            st.setString(8, paymentMethod);
            st.setString(9, ShippingAddress);
            st.executeUpdate();
            System.out.println("Order Added");
            return id;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    private int getNextOrderID() {
        String sql = "SELECT MAX(OrderID) as OrderID FROM Orders";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("OrderID") + 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 1;
    }

    public void addItemToOrder(int orderID, List<CartItem> list) {
        String sql = "INSERT INTO [dbo].[OrderItems]\n"
                + "           ([OrderItemID]\n"
                + "           ,[OrderID]\n"
                + "           ,[CartItemID]\n"
                + "           ,[Price])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            for (CartItem item : list) {
                st.setInt(1, this.getNextOrderItemID());
                st.setInt(2, orderID);
                st.setInt(3, item.getId());
                CartDAO dao = new CartDAO();
                dao.setCartItemIsOrder(item.getId());
                st.setDouble(4, item.getPrice());
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private int getNextOrderItemID() {
        String sql = "SELECT MAX(OrderItemID) as OrderItemID FROM OrderItems";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("OrderItemID") + 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 1;
    }

    public static void main(String[] args) {
        OrderDAO d = new OrderDAO();
        System.out.println(d.getNextOrderID());
        d.addOrder(1, 100, "Pending", "123456789", "Nguyen Van A", "Note", "COD", "123 Nguyen Van Linh");
    }

    public List<Order> getOrdersByAccountID(int accountID) {
        String sql = "SELECT * FROM Orders WHERE AccountID = ?";
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderID(rs.getInt("OrderID"));
                o.setAccountID(rs.getInt("AccountID"));
                o.setOrderedDate(rs.getDate("OrderedDate"));
                o.setTotalAmount(rs.getDouble("TotalAmount"));
                o.setStatus(rs.getString("status"));
                o.setPhoneNumber(rs.getString("phone"));
                o.setName(rs.getString("name"));
                o.setNote(rs.getString("note"));
                o.setPaymentMethod(rs.getString("paymentMethod"));
                o.setAddress(rs.getString("ShippingAddress"));
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getOrderFromAdmin() {
        String sql = "SELECT * FROM Orders";
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderID(rs.getInt("OrderID"));
                o.setAccountID(rs.getInt("AccountID"));
                o.setOrderedDate(rs.getDate("OrderedDate"));
                o.setTotalAmount(rs.getDouble("TotalAmount"));
                o.setStatus(rs.getString("status"));
                o.setPhoneNumber(rs.getString("phone"));
                o.setName(rs.getString("name"));
                o.setNote(rs.getString("note"));
                o.setPaymentMethod(rs.getString("paymentMethod"));
                o.setAddress(rs.getString("ShippingAddress"));
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public OrderDetail getOrderDetailByID(int id) {
        String sql = "SELECT * FROM Orders WHERE OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                OrderDetail o = new OrderDetail();
                o.setId(rs.getInt("OrderID"));
                o.setName(rs.getString("name"));
                o.setAddress(rs.getString("ShippingAddress"));
                o.setPhoneNumber(rs.getString("phone"));
                o.setPaymentMethod(rs.getString("paymentMethod"));
                o.setTotalAmount(rs.getDouble("TotalAmount"));
                o.setOrderedDate(rs.getDate("OrderedDate"));
                o.setStatus(rs.getString("status"));
                o.setNote(rs.getString("note"));
                o.setList(listOrderItemByOrderID(id));
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    private List<CartItem> listOrderItemByOrderID(int id) {
        String sql = "Select p.ProductName, ip.image_data as image, p.Price, c.quantity,pi.Size \n"
                + "from Orders o\n"
                + "join OrderItems i on o.OrderID = i.OrderID\n"
                + "join CartItems c on c.CartItemID = i.CartItemID\n"
                + "join ProductItems pi on pi.ProductItemID = c.ProductItemID\n"
                + "join Products p on p.ProductID = pi.ProductID\n"
                + "join ImageProducts ip on ip.ProductID = p.ProductID\n"
                + "where ip.isMain = 1 and c.isOrder = 1 and o.OrderID = ?";
        List<CartItem> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartItem item = new CartItem();
                item.setName(rs.getString("ProductName"));
                item.setQuantity(rs.getInt("Quantity"));
                item.setPrice(rs.getDouble("Price"));
                item.setImage(rs.getString("image"));
                item.setSize(rs.getInt("size"));
                item.setTotalPrice(item.getPrice() * item.getQuantity());
                list.add(item);
                // System.out.println(item);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
