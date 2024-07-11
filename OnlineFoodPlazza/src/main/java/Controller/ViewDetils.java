package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Impl.FoodDaoImpl;
import POJO.Food;

/**
 * Servlet implementation class ViewDetils
 */
@WebServlet("/ViewDetils")
public class ViewDetils extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int foodId;
	String foodName;
	String foodType;
	String foodCategory;
	String foodDesc;
	double foodPrice;
	String image;
	Boolean flag;
	FoodDaoImpl fdao=new FoodDaoImpl();
	Food f=new Food();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewDetils() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");  
		PrintWriter out=response.getWriter();  
		out.println("<a href='AddFood.jsp'>Add New Employee</a>");
		out.println("<h1>Food List</h1>");  

		List<Food> list=fdao.getAllFood();
		
		out.print("<table border='1' width='100%'");  
		out.print("<tr><th>Food Id</th><th>Food Name</th><th>Food Type</th><th>Food Category</th><th>Food Discription</th><th>Price</th><th>Image</th><th>Edit</th><th>Delete</th></tr>");  
				for(Food f:list){  
					out.print("<tr><td>"+f.getFoodId()+"</td><td>"+f.getFoodName()+"</td><td>"+f.getFoodType()+"</td><td>"+f.getFoodCategory()+"</td><td>"+f.getFoodDesc()+"</td><td>"+f.getFoodPrice()+"</td><td>"+f.getImage()+"</td><td><a href='UpdateFoodItem?id="+f.getFoodId()+"'>edit</a></td> <td><a href='DeleteFoodItem?id="+f.getFoodId()+"'>delete</a></td></tr>");  
				}  
				out.print("</table>");  

				out.close();  
	}

}
