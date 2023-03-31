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
<title>USER DETAILS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>  
</head>
<body>
 <div class="container">
   <div class="row py-3">
     <div class="col-sm-10">
       <h2 class="text-center">USER DETAILS</h2>
      </div>
      <div class="col-sm-2">
          <div class="d-flex flex-row-reverse bd-highlight">
          <a href="index.html">
           <button type="button" class="btn btn-info" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
</svg> Add User</button>
            </a>
          </div>
       </div>
   </div>
   <div class="row py-4">
     <div class="container-fluid">
      <table class="table table-hover" id="userTable">
       <thead class="text-center">
        <tr>
         <th scope="col">S.No</th>
         <th scope="col">UserId</th>
         <th scope="col">First Name</th>
         <th scope="col">Last Name</th>
         <th scope="col">Email</th>
         <th scope="col">Mobile Number</th>
         <th scope="col">Age</th>
         <th scope="col">Action</th>
        </tr>
        </thead>
        <% LinkedList<User> users = RegisterDAO.selectUsers(); %>
        <tbody class="text-center">
        <% if(users.size()==0)
        	{%>
        	<tr>
        	<td colspan="8" style="text-align:center;">---- NO DATA TO DISPLAY ---- </td>
        	</tr>
        	<% } 
               else
               { 
            	   int serial=0;
                   Iterator<User> itr = users.iterator();
                   while(itr.hasNext())
                   {
                	   User user = (User)itr.next();
                	   serial++;
               %>
               <tr id="<%=user.getUserId() %>" style="inline;">
            <th scope="row"><%=serial%></th>
            <td><%=user.getUserId()%></td>
            <td ><%=user.getFname() %></td>
            <td ><%=user.getLname() %></td>
            <td ><%=user.getEmail() %></td>
            <td ><%=user.getMobileNum() %></td>
            <td ><%=user.getAge() %></td>
            <td>
            <button type="button" 
            class="btn btn-warning" onclick="editInfo()">  EDIT</button>
             <button type="button" class="btn btn-danger" onclick="deleteUser(<%=user.getUserId()%>)"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
  <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
</svg> REMOVE</button>
            </td>
          </tr>
          <% 
          } %>
          <%} %>
        </tbody>
      </table>
      
      <!--  script function edit and dlete -->
       
      <script>
      function changeColor(child,color1,color2)
      {
    	  for(let i=2;i<child.length-1;i++)
		   { 
		   child[i].style.backgroundColor =color1;
		   child[i].style.color=color2;
		   }
      }
      
       function editInfo()
       {
    	   let row = event.target.closest("tr");
    	   const child = row.children;
    	   child[1].contentEditable=false;
    	   let editBtn = child[7].children;
		   let btnCont = editBtn[0].innerHTML;
    	   //console.log(btnCont=='SAVE');
    	   if(!row.isContentEditable)
    	   {
    	   row.contentEditable = true; 
    		   changeColor(child,"grey","white");
    		   editBtn[0].innerHTML = 'UPDATE';
    	    }
    	   else{
    		   let user = child[1].innerHTML;
    		   let fname = child[2].innerHTML;
    		   let lname = child[3].innerHTML;
    		   let email =child[4].innerHTML;
    		   let mobileNum = child[5].innerHTML;
    		   let age = child[6].innerHTML;
    		   let url = "RegisterServlet?action=edit&userId="+user+"&fname="+fname+"&lname="+lname+"&email="+email+"&mobileNum="+mobileNum+"&age="+age;
    		   //console.log(url);
    		      let xhttp = new XMLHttpRequest();
    	    	  xhttp.open("POST",url,true);
    	   	        xhttp.send();
    	    	   xhttp.onreadystatechange = function()
    	    	   {
    	    		   if(this.readyState==4 && this.status==200)
    	    			{
    	    			    changeColor(child,"white","black");
    	    			    row.contentEditable = false;
    	    			    editBtn[0].innerHTML = "EDIT";
    	    			}   
    	    	   }
    	   }
       }
       
       
       function deleteUser(userId)
       {
    	   let row = event.target.closest("tr");
    	    console.log(row);
    	   // row.remove();
    	  let xhttp = new XMLHttpRequest();
    	  xhttp.open("POST","RegisterServlet?action=delete&userId="+userId,true);
   	      xhttp.send();
    	   xhttp.onreadystatechange = function()
    	   {
    		   if(this.readyState==4 && this.status==200)
    			{
    			  row.remove();
    			}   
    	   }
    	      
    	   
       }
      </script>   
      <!--  closing for parent property -->
     </div>
   </div>
 </div>
</body>
</html>