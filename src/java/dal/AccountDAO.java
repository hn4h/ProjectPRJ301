/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.PasswordUtil;

/**
 *
 * @author 11
 */
public class AccountDAO extends DBContext{
    public Account checkAuthen(String username, String password){
        String sql = "Select * from Accounts where username = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                if(PasswordUtil.verifyPassword(password, rs.getString("HashedPassword"))){
                    Account account = new Account();
                    account.setUserName(rs.getString("username"));
                    account.setHashedPassword(rs.getString("HashedPassword"));
                    account.setAccountID(rs.getInt("accountID"));
                    account.setCreatedDate(rs.getDate("createdDate").toString());
                    account.setProfileImage(rs.getString("profileImage"));
                    account.setRole(rs.getInt("role"));
                    account.setPhoneNumber(rs.getString("phoneNumber"));
                    account.setAddress(rs.getString("address"));
                    account.setEmail(rs.getString("email"));
                    account.setFirstName(rs.getString("firstName"));
                    account.setLastName(rs.getString("lastName"));
                    return account;
                }
            }
            return null;
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    public void createAccount(String username, String password, String email, String firstName, String lastName){
        String hashedPassword = PasswordUtil.hashPassword(password);
        String sql = "INSERT INTO Accounts(AccountID, UserName, HashedPassword,role , FirstName, LastName, email) values (?,?,?,?,?,?,?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, getNextAccountID());
            st.setString(2, username);
            st.setString(3, hashedPassword);
            st.setInt(4, 1);
            st.setString(5, firstName);
            st.setString(6, lastName);
            st.setString(7, email);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    public boolean checkUsername(String username){
        String sql = "Select * from Accounts where username = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            return rs.next();
        }catch(SQLException e){
            System.out.println(e);
        }
        return false;
    }
    public int getNextAccountID(){
        String sql = "Select max(AccountID) from Accounts";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return rs.getInt(1)+1;
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return 0;
    }
    public static void main(String[] args){
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.checkAuthen("admin", "admin"));
    }
}
