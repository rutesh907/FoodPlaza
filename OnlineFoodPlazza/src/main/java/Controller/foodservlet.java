package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Impl.FoodDaoImpl;
import POJO.Food;

@WebServlet("/foodservlet")
public class foodservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int foodId;
	String foodName;
	String foodType;
	String foodCategory;
	String foodDesc;
	double foodPrice;
	String image;
	Boolean flag;
	String msg,errorMsg;

//objects	
	Food f=null;
	FoodDaoImpl fimpl=new FoodDaoImpl();
	HttpSession session=null;
	List<Food> flist=null;	
	RequestDispatcher rd=null;

	public foodservlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String process=request.getParameter("process");
		session=request.getSession();
		
		if (process!=null&&process.equals("allFood")) {
			
			flist=fimpl.getAllFood();
			session.setAttribute("flist", flist);
			
			response.sendRedirect("FoodList.jsp");
			
			
		} else if(process!=null&&process.equals("updateFood")){
			foodId=Integer.parseInt(request.getParameter("foodId"));
			f=fimpl.searchFood(foodId);
			
			session.setAttribute("foodObj", f);
			response.sendRedirect("UpdateFoodItem.jsp");
			
			
		}else if (process!=null&&process.equals("deleteFood")) {
			foodId=Integer.parseInt(request.getParameter("foodId"));
			flag=fimpl.deleteFood(foodId);

			if (flag) {
//				response.getWriter().println("Food Item Deleted Successfully");
				msg="Food Item Deleted Successfully..!!!";
				request.setAttribute("msg", msg);
				
				flist=fimpl.getAllFood();
				session.setAttribute("flist", flist);
				
				response.sendRedirect("FoodList.jsp");
				
				
			} else {
//				response.getWriter().println("Faild to Delete Food Item");
				errorMsg="Faild to Delete Food Item..!!!";
				request.setAttribute("errorMsg", errorMsg);
				
				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
				
			}

		}else{
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String process=request.getParameter("process");

		if (process!=null&&process.equals("addFood")) 
		{
			foodName=request.getParameter("foodName");
			foodType=request.getParameter("foodType");
			foodCategory=request.getParameter("foodCategory");
			foodDesc=request.getParameter("foodDesc");
			foodPrice=Double.parseDouble(request.getParameter("foodPrice"));
			image=request.getParameter("image");

			f=new Food();
			f.setFoodName(foodName);
			f.setFoodType(foodType);
			f.setFoodCategory(foodCategory);
			f.setFoodDesc(foodDesc);
			f.setFoodPrice(foodPrice);
			f.setImage(image);

			flag=fimpl.addFood(f);

			if (flag) {
					
				msg="Add Food item Successfully..!!!";
				request.setAttribute("msg", msg);
				
				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
				
			} else {
				errorMsg="Faild to add Food Item...";
				request.setAttribute("errorMsg", errorMsg);
				
				rd=request.getRequestDispatcher("AddFood.jsp");
				rd.forward(request, response);	
						}
		}else if (process!=null&&process.equals("updateFood")) {

			foodId=Integer.parseInt(request.getParameter("foodID"));
			foodName=request.getParameter("foodName");
			foodType=request.getParameter("foodType");
			foodCategory=request.getParameter("foodCategory");
			foodDesc=request.getParameter("foodDesc");
			foodPrice=Double.parseDouble(request.getParameter("foodPrice"));
			image=request.getParameter("image");

			f=new Food(foodId, foodName, foodType, foodCategory, foodDesc, foodPrice,image);

			flag=fimpl.updateFood(f);

			if (flag) {
				response.getWriter().println("");
				msg="Update Food Item Successfully..!!!";
				request.setAttribute("msg", msg);
				
				flist=fimpl.getAllFood();
				session.setAttribute("flist", flist);
				
				response.sendRedirect("FoodList.jsp");
				
			} else {
			
				errorMsg="Faild to Update Food Item..!!!";
				request.setAttribute("errorMsg", errorMsg);
				
				flist=fimpl.getAllFood();
				session.setAttribute("flist", flist);
				
				response.sendRedirect("FoodList.jsp");
			}

		} else if (process!=null&&process.equals("deleteFood")) {
			foodId=Integer.parseInt(request.getParameter("foodID"));

			f=new Food();
			f.setFoodId(foodId);

			flag=fimpl.updateFood(f);

			if (flag) {
				response.getWriter().println("Food Item Deleted Successfully");
			} else {
				response.getWriter().println("Faild to Delete Food Item");
			} 
		
		}else {
			
		}		
	}

}
