
function validate(child){
   	 let fname = child[2].innerHTML;
		   let lname = child[3].innerHTML;
		   let email =child[4].innerHTML;
		   let mobileNum = child[5].innerHTML;
		   let age = child[6].innerHTML;
	
	if(fname.length==0 || lname.length==0 || email.length==0 || mobileNum.length==0 || age.length==0)
    {
	 alert("Enter All Fields to Complete Registration");
	 return false;
    }
    else
    {
	if(fname.length<=2){
	 alert("First Name should be Valid!");
	 return false;
	 }
	let pattern = /\D/g;
	let isValidNum = mobileNum.match(pattern);
	if(isValidNum===null)
    	isValidNum="";
	    if(mobileNum.length!=10)
	    {
		 alert("Mobile Number must contain 10 Digits"); 
		 return false;
	    }
	    else if(isValidNum.length>0){
	     alert("Mobile Number Fiels must contain only Digits(10)");
	     return false;
	     }
	    let userAge = +age;
	    if(age<=5)
	    {
		  alert("Age must be Greater than 5!");
		  return false;
     	}
     	else if(age>=40)
     	{
	    alert("Age must be less than 40!");
	    return false;
         }    
    }
	return true;
}
		
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
   	   child[0].contentEditable=false;
   	   let editBtn = child[7].children;
		   let btnCont = editBtn[0].innerHTML;
   	   //console.log(btnCont=='SAVE');
   	   if(!row.isContentEditable)
   	   {
   	       row.contentEditable = true; 
   		   changeColor(child,"grey","white");
   		   editBtn[0].innerHTML = 'UPDATE';
   	     }
   	   else
   	   {
   		   
   		   let user = child[1].innerHTML;
   		   let fname = child[2].innerHTML;
   		   let lname = child[3].innerHTML;
   		   let email =child[4].innerHTML;
   		   let mobileNum = child[5].innerHTML;
   		   let age = child[6].innerHTML;
   		   let url = "RegisterServlet?action=edit&userId="+user+"&fname="+fname+"&lname="+lname+"&email="+email+"&mobileNum="+mobileNum+"&age="+age;
   		   //console.log(url);
   		     // console.log(validate(child))
   	    	  if(validate(child)){
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
      
      } 
      function deleteUser(userId)
      {
   	   let row = event.target.closest("tr");
   	    //console.log(row);
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