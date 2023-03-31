package com.Servlet;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.RegisterDAO;
import com.Modal.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		if(action.equals("addUser")) 
		{
		User user = new User(request.getParameter("fname"),request.getParameter("lname"),request.getParameter("email"),request.getParameter("mobileNum"), Integer.parseInt(request.getParameter("age")));
		try {
			if(RegisterDAO.addUser(user))
			{
				response.sendRedirect("UserDetails.jsp");
			}
			else
			{
				HttpSession ht = request.getSession();
				ht.setAttribute("Message", "Enter Valid Details to Complete Your Registration");
				response.sendRedirect("error.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else if(action.equals("delete"))
		{
			 if(RegisterDAO.deleteUser(request.getParameter("userId")))
			 {
			   out.print("success");
			 }
			 else
				 out.print("error");
		}
		else
		{
			User user = new User(Integer.parseInt(request.getParameter("userId")),request.getParameter("fname"),request.getParameter("lname"),request.getParameter("email"),request.getParameter("mobileNum"),Integer.parseInt(request.getParameter("age")));
			try {
				if(RegisterDAO.updateUser(user))
					response.sendRedirect("UserDetails.jsp");
				else
				{
					HttpSession session = request.getSession();
					session.setAttribute("Message", "Enter a Valid to Update Info");
					response.sendRedirect("error.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
