package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Impl.CustomerDaoImpl;
import POJO.Customer;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String custName;
	String emailId;
	String custPassword;
	String custAddress;
	String contactNo;
	String custLocation;
	Boolean flag;
	String msg,errorMsg;
	
	Customer c1=null;

	CustomerDaoImpl cimpl=new CustomerDaoImpl();
	Customer c=new Customer();
	HttpSession session=null;
       
	RequestDispatcher rd=null;
	
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String process=request.getParameter("process");
		
		session=request.getSession();
		
		if(process!=null&&process.equals("updateCustomer"))
		{
			emailId=(String) session.getAttribute("username");
			c=cimpl.searchByEmailId(emailId);
			
			session.setAttribute("custObj", c);
			response.sendRedirect("UpdateCustDetails.jsp");
			
		}
			
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String process=request.getParameter("process");
		
		if (process!=null&&process.equals("addCustomer")) {
			String firstname=request.getParameter("first_name");
			String lastname=request.getParameter("last_name");
			
			custName=firstname.concat(" "+lastname);
			emailId=request.getParameter("emailId");
			custPassword=request.getParameter("custPassword");
			custAddress=request.getParameter("custAddress");
			contactNo=request.getParameter("contactNo");
			custLocation=request.getParameter("custLocation");
			
			c1=new Customer();
			c1.setCustName(custName);
			c1.setEmailId(emailId);
			c1.setCustPassword(custPassword);
			c1.setCustAddress(custAddress);
			c1.setContactNo(contactNo);
			c1.setCustLocation(custLocation);
			
			flag=cimpl.addCustomer(c1);
			
			if (flag) {
				
				
				msg="Customer Registration Successfully..!!";
				request.setAttribute("msg", msg);
				
				rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
			
		
			} else {
				
				errorMsg="Customer Registration Failed...";
				request.setAttribute("errorMsg", errorMsg);
				
				rd=request.getRequestDispatcher("CustomerRegistration.jsp");
				rd.forward(request, response);	
	
			}
			
			
		} else if(process!=null&&process.equals("updateCustomer")){
			
			emailId=request.getParameter("emailId");	
			custName=request.getParameter("full_name");
			custPassword=request.getParameter("custPassword");
			custAddress=request.getParameter("custAddress");
			contactNo=request.getParameter("contactNo");
			custLocation=request.getParameter("custLocation");
			
			c1=new Customer();
			
			c1.setCustName(custName);
			c1.setEmailId(emailId);
			c1.setCustPassword(custPassword);
			c1.setCustAddress(custAddress);
			c1.setContactNo(contactNo);
			c1.setCustLocation(custLocation);
			
			flag=cimpl.updateCustomer(c1);
			
			if (flag) {
				
				msg="Update Customer Details Successfully...";
				request.setAttribute("msg", msg);
				
				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
				
			
			} else {
			
				errorMsg="Faild to Update Customer Details...";
				request.setAttribute("errorMsg", errorMsg);
				
				rd=request.getRequestDispatcher("UpdateCustDetails.jsp");
				rd.forward(request, response);
			}

		}else {
			
			
		}
	
	}

}
