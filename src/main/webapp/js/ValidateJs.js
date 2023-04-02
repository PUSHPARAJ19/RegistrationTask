


const btn = document.getElementById("registerBtn");
 btn.addEventListener("mouseover", function()
{
    
	let fname = document.getElementById("fname").value;
	let lname = document.getElementById("lname").value;
	let email =document.getElementById("email").value;
	let mobileNum =document.getElementById("mobileNum").value;
	let age = document.getElementById("age").value;
		if(fname.length==0 || lname.length==0 || email.length==0 || mobileNum.length==0 || age.length==0)
	    {
		 alert("Enter All Fields to Complete Registration");
	    }
	    else
	    {
		if(fname.length<=2){
		 alert("First Name should be Valid!");
		 }
		let pattern = /\D/g;
		let isValidNum = mobileNum.match(pattern);
		if(isValidNum===null)
	    	isValidNum="";
		    if(mobileNum.length!=10)
		    {
			 alert("Mobile Number must contain 10 Digits"); 
		    }
		    else if(isValidNum.length>0){
		     alert("Mobile Number Fiels must contain only Digits(10)");
		     }
		    let userAge = +age;
		    if(age<=5)
		    {
			  alert("Age must be Greater than 5!");
	     	}
	     	else if(age>=40)
	     	{
		    alert("Age must be less than 40!");
	         }    
	    }
});
