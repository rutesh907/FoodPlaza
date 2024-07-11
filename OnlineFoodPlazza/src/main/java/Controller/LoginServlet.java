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
import Impl.LoginDaoImpl;
import POJO.Customer;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	LoginDaoImpl limp=new LoginDaoImpl();
	boolean flag;
	HttpSession session=null;
	RequestDispatcher rd=null;
	String login,msg,errorMsg;
	
	public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession();
		
		session.invalidate();
		msg="You have logged out successfully..!!!";
		request.setAttribute("msg", msg);
		
		rd=request.getRequestDispatcher("MyIndex.jsp");
		rd.forward(request, response);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("emailId");
		String password=request.getParameter("custPassword");
		
		session=request.getSession();
		
		flag=limp.userLogin(username, password);
		
		
	if (flag) {
		login="customer";
		
		Customer c=new CustomerDaoImpl().searchByEmailId(username);
	
		msg="Welcome to our website "+c.getCustName();
		
		session.setAttribute("login",login);
		request.setAttribute("msg", msg);
		session.setAttribute("username",username);
		
		
		rd=request.getRequestDispatcher("MyIndex.jsp");
		rd.forward(request, response);
		
		
	} else {
		
		flag=limp.adminLogin(username, password);
		if (flag) {
			login="admin";
		
			msg="Welcome to our website. you have logged in as ADMIN";
			
			session.setAttribute("login",login);
			request.setAttribute("msg", msg);
			session.setAttribute("username",username);
			
			rd=request.getRequestDispatcher("MyIndex.jsp");
			rd.forward(request, response);
			
			
		} else {
			
			login=null;
			
			
			errorMsg="Invalid credentials. Please check the username and password given..!!!";
			request.setAttribute("errorMsg", errorMsg);
			session.setAttribute("login",login);
			rd=request.getRequestDispatcher("Login.jsp");
			rd.include(request, response);
			

			
		}
		
	}
	
	
	}

}
