/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;
import model.ProductCatalog;

/**
 *
 * @author 11
 */
public class ProductDAO extends DBContext {

    public Product getProductByID(int id) {
        String sql = "select p.ProductID,p.ProductCode, p.ProductName, p.Price, p.Description as description ,b.BrandID, b.BrandName from Products p join Brands b on p.BrandID = b.BrandID join ImageProducts i on i.ProductID = p.ProductID where p.productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setProductCode(rs.getString("ProductCode"));
                product.setDescription(rs.getString("description"));
                product.setBrand(new Brand(rs.getInt("BrandID"), rs.getString("BrandName")));
                product.setPrice(rs.getDouble("Price"));
                product.setCategories(this.getCategories(id));
                product.setImages(this.getImage(id));
                product.setProductCatalogs(this.getProductCatalogs(id));
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    private List<Category> getCategories(int id) {
        List<Category> list = new ArrayList<>();
        String sql = "select c.CategoryID, c.CategoryName from CategoryProduct cp join Categories c on c.CategoryID = cp.CategoryID where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    private List<String> getImage(int id) {
        List<String> list = new ArrayList<>();
        String sql = "select image_data from ImageProducts where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("image_data"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        dao.addImage(52);
    }

    private List<ProductCatalog> getProductCatalogs(int id) {
        List<ProductCatalog> list = new ArrayList<>();
        String sql = "SELECT [ProductItemID],[Size],[StockQuantity],[ReleaseDate] FROM [ProjectPRJ301].[dbo].[ProductItems] where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new ProductCatalog(rs.getInt("ProductItemID"), rs.getInt("Size"), rs.getInt("StockQuantity"), rs.getDate("ReleaseDate")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    private void addImage(int id) {
        String sql = "insert into ImageProducts(id,ProductID, isMain) values(?, ?, 1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, this.getNextImageID());
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    private int getNextImageID() {
        String sql = "select max(id) as max from ImageProducts";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("max") + 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    private void deleteImage(int id) {
        String sql = "delete from ImageProducts where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.ProductID,p.ProductCode, p.ProductName, p.Price, p.Description as description ,b.BrandID, b.BrandName, p.isStorage from Products p join Brands b on p.BrandID = b.BrandID join ImageProducts i on i.ProductID = p.ProductID where i.isMain = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setProductCode(rs.getString("ProductCode"));
                product.setDescription(rs.getString("description"));
                product.setBrand(new Brand(rs.getInt("BrandID"), rs.getString("BrandName")));
                product.setPrice(rs.getDouble("Price"));
                product.setCategories(this.getCategories(rs.getInt("productID")));
                product.setImages(this.getImage(rs.getInt("productID")));
                product.setProductCatalogs(this.getProductCatalogs(rs.getInt("productID")));
                product.setIsStorage(rs.getBoolean("isStorage"));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println(list.size());
        return list;
    }
    public void updateProduct(int id, String productName, String productCode, int brandID, double price, String isStorage, String[] categories, String description) {
        String sql = "update Products set ProductName = ?, ProductCode = ?, BrandID = ?, Price = ?, isStorage = ?, Description = ?  where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productName);
            st.setString(2, productCode);
            st.setInt(3, brandID);
            st.setDouble(4, price);
            st.setString(5, isStorage);
            st.setString(6, description);
            st.setInt(7, id);
            st.executeUpdate();
            this.updateCategories(id, categories);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void updateCategories(int id, String[] categories) {
        String sql = "delete from CategoryProduct where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            this.insertCategories(id, categories);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void insertCategories(int id, String[] categories) {
        String sql = "insert into CategoryProduct(id,CategoryID, ProductID) values(?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int nextID = this.getMaxCategoryID() + 1;
            for (String category : categories) {
                System.out.println(nextID);
                st.setInt(1, nextID++);
                st.setInt(3, id);
                st.setInt(2, Integer.parseInt(category));
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    private int getMaxCategoryID() {
        String sql = "select max(id) as max from CategoryProduct";
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
    public void addProduct(String name, String code, String price, String brand, String[] categories, String isStorage, String description) {
        String sql = "insert into Products(ProductID,ProductName, ProductCode, Price, BrandID, isStorage, Description) values(?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int id = this.getNextProductID();
            st.setInt(1, id);
            st.setString(2, name);
            st.setString(3, code);
            st.setDouble(4, Double.parseDouble(price));
            st.setInt(5, Integer.parseInt(brand));
            if (isStorage == null || isStorage.equals("false")) {
            st.setBoolean(6, false);
            } else {
                st.setBoolean(6, true);
            }
            st.setString(7, description);
            st.executeUpdate();
            this.insertCategories(id, categories);
            this.addImage(id);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public int getNextProductID() {
        String sql = "select max(ProductID) as max from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("max") + 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    public void deleteProduct(int id) {
        String sql = "delete from Products where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            this.deleteImage(id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
