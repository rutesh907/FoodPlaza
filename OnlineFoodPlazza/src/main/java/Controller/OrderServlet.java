package Controller;

import java.io.IOException;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Impl.CustomerDaoImpl;
import Impl.OrderDaoImpl;
import POJO.Customer;
import POJO.OrderFood;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	int orderId;
	LocalDateTime orderDate;
	double totalBill;
	String emailId;
	String orderStatus;
	String msg,errorMsg;
	boolean flag;


	OrderFood o=null;
	OrderDaoImpl oimpl=new OrderDaoImpl();
	List<OrderFood> olist;

	HttpSession session=null;
	RequestDispatcher rd=null;
	
	CustomerDaoImpl cimpl=new CustomerDaoImpl();
	Customer c=new Customer();

	public OrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String process=request.getParameter("process");
		session=request.getSession();


		if(process!=null&&process.equals("confirmOrder")){
			olist=oimpl.showAllOrder();

			if (olist==null||olist.isEmpty()) {
				errorMsg="No order resived yet";
				request.setAttribute("errorMsg", errorMsg);

				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);

			} else {

				session.setAttribute("olist", olist);
				response.sendRedirect("PendingOrder.jsp");	
			}

		}else if(process!=null&&process.equals("UpdateStatus")){
			orderId=Integer.parseInt(request.getParameter("OrderId"));

			orderStatus="Order Delivered.";

			o=new OrderFood();
			o.setOrderId(orderId);
			o.setOrderStatus(orderStatus);

			flag=oimpl.changeOrderStatus(orderStatus, orderId);
			if (flag) {

				msg="Order Details Update Successfully...";
				request.setAttribute("msg", msg);
				
				olist=oimpl.showAllOrder();
				session.setAttribute("olist", olist);
				response.sendRedirect("PendingOrder.jsp");	
				

			} else {

				errorMsg="Faild to Update Order Details...";
				request.setAttribute("errorMsg", errorMsg);

				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);

			}

		}else if(process!=null&&process.equals("ShowDeliveredList")){
			olist=oimpl.showDeliveredHistory();

			if (olist==null||olist.isEmpty()) {
				errorMsg="No order resived yet";
				request.setAttribute("errorMsg", errorMsg);

				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);

			} else {

				session.setAttribute("olist", olist);
				response.sendRedirect("DeliveredHistory.jsp");	
			}

		}else if(process!=null&&process.equals("ShowMyOrders")){
			emailId=(String) session.getAttribute("username");
			
			olist=oimpl.showMyOrderHistory(emailId);
			
			if (olist==null||olist.isEmpty()) {
				errorMsg="Order History is empty...";
				request.setAttribute("errorMsg", errorMsg);
				
				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
				
			}
			else {
				session.setAttribute("olist", olist);
				response.sendRedirect("MyOrders.jsp");
				
			}
			
			
		}else if(process!=null&&process.equals("getDetails")){
			
			emailId=(String) session.getAttribute("username");
			orderId=Integer.parseInt(request.getParameter("orderId"));
			
			o=oimpl.showOrderById(orderId);
			c=cimpl.searchByEmailId(emailId);
			
			session.setAttribute("orderObj", o);
			session.setAttribute("custObj", c);
			response.sendRedirect("OrderInformationCard.jsp");
			
			
		}else if(process!=null&&process.equals("cancelOrder")){
			
			orderId=Integer.parseInt(request.getParameter("orderId"));
			
			flag=oimpl.cancelOrder(orderId);
			
			if (flag) {
				msg="Order Cancelled Successfully..!!!";
				request.setAttribute("msg", msg);
				
				emailId=(String) session.getAttribute("username");
				olist=oimpl.showMyOrderHistory(emailId);
				
				session.setAttribute("olist", olist);
				response.sendRedirect("MyOrders.jsp");
				
			} else {

				errorMsg="Faild to Delete Food Item..!!!";
				request.setAttribute("errorMsg", errorMsg);
				
				emailId=(String) session.getAttribute("username");
				olist=oimpl.showMyOrderHistory(emailId);
				
				session.setAttribute("olist", olist);
				response.sendRedirect("MyOrders.jsp");
			}
			
			
		}else {
			
		}



	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String process=request.getParameter("process");
		session=request.getSession();

		if(process!=null&&process.equals("placeOrder"))
		{
			emailId=(String) session.getAttribute("username");
			orderStatus="Order confirmed.";

			o=new OrderFood();
			o.setEmailId(emailId);
			o.setOrderStatus(orderStatus);

			flag=oimpl.placeOrder(o);

			if (flag) {

				String time=DateTimeFormatter.ofPattern("hh:mm a").format(LocalTime.now().plusHours(1));

				msg="Your order has been placed Successfully. Delivery will be done before : "+time;
				request.setAttribute("msg", msg);

				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);

			} else {

				errorMsg="Error while placing order";
				request.setAttribute("errorMsg", errorMsg);

				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);

			}



		}else {

		}


	}

}
