package Vendor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import p1.DBConn;


public class VendorLogin {
	private String email;
	private String pwd;
	
	public VendorLogin(VloginBean ul)
	{
		email= ul.getemail();
		pwd = ul.getpassword();
	}
	public String Vlogin()
	{
		Connection con = null;
		PreparedStatement preparedStatement = null;
		try
		{
		con = DBConn.createConnection();
		String query = "select * from vendor where email=? and pwd=?";
		preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
		preparedStatement.setString(2, pwd);
		preparedStatement.setString(1, email);
		ResultSet rs = preparedStatement.executeQuery();
		
		if (rs.next())  //Just to ensure data has been inserted into the database
		return "SUCCESS"; 
		}
		catch(SQLException e)
		{
		e.printStackTrace();
		}
		
		return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
		}
}
