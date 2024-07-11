package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import Impl.CartDaoImpl;
import Impl.CustomerDaoImpl;
import Impl.FoodDaoImpl;
import POJO.Cart;
import POJO.Customer;
import POJO.Food;


@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String process;
	int foodid;
	int cartid;	
	String cEmail;
	int fquantity;
	String fname;
	double fprice;
	double totalPrice;
	Boolean flag,exist;
	String msg,errorMsg;
	
	
	HttpSession session=null;;
	RequestDispatcher rd=null;
	//	CartDaoImpl Cimpl=new CartDaoImpl();
	FoodDaoImpl fimpl=new FoodDaoImpl();

	Customer c1=null;
	CustomerDaoImpl custimpl=new CustomerDaoImpl(); 

	CartDaoImpl cimpl=new CartDaoImpl();
	Food f=null;
	Cart c=null;

	List<Cart> clist;
	List<Food> flist;



	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process=request.getParameter("process");	
		session=request.getSession();

		if (process!=null&&process.equals("addToCart")) {
			foodid=Integer.parseInt(request.getParameter("foodId"));


			
			
			f=fimpl.searchFood(foodid);

			fname=f.getFoodName();
			fprice=f.getFoodPrice();
			fquantity=1;	
			
//			cEmail="rohanmore@gmail.com";
			
			cEmail=(String)session.getAttribute("username");

			c=new Cart();
			c.setFoodid(foodid);
			c.setFprice(fprice);
			c.setFquantity(fquantity);
			c.setcEmail(cEmail);
			c.setFname(fname);

			clist=cimpl.searchCartByEmailId(cEmail);
			exist=false;
			for (Cart cart : clist) {
				if (cart.getFoodid()==foodid) {
					errorMsg="Already Available in cart.";
					request.setAttribute("errorMsg", errorMsg);
					exist=true;
					flag=false;
					
				} 
			}
			if (!exist) {
				flag=cimpl.addToCart(c);
			}		
			
			if(flag)
			{
				msg="Add item to cart succefully";
				request.setAttribute("msg", msg);

			}
			else {
				errorMsg="Already Available in cart.";
				request.setAttribute("errorMsg", errorMsg);

			}

			flist=new FoodDaoImpl().getAllFood();
			session.setAttribute("flist", flist);

			rd=request.getRequestDispatcher("FoodList.jsp");
			rd.forward(request, response);


		}else if (process!=null&&process.equals("showCartList")) {

			cEmail=(String)session.getAttribute("username");

			//			cEmail="rohanmore@gmail.com";

			//			response.getWriter().println(cEmail);
			clist=cimpl.searchCartByEmailId(cEmail);

			if(clist==null || clist.isEmpty()) {

				request.setAttribute("errorMsg", "Your cart is empty...");
				flist=new FoodDaoImpl().getAllFood();
				session.setAttribute("flist", flist);

				rd=request.getRequestDispatcher("FoodList.jsp");
				rd.forward(request, response);
			}
			else {

				session.setAttribute("clist", clist);
				response.sendRedirect("MyCart1.jsp");
			}


		}else if (process!=null&&process.equals("deleteCartItem")) {
			cartid=Integer.parseInt(request.getParameter("cartid"));

			flag=cimpl.deleteCartById(cartid);

			if(flag)
			{
				msg="Item deleted from cart";
				request.setAttribute("msg", msg);

			}else {

				errorMsg="Could not delete this item. Please try again!!!";
				request.setAttribute("errorMsg", errorMsg);		

			}

			clist=cimpl.searchCartByEmailId(cEmail);

			if(clist==null || clist.isEmpty()) {

				request.setAttribute("errorMsg", "Your cart is empty...");
				flist=new FoodDaoImpl().getAllFood();
				session.setAttribute("flist", flist);

				rd=request.getRequestDispatcher("FoodList.jsp");
				rd.forward(request, response);
			}

			else {
				session.setAttribute("clist", clist);

				rd=request.getRequestDispatcher("MyCart1.jsp");
				rd.forward(request, response);
			}


		}else if(process!=null && process.equals("clearCart")) {

			cEmail=(String)session.getAttribute("username");
			flag=cimpl.deleteCartByEmail(cEmail);
			
			if(flag) {
				
				msg="Your cart is now empty!!";
				request.setAttribute("msg", msg);
				
				flist=new FoodDaoImpl().getAllFood();
				session.setAttribute("flist", flist);

				rd=request.getRequestDispatcher("FoodList.jsp");
				rd.forward(request, response);
			}
			else {
				
				errorMsg="Could not clear the cart!! Please try again...";
				request.setAttribute("errorMsg", errorMsg);
				
				clist=cimpl.searchCartByEmailId(cEmail);
				session.setAttribute("clist", clist);

				rd=request.getRequestDispatcher("MyCart1.jsp");
				rd.forward(request, response);
			}

		}else {

			
		}



	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String process=request.getParameter("process");
		session=request.getSession();
		/*
		 * PrintWriter is a predefined class which is used to send data from servlet to front end technology
		 * such as ajax.
		 * We can also print any message on page with the help of printwriter
		 */
		PrintWriter pw=response.getWriter();

		if(process!=null && process.equals("updateCartQuantity")) {
			cartid=Integer.parseInt(request.getParameter("cartid"));
			fquantity=Integer.parseInt(request.getParameter("fquantity"));

			flag=cimpl.updateCart(cartid, fquantity);
			if(flag) {

				c=cimpl.searchCartById(cartid);
				totalPrice=c.getTotalPrice();
				pw.print(totalPrice);
			}

		}

	}

}
