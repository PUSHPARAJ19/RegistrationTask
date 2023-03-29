<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.DAO.RegisterDAO" %>
<%@page import="com.Modal.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/RegistrationTask/css/style.css">

<style>
section
{
	background-image: url('register.jpg');
	background-repeat:no-repeat;
	background-size:cover;
}
</style>
</head>
<body>
<%
   //HttpSession ses = request.getSession(false);
    User user = new User();
    //System.out.println(new Date()+" "+ session.isNew());
    String action="";
  if(request.getParameter("userId")==null)
  {
	 user = new User("","","","",0);  
	 action="addUser";
  }
  else
  {
	  action="edit";
	 user = RegisterDAO.selectUser(request.getParameter("userId"));
  }
  %>
<section class="vh-100">
  <div class="mask d-flex align-items-center gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 24px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center">REGISTER</h2>

              <form name="registerForm" action="RegisterServlet">
               <input type="hidden" id="formName" name="action" value=<%=action %>>
               <%if(action.equals("edit")){ %>
                 <div class="form-outline mb-2" d="userId">
                  <label class="form-label" for="userId">User ID</label>
                  <input type="text"   class="form-control form-control-lg" value="<%=user.getUserId() %>"  disabled/>
                  <input type="hidden"  name="userId" class="form-control form-control-lg" value="<%=user.getUserId() %>" />
                   
                </div>
                <% } %>
                 
                <div class="form-outline mb-2">
                  <label class="form-label" for="fname">First Name</label>
                  <input type="text" id="fname" name="fname" class="form-control form-control-lg" value="<%=user.getFname() %>" required/>
                </div>
               
                <div class="form-outline mb-2">
                  <label class="form-label" for="lname">Last Name</label>
                  <input type="text" id="lname" name="lname" class="form-control form-control-lg" value="<%=user.getLname()%>"required />
                </div>

                <div class="form-outline mb-2">
                  <label class="form-label" for="email">Email</label>
                  <input type="email" id="email" name="email" class="form-control form-control-lg" value="<%=user.getEmail()%>" required/>
                </div>
               
                <div class="form-outline mb-2">
                  <label class="form-label" for="mobileNum">Mobile Number</label>
                  <input type="text" id="mobileNum" name="mobileNum" class="form-control form-control-lg" value="<%=user.getMobileNum() %>" required/>
                </div>
               
                <div class="form-outline mb-2">
                  <label class="form-label" for="age">Age</label>
                  <input type="text" id="age" name="age" class="form-control form-control-lg" value="<%=user.getAge()%>"required/>
                </div>


                <div class="d-flex justify-content-center">
                  <button type="submit" id="registerBtn" class="btn btn-success btn-block btn-lg gradient-custom-4 text-white">Register</button>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
 <script src="/RegistrationTask/js/ValidateJs.js"></script>
</body>
</html>
