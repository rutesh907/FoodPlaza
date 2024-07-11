package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Impl.ContactDaoImpl;
import POJO.ContactUs;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    int SrNo;
    String CustName;   
    String CustEmail;
    String CustPhoneNo; 
    String Messages;
	String msg,errorMsg;
	boolean flag;
	
    
    ContactUs c=new ContactUs();
    ContactDaoImpl cdimpl=new ContactDaoImpl();
	List<ContactUs> conlist=null;
    
    HttpSession session=null;
	RequestDispatcher rd=null;

	
    public ReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String process=request.getParameter("process");
		session=request.getSession();
		
		if (process!=null&&process.equals("seeReview")) {
			
			conlist=cdimpl.ShowReview();
			if (conlist.isEmpty()) {
				errorMsg="Review or Suggestion box is empty...";
				request.setAttribute("errorMsg", errorMsg);
				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
				
			}else {
				session.setAttribute("conlist", conlist);
				response.sendRedirect("Review.jsp");	
			}
			
			
		}else if (process!=null&&process.equals("deletereview")){
			SrNo=Integer.parseInt(request.getParameter("SrNo"));
			flag=cdimpl.deletereview(SrNo);
			
			if (flag) {
				msg="Review Deleted Successfully..!!!";
				request.setAttribute("msg", msg);
				
				conlist=cdimpl.ShowReview();
				session.setAttribute("conlist", conlist);
				
				response.sendRedirect("Review.jsp");
				
			} else {
				errorMsg="Faild to Delete Review..!!!";
				request.setAttribute("errorMsg", errorMsg);
				
				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
			
		}else {
			
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String process=request.getParameter("process");
		session=request.getSession();
		
		if (process!=null&&process.equals("addreview")) {
			
			CustName=request.getParameter("CustName");
			CustEmail=request.getParameter("CustEmail");
			CustPhoneNo=request.getParameter("CustPhoneNo");
			Messages=request.getParameter("Messages");
			
			c=new ContactUs();
			c.setCustName(CustName);
			c.setCustEmail(CustEmail);
			c.setCustPhoneNo(CustPhoneNo);
			c.setMessages(Messages);
			
			flag=cdimpl.addreview(c);
			
			if (flag) {
				msg="Your Response Send Successfully..!!!";
				request.setAttribute("msg", msg);
				
				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			} else {
				errorMsg="Error While Sending Response..!!!";
				request.setAttribute("errorMsg", errorMsg);
				
				rd=request.getRequestDispatcher("Contact.jsp");
				rd.forward(request, response);
			}
			
		}
		
	}

}
