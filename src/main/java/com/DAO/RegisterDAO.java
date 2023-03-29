package com.DAO;
import java.sql.*;
import java.util.LinkedList;
import com.Modal.User;
import com.util.DBUtil;
public class RegisterDAO {
	public static User selectUser(String userId)
	{
		User user = null;
		
		Connection con = DBUtil.getConnection();
		String query = "Select fname,lname,email,mobileNum,age FROM user where userId=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, Integer.parseInt(userId));
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				user = new User(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5));

			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user.setUserId(Integer.parseInt(userId));
		return user;
	}
	 public static boolean addUser(User user) throws SQLException
	 {
		 //DBUtil db = new DBUtil();
		 int status=0;
		 Connection con = DBUtil.getConnection();
		 String query = "insert into User(fname,lname,email,mobileNum,age) values(?,?,?,?,?)";
		 try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getFname());
			ps.setString(2, user.getLname());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getMobileNum());
			ps.setInt(5, user.getAge());
			 status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();}
		 //con.close();
		 if(status==1)
		     return true;
		 else
			 return false;
		 
	 }
	 public static boolean updateUser(User user) throws SQLException
	 {
		 int status=0;
		 DBUtil db = new DBUtil();
		 Connection con = db.getConnection();
		 String query = "Update user set fname=?,lname=?,email=?,mobileNum=?,age=? where UserId=?";
		 try {
			PreparedStatement ps = con.prepareStatement(query);
		    ps.setString(1, user.getFname());
		    ps.setString(2, user.getLname());
		    ps.setString(3, user.getEmail());
		    ps.setString(4, user.getMobileNum());
		    ps.setInt(5,user.getAge());
		    ps.setInt(6,user.getUserId());
		     status = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 con.close();
		 if(status==1)
		     return true;
		 else
			 return false;
	 }
	 public static boolean deleteUser(String userId)
	 {
		 int f=0;
		 Connection con = DBUtil.getConnection();
		 String query = "DELETE from user where userId=?";
		 try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, Integer.parseInt(userId));
			f= ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 if(f==1)
			 return true;
		 else
			 return false;
		 
	 }
	 public static LinkedList<User> selectUsers() throws SQLException
	 {
		// DBUtil db = new DBUtil();
		 LinkedList<User> users = new LinkedList<>();
		 Connection con = DBUtil.getConnection();
		 PreparedStatement ps = con.prepareStatement("Select UserId,fname,lname,email,mobileNum,age FROM user");
		 ResultSet rs = ps.executeQuery();
		 while(rs.next())
		 {
			 User user = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6));
//			 user.setUserId(rs.getInt(1));
//			 user.setFname(rs.getString(2));
//			 user.setLname(rs.getString(3));
//			 user.setEmail(rs.getString(4));
//			 user.setMobileNum(rs.getString(5));
//			 user.setAge(rs.getInt(6));
			 users.add(user);
		 }
		 return users;
	 }
 //public static void main(String[] args) throws SQLException {
//	 User user1 = new User(102,"Bindhu","Shaar","bindhuil.com","6789346761",7);
//	 RegisterDAO.addUser(user1);
//	 LinkedList<User> user = RegisterDAO.selectUsers();
//	 int l = user.size();
//	 while(l>0)
//	 {
//		 System.out.println( (User)user.get(l-1));
//		 l--;
//	 }
//}
}
