package Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import DAO.ContactDao;
import POJO.ContactUs;
import Utility.DButility;

public class ContactDaoImpl implements ContactDao {

	@Override
	public boolean addreview(ContactUs c) {
		try {
			Connection con=DButility.getConnect();
			
			String sql="insert into reviews(CustName,CustEmail,CustPhoneNo,Messages) values(?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, c.getCustName());
			ps.setString(2, c.getCustEmail());
			ps.setString(3, c.getCustPhoneNo());
			ps.setString(4, c.getMessages());
			
			int i=ps.executeUpdate();
			if(i>0)
				return true;
			else
				return false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<ContactUs> ShowReview() {
		
		List<ContactUs> clist=new LinkedList<ContactUs>();
		try {
			Connection con=DButility.getConnect();
			
			String sql="select * from reviews";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			
			while (rs.next()) {
				ContactUs c=new ContactUs();
				c.setSrNo(rs.getInt(1));
				c.setCustName(rs.getString(2));
				c.setCustEmail(rs.getString(3));
				c.setCustPhoneNo(rs.getString(4));
				c.setMessages(rs.getString(5));
				clist.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return clist;
	}

	@Override
	public boolean deletereview(int srno) {

		try {
			Connection con=DButility.getConnect();
			String sql="delete from reviews where Sr_No=?";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setInt(1, srno);
			
			int i=ps.executeUpdate();
			if(i>0)
				return true;
			else 
				return false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
